using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using EntidadesCompartidas;
using Logica;

public partial class MantenimientoSecciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";

        if (!IsPostBack)
            LimpioFormulario();
    }

    private void LimpioFormulario()
    {
        btnAgregar.Enabled = false;
        btnModificar.Enabled = false;
        btnEliminar.Enabled = false;
        btnBuscar.Enabled = true;

        txtCodigo.Text = "";
        txtCodigo.Enabled = true;
        txtNombre.Text = "";
        txtNombre.Enabled = false;       
    }

    private void ActivarBotones(bool esAlta = true)
    {
        btnAgregar.Enabled = esAlta;
        btnModificar.Enabled = !esAlta;
        btnEliminar.Enabled = !esAlta;
        btnBuscar.Enabled = false;

        txtCodigo.Enabled = false;
        txtNombre.Enabled = true;        
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            string codSec = txtCodigo.Text.Trim();

            Seccion sec = LogicaSecciones.Buscar(codSec);

            if (sec != null)
            {
                txtCodigo.Text = sec.Codigo;
                txtNombre.Text = sec.Nombre;

                ActivarBotones(false);

                Session["SeccionEncontrada"] = sec;
            }
            else
            {
                ActivarBotones();

                lblError.ForeColor = Color.Black;
                lblError.Text = "No se encontro seccion con ese codigo";

                Session["SeccionEncontrada"] = null;
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
    
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            string codSec = txtCodigo.Text.Trim();
            string nombre = txtNombre.Text.Trim();

            Seccion sec = new Seccion(codSec, nombre);

            LogicaSecciones.Agregar(sec);

            lblError.ForeColor = Color.Green;
            lblError.Text = "Alta con exito";

            LimpioFormulario();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioFormulario();
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            Seccion sec = (Seccion)Session["SeccionEncontrada"];

            sec.Nombre = txtNombre.Text.Trim();

            LogicaSecciones.Modificar(sec);

            lblError.ForeColor = Color.Green;
            lblError.Text = "Modificacion con exito";

            LimpioFormulario();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            Seccion sec = (Seccion)Session["SeccionEncontrada"];

            LogicaSecciones.Eliminar(sec);

            lblError.ForeColor = Color.Green;
            lblError.Text = "Eliminacion exitosa";

            LimpioFormulario();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
}