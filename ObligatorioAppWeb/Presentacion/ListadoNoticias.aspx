<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListadoNoticias.aspx.cs" Inherits="ListadoNoticias" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Listado Noticias </title>
</head>
<body bgcolor="#FFFF99">
    <form id="form1" runat="server">
    <div align="center" style="overflow: auto"> 
    <strong>
        <asp:Label ID="lblNoticias" runat="server" Text="Listado de Noticias" 
            Font-Italic="True" Font-Size="XX-Large" ForeColor="#3399FF" 
            Font-Bold="True"></asp:Label>
        </strong>
        <br />
        <br />
    <br />
    <div>
    
        <asp:DropDownList ID="ddlNoticias" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddlNoticias_SelectedIndexChanged">
            <asp:ListItem>----</asp:ListItem>
            <asp:ListItem>Todas</asp:ListItem>
            <asp:ListItem>Nacionales</asp:ListItem>
            <asp:ListItem>Internacionales</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:TextBox ID="txtListado" runat="server" Height="400px" TextMode="MultiLine" Wrap="true"
                    Width="80%" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="lbVolver" runat="server" PostBackUrl="~/Default.aspx">Volver</asp:LinkButton>
        <br />
    
    </div>
    </div>
    </form>
</body>
</html>
