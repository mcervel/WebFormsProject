<%@ Page Title="" Language="C#" MasterPageFile="~/Projekt.Master" AutoEventWireup="true" CodeBehind="UrediOsobu.aspx.cs" Inherits="Projekt.UrediOsobu" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerRight" runat="server">
    <a id="hyperLinkUser" title="Pošalji E-mail" class="btn btn-sm btn-success" href="mailto:admin@email.com">ADMIN ADMIN</a>
    <asp:Button runat="server" ID="btnOdjava" class="btn btn-sm btn-warning" Text="Odjavi se" OnClick="btnOdjava_Click" meta:resourcekey="btnOdjavaResource1"></asp:Button>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
    <div class="content">
        <div style="overflow:hidden">
            <div runat="server" id="divOsoba" style="width: 30%; margin:auto;">
            </div>
        </div>
    </div>
</asp:Content>
