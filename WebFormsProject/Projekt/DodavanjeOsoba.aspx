<%@ Page Title="" Language="C#" MasterPageFile="~/Projekt.Master" AutoEventWireup="true" CodeBehind="DodavanjeOsoba.aspx.cs" Inherits="Projekt.DodavanjeOsoba" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="formContainer" id="main">
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="form-group">
                <asp:Label runat="server" ID="lblIme" Text="Ime" meta:resourcekey="lblImeResource1"></asp:Label>
                &nbsp;
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2"
                    runat="server"
                    ErrorMessage="Ime je obavezno polje"
                    Display="Dynamic"
                    ControlToValidate="tbIme"
                    ForeColor="Red"
                    Text="*" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="tbIme" class="form-control" CausesValidation="True" meta:resourcekey="tbImeResource1" />

            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="lblPrezime" Text="Prezime" meta:resourcekey="lblPrezimeResource1"></asp:Label>
                &nbsp;
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3"
                        runat="server"
                        ControlToValidate="tbPrezime"
                        Display="Dynamic"
                        ErrorMessage="Prezime je obavezno polje"
                        ForeColor="Red"
                        Text="*" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="tbPrezime" class="form-control" CausesValidation="True" meta:resourcekey="tbPrezimeResource1" />

            </div>
            <div>


                <div runat="server" id="emailDiv" class="form-group">
                    <div>
                        <asp:Label runat="server" ID="lblEmail" Text="Email:" meta:resourcekey="lblEmailResource1"></asp:Label>
                        &nbsp;
                        <asp:RegularExpressionValidator
                            ID="emailRegexValidator"
                            runat="server"
                            ControlToValidate="tbEmail"
                            ErrorMessage="Kriva E-mail adresa"
                            Display="Dynamic"
                            Text="*"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ForeColor="Red" meta:resourcekey="emailRegexValidatorResource1"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator
                            ID="emailRequiredFieldValidator"
                            runat="server"
                            Text="*"
                            Display="Dynamic"
                            ControlToValidate="tbEmail"
                            ErrorMessage="E-mail je obavezno polje"
                            ForeColor="Red" meta:resourcekey="emailRequiredFieldValidatorResource1"></asp:RequiredFieldValidator>
                    </div>

                    <asp:TextBox runat="server" ID="tbEmail" class="form-control" CausesValidation="True" meta:resourcekey="tbEmailResource1" />
                    <div runat="server" id="otherEmailsDiv" class="form-group"> 

                    </div>
                </div>
                <asp:LinkButton runat="server" ID="lbAddEmail" Text="Dodaj još E-mail adresa..." OnClick="lbAddEmail_Click" CausesValidation="False" meta:resourcekey="lbAddEmailResource1"></asp:LinkButton>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">

            <div class="form-group">
                <asp:Label runat="server" ID="lblTelefon" Text="Telefon:" meta:resourcekey="lblTelefonResource1"></asp:Label>
                <asp:TextBox runat="server" ID="tbTelefon" class="form-control" meta:resourcekey="tbTelefonResource1" />
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="lblGrad" Text="Grad" meta:resourcekey="lblGradResource1"></asp:Label>
                <asp:DropDownList runat="server" name="ddlGrad" ID="ddlGrad" class="form-control" meta:resourcekey="ddlGradResource1">
                    <asp:ListItem Text="Zagreb" Value="Zagreb" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Text="Varaždin" Value="Varazdin" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    <asp:ListItem Text="Split" Value="Split" meta:resourcekey="ListItemResource3"></asp:ListItem>
                    <asp:ListItem Text="Rijeka" Value="Rijeka" meta:resourcekey="ListItemResource4"></asp:ListItem>
                    <asp:ListItem Text="Pula" Value="Pula" meta:resourcekey="ListItemResource5"></asp:ListItem>
                    <asp:ListItem Text="Osijek" Value="Osijek" meta:resourcekey="ListItemResource6"></asp:ListItem>
                    <asp:ListItem Text="Dubrovnik" Value="Dubrovnik" meta:resourcekey="ListItemResource7"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="lblStatus" Text="Status:" meta:resourcekey="lblStatusResource1"></asp:Label>
                <asp:DropDownList runat="server" ID="ddlStatus" class="form-control" meta:resourcekey="ddlStatusResource1">
                    <asp:ListItem Value="0" Text="Korisnik" meta:resourcekey="ListItemResource8"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Administrator" meta:resourcekey="ListItemResource9"></asp:ListItem>
                </asp:DropDownList>
            </div>

        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="form-group">
                <asp:Label runat="server" ID="lblLozinka" Text="Lozinka:" meta:resourcekey="lblLozinkaResource1"></asp:Label>
                &nbsp;
                    <asp:RequiredFieldValidator
                        runat="server"
                        ControlToValidate="tbLozinka"
                        Display="Dynamic"
                        Text="*"
                        ForeColor="Red"
                        ErrorMessage="Lozinka je obavezno polje" meta:resourcekey="RequiredFieldValidatorResource2"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" TextMode="Password" ID="tbLozinka" class="form-control" CausesValidation="True" meta:resourcekey="tbLozinkaResource1" />
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="lblLozinkaPotvrda" Text="Potvrda lozinke:" meta:resourcekey="lblLozinkaPotvrdaResource1"></asp:Label>

                <asp:RequiredFieldValidator
                    runat="server"
                    Text="*"
                    Display="Dynamic"
                    ControlToValidate="tbLozinkaPotvrda"
                    ForeColor="Red"
                    ErrorMessage="Potvrda lozinke je obavezno polje" meta:resourcekey="RequiredFieldValidatorResource3"></asp:RequiredFieldValidator>

                <asp:CompareValidator
                    runat="server"
                    ControlToValidate="tbLozinkaPotvrda"
                    ControlToCompare="tbLozinka"
                    Text="*"
                    ErrorMessage="Potvrda lozinke ne odgovara unesenoj lozinki"
                    Display="Dynamic" ForeColor="Red" meta:resourcekey="CompareValidatorResource1"></asp:CompareValidator>
                <asp:TextBox runat="server" TextMode="Password" ID="tbLozinkaPotvrda" class="form-control" CausesValidation="True" meta:resourcekey="tbLozinkaPotvrdaResource1" />
            </div>
            <asp:Button runat="server" ID="btnDodaj" class="btn btn-primary" Text="Dodaj" OnClick="btnDodaj_Click" meta:resourcekey="btnDodajResource1" />
        </div>

        <asp:HiddenField runat="server" ID="hiddenFieldToastr" Value="false" />

        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="validationSummary">
                <asp:ValidationSummary runat="server" ForeColor="Red" meta:resourcekey="ValidationSummaryResource1" />
            </div>
        </div>
        <div style="clear: both;"></div>
    </div>

    <script type="text/javascript">

        window.onload = function (e) {
            var toastrField = document.getElementById('mainContent_hiddenFieldToastr').value;

            if (toastrField == "true") {
                toastr["info"]("Person has been inserted to database!")
                document.getElementById('mainContent_hiddenFieldToastr').value = "false";
            }
    
        }

    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerRight" runat="server">
    <a id="hyperLinkUser" title="Pošalji E-mail" class="btn btn-sm btn-success" href="mailto:admin@email.com">ADMIN ADMIN</a>
    <asp:Button runat="server" ID="btnOdjava" class="btn btn-sm btn-warning" Text="Odjavi se" OnClick="btnOdjava_Click" CausesValidation="False" meta:resourcekey="btnOdjavaResource1"></asp:Button>
</asp:Content>
