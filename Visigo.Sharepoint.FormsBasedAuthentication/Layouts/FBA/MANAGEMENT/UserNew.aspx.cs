using System;
using System.Web.Security;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using Microsoft.SharePoint.Administration;
using System.Web.UI.WebControls;
using Microsoft.SharePoint.Utilities;
using System.Web;

namespace Visigo.Sharepoint.FormsBasedAuthentication
{
    /// <summary>
    /// Code behind for UserNew.aspx
    /// </summary>
    public partial class UserNew : LayoutsPageBase
    {

        protected override bool RequireSiteAdministrator
        {
            get { return true; }
        }

        protected override void OnLoad(EventArgs e)
        {
            this.CheckRights();

            bool _showRoles = (new MembershipSettings(SPContext.Current.Web)).EnableRoles;

            ReqValEmailSubject.Enabled = emailUser.Checked;
            txtEmailBody.Text = "You have been added to the CMIT Solutions Vault Home Site." + Environment.NewLine + "URL to login to site : " + SPContext.Current.Web.Url + Environment.NewLine;

            if (!Page.IsPostBack)
            {
                try
                {
                    // if roles activated display roles
                    if (_showRoles)
                    {
                        RolesSection.Visible = true;
                        GroupSection.Visible = false;

                        // load roles
                        rolesList.DataSource = Utils.BaseRoleProvider().GetAllRoles();
                        rolesList.DataBind();
                    }
                    // otherwise display groups
                    else
                    {
                        GroupSection.Visible = true;
                        RolesSection.Visible = false;

                        // load groups
                        groupList.DataSource = this.Web.SiteGroups;
                        groupList.DataBind();
                    }
                    txtDatofProvisionaing.SelectedDate = DateTime.Now.Date;

                    // Display Question and answer if required by provider
                    if (Utils.BaseMembershipProvider().RequiresQuestionAndAnswer)
                    {
                        QuestionSection.Visible = true;
                        AnswerSection.Visible = true;
                    }
                    else
                    {
                        QuestionSection.Visible = false;
                        AnswerSection.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    Utils.LogError(ex, true);
                }
            }
        }

        protected void OnSubmit(object sender, EventArgs e)
        {
            // ModifiedBySolvion
            // bhi - 09.01.2012
            // Reset message labels
            //lblMessage.Text =
                lblAnswerMessage.Text = lblEmailMessage.Text = lblPasswordMessage.Text = lblQuestionMessage.Text = "";
            // EndModifiedBySolvion

            bool _showRoles = (new MembershipSettings(SPContext.Current.Web)).EnableRoles;

            // check to see if username already in use
            MembershipUser user = Utils.BaseMembershipProvider().GetUser(txtEmail.Text,false);
            
            if (user == null)
            {
                try
                {
                    // get site reference             
                    string provider = Utils.GetMembershipProvider(this.Site);

                    // create FBA database user
                    MembershipCreateStatus createStatus;

                    if (Utils.BaseMembershipProvider().RequiresQuestionAndAnswer)
                    {
                        user = Utils.BaseMembershipProvider().CreateUser(txtEmail.Text, txtPassword.Text, txtEmail.Text, txtQuestion.Text, txtAnswer.Text, isActive.Checked, null, out createStatus);
                    }
                    else
                    {
                        user = Utils.BaseMembershipProvider().CreateUser(txtEmail.Text, txtPassword.Text, txtEmail.Text, null, null, isActive.Checked, null, out createStatus);
                    }

                    if (createStatus != MembershipCreateStatus.Success)
                    {
                        SetErrorMessage(createStatus);
                        return;
                    }

                    if (user == null)
                    {
                        lblEmailMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "UnknownError");
                        return;
                    }

                    bool groupAdded = false;

                    if (_showRoles)
                    {
                        for (int i = 0; i < rolesList.Items.Count; i++)
                        {
                            if (rolesList.Items[i].Selected)
                            {
                                Utils.BaseRoleProvider().AddUsersToRoles(new string[] {user.UserName}, new string[] {rolesList.Items[i].Value});
                            }
                        }

                        // add user to SharePoint whether a role was selected or not
                        AddUserToSite(Utils.EncodeUsername(user.UserName), user.Email, txtFullName.Text);
                    }
                    else
                    {
                        // add user to each group that was selected
                        for (int i = 0; i < groupList.Items.Count; i++)
                        {
                            if (groupList.Items[i].Selected)
                            {
                                // add user to group
                                SPGroup group = this.Web.SiteGroups[groupList.Items[i].Value];
                                group.AddUser(
                                    Utils.EncodeUsername(user.UserName),
                                    user.Email,
                                    txtFullName.Text,
                                    "");

                                // update
                                group.Update();
                                groupAdded = true;
                            }
                        }

                        // if no group selected, add to site with no permissions
                        if (!groupAdded)
                        {
                            AddUserToSite(Utils.EncodeUsername(user.UserName), user.Email, txtFullName.Text);
                        }
                    }

                    SPSite site = SPContext.Current.Site;
                    SPWeb web = site.RootWeb;
                    SPList list = web.SiteUserInfoList;

                    SPUser SPuser= web.AllUsers.GetByEmail(txtEmail.Text);
                    SPListItem userItem = null;
                    try
                    {
                        userItem = list.GetItemById(SPuser.ID);
                    }
                    catch (Exception ex)
                    {
                        Utils.LogError(ex);
                    }

                    if (userItem != null)
                    {
                        userItem["CMIT Location"] = txtCMITLocation.Text;
                        userItem["CMITTitle"] = txtTitle.Text;
                        userItem["Telephone Number"] = txtTelephoneNumber.Text;
                        userItem["Date of provisioning"] = txtDatofProvisionaing.SelectedDate;
                        userItem.Update();
                    }

                    // Email User
                    if ((emailUser.Checked == true))
                    {
                        if ((!string.IsNullOrEmpty(txtEmailSubject.Text)) && (!string.IsNullOrEmpty(txtEmailBody.Text)))
                        {
                            var emailBody = txtEmailBody.Text +Environment.NewLine +"Use your email as user name :" + txtEmail.Text + " and password as :" + txtPassword.Text + Environment.NewLine + "We recommand you to change your password when you login for first time.";
                            Email.SendEmail(this.Web, user.Email, txtEmailSubject.Text, emailBody);
                        }
                    }

                    SPUtility.Redirect("FBA/Management/UsersDisp.aspx", SPRedirectFlags.RelativeToLayoutsPage | SPRedirectFlags.UseSource, this.Context);


                }
                catch (Exception ex)
                {
                    Utils.LogError(ex, true);
                }
            }
            else
            {
                lblEmailMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "DuplicateUserName"); ;
            }
        }

