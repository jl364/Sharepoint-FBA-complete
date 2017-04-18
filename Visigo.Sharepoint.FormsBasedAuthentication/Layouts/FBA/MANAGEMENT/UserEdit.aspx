<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="Visigo.Sharepoint.FormsBasedAuthentication.UserEdit"
    DynamicMasterPageFile="~masterurl/default.master" %>

<%@ Register TagPrefix="wssuc" TagName="ToolBar" Src="~/_controltemplates/ToolBar.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ToolBarButton" Src="~/_controltemplates/ToolBarButton.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" Src="~/_controltemplates/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" Src="~/_controltemplates/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" Src="~/_controltemplates/ButtonSection.ascx" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:content id="Content1" contentplaceholderid="PlaceHolderPageTitle" runat="server">
    <SharePoint:EncodedLiteral ID="PageTitle" Text="<%$ Resources:FBAPackWebPages, EditUser_Title %>"
        EncodeMethod="HtmlEncode" runat="server" />
</asp:content>
<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitleInTitleArea"
    runat="server">
   	<a href="../../settings.aspx"><SharePoint:EncodedLiteral ID="EncodedLiteral1" runat="server" text="<%$Resources:wss,settings_pagetitle%>" EncodeMethod="HtmlEncode"/></a>&#32;<SharePoint:ClusteredDirectionalSeparatorArrow ID="ClusteredDirectionalSeparatorArrow1" runat="server" />
    <a href="UsersDisp.aspx"><SharePoint:EncodedLiteral ID="EncodedLiteral2" Text="<%$ Resources:FBAPackWebPages, UserMgmt_Title %>"
        EncodeMethod="HtmlEncode" runat="server" /></a>&#32;<SharePoint:ClusteredDirectionalSeparatorArrow ID="ClusteredDirectionalSeparatorArrow2" runat="server" />
    <SharePoint:EncodedLiteral ID="TitleArea" Text="<%$ Resources:FBAPackWebPages, EditUser_Title %>"
        EncodeMethod="HtmlEncode" runat="server" />
</asp:content>
<asp:content id="Content5" contentplaceholderid="PlaceHolderTitleBreadcrumb" runat="server">
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
</asp:content>
<asp:content id="Content3" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">

