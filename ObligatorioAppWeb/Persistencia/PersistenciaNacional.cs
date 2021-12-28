using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data.SqlClient;
using System.Data;

using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaNacional
    {
        public static int Agregar(Nacional pNoti)
        {
            int codNoti;

            SqlConnection oConexion = new SqlConnection(Conexion.STR);
            SqlCommand oComando = new SqlCommand("AgregarNoticiaNacional", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@fecha", pNoti.FechaHora);
            oComando.Parameters.AddWithValue("@titulo", pNoti.Titulo);
            oComando.Parameters.AddWithValue("@resumen", pNoti.Resumen);
            oComando.Parameters.AddWithValue("@contenido", pNoti.Contenido);
            oComando.Parameters.AddWithValue("@codPeri", pNoti.Periodista.Codigo);
            oComando.Parameters.AddWithValue("@codSec", pNoti.Seccion.Codigo);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();

                int resultado = Convert.ToInt32(oComando.Parameters["@Retorno"].Value);

                if (resultado == -1)
                {
                    throw new Exception("No existe el periodista con ese Codigo");
                }
                else if (resultado == -2)
                {
                    throw new Exception("No existe la seccion con ese codigo");
                }
                else if (resultado == -3)
                {
                    throw new Exception("Occurrio un error inesperado");
                }
                else
                {
                    codNoti = resultado;
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            finally
            {
                oConexion.Close();
            }
            return codNoti;
        }

        public static List<Noticia> ListarNoticiasNacional(Seccion pSec)
        {
            List<Noticia> colNoticias = new List<Noticia>();
            DateTime fechaHora;
            string titulo, resumen, contenido;
            int codPeri, id;
            Periodista pPeriodista;
            SqlDataReader oReader;

            SqlConnection oConexion = new SqlConnection(Conexion.STR);

            SqlCommand oComando = new SqlCommand("NacionalesPorSeccion", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;
            oComando.Parameters.AddWithValue("@idSec", pSec.Codigo);

            try
            {
                oConexion.Open();
                oReader = oComando.ExecuteReader();

                if (oReader.HasRows)
                {
                    while (oReader.Read())
                    {
                        id = Convert.ToInt32(oReader["Codigo de Noticia"]);
                        fechaHora = Convert.ToDateTime(oReader["Fecha"]);
                        titulo = Convert.ToString(oReader["Titulo"]);
                        resumen = Convert.ToString(oReader["Resumen"]);
                        contenido = Convert.ToString(oReader["Contenido"]);
                        codPeri = Convert.ToInt32(oReader["Codigo de Periodista"]);
                        pPeriodista = PersistenciaPeriodista.Buscar(codPeri);

                        Nacional oNacional = new Nacional(id, fechaHora, titulo, resumen, contenido, pPeriodista, pSec);
                        colNoticias.Add(oNacional);
                    }
                }
                oReader.Close();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            finally
            {
                oConexion.Close();
            }
            return colNoticias;

        }

        public static List<Noticia> ListarNoticiasNacional()
        {
            List<Noticia> colNoticia = new List<Noticia>();
            DateTime fechaHora;
            string titulo, resumen, contenido, codSec;
            int codPeri, id;
            Periodista pPeriodista;
            Seccion pSeccion;
            SqlDataReader oReader;

            SqlConnection oConexion = new SqlConnection(Conexion.STR);

            SqlCommand oComando = new SqlCommand("ListarNacionales", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            try
            {
                oConexion.Open();
                oReader = oComando.ExecuteReader();

                if (oReader.HasRows)
                {
                    while (oReader.Read())
                    {
                        id = Convert.ToInt32(oReader["CodNoti"]);
                        fechaHora = Convert.ToDateTime(oReader["FechaHora"]);
                        titulo = Convert.ToString(oReader["Titulo"]);
                        resumen = Convert.ToString(oReader["Resumen"]);
                        contenido = Convert.ToString(oReader["Contenido"]);

                        codPeri = Convert.ToInt32(oReader["CodPeri"]);
                        pPeriodista = PersistenciaPeriodista.Buscar(codPeri);

                        codSec = Convert.ToString(oReader["CodSec"]);
                        pSeccion = PersistenciaSeccion.Buscar(codSec);

                        Nacional oNacional = new Nacional(id, fechaHora, titulo, resumen, contenido, pPeriodista, pSeccion);
                        colNoticia.Add(oNacional);
                    }
                }
                oReader.Close();
            }
            catch (Exception ex)
            {
                
                throw new Exception(ex.Message);
            }
            finally
            {
                oConexion.Close();
            }
            return colNoticia;
        }
    }
}
