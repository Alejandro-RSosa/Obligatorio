using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Logica;
using EntidadesCompartidas;
using System.Drawing;

public partial class ListadoNoticias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        try
        {
            if (!IsPostBack)
            {
                List<Noticia> allNoticias = LogicaNoticias.ListarNoticias();
                Session["TodasNoticias"] = allNoticias;

                if (allNoticias.Count == 0)
                {
                    ddlNoticias.Enabled = false;
                    throw new Exception("No existen noticias en la base de datos");
                }                
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
        
    }
    protected void ddlNoticias_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            List<Noticia> allNoticias = (List<Noticia>)Session["TodasNoticias"];
            string texto = "";

            if (ddlNoticias.SelectedIndex == 0)
            {
                txtListado.Text = "";
                throw new Exception("Seleccione una opcion");
            }
            
            else if (ddlNoticias.SelectedIndex == 1)
            {
                foreach (Noticia noti in allNoticias)
                {
                    texto = texto == "" ? noti.ToString() : texto + "\n\n" + noti.ToString();
                }

            }
            else if (ddlNoticias.SelectedIndex == 2)
            {
                foreach (Noticia noti in allNoticias)
                {
                    if (noti is Nacional)
                    {
                        texto = texto == "" ? noti.ToString() : texto + "\n\n" + noti.ToString();
                    }
                }
            }
            else if (ddlNoticias.SelectedIndex == 3)
            {
                foreach (Noticia noti in allNoticias)
                {
                    if (noti is Internacional)
                    {
                        texto = texto == "" ? noti.ToString() : texto + "\n\n" + noti.ToString();
                    }
                }
            }
            txtListado.Text = texto;
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
}