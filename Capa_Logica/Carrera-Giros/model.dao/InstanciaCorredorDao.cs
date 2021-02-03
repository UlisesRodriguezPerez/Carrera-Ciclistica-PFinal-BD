using model.entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace model.dao
{
    public class InstanciaCorredorDao : TemplateCRUD<InstanciaCorredor>
    {

        //Atributos de la clase
        private Conexion objConexion;
        private SqlCommand comando;

        public InstanciaCorredorDao()
        {
            objConexion = Conexion.saberEstado();
        }

        public string findIdCA(InstanciaCorredor instanciaCorredor)
        {
            string indice;
            try
            {
                comando = new SqlCommand("SPFindIdCA", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pNumeroCuentaDeAhorro", instanciaCorredor.IdCorredor);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                read.Read();
                indice = read[0].ToString();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return indice;
        }



        public void create(InstanciaCorredor instanciaCorredor)
        {
            string existePersona;
            try
            {
                comando = new SqlCommand("SPInsertarBeneficiario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                //comando.Parameters.AddWithValue("@pIdTipoParentezco",beneficiario.IdTipoParentezco);
                comando.Parameters.AddWithValue("@pParentezco", instanciaCorredor.IdCorredor);
                comando.Parameters.AddWithValue("@pDocumentoIdentidadPersona", instanciaCorredor);
                //comando.Parameters.AddWithValue("@pIdPersona", beneficiario.IdPersona);
                comando.Parameters.AddWithValue("@pNumeroCuentaAhorro", instanciaCorredor);
                comando.Parameters.AddWithValue("@pPorcentaje ", instanciaCorredor);
                objConexion.getConexion().Open();
                comando.ExecuteNonQuery();

                //SqlDataReader read = comando.ExecuteReader();
                //read.Read();
                //existePersona = read[1].ToString();
                //System.Diagnostics.Debug.WriteLine(existePersona);
            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            //return existePersona;
        }



        public bool find(InstanciaCorredor objetoInstanciaCorredor)
        {
            bool hayRegistros;
            try
            {
                comando = new SqlCommand("SPObtenerBeneficiario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objetoInstanciaCorredor.IdCorredor);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    objetoInstanciaCorredor.Id = Convert.ToInt32(read[0].ToString());
                    objetoInstanciaCorredor.IdCorredor = Convert.ToInt32(read[1].ToString());
                    objetoInstanciaCorredor.IdInstanciaGiroPorEquipo = Convert.ToInt32(read[2].ToString());
                    //objetoInstanciaCorredor.IdCuenta = Convert.ToInt32(read[3].ToString());
                    //objetoInstanciaCorredor.Porcentaje = Convert.ToInt32(read[4].ToString());
                    //objetoInstanciaCorredor.Nombre = read[5].ToString();
                    //objetoInstanciaCorredor.Parentezco = read[6].ToString();
                    //objetoInstanciaCorredor.NumeroCuenta = Convert.ToInt32(read[7].ToString());
                    //objetoInstanciaCorredor.FechaNacimiento = Convert.ToDateTime(read[8].ToString());
                    //objetoInstanciaCorredor.Telefono1 = read[9].ToString();
                    //objetoInstanciaCorredor.Telefono2 = read[10].ToString();
                    //objetoInstanciaCorredor.CorreoElectronico = read[11].ToString();
                    //objetoInstanciaCorredor.ValorDocumentoId = read[12].ToString();

                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return hayRegistros;
        }

        public List<InstanciaCorredor> findAll()
        {
            List<InstanciaCorredor> listaInstanciaCorredor = new List<InstanciaCorredor>();
            return listaInstanciaCorredor;
        }
        public List<InstanciaCorredor> findAllAdmin()
        {
            List<InstanciaCorredor> listaInstanciaCorredor = new List<InstanciaCorredor>();

            try
            {
                comando = new SqlCommand("SPObtenerBeneficiariosTotales", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                //comando.Parameters.AddWithValue("@idCuentaAhorro", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {

                    InstanciaCorredor objetoInstanciaCorredor = new InstanciaCorredor
                    {
                        NombreCorredor = read[0].ToString(),
                        //NumeroCuenta = Convert.ToInt32(read[1].ToString()),
                        //Cantidad = Convert.ToInt32(read[2].ToString()),
                        //MontoTotal = Convert.ToDecimal(read[3].ToString()),
                        //Porcentaje = Convert.ToInt32(read[4].ToString()),
                        //Nombre = read[5].ToString(),
                        //Parentezco = read[6].ToString(),
                        //NumeroCuenta = Convert.ToInt32(read[7].ToString()),
                    };
                    listaInstanciaCorredor.Add(objetoInstanciaCorredor);
                }
            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return listaInstanciaCorredor;
        }

        public List<InstanciaCorredor> find10MejoresRegulares(int id)
        {
            List<InstanciaCorredor> listaInstanciaCorredor = new List<InstanciaCorredor>();

            try
            {
                comando = new SqlCommand("SPObtenerTopMasRegulares", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idInstanciaGiro", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {

                    InstanciaCorredor objetoInstanciaCorredor = new InstanciaCorredor
                    {
                        NombreGiro = read[0].ToString(),
                        NombreCorredor = read[1].ToString(),
                        NumeroCamisa = Convert.ToInt32(read[2].ToString()),
                        NombreEquipo = read[3].ToString(),
                        SumaPuntosRegulares = Convert.ToInt32(read[4].ToString()),
                        Anio = Convert.ToInt32(read[5].ToString()),
                    };
                    listaInstanciaCorredor.Add(objetoInstanciaCorredor);
                }
            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return listaInstanciaCorredor;
        }

        public List<InstanciaCorredor> find10MejoresTiempo(int id)
        {
            List<InstanciaCorredor> listaInstanciaCorredor = new List<InstanciaCorredor>();

            try
            {
                comando = new SqlCommand("SPObtenerTopMejoresTiempos", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idInstanciaGiro", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {

                    InstanciaCorredor objetoInstanciaCorredor = new InstanciaCorredor
                    {
                        NombreGiro = read[0].ToString(),
                        NombreCorredor = read[1].ToString(),
                        NumeroCamisa = Convert.ToInt32(read[2].ToString()),
                        NombreEquipo = read[3].ToString(),
                        TiempoTotal = read[4].ToString(),
                        Anio = Convert.ToInt32(read[5].ToString()),
                    };
                    listaInstanciaCorredor.Add(objetoInstanciaCorredor);
                }
            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return listaInstanciaCorredor;
        }


        public List<InstanciaCorredor> find10MejoresMontana(int id)
        {
            List<InstanciaCorredor> listaInstanciaCorredor = new List<InstanciaCorredor>();

            try
            {
                comando = new SqlCommand("SPObtenerTopMejoresMontana", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idInstanciaGiro", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {

                    InstanciaCorredor objetoInstanciaCorredor = new InstanciaCorredor
                    {
                        NombreGiro = read[0].ToString(),
                        NombreCorredor = read[1].ToString(),
                        NumeroCamisa = Convert.ToInt32(read[2].ToString()),
                        NombreEquipo = read[3].ToString(),
                        SumaPuntosMontana =Convert.ToInt32(read[4].ToString()),
                        Anio = Convert.ToInt32(read[5].ToString()),
                    };
                    listaInstanciaCorredor.Add(objetoInstanciaCorredor);
                }
            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return listaInstanciaCorredor;
        }
    }
}