        protected void SetErrorMessage(MembershipCreateStatus status)
        {
             switch (status)
             {
                 case MembershipCreateStatus.DuplicateUserName:
                    lblEmailMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "DuplicateUserName");
                    break;

                case MembershipCreateStatus.DuplicateEmail:
                    lblEmailMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "DuplicateEmail");
                    break;

                case MembershipCreateStatus.InvalidPassword:
                    string message = "";
                    if (string.IsNullOrEmpty(Utils.BaseMembershipProvider().PasswordStrengthRegularExpression))
                    {
                        message = string.Format(LocalizedString.GetGlobalString("FBAPackWebPages", "InvalidPasswordChars"), Utils.BaseMembershipProvider().MinRequiredPasswordLength,  Utils.BaseMembershipProvider().MinRequiredNonAlphanumericCharacters);
                    }
                    else
                    {
                        message = string.Format(LocalizedString.GetGlobalString("FBAPackWebPages", "InvalidPasswordCharsRegex"), Utils.BaseMembershipProvider().MinRequiredPasswordLength,  Utils.BaseMembershipProvider().MinRequiredNonAlphanumericCharacters, Utils.BaseMembershipProvider().PasswordStrengthRegularExpression);
                    }
                    //LocalizedString.GetGlobalString("FBAPackWebPages", "InvalidPassword")
                    // TODO: use resource files
                    lblPasswordMessage.Text = message;
                    break;

                case MembershipCreateStatus.InvalidEmail:
                    lblEmailMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "InvalidEmail");
                    break;

                case MembershipCreateStatus.InvalidAnswer:
                    lblAnswerMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "InvalidAnswer");
                    break;

                case MembershipCreateStatus.InvalidQuestion:
                    lblQuestionMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "InvalidQuestion");
                    break;

                case MembershipCreateStatus.InvalidUserName:
                    lblEmailMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "InvalidUserName");
                    break;

                case MembershipCreateStatus.ProviderError:
                    lblEmailMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "ProviderError");
                    break;

                case MembershipCreateStatus.UserRejected:
                    lblEmailMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "UserRejected");
                    break;

                default:
                    lblEmailMessage.Text = LocalizedString.GetGlobalString("FBAPackWebPages", "UnknownError");
                    break;
            }
        }

        /// <summary>
        /// Adds a user to the SharePoint (in no particular group)
        /// </summary>
        /// <param name="login"></param>
        /// <param name="email"></param>
        /// <param name="fullname"></param>
        private void AddUserToSite(string login, string email, string fullname)
        {
            this.Web.AllUsers.Add(
                login,
                email,
                fullname,
                "");
        }
    }
}
