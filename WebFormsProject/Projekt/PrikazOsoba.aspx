<%@ Page Title="" Language="C#" MasterPageFile="~/Projekt.Master" AutoEventWireup="true" CodeBehind="PrikazOsoba.aspx.cs" Inherits="Projekt.PrikazOsoba" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="content">
        <div class="panel-group" id="accordion">

            <div class="panel panel-default">

                <div class="panel-heading" role="tab">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#gridViewContent">Grid View
                        </a>
                    </h4>
                </div>

                <div id="gridViewContent" class="panel-collapse collapse show">
                    <div class="panel-body">
                        <asp:GridView ID="gvOsobe" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="IDOsoba" OnRowCancelingEdit="gvOsobe_RowCancelingEdit" OnRowEditing="gvOsobe_RowEditing" OnRowUpdating="gvOsobe_RowUpdating" CssClass="tblGrid table table-condensed" meta:resourcekey="gvOsobeResource1">

                            <Columns>

                                <asp:TemplateField HeaderText="Ime" meta:resourcekey="TemplateFieldResource1">
                                    <EditItemTemplate>
                                        <asp:TextBox CssClass="form-control input-sm" ID="txtIme" runat="server" Text='<%# Bind("Ime") %>' meta:resourcekey="txtImeResource1"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="validatorIme"
                                            runat="server"
                                            ErrorMessage="Ime je obavezno polje"
                                            Display="Dynamic"
                                            ControlToValidate="txtIme"
                                            ForeColor="Red" meta:resourcekey="validatorImeResource1"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("Ime") %>' SortExpression="Ime" meta:resourcekey="LabelResource1" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Prezime" meta:resourcekey="TemplateFieldResource2">
                                    <EditItemTemplate>
                                        <asp:TextBox CssClass="form-control input-sm" ID="txtPrezime" runat="server" Text='<%# Bind("Prezime") %>' meta:resourcekey="txtPrezimeResource1"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="validatorPrezime"
                                            runat="server"
                                            ControlToValidate="txtPrezime"
                                            Display="Dynamic"
                                            ErrorMessage="Prezime je obavezno polje"
                                            ForeColor="Red" meta:resourcekey="validatorPrezimeResource1"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("Prezime") %>' SortExpression="Ime" meta:resourcekey="LabelResource2" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="E-mail adrese" meta:resourcekey="TemplateFieldResource3">
                                    <EditItemTemplate>

                                        <asp:TextBox CssClass="form-control input-sm" ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' meta:resourcekey="txtEmailResource1"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="emailRegularExpressionValidator" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Krivo upisana E-mail adresa!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="emailRegularExpressionValidatorResource1"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator
                                            runat="server"
                                            ID="emailRequiredValidator"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmail"
                                            ErrorMessage="E-mail je obavezno polje"
                                            ForeColor="Red" meta:resourcekey="emailRequiredValidatorResource1"></asp:RequiredFieldValidator>
                                        
                                        <asp:TextBox CssClass="form-control input-sm" ID="txtEmail2" runat="server" Text='<%# Bind("Email2") %>' meta:resourcekey="txtEmail2Resource1"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="email2RegularExpressionValidator" runat="server" ControlToValidate="txtEmail2" Display="Dynamic" ErrorMessage="Krivo upisana E-mail adresa!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="email2RegularExpressionValidatorResource1"></asp:RegularExpressionValidator>
                                        
                                        <asp:TextBox CssClass="form-control input-sm" ID="txtEmail3" runat="server" Text='<%# Bind("Email3") %>' meta:resourcekey="txtEmail3Resource1"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="email3RegularExpressionValidator" runat="server" ControlToValidate="txtEmail3" Display="Dynamic" ErrorMessage="Krivo upisana E-mail adresa!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="email3RegularExpressionValidatorResource1"></asp:RegularExpressionValidator>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server"
                                            Text='<%# Eval("Email") %>'
                                            NavigateUrl='<%# Eval("Email", "mailto:{0}") %>' meta:resourcekey="HyperLinkResource1" />
                                        <br />
                                        <asp:HyperLink runat="server"
                                            Text='<%# Eval("Email2") %>'
                                            NavigateUrl='<%# Eval("Email2", "mailto:{0}") %>' meta:resourcekey="HyperLinkResource2" />
                                        <br />

                                        <asp:HyperLink runat="server"
                                            Text='<%# Eval("Email3") %>'
                                            NavigateUrl='<%# Eval("Email3", "mailto:{0}") %>' meta:resourcekey="HyperLinkResource3" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Telefon" meta:resourcekey="TemplateFieldResource4">
                                    <EditItemTemplate>
                                        <asp:TextBox CssClass="form-control input-sm" ID="txtTelefon" runat="server" Text='<%# Bind("Telefon") %>' meta:resourcekey="txtTelefonResource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("Telefon") %>' SortExpression="Ime" meta:resourcekey="LabelResource3" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                                    <ItemTemplate>
                                        <asp:DropDownList Width="120px" CssClass="form-control input-sm" ID="ddlStatus" runat="server" AutoPostBack="True" Enabled="False" SelectedValue='<%# Bind("Status") %>' meta:resourcekey="ddlStatusResource1">
                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource3" Selected="True">Korisnik</asp:ListItem>
                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource4">Administrator</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:DropDownList Width="120px" CssClass="form-control input-sm" ID="ddlStatusEdit" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Status") %>' meta:resourcekey="ddlStatusEditResource1">
                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Selected="True">Korisnik</asp:ListItem>
                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">Administrator</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <%--<asp:BoundField DataField="Status" />--%>
                                <asp:CommandField CancelText="Odustani" EditText="Uredi" ShowEditButton="true" ControlStyle-ForeColor="Blue" meta:resourcekey="CommandFieldResource1" >
