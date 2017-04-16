<table border="0" cellpadding="0">
    <tr>
   <tr> <td colspan="2" height="5">&nbsp;</td> </tr>
    <tr>
    <td align="left" colspan="2">
        <asp:Label ID="UserNameInstruction" Font-Bold="true" Font-Size="Larger" runat="server" /></td>
    </tr>
   <tr> <td colspan="2" height="5">&nbsp;</td> </tr>
    <tr>
    <td align="left">
        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName"></asp:Label></td>
    <td>
        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"  Display="Dynamic"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td align="center" colspan="2" style="color: red">
        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
    </td>
    </tr>
    <tr> <td colspan="2" height="5">&nbsp;</td> </tr>
    <tr>
    <td align="center" colspan="2">
        <asp:Button ID="SubmitButton" Visible="false" runat="server" CommandName="Submit" />
        <asp:LinkButton ID="SubmitLinkButton" Visible="false" runat="server" CommandName="Submit" />
        <asp:ImageButton ID="SubmitImageButton" Visible="false" runat="server" CommandName="Submit" />
    </td>
    </tr>
</table>