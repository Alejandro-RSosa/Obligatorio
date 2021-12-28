<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Planeta a Diario </title>
    <style type="text/css">
        .style1
        {
            width: 503px;
            height: 411px;
        }
    </style>
</head>
<body bgcolor="#FFFF99">
    <form id="form1" runat="server">
    <div align="center">
    
        <img alt="" class="style1" src="Img/planeta.png" /><br />
        <div>
            <asp:Label ID="Label1" runat="server" ForeColor="#000099" Text="ABM" 
                Font-Size="X-Large"></asp:Label>
            <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" 
            PostBackUrl="~/MantenimientoPeriodistas.aspx" Font-Size="Large">Mantenimiento Periodistas</asp:LinkButton>
            <br />
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" 
                PostBackUrl="~/MantenimientoSecciones.aspx" Font-Size="Large">Mantenimiento Secciones</asp:LinkButton>
        </div>
        <br />
        <br />
        <div>
            <asp:Label ID="Label2" runat="server" Text="Agregar Noticias" 
                ForeColor="#000099" Font-Size="X-Large"></asp:Label>
                <br />
        <br />
        <asp:LinkButton ID="LinkButton3" runat="server" 
                PostBackUrl="~/AgregarNoticiaInternacional.aspx" Font-Size="Large">Agregar Noticias Internacionales</asp:LinkButton>
            <br />
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" 
                PostBackUrl="~/AgregarNoticiaNacional.aspx" Font-Size="Large">Agregar Noticias Nacionales</asp:LinkButton>
        </div>
        <br />
        <br />
        <div>
            <asp:Label ID="Label3" runat="server" ForeColor="#000099" Text="Listados" 
                Font-Size="X-Large"></asp:Label>
            <br />
        <br />
        <asp:LinkButton ID="LinkButton5" runat="server" 
                PostBackUrl="~/ListadoSecciones.aspx" Font-Size="Large">Listado de Secciones</asp:LinkButton>
            <br />
        <br />        
        <asp:LinkButton ID="LinkButton6" runat="server" 
                PostBackUrl="~/ListadoNoticias.aspx" Font-Size="Large">Listado de Noticias</asp:LinkButton>
            <br />
        </div>
        <br />
        <br />    
    </div>
    </form>
</body>
</html>