<ControlStyle ForeColor="Blue"></ControlStyle>
                                </asp:CommandField>
                            </Columns>
                            <%--<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />--%>
                            <HeaderStyle BackColor="#333333" ForeColor="White" Font-Size="Medium" Height="30px" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>


                    </div>
                </div>
            </div>


            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#repeaterContent" class="collapsed">Repeater
                        </a>
                    </h4>
                </div>
                <div id="repeaterContent" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div>
                            <asp:Repeater ID="repeaterOsobe" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-condensed table-hover tblRepeater">
                                        <tr style="background-color: #333333; padding: 5px; color: white;">
                                            <th>
                                                <asp:Label ID="lblIme" runat="server" Text="Ime" meta:resourcekey="lblImeResource1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblPrezime" runat="server" Text="Prezime" meta:resourcekey="lblPrezimeResource1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblEmail" runat="server" Text="E-mail" meta:resourcekey="lblEmailResource1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblTelefon" runat="server" Text="Telefon" meta:resourcekey="lblTelefonResource1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblStatus" runat="server" Text="Status" meta:resourcekey="lblStatusResource1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblGrad" runat="server" Text="Grad" meta:resourcekey="lblGradResource1"></asp:Label></th>
                                            <th>&nbsp;</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Ime") %></td>
                                        <td><%# Eval("Prezime") %></td>
                                        <td>
                                            <ul>
                                                <li>
                                                    <a href="mailto:<%# Eval("Email") %>"><%# Eval("Email") %></a>
                                                </li>
                                                <li>
                                                    <a href="mailto:<%# Eval("Email2") %>"><%# Eval("Email2") %></a>
                                                </li>
                                                <li>
                                                    <a href="mailto:<%# Eval("Email3") %>"><%# Eval("Email3") %></a>
                                                </li>
                                            </ul>
                                        </td>
                                        <td><%# Eval("Telefon") %></td>
                                        <td><%# Eval("Status") %></td>
                                        <td><%# Eval("Grad") %></td>

                                        <td>
                                            <asp:LinkButton ID="btnUredi" runat="server" Text="Uredi" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Eval("IDOsoba") %>' OnClick="btnUredi_Click" meta:resourcekey="btnUrediResource1" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="temporary-error">
        <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Bold="True" meta:resourcekey="lblInfoResource1"></asp:Label>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerRight" runat="server">
    <a id="hyperLinkUser" title="Pošalji E-mail" class="btn btn-sm btn-success" href="mailto:admin@email.com">ADMIN ADMIN</a>
    <asp:Button runat="server" ID="btnOdjava" class="btn btn-sm btn-warning" Text="Odjavi se" OnClick="btnOdjava_Click" meta:resourcekey="btnOdjavaResource1"></asp:Button>
</asp:Content>
