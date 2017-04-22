<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserNew.aspx.cs" Inherits="Visigo.Sharepoint.FormsBasedAuthentication.UserNew"
    DynamicMasterPageFile="~masterurl/default.master" %>
    
<%@ Register TagPrefix="wssuc" TagName="ToolBar" Src="~/_controltemplates/ToolBar.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ToolBarButton" Src="~/_controltemplates/ToolBarButton.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" Src="~/_controltemplates/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" Src="~/_controltemplates/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" Src="~/_controltemplates/ButtonSection.ascx" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    <SharePoint:EncodedLiteral ID="PageTitle" Text="<%$ Resources:FBAPackWebPages, NewUser_Title %>"
        EncodeMethod="HtmlEncode" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea"
    runat="server">
   	<a href="../../settings.aspx"><SharePoint:EncodedLiteral ID="EncodedLiteral1" runat="server" text="<%$Resources:wss,settings_pagetitle%>" EncodeMethod="HtmlEncode"/></a>&#32;<SharePoint:ClusteredDirectionalSeparatorArrow ID="ClusteredDirectionalSeparatorArrow1" runat="server" />
    <a href="UsersDisp.aspx"><SharePoint:EncodedLiteral ID="EncodedLiteral2" Text="<%$ Resources:FBAPackWebPages, UserMgmt_Title %>"
        EncodeMethod="HtmlEncode" runat="server" /></a>&#32;<SharePoint:ClusteredDirectionalSeparatorArrow ID="ClusteredDirectionalSeparatorArrow2" runat="server" />
    <SharePoint:EncodedLiteral ID="TitleArea" Text="<%$ Resources:FBAPackWebPages, NewUser_Title %>"
        EncodeMethod="HtmlEncode" runat="server" />
</asp:Content>
<asp:Content ID="Content5" contentplaceholderid="PlaceHolderTitleBreadcrumb" runat="server">
  <SharePoint:UIVersionedContent ID="UIVersionedContent1" UIVersion="3" runat="server"><ContentTemplate>
	<asp:SiteMapPath
		SiteMapProvider="SPXmlContentMapProvider"
		id="ContentMap"
		SkipLinkText=""
		NodeStyle-CssClass="ms-sitemapdirectional"
		RootNodeStyle-CssClass="s4-die"
		PathSeparator="&#160;&gt; "
		PathSeparatorStyle-CssClass = "s4-bcsep"
		runat="server" />
  </ContentTemplate></SharePoint:UIVersionedContent>
  <SharePoint:UIVersionedContent ID="UIVersionedContent2" UIVersion="4" runat="server"><ContentTemplate>
	<SharePoint:ListSiteMapPath
		runat="server"
		SiteMapProviders="SPSiteMapProvider,SPXmlContentMapProvider"
		RenderCurrentNodeAsLink="false"
		PathSeparator=""
		CssClass="s4-breadcrumb"
		NodeStyle-CssClass="s4-breadcrumbNode"
		CurrentNodeStyle-CssClass="s4-breadcrumbCurrentNode"
		RootNodeStyle-CssClass="s4-breadcrumbRootNode"
		HideInteriorRootNodes="true"
		SkipLinkText="" />
  </ContentTemplate></SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    
    <table border="0" width="96%" cellspacing="0" style="display:inline-block" cellpadding="10" class="ms-descriptiontext">
        <tr>
       <%--  <wssuc:InputFormSection runat="server">
            <template_inputformcontrols>--%>
            <td style="width:17%">
                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:FBAPackWebPages, TypeEmailAddrLabelText %>"></asp:Label>
            </td>
            <td style="width:34%">
                <asp:Label ID="lblEmailMessage" runat="server" Text="" ForeColor="red"></asp:Label>
		        <%--<wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, TypeEmailAddrLabelText %>">--%>
			   <%--     <Template_Control>--%>
			        <SharePoint:InputFormTextBox Title="<%$ Resources:FBAPackWebPages, EmailColHeaderText %>" class="ms-input" Columns="40" maxlength="255" ID="txtEmail" Direction="LeftToRight" Runat="server" autocomplete="off" />
			        <SharePoint:InputFormRegularExpressionValidator ID="InputFormRegExpressionFieldValidator1"  ControlToValidate="txtEmail" Display="Dynamic" runat="server" ValidationExpression=".+\@.+" ErrorMessage="Enter a valid email address."/>
                     <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator1" ControlToValidate="txtEmail" Display="Dynamic" Runat="server"/>	
                </td>
                       <td rowspan="11" runat="server" id="GroupSection">
       
                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:FBAPackWebPages, GroupLabelText %>"></asp:Label>
				        <SharePoint:InputFormCheckBoxList ID="groupList" CssClass="ms-RadioText" ToolTip="<%$ Resources:FBAPackWebPages, GroupToolTipText %>" runat="server" />
             </td>
            </tr>
			       <%-- </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>
        <!-- User Name -->
       <%-- <wssuc:InputFormSection runat="server" Title="<%$ Resources:FBAPackWebPages, UserNameColHeaderText %>">
            <template_inputformcontrols>
                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="red"></asp:Label>
		        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, TypeUserNameLabelText %>">
			        <Template_Control>
			            
			            <SharePoint:InputFormTextBox Title="<%$ Resources:FBAPackWebPages, UserNameColHeaderText %>" class="ms-input" Columns="40" maxlength="255" ID="txtUsername" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator1" ControlToValidate="txtUsername" Display="Dynamic" Runat="server"/>			            
			        </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>
        <!-- Full Name -->
