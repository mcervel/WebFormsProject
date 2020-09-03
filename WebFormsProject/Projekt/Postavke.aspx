<%@ Page Title="" Language="C#" MasterPageFile="~/Projekt.Master" AutoEventWireup="true" CodeBehind="Postavke.aspx.cs" Inherits="Projekt.Postavke" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="content">

        <div class="formContainer">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4"></div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="form-group">
                        <asp:Label ID="lblTema" runat="server" Text="Tema" Font-Bold="True" meta:resourcekey="lblTemaResource1"></asp:Label>
                        <asp:DropDownList ID="ddlTema" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlTema_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="ddlTemaResource1">
                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">---- odaberi ---</asp:ListItem>
                            <asp:ListItem Value="predefinirana" meta:resourcekey="ListItemResource2">Predefinirana</asp:ListItem>
                            <asp:ListItem Value="plava" meta:resourcekey="ListItemResource3">Plava</asp:ListItem>
                            <asp:ListItem Value="crvena" meta:resourcekey="ListItemResource4">Crvena</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblKultura" runat="server" Text="Jezik:" Font-Bold="True" meta:resourcekey="lblKulturaResource1"></asp:Label>
                        <asp:DropDownList ID="ddlJezik" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlJezik_SelectedIndexChanged" meta:resourcekey="ddlJezikResource1">
                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource5">---- odaberi ---</asp:ListItem>
                            <asp:ListItem Value="hr" meta:resourcekey="ListItemResource6">Hrvatski</asp:ListItem>
                            <asp:ListItem Value="en" meta:resourcekey="ListItemResource7">Engleski</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblRepo" runat="server" Text="Repozitorij" Font-Bold="True" meta:resourcekey="lblRepoResource1"></asp:Label>
                        <asp:DropDownList ID="ddlRepozitorij" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlRepozitorij_SelectedIndexChanged" meta:resourcekey="ddlRepozitorijResource1">
                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource8">---- odaberi ---</asp:ListItem>
                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource9">Baza</asp:ListItem>
                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource10">Txt datoteka</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>
                <div class="col-lg-4 col-md-4 col-sm-4"></div>
            </div>
        </div>

    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="headerRight" runat="server">
    <a id="hyperLinkUser" title="Pošalji E-mail" class="btn btn-sm btn-success" href="mailto:admin@email.com">ADMIN ADMIN</a>
    <asp:Button runat="server" ID="btnOdjava" class="btn btn-sm btn-warning" Text="Odjavi se" OnClick="btnOdjava_Click" meta:resourcekey="btnOdjavaResource1"></asp:Button>
</asp:Content>
