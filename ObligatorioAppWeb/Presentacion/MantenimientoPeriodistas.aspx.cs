using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

using EntidadesCompartidas;
using Logica;

public partial class MantenimientoPeriodistas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";

        if (!IsPostBack)
        {
            LimpioFormulario();

            txtCorreo.Attributes.Add("Type", "Email");
        }
    }

    private void LimpioFormulario()
    {
        btnAgregar.Enabled = false;
        btnModificar.Enabled = false;
        btnEliminar.Enabled = false;
        btnBuscar.Enabled = true;

        txtCodPeri.Text = "";
        txtCodPeri.Enabled = true;
        txtNombre.Text = "";
        txtNombre.Enabled = false;
        txtApellido.Text = "";
        txtApellido.Enabled = false;
        txtCorreo.Text = "";
        txtCorreo.Enabled = false;
    }

    private void ActivarBotones(bool esAlta = true)
    {
        btnAgregar.Enabled = esAlta;
        btnModificar.Enabled = !esAlta;
        btnEliminar.Enabled = !esAlta;
        btnBuscar.Enabled = false;

        txtCodPeri.Enabled = false;
        txtNombre.Enabled = true;
        txtApellido.Enabled = true;
        txtCorreo.Enabled = true;
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            int codPeri;
            try
            {
                codPeri = Convert.ToInt32(txtCodPeri.Text);
            }
            catch 
            {
                throw new Exception("El codigo debe ser un numero entero");
            }

            Periodista pPeri = LogicaPeriodista.Buscar(codPeri);
            if (pPeri != null)
            {
                txtNombre.Text = pPeri.Nombre;
                txtApellido.Text = pPeri.Apellido;
                txtCorreo.Text = pPeri.Email;

                ActivarBotones(false);

                Session["PeriodistaEncontrado"] = pPeri;
            }
            else
            {
                ActivarBotones();

                lblError.ForeColor = Color.Black;
                lblError.Text = "No hay periodistas con ese codigo";

                Session["PeriodistaEncontrado"] = null;
            }

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

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            int codPeri = Convert.ToInt32(txtCodPeri.Text);
            string nombre = txtNombre.Text.Trim();
            string apellido = txtApellido.Text.Trim();
            string correo = txtCorreo.Text.Trim();

            Periodista peri = new Periodista(codPeri, nombre, apellido, correo);

            LogicaPeriodista.Agregar(peri);

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

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            Periodista pPeri = (Periodista)Session["PeriodistaEncontrado"];

            pPeri.Nombre = txtNombre.Text.Trim();
            pPeri.Apellido = txtApellido.Text.Trim();
            pPeri.Email = txtCorreo.Text.Trim();

            LogicaPeriodista.Modificar(pPeri);

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
            Periodista pPeri = (Periodista)Session["PeriodistaEncontrado"];

            LogicaPeriodista.Eliminar(pPeri);

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