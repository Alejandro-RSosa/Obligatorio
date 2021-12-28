using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using Logica;
using EntidadesCompartidas;

public partial class ListadoSecciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        try
        {
            if (!IsPostBack)
            {
                List<Seccion> colSecciones = LogicaSecciones.ListarSecciones();
                Session["ListadoSecciones"] = colSecciones;

                if (colSecciones.Count > 0)
                {
                    gvSeccion.DataSource = colSecciones;
                    gvSeccion.DataBind();
                }
                else
                {
                    throw new Exception("No hay secciones para mostrar");
                }
            }
            
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void gvSeccion_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {            
            List<Seccion> colSecciones = (List<Seccion>)Session["ListadoSecciones"];
            int codSec = gvSeccion.SelectedIndex;
            Seccion oSeccion = colSecciones[codSec];

            List<Noticia> resultadoNoti = LogicaNoticias.ListarNoticias(oSeccion);

            if (resultadoNoti.Count != 0)
            {
                gvNoticias.DataSource = resultadoNoti;
                gvNoticias.DataBind();
                lblSeccionSel.Text = "Noticias de seccion " + gvSeccion.SelectedRow.Cells[1].Text;
            }
            else
            {
                gvNoticias.DataSource = null;
                gvNoticias.DataBind();
                lblSeccionSel.Text = "";
                throw new Exception("No existen noticias con esa sección");
            }

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
}