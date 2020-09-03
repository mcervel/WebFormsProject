<%@ Page Title="" Language="C#" MasterPageFile="~/Projekt.Master" AutoEventWireup="True" CodeBehind="Login.aspx.cs" Inherits="Projekt.Login" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4"></div>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="formContainer" style="padding: 20px">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblEmail" Text="E-mail" meta:resourcekey="lblEmailResource1"></asp:Label>
                    &nbsp;
                    <asp:RegularExpressionValidator
                        ID="emailRegexValidator"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Kriva E-mail adresa"
                        Display="Dynamic"
                        Text="*"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ForeColor="Red" meta:resourcekey="emailRegexValidatorResource1"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email je obavezno polje!" ControlToValidate="txtEmail" ForeColor="Red" Text="*" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                    <asp:TextBox runat="server" ID="txtEmail" class="form-control" meta:resourcekey="txtEmailResource1" />
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="lblLozinka" Text="Lozinka" meta:resourcekey="lblLozinkaResource1"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Lozinka je obavezno polje!" ControlToValidate="txtLozinka" ForeColor="Red" Text="*" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>  
                    <asp:TextBox runat="server" ID="txtLozinka" TextMode="Password" class="form-control" meta:resourcekey="txtLozinkaResource1" />
                </div>
                <div class="checkbox">
                    <label>
                    <asp:CheckBox runat="server" ID="cbRememberMe" meta:resourcekey="cbRememberMeResource1" Text="Zapamti me" />
                    </label>
                </div>
                <asp:Button runat="server"  Text="Ulaz" ID="btnLogin" class="btn btn-primary" OnClick="btnLogin_Click" meta:resourcekey="btnLoginResource1"/>
                <div style="margin-top: 20px;">
                    <div class="temporary-error">
                        <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Bold="True" meta:resourcekey="lblInfoResource1"></asp:Label>
                    </div>
                </div>
                <div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" meta:resourcekey="ValidationSummary1Resource1" />
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4"></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="headerRight" runat="server">
</asp:Content>