<%--        <wssuc:InputFormSection runat="server">
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, TypeFullNameLabelText %>">
			        <Template_Control>--%>
         <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:FBAPackWebPages, TypeFullNameLabelText %>"></asp:Label>
            </td>
            <td>
			            <SharePoint:InputFormTextBox Title="<%$ Resources:FBAPackWebPages, FullNameColHeaderText %>" class="ms-input" Columns="40" maxlength="255" ID="txtFullName" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator2" ControlToValidate="txtFullName" Display="Dynamic" Runat="server"/>
                </td>

        <%-- </tr>--%>
			     <%--   </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>
        <!-- Password -->
       <%-- <wssuc:InputFormSection runat="server">
            <template_inputformcontrols>
                <asp:Label ID="lblPasswordMessage" runat="server" Text="" ForeColor="red"></asp:Label>
		        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, ConfirmPasswordLabelText %>">
			        <Template_Control>--%>
         <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Enter Password"></asp:Label>
            </td>
            <td>
                   <asp:Label ID="lblPasswordMessage" runat="server" Text="" ForeColor="red"></asp:Label>
			            <SharePoint:InputFormTextBox Title="password" ToolTip="<%$ Resources:FBAPackWebPages, EnterPasswordToolTipText %>" class="ms-input" Columns="40" textmode="Password" maxlength="255" ID="txtPassword" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="txtPasswordValidator1" ControlToValidate="txtPassword" Display="Dynamic" Runat="server"/>
                </td>
             </tr>
                              <%-- <br>
                               <br>--%>
          <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label>
            </td>
            <td>
			            <SharePoint:InputFormTextBox Title="confirm" ToolTip="<%$ Resources:FBAPackWebPages, ConfirmPasswordToolTipText %>" class="ms-input" Columns="40" textmode="Password" maxlength="255" ID="txtConfirm" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="txtConfirmValidator1" ControlToValidate="txtConfirm" Display="Dynamic" Runat="server"/>
			            <SharePoint:InputFormCompareValidator ID="InputFormCompareValidatorPassword" SetFocusOnError="true"  ControlToValidate="txtConfirm" ControlToCompare="txtPassword" Type="String" Display="Dynamic" Operator="Equal" ErrorMessage="Password and confirmation do not match." runat="server"/>
                 </td>
             </tr>
			      <%--  </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>

        
         <%--<wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="Type user's CMIT Location">
			        <Template_Control>--%>
                              <%-- <br>--%>
          <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Type user's CMIT Location"></asp:Label>
            </td>
            <td>
			            <SharePoint:InputFormTextBox Title="Enter CMIT Location" class="ms-input" Columns="40" maxlength="255" ID="txtCMITLocation" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator5" ControlToValidate="txtCMITLocation" Display="Dynamic" Runat="server"/>
                </td>
             </tr>
			        <%--</Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>

         <%--<wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="Type user's Telephone Number">
			        <Template_Control>--%>
          <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Type user's Telephone Number"></asp:Label>
            </td>
            <td>
                         <SharePoint:InputFormTextBox Title="Enter CMIT Location" class="ms-input" Columns="40" maxlength="10" ID="txtTelephoneNumber" Direction="LeftToRight" Runat="server" autocomplete="off" />
                        <SharePoint:InputFormRegularExpressionValidator ID="InputFormRegularExpressionValidator1"  ControlToValidate="txtTelephoneNumber" Display="Dynamic" runat="server" ValidationExpression="[0-9]{10}" ErrorMessage="Enter a valid Telephone Number."/>
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator6" ControlToValidate="txtTelephoneNumber" Display="Dynamic" Runat="server"/>
                </td>
             </tr>
			     
