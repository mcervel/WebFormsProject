<%@ Page Title="" Language="C#" MasterPageFile="~/Projekt.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="Projekt._404" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerRight" runat="server">
    <a id="hyperLinkUser" title="Pošalji E-mail" class="btn btn-sm btn-success" href="mailto:admin@email.com">ADMIN ADMIN</a>
    <asp:Button runat="server" ID="btnOdjava" class="btn btn-sm btn-warning" Text="Odjavi se" OnClick="btnOdjava_Click" meta:resourcekey="btnOdjavaResource1"></asp:Button>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width: 100%; height: 300px;">
        <tr>
            <td align="center" valign="middle">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="33px"
                    ForeColor="Red" Text="404 STATUS ERROR" meta:resourcekey="Label1Resource1"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblOpisGreske" runat="server" CssClass="info" BorderStyle="Solid" BorderWidth="0px" ForeColor="Black" BorderColor="Gray" Font-Bold="True" meta:resourcekey="lblOpisGreskeResource1">The page you were looking for does not exist!</asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
