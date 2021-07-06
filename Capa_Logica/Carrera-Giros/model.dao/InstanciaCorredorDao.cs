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



