﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailUserControl.ascx.cs" Inherits="Projekt.Controls.EmailUserControl" %>

<asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" meta:resourcekey="tbEmailResource1"></asp:TextBox>
<asp:RegularExpressionValidator ID="validatorEmail" runat="server" ErrorMessage="Kriva e-mail adresa" Text="*" ValidationExpression="^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z][a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$" Display="Dynamic" ControlToValidate="tbEmail" ForeColor="Red" meta:resourcekey="validatorEmailResource1"></asp:RegularExpressionValidator>