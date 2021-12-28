using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data.SqlClient;
using System.Data;

using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaPeriodista
    {
        public static Periodista Buscar(int pCodPeri)
        {
            string nombre, apellido, correo;
            

            Periodista oPeriodista = null;
            SqlDataReader oReader;

            SqlConnection oConexion = new SqlConnection(Conexion.STR);
            SqlCommand oComando = new SqlCommand("BuscarPeriodista", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@CodPeri", pCodPeri);

            try
            {
                oConexion.Open();
                oReader = oComando.ExecuteReader();

                if (oReader.HasRows)
                {
                    if (oReader.Read())
                    {
                        nombre = (string)oReader["Nombre"];
                        apellido = (string)oReader["Apellido"];
                        correo = (string)oReader["Correo"];

                        oPeriodista = new Periodista(pCodPeri, nombre, apellido, correo);
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
            return oPeriodista;
        }

        public static void Agregar(Periodista pPeriodista)
        {
            
            
            SqlConnection oConexion = new SqlConnection(Conexion.STR);
            SqlCommand oComando = new SqlCommand("AgregarPeriodista", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@CodPeri", pPeriodista.Codigo);
            oComando.Parameters.AddWithValue("@Nom", pPeriodista.Nombre);
            oComando.Parameters.AddWithValue("@Ape", pPeriodista.Apellido);
            oComando.Parameters.AddWithValue("@Correo", pPeriodista.Email);

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
                    throw new Exception("Ya existe el periodista con ese Codigo");
                }
                else if (resultado == -2)
                {
                    throw new Exception("Occurrio un error inesperado");
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
        }

        public static void Modificar(Periodista pPeriodista)
        {


            SqlConnection oConexion = new SqlConnection(Conexion.STR);
            SqlCommand oComando = new SqlCommand("ModificarPeriodista", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@CodPeri", pPeriodista.Codigo);
            oComando.Parameters.AddWithValue("@Nom", pPeriodista.Nombre);
            oComando.Parameters.AddWithValue("@Ape", pPeriodista.Apellido);
            oComando.Parameters.AddWithValue("@Correo", pPeriodista.Email);

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
                    throw new Exception("Ocurrio un error inesperado");
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
        }

        public static void Eliminar(Periodista pPeriodista)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.STR);
            SqlCommand oComando = new SqlCommand("EliminarPeriodista", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            oComando.Parameters.AddWithValue("@CodPeri", pPeriodista.Codigo);

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
                    throw new Exception("Tiene noticias asignadas, no se puede Eliminar");
                }
                else if (resultado == -3)
                {
                    throw new Exception("Occurrio un error inesperado");
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
        }
    }
    

}
