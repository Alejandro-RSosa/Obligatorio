<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MantenimientoSecciones.aspx.cs" Inherits="MantenimientoSecciones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> ABM Secciones </title>
        
    <style type="text/css">
        .style1
        {
            width: 93px;
        }
    </style>
        
</head>
<body bgcolor="#FFFF99">
    <form id="form1" runat="server">
    <div align="center">
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="XX-Large" ForeColor="#3399FF" Text="Mantenimiento Secciones"></asp:Label>
    <br />
    <br />
    <br />
        <table style="width: 30%;" align="center">
            <tr>
                <td class="style2">
                    <asp:Label ID="Label7" runat="server" ForeColor="#000099" Text="Codigo:"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtCodigo" runat="server" Width="75px"></asp:TextBox>
                </td>
                <td class="style1">
                    <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
                        Text="Buscar" BackColor="#3399FF" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label8" runat="server" ForeColor="#000099" Text="Nombre:"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtNombre" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    </td>
                <td class="style7">
                    <asp:Button ID="btnAgregar" runat="server" onclick="btnAgregar_Click" 
                        Text="Agregar" BackColor="#3399FF" />
                    &nbsp;
                    <asp:Button ID="btnModificar" runat="server" onclick="btnModificar_Click" 
                        Text="Modificar" BackColor="#3399FF" />
                    &nbsp;
                    <asp:Button ID="btnEliminar" runat="server" onclick="btnEliminar_Click" 
                        Text="Eliminar" BackColor="#3399FF" />
                </td>
                <td class="style1">
                    <asp:Button ID="btnLimpiar" runat="server" onclick="btnLimpiar_Click" 
                        Text="Limpiar" BackColor="#3399FF" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style4" style="margin-left: 40px">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style4" style="margin-left: 40px">
                    <asp:LinkButton ID="lbVolver" runat="server" PostBackUrl="~/Default.aspx">Volver</asp:LinkButton>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