</asp:content>
<asp:content id="Content4" contentplaceholderid="PlaceHolderMain" runat="server">
    <table border="0" width="95%" cellspacing="0" cellpadding="10" class="ms-descriptiontext">
   
          <tr>
            <td style="width:17%">
                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:FBAPackWebPages, UserNameReadonlyLabelText %>"></asp:Label>
            </td>
            <td style="width:38%">
                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="red"></asp:Label>
			    <SharePoint:InputFormTextBox Title="Username" Enabled="false" ReadOnly="true" class="ms-input" Columns="40" maxlength="255" ID="txtUsername" Direction="LeftToRight" Runat="server" />
			    <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator1" ControlToValidate="txtUsername" Display="Dynamic" Runat="server"/>
			   </td> 
              <td rowspan="10" id="GroupSection" runat="server">
                   <asp:Label ID="Label12" runat="server" Text="<%$ Resources:FBAPackWebPages, GroupLabelText %>"></asp:Label>
				        <SharePoint:InputFormCheckBoxList ID="groupList" CssClass="ms-RadioText" ToolTip="<%$ Resources:FBAPackWebPages, GroupToolTipText %>" runat="server" />
              </td>
            </tr>
			
         <tr>
            <td >
                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:FBAPackWebPages, TypeFullNameLabelText %>"></asp:Label>
            </td>
            <td>
		            <SharePoint:InputFormTextBox Title="<%$ Resources:FBAPackWebPages, FullNameColHeaderText %>" class="ms-input" Columns="40" maxlength="255" ID="txtFullName" Direction="LeftToRight" Runat="server" />
		            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator2" ControlToValidate="txtFullName" Display="Dynamic" Runat="server"/>
                </td> 
            </tr>
		  
                      <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Type user's CMIT Location"></asp:Label>
            </td>
            <td>
			            <SharePoint:InputFormTextBox Title="Enter CMIT Location" class="ms-input" Columns="40" maxlength="255" ID="txtCMITLocation" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator5" ControlToValidate="txtCMITLocation" Display="Dynamic" Runat="server"/>
			         </td> 
            </tr>


        <tr>
                         <td>
                <asp:Label ID="Label4" runat="server" Text="Type user's Telephone Number"></asp:Label>
            </td>
            <td>
                         <SharePoint:InputFormTextBox Title="Enter CMIT Location" class="ms-input" Columns="40" maxlength="10" ID="txtTelephoneNumber" Direction="LeftToRight" Runat="server" autocomplete="off" />
                        <SharePoint:InputFormRegularExpressionValidator ID="InputFormRegularExpressionValidator1"  ControlToValidate="txtTelephoneNumber" Display="Dynamic" runat="server" ValidationExpression="[0-9]{10}" ErrorMessage="Enter a valid Telephone Number."/>
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator6" ControlToValidate="txtTelephoneNumber" Display="Dynamic" Runat="server"/>
                 </td> 
            </tr>
			  
            <tr>
                         <td >
                <asp:Label ID="Label5" runat="server" Text="Type user's Title"></asp:Label>
            </td>
            <td>
                     
			            <SharePoint:InputFormTextBox Title="Enter Title" class="ms-input" Columns="40" maxlength="255" ID="txtTitle" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator7" ControlToValidate="txtTitle" Display="Dynamic" Runat="server"/>
                 </td> 
            </tr>
		       
         <tr>
                         <td >
                <asp:Label ID="Label6" runat="server" Text="Type Date of Provisioning"></asp:Label>
            </td>
            <td>
                       <SharePoint:DateTimeControl ID="txtDatofProvisionaing" runat="server" IsRequiredField="true"  DateOnly="true" />
                 </td> 
            </tr>
		      
          <tr>
                         <td >
                <asp:Label ID="Label7" runat="server" Text="Active User"></asp:Label>
            </td>
            <td>
                
				    <asp:CheckBox ID="isActive" ToolTip="<%$ Resources:FBAPackWebPages, ActiveCheckBoxToolTipText %>" Text="<%$ Resources:FBAPackWebPages, ActiveCheckBoxLabelText %>" runat="server"/>
                  </td> 
            </tr>
			
         <tr>
                         <td >
                <asp:Label ID="Label8" runat="server" Text="Unlock User"></asp:Label>
            </td>
            <td>
				    <asp:CheckBox ID="isLocked" ToolTip="<%$ Resources:FBAPackWebPages, AccountLockedToolTipText %>" Text="<%$ Resources:FBAPackWebPages, AccountLockedLabelText %>" runat="server"/>
                  </td> 
            </tr>
			
        <tr id="RolesSection" runat="server">
                         <td>
                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:FBAPackWebPages, GroupLabelText %>"></asp:Label>
            </td>
            <td>
			        <SharePoint:InputFormCheckBoxList ID="rolesList" CssClass="ms-RadioText" ToolTip="<%$ Resources:FBAPackWebPages, GroupToolTipText %>" runat="server"/>
                 </td> 
            </tr>
        <wssuc:ButtonSection runat="server">
            <template_buttons>
            <asp:Button UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="OnDeleteUser" Text="<%$ Resources:FBAPackWebPages, DeleteButtonText %>" id="BtnDelete" accesskey="D"/>
	        <asp:Button UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="OnResetPassword" Text="<%$ Resources:FBAPackWebPages, ResetPasswordButtonText %>" id="BtnReset" accesskey="R"/>
    	    <asp:Button UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="OnSubmit" Text="<%$ Resources:FBAPackWebPages, SaveButonText %>" id="BtnOk" accesskey="<%$Resources:wss,okbutton_accesskey%>"/>	    
	    </template_buttons>
        </wssuc:ButtonSection>
    </table>
</asp:content>