<%--			        </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>

         <%-- <wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="Type user's Title">
			        <Template_Control>--%>
         <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Type user's Title"></asp:Label>
            </td>
            <td>
			            <SharePoint:InputFormTextBox Title="Enter Title" class="ms-input" Columns="40" maxlength="255" ID="txtTitle" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator7" ControlToValidate="txtTitle" Display="Dynamic" Runat="server"/>
                </td>
             </tr>
			       <%-- </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>

         <%-- <wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="Type user's Date of Provisioning">
			        <Template_Control>--%>
          <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Type Date of Provisioning"></asp:Label>
            </td>
            <td>
                       <SharePoint:DateTimeControl ID="txtDatofProvisionaing" runat="server" IsRequiredField="true"  DateOnly="true" />
                 </td>
             </tr>
			       <%-- </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>

        <!-- Security Question -->
        <tr id="QuestionSection" runat="server">
            <td>
                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:FBAPackWebPages, TypeSecurityQLableText %>"></asp:Label>
            </td>
            <td>
        <%--<wssuc:InputFormSection id="QuestionSection" runat="server" >
            <template_inputformcontrols>
                <asp:Label ID="lblQuestionMessage" runat="server" Text="" ForeColor="red"></asp:Label>
		        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, TypeSecurityQLableText %>">
			        <Template_Control>--%>
                   <asp:Label ID="lblQuestionMessage" runat="server" Text="" ForeColor="red"></asp:Label>
			            <SharePoint:InputFormTextBox Title="<%$ Resources:FBAPackWebPages, SecurityQuestionHeaderText %>" class="ms-input" Columns="40" maxlength="255" ID="txtQuestion" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator3" ControlToValidate="txtQuestion" Display="Dynamic" Runat="server"/>
                 </td>
             </tr>
			       <%-- </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>
        <!-- Security Answer -->
        <%--<wssuc:InputFormSection id="AnswerSection" runat="server">
            <template_inputformcontrols>
                <asp:Label ID="lblAnswerMessage" runat="server" Text="" ForeColor="red"></asp:Label>
		        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, TypeSecurityALableText %>">
			        <Template_Control>--%>
          <tr id="AnswerSection" runat="server">
            <td>
                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:FBAPackWebPages, TypeSecurityQLableText %>"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAnswerMessage" runat="server" Text="" ForeColor="red"></asp:Label>
			            <SharePoint:InputFormTextBox Title="<%$ Resources:FBAPackWebPages, SecurityAnswerHeaderText %>" class="ms-input" Columns="40" maxlength="255" ID="txtAnswer" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator4" ControlToValidate="txtAnswer" Display="Dynamic" Runat="server"/>
                  </td>
             </tr>
			       <%-- </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>
        <!-- Email Address -->
     <%--   <wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
                <asp:Label ID="lblEmailMessage" runat="server" Text="" ForeColor="red"></asp:Label>
		        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, TypeEmailAddrLabelText %>">
			        <Template_Control>
			        <SharePoint:InputFormTextBox Title="<%$ Resources:FBAPackWebPages, EmailColHeaderText %>" class="ms-input" Columns="40" maxlength="255" ID="txtEmail" Direction="LeftToRight" Runat="server" autocomplete="off" />
			        <SharePoint:InputFormRegularExpressionValidator ID="InputFormRegExpressionFieldValidator1"  ControlToValidate="txtEmail" Display="Dynamic" runat="server" ValidationExpression=".+\@.+" ErrorMessage="Enter a valid email address."/>
			        </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>
        <!-- Is Active -->
       <%-- <wssuc:InputFormSection runat="server" id="ActiveSection" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server">
			        <Template_Control>--%>
         <tr id="ActiveSection" runat="server">
            <td>
                <asp:Label ID="Label11" runat="server" Text="Activate User"></asp:Label>
            </td>
            <td>
				        <asp:CheckBox ID="isActive" Checked="true" ToolTip="<%$ Resources:FBAPackWebPages, ActiveCheckBoxToolTipText %>" Text="<%$ Resources:FBAPackWebPages, ActiveCheckBoxLabelText %>" runat="server"/>
			        <%--</Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>
                 </td>
             </tr>
        <!-- Groups -->
    
        <!-- Roles -->
       <%-- <<%--wssuc:InputFormSection runat="server" id="RolesSection">
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, GroupLabelText %>">
			        <Template_Control>--%>
            <tr id="RolesSection" runat="server">
            <td>
                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:FBAPackWebPages, GroupLabelText %>"></asp:Label>
            </td>
            <td>
				        <SharePoint:InputFormCheckBoxList ID="rolesList" CssClass="ms-RadioText" ToolTip="<%$ Resources:FBAPackWebPages, GroupToolTipText %>" runat="server" />
                  </td>
             </tr>
			        <%--</Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>--%>
        <!-- Email -->
       <wssuc:InputFormSection runat="server" id="EmailSection" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server">
			        <Template_Control>
            <%--<tr id="EmailSection" runat="server">
            <td>
                <asp:Label ID="Label14" runat="server" Text="Email user"></asp:Label>
            </td>
            <td>--%>
			            <SharePoint:InputFormCheckBox id="emailUser" runat="server" Checked="False" LabelText="<%$ Resources:FBAPackWebPages, SendMailLabelText %>" ToggleChildren="true">
				            <SharePoint:EncodedLiteral ID="EncodedLiteral3" runat="server" text="<%$Resources:wss,aclver_SubjectLabel%>" EncodeMethod='HtmlEncode'/>
					        <br>
					        <Template_Control>
					            <SharePoint:InputFormTextBox Title="<%$Resources:wss,aclver_SubjectTitle%>" class="ms-input" ID="txtEmailSubject" Text="Welcome to CMIT Solutions Vault Home Site" Columns="40" Runat="server" MaxLength="255" />
					            <SharePoint:InputFormRequiredFieldValidator id="ReqValEmailSubject" runat="server" BreakBefore=true BreakAfter=true EnableClientScript="false" ControlToValidate="txtEmailSubject"/>
					        </Template_Control>
					        <br>
					        <SharePoint:EncodedLiteral ID="EncodedLiteral4" runat="server" text="<%$Resources:wss,aclver_BodyLabel%>" EncodeMethod='HtmlEncode'/>
					        <br>
					        <Template_Control>
					            <SharePoint:InputFormTextBox Title="<%$Resources:wss,aclver_BodyTitle%>" class="ms-input" ID="txtEmailBody" Runat="server" TextMode="MultiLine" Columns="40" Rows="8" Cols=64 MaxLength=512 />
					        </Template_Control>
			            </SharePoint:InputFormCheckBox>
                <%-- </td>
             </tr>--%>
			         </Template_Control>
			    </wssuc:InputFormControl>   
		    </template_inputformcontrols>
        </wssuc:InputFormSection>
        <!-- Buttons -->
        <wssuc:ButtonSection runat="server">
            <template_buttons>
		        <asp:Button UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="OnSubmit" Text="<%$Resources:wss,multipages_okbutton_text%>" id="BtnOk" accesskey="<%$Resources:wss,okbutton_accesskey%>"/>
		    </template_buttons>
        </wssuc:ButtonSection>
    </table>

</asp:Content>
