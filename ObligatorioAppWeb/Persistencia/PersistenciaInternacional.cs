using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data.SqlClient;
using System.Data;

using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaInternacional
    {
        public static int Agregar(Internacional pNoti)
        {
            int codNoti;

            SqlConnection oConexion = new SqlConnection(Conexion.STR);
            SqlCommand oComando = new SqlCommand("AgregarNoticiaInternacional", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@fecha", pNoti.FechaHora);
            oComando.Parameters.AddWithValue("@titulo", pNoti.Titulo);
            oComando.Parameters.AddWithValue("@resumen", pNoti.Resumen);
            oComando.Parameters.AddWithValue("@contenido", pNoti.Contenido);
            oComando.Parameters.AddWithValue("@codPeri", pNoti.Periodista.Codigo);
            oComando.Parameters.AddWithValue("@pais", pNoti.PaisOrigen);

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

        public static List<Noticia> ListarNoticiasInternacional()
        {
            List<Noticia> colNoticias = new List<Noticia>();
            DateTime fechaHora;
            string titulo, resumen, contenido, pais;
            int codPeri, id;
            Periodista pPeriodista;

            SqlDataReader oReader;

            SqlConnection oConexion = new SqlConnection(Conexion.STR);

            SqlCommand oComando = new SqlCommand("ListarInternacionales", oConexion);
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
                        pais = Convert.ToString(oReader["Pais"]);

                        codPeri = Convert.ToInt32(oReader["CodPeri"]);
                        pPeriodista = PersistenciaPeriodista.Buscar(codPeri);

                        Internacional oInternacional = new Internacional(id, fechaHora, titulo, resumen, contenido, pPeriodista, pais);

                        colNoticias.Add(oInternacional);
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
    }
}
