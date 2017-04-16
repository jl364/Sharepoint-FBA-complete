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
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    <SharePoint:EncodedLiteral ID="PageTitle" Text="<%$ Resources:FBAPackWebPages, EditUser_Title %>"
        EncodeMethod="HtmlEncode" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea"
    runat="server">
   	<a href="../../settings.aspx"><SharePoint:EncodedLiteral ID="EncodedLiteral1" runat="server" text="<%$Resources:wss,settings_pagetitle%>" EncodeMethod="HtmlEncode"/></a>&#32;<SharePoint:ClusteredDirectionalSeparatorArrow ID="ClusteredDirectionalSeparatorArrow1" runat="server" />
    <a href="UsersDisp.aspx"><SharePoint:EncodedLiteral ID="EncodedLiteral2" Text="<%$ Resources:FBAPackWebPages, UserMgmt_Title %>"
        EncodeMethod="HtmlEncode" runat="server" /></a>&#32;<SharePoint:ClusteredDirectionalSeparatorArrow ID="ClusteredDirectionalSeparatorArrow2" runat="server" />
    <SharePoint:EncodedLiteral ID="TitleArea" Text="<%$ Resources:FBAPackWebPages, EditUser_Title %>"
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
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <table border="0" width="100%" cellspacing="0" cellpadding="0" class="ms-descriptiontext">
        <wssuc:InputFormSection runat="server">
            <template_inputformcontrols>
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="red"></asp:Label>
		    <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, UserNameReadonlyLabelText %>">
			    <Template_Control>
			    <SharePoint:InputFormTextBox Title="Username" Enabled="false" ReadOnly="true" class="ms-input" Columns="40" maxlength="255" ID="txtUsername" Direction="LeftToRight" Runat="server" />
			    <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator1" ControlToValidate="txtUsername" Display="Dynamic" Runat="server"/>
			    
			    </Template_Control>
		    </wssuc:InputFormControl>
	    </template_inputformcontrols>
        </wssuc:InputFormSection>
        <wssuc:InputFormSection runat="server">
            <template_inputformcontrols>
	        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, TypeFullNameLabelText %>">
		        <Template_Control>
		            <SharePoint:InputFormTextBox Title="<%$ Resources:FBAPackWebPages, FullNameColHeaderText %>" class="ms-input" Columns="40" maxlength="255" ID="txtFullName" Direction="LeftToRight" Runat="server" />
		            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator2" ControlToValidate="txtFullName" Display="Dynamic" Runat="server"/>
		        </Template_Control>
	        </wssuc:InputFormControl>
        </template_inputformcontrols>
        </wssuc:InputFormSection>

                 <wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="Type user's CMIT Location">
			        <Template_Control>
			            <SharePoint:InputFormTextBox Title="Enter CMIT Location" class="ms-input" Columns="40" maxlength="255" ID="txtCMITLocation" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator5" ControlToValidate="txtCMITLocation" Display="Dynamic" Runat="server"/>
			        </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>

         <wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="Type user's Telephone Number">
			        <Template_Control>
                         <SharePoint:InputFormTextBox Title="Enter CMIT Location" class="ms-input" Columns="40" maxlength="10" ID="txtTelephoneNumber" Direction="LeftToRight" Runat="server" autocomplete="off" />
                        <SharePoint:InputFormRegularExpressionValidator ID="InputFormRegularExpressionValidator1"  ControlToValidate="txtTelephoneNumber" Display="Dynamic" runat="server" ValidationExpression="[0-9]{10}" ErrorMessage="Enter a valid Telephone Number."/>
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator6" ControlToValidate="txtTelephoneNumber" Display="Dynamic" Runat="server"/>
			        </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>

          <wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="Type user's Title">
			        <Template_Control>
			            <SharePoint:InputFormTextBox Title="Enter Title" class="ms-input" Columns="40" maxlength="255" ID="txtTitle" Direction="LeftToRight" Runat="server" autocomplete="off" />
			            <SharePoint:InputFormRequiredFieldValidator ID="InputFormRequiredFieldValidator7" ControlToValidate="txtTitle" Display="Dynamic" Runat="server"/>
			        </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>

          <wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		        <wssuc:InputFormControl runat="server" LabelText="Type user's Date of Provisioning">
			        <Template_Control>
                       <SharePoint:DateTimeControl ID="txtDatofProvisionaing" runat="server" IsRequiredField="true"  DateOnly="true" />
			        </Template_Control>
		        </wssuc:InputFormControl>
	        </template_inputformcontrols>
        </wssuc:InputFormSection>
      <%--  <wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		    <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, TypeEmailAddrLabelText %>">
			    <Template_Control>
			    <SharePoint:InputFormTextBox Title="<%$ Resources:FBAPackWebPages, EmailColHeaderText %>" class="ms-input" Columns="40" maxlength="255" ID="txtEmail" Direction="LeftToRight" Runat="server" />
			    <SharePoint:InputFormRegularExpressionValidator ID="InputFormRegExpressionFieldValidator1"  ControlToValidate="txtEmail" Display="Dynamic" runat="server" ValidationExpression=".+\@.+" ErrorMessage="Enter a valid email address."/>
			    </Template_Control>
		    </wssuc:InputFormControl>
	    </template_inputformcontrols>--%>
        </wssuc:InputFormSection>
        <wssuc:InputFormSection runat="server" id="CategorySection1" >
            <template_inputformcontrols>
		    <wssuc:InputFormControl runat="server">
			    <Template_Control>
				    <asp:CheckBox ID="isActive" ToolTip="<%$ Resources:FBAPackWebPages, ActiveCheckBoxToolTipText %>" Text="<%$ Resources:FBAPackWebPages, ActiveCheckBoxLabelText %>" runat="server"/>
			    </Template_Control>
		    </wssuc:InputFormControl>
	    </template_inputformcontrols>
        </wssuc:InputFormSection>
        <wssuc:InputFormSection runat="server" >
            <template_inputformcontrols>
		    <wssuc:InputFormControl runat="server">
			    <Template_Control>
				    <asp:CheckBox ID="isLocked" ToolTip="<%$ Resources:FBAPackWebPages, AccountLockedToolTipText %>" Text="<%$ Resources:FBAPackWebPages, AccountLockedLabelText %>" runat="server"/>
			    </Template_Control>
		    </wssuc:InputFormControl>
	    </template_inputformcontrols>
        </wssuc:InputFormSection>
        <wssuc:InputFormSection runat="server" id="GroupSection" >
            <template_inputformcontrols>
	        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, GroupLabelText %>">
		        <Template_Control>
			        <SharePoint:InputFormCheckBoxList ID="groupList" CssClass="ms-RadioText" ToolTip="<%$ Resources:FBAPackWebPages, GroupToolTipText %>" runat="server"/>
		        </Template_Control>
	        </wssuc:InputFormControl>
        </template_inputformcontrols>
        </wssuc:InputFormSection>
        <wssuc:InputFormSection runat="server" id="RolesSection">
            <template_inputformcontrols>
	        <wssuc:InputFormControl runat="server" LabelText="<%$ Resources:FBAPackWebPages, GroupLabelText %>">
		        <Template_Control>
			        <SharePoint:InputFormCheckBoxList ID="rolesList" CssClass="ms-RadioText" ToolTip="<%$ Resources:FBAPackWebPages, GroupToolTipText %>" runat="server"/>
		        </Template_Control>
	        </wssuc:InputFormControl>
        </template_inputformcontrols>
        </wssuc:InputFormSection>
        <wssuc:ButtonSection runat="server">
            <template_buttons>
            <asp:Button UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="OnDeleteUser" Text="<%$ Resources:FBAPackWebPages, DeleteButtonText %>" id="BtnDelete" accesskey="D"/>
	        <asp:Button UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="OnResetPassword" Text="<%$ Resources:FBAPackWebPages, ResetPasswordButtonText %>" id="BtnReset" accesskey="R"/>
    	    <asp:Button UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="OnSubmit" Text="<%$ Resources:FBAPackWebPages, SaveButonText %>" id="BtnOk" accesskey="<%$Resources:wss,okbutton_accesskey%>"/>	    
	    </template_buttons>
        </wssuc:ButtonSection>
    </table>
</asp:Content>
