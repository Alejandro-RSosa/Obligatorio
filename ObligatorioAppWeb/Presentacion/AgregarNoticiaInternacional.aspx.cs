using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

using EntidadesCompartidas;
using Logica;

public partial class AgregarNoticiaInternacional : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        
        if (!IsPostBack)
        {
            LimpioFormulario();
            txtFecha.Attributes.Add("Type", "Date");
            txtHora.Attributes.Add("Type", "Time");
        }
    }

    private void LimpioFormulario()
    {
        txtTitulo.Text = "";
        txtResumen.Text = "";
        txtContenido.Text = "";
        txtPais.Text = "";
        txtCodPeri.Text = "";
        txtHora.Text = "";
        txtFecha.Text = "";
    }
    
    private int[] ConvertirFechaHora(string pFecha, string pHoraMinutos)
    {
        int[] resultado = new int[5];
        try         
        {             
            string[] subFecha = pFecha.Split('-');             
            string[] subHoraMin = pHoraMinutos.Split(':');              
            resultado[0] = Convert.ToInt32(subFecha[0]);             
            resultado[1] = Convert.ToInt32(subFecha[1]);             
            resultado[2] = Convert.ToInt32(subFecha[2]);             
            resultado[3] = Convert.ToInt32(subHoraMin[0]);             
            resultado[4] = Convert.ToInt32(subHoraMin[1]);          
        }        
        catch (Exception ex)         
        {              
            throw new Exception(ex.Message);         
        }          
        return resultado;     
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            string pTitulo = txtTitulo.Text;
            string pResumen = txtResumen.Text;
            string pContenido = txtContenido.Text;
            string pPais = txtPais.Text;
            int pCodPeri = Convert.ToInt32(txtCodPeri.Text);
            string Fecha = txtFecha.Text;
            string Hora = txtHora.Text;
            int[] fecHora = ConvertirFechaHora(Fecha, Hora);
            DateTime pFechaHora = new DateTime(fecHora[0], fecHora[1], fecHora[2], fecHora[3], fecHora[4], 0);

            Periodista pPeri = LogicaPeriodista.Buscar(pCodPeri);

            Noticia pNotiInter = new Internacional(0, pFechaHora, pTitulo, pResumen, pContenido, pPeri, pPais);

            int nuevoID = LogicaNoticias.Agregar(pNotiInter);


            lblError.ForeColor = Color.Green;
            lblError.Text = "Noticia agregada correctamente con id " + Convert.ToString(nuevoID);

            LimpioFormulario();

        }
        catch (Exception ex)
        {

            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
}