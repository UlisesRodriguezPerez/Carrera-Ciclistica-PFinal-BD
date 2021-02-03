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
    public class InstanciaEquipoDao : TemplateCRUD<InstanciaEquipo>
    {

        //Atributos de la clase
        private Conexion objConexion;
        private SqlCommand comando;

        public InstanciaEquipoDao()
        {
            objConexion = Conexion.saberEstado();
        }


        public bool find(InstanciaEquipo objetoInstanciaEquipo)
        {
            bool hayRegistros;
            try
            {
                comando = new SqlCommand("SPObtenerBeneficiario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objetoInstanciaEquipo.IdCorredor);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    objetoInstanciaEquipo.Id = Convert.ToInt32(read[0].ToString());
                    objetoInstanciaEquipo.IdCorredor = Convert.ToInt32(read[1].ToString());
                    objetoInstanciaEquipo.IdInstanciaGiroPorEquipo = Convert.ToInt32(read[2].ToString());
                    //objetoInstanciaEquipo.IdCuenta = Convert.ToInt32(read[3].ToString());
                    //objetoInstanciaEquipo.Porcentaje = Convert.ToInt32(read[4].ToString());
                    //objetoInstanciaEquipo.Nombre = read[5].ToString();
                    //objetoInstanciaEquipo.Parentezco = read[6].ToString();
                    //objetoInstanciaEquipo.NumeroCuenta = Convert.ToInt32(read[7].ToString());
                    //objetoInstanciaEquipo.FechaNacimiento = Convert.ToDateTime(read[8].ToString());
                    //objetoInstanciaEquipo.Telefono1 = read[9].ToString();
                    //objetoInstanciaEquipo.Telefono2 = read[10].ToString();
                    //objetoInstanciaEquipo.CorreoElectronico = read[11].ToString();
                    //objetoInstanciaEquipo.ValorDocumentoId = read[12].ToString();

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

        public List<InstanciaEquipo> findAll()
        {
            List<InstanciaEquipo> listaInstanciaEquipo = new List<InstanciaEquipo>();
            return listaInstanciaEquipo;
        }


        public List<InstanciaEquipo> find3MejoresTiempo(int id)
        {
            List<InstanciaEquipo> listaInstanciaEquipo = new List<InstanciaEquipo>();

            try
            {
                comando = new SqlCommand("SPObtenerTopMejoresTiemposEquipos", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idInstanciaGiro", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {

                    InstanciaEquipo objetoInstanciaEquipo = new InstanciaEquipo
                    {
                        NombreGiro = read[0].ToString(),
                        NombreEquipo = read[1].ToString(),
                        TiempoTotal = read[2].ToString(),
                        Anio = Convert.ToInt32(read[3].ToString()),
                    };
                    listaInstanciaEquipo.Add(objetoInstanciaEquipo);
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
            return listaInstanciaEquipo;
        }


    }
}



