<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AgregarNoticiaInternacional.aspx.cs" Inherits="AgregarNoticiaInternacional" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Noticias Internacionales </title>    
    
</head>
<body bgcolor="#FFFF99">
    <form id="form1" runat="server">
    <div align="center" class="style1">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="XX-Large" ForeColor="#3399FF" Text="Agregar Noticia Internacional"></asp:Label>
        <br />
        <br />
    <br />
    
        <table style="width: auto;" border="1px" cellpadding="5px" align="center">
            <tr>
                <td>
                    Titulo:</td>
                <td>
                    <asp:TextBox ID="txtTitulo" runat="server" Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Resumen:</td>
                <td>
                    <asp:TextBox ID="txtResumen" runat="server" Width="500px" Height="75px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Contenido:</td>
                <td>
                    <asp:TextBox ID="txtContenido" runat="server" Height="150px" 
                        TextMode="MultiLine" Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Fecha:</td>
                <td class="style1">
                    <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Hora:</td>
                <td class="style1">
                    <asp:TextBox ID="txtHora" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Codigo de Periodista:</td>
                <td>
                    <asp:TextBox ID="txtCodPeri" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Pais:</td>
                <td>
                    <asp:TextBox ID="txtPais" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnAgregar" runat="server" onclick="btnAgregar_Click" 
                        Text="Agregar" BackColor="#3399FF" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:LinkButton ID="lbtnVolver" runat="server" PostBackUrl="~/Default.aspx">Volver</asp:LinkButton>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
