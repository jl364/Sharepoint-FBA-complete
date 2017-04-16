using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Administration;
using System.Web.Security;
using System.Diagnostics;

namespace Visigo.Sharepoint.FormsBasedAuthentication.Code
{
    class SendEmailTimerJob : SPJobDefinition
    {

        public SendEmailTimerJob() : base()
        {
        }

        public SendEmailTimerJob(string jobName, SPService service) : base(jobName, service, null, SPJobLockType.None)
        {
            this.Title = "Send Email Timer Job";
        }


        public SendEmailTimerJob(string jobName, SPWebApplication webapp) : base(jobName, webapp, null, SPJobLockType.ContentDatabase)
        {
            this.Title = "Send Email Timer Job";
        }

        public override void Execute(Guid targetInstanceId)
        {
            try
            {
                SPWebApplication webApp = this.Parent as SPWebApplication;
                //SPList taskList = webApp.Sites[0].RootWeb.Lists["Tasks"];
                //SPListItem newTask = taskList.Items.Add();
                //newTask["Title"] = "New Task" + DateTime.Now.ToString();
                //newTask.Update();
                if (webApp.Sites.Count > 0)
                {
                    string provider = Utils.GetMembershipProvider(webApp.Sites[0]);
                    if (provider == null)
                        return;

                    int totalRecords = 0;
                    foreach (MembershipUser memberuser in Utils.BaseMembershipProvider(webApp.Sites[0]).GetAllUsers(0, 100000, out totalRecords))
                    {

                        if (memberuser.IsApproved)
                        {
                            if (memberuser.LastLoginDate < DateTime.Now.AddMonths(-6))
                            {
                                List<string> EmailAddress = new List<string>();
                                if (webApp.Sites[0].RootWeb.SiteAdministrators.Count > 1)
                                {
                                    foreach (SPUser user in webApp.Sites[0].RootWeb.SiteAdministrators)
                                    {
                                        EmailAddress.Add(user.Email);
                                    }
                                }

                                if (EmailAddress.Count > 0)
                                {
                                    string emailTitle = "Sharepoint user " + memberuser.Email + " is inactive from more than 6 months";
                                    string emailBody = "Sharepoint user " + memberuser.Email + "is inactive from more than 6 months. Last login date of the user is :" + memberuser.LastLoginDate + ". Please review that user needs to be kept in system for sharepoint site " + webApp.Sites[0].Url + ". You are receiving this email because you are administrator of this site.";
                                    Email.SendEmail(webApp.Sites[0].RootWeb, string.Join(";", EmailAddress.ToArray()), emailTitle, emailBody);
                                }
                            }
                        }
                    }
                }
            }
            catch { }
        }
    }
}
