<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Sp.Login.Custom.Layouts.Sp.Login.Custom.ForgetPassword" MasterPageFile="~/_layouts/15/simplev4.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
</asp:Content>
<asp:content contentplaceholderid="PlaceHolderIcon" runat="server">
   <img   title="pgclogo" border="0" alt="PGC Logo" src="/_layouts/15/images/FAVICON.ico"  />
</asp:content>
<asp:content id="Main" contentplaceholderid="PlaceHolderMain" runat="server">

<div>

     <asp:PasswordRecovery ID="_ctlPasswordRecovery" BorderPadding="4" Runat="server"  >

      </asp:PasswordRecovery>
      
</div>


</asp:content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Forgot Password
</asp:Content>
<asp:content id="PageTitleInTitleArea" contentplaceholderid="PlaceHolderPageTitleInTitleArea"
    runat="server">
Forgot Password
</asp:content>
