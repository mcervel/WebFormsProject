<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OsobaUserControl.ascx.cs" Inherits="Projekt.Controls.OsobaUserControl" %>

<div class="osoba">
    <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblIme" Text="Ime" meta:resourcekey="lblImeResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbIme" class="form-control input-sm" CausesValidation="True" meta:resourcekey="tbImeResource1" />
            </td>
            <td>
                <asp:HiddenField runat="server" ID="IDOsoba" />
                <asp:RequiredFieldValidator
                    ID="validatorIme"
                    runat="server"
                    ErrorMessage="Ime je obavezno polje"
                    Display="Dynamic"
                    ControlToValidate="tbIme"
                    ForeColor="Red"
                    Text="*" meta:resourcekey="validatorImeResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblPrezime" Text="Prezime" meta:resourcekey="lblPrezimeResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbPrezime" class="form-control input-sm" CausesValidation="True" meta:resourcekey="tbPrezimeResource1" />
            </td>
            <td>
                <asp:RequiredFieldValidator
                    ID="validatorPrezime"
                    runat="server"
                    ControlToValidate="tbPrezime"
                    Display="Dynamic"
                    ErrorMessage="Prezime je obavezno polje"
                    ForeColor="Red"
                    Text="*" meta:resourcekey="validatorPrezimeResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:DropDownList CssClass="form-control input-sm" ID="ddlEmail" runat="server" AutoPostBack="True" meta:resourcekey="ddlEmailResource1">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblEmail" Text="Email:" meta:resourcekey="lblEmailResource1"></asp:Label>
            </td>
            <td>
                <div class="input-group">
                    <asp:TextBox runat="server" ID="tbEmail" class="form-control input-sm" CausesValidation="True" meta:resourcekey="tbEmailResource1" />
                    <span class="input-group-btn">
                        <asp:LinkButton CssClass="btn btn-default btn-sm" ID="btnEmailEdit" runat="server" OnClick="btnEmailEdit_Click" meta:resourcekey="btnEmailEditResource1" Text="
                                &lt;span style='color: #0094ff;' class='glyphicon glyphicon-save' /&gt;
                        "></asp:LinkButton>
                    </span>
                </div>

            </td>
            <td>
                <asp:RegularExpressionValidator
                    runat="server"
                    ID="regularValidatorEmail"
                    ControlToValidate="tbEmail"
                    ErrorMessage="Kriva E-mail adresa"
                    Display="Dynamic"
                    Text="*"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ForeColor="Red" meta:resourcekey="regularValidatorEmailResource1"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator
                    runat="server"
                    ID="requiredValidatorEmail"
                    Text="*"
                    Display="Dynamic"
                    ControlToValidate="tbEmail"
                    ErrorMessage="E-mail je obavezno polje"
                    ForeColor="Red" meta:resourcekey="requiredValidatorEmailResource1"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblTelefon" Text="Telefon:" meta:resourcekey="lblTelefonResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbTelefon" class="form-control input-sm" meta:resourcekey="tbTelefonResource1" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblLozinka" Text="Lozinka:" meta:resourcekey="lblLozinkaResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbLozinka" class="form-control input-sm" CausesValidation="True" meta:resourcekey="tbLozinkaResource1" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStatus" runat="server" Text="Status:" meta:resourcekey="lblStatusResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList CssClass="form-control input-sm" ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblGrad" runat="server" Text="Grad:" meta:resourcekey="lblGradResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList CssClass="form-control input-sm" ID="ddlGrad" runat="server" meta:resourcekey="ddlGradResource1">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnEdit" runat="server" Text="Uredi" CssClass="btn btn-primary btn-sm btnCtrl" OnClick="btnEdit_Click" meta:resourcekey="btnEditResource1" />
                <asp:Button ID="btnDelete" runat="server" Text="Obriši" CssClass="btn btn-warning btn-sm btnCtrl" OnClick=" btnDelete_Click" OnClientClick="return confirmDelete(this, 'Confirm delete?');" meta:resourcekey="btnDeleteResource1" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="validationSummary" CssClass="validationSummary" runat="server" meta:resourcekey="validationSummaryResource1" />
            </td>
        </tr>
    </table>
</div>

<script>
    function confirmDelete(sender, message) {
        if (sender.dataset.deleteconfirmed == 'true')
            return true;

        bootbox.confirm(message, function (confirmed) {
            if (confirmed) {
                sender.setAttribute('data-deleteconfirmed', confirmed);
                sender.click();
            }
        });

        return false;
    }
</script>
