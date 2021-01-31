using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using model.entity;

namespace model.dao
{
    public class GiroDao : TemplateCRUD<Giro>
    {
        private Conexion objConexion;
        private SqlCommand comando;
        //private string ip;
        //private static string host;


        public GiroDao()
        {
            //obtenerIP();
            objConexion = Conexion.saberEstado();
        }

        //public void create(Giro objetoUsuario)
        //{
        //    try
        //    {
        //        //string create = "insert into Usuario(ID,Nombre,Password,EsAdministrador)values('" + objetoUsuario.IdUsuario + "','" + objetoUsuario.NombreUsuario + "','" + objetoUsuario.Password + "','" + objetoUsuario.TipoUsuario + "')";
        //        comando = new SqlCommand("SPInsertarUsuario", objConexion.getConexion());
        //        comando.CommandType = CommandType.StoredProcedure;
        //        comando.Parameters.AddWithValue("@Nombre", objetoUsuario.NombreUsuario);
        //        comando.Parameters.AddWithValue("@Password", objetoUsuario.Password);
        //        comando.Parameters.AddWithValue("@TipoUsuario", objetoUsuario.TipoUsuario);
        //        objConexion.getConexion().Open();
        //        comando.ExecuteNonQuery();

        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    finally
        //    {
        //        objConexion.getConexion().Close();
        //        objConexion.cerrarConexion();
        //    }


        //}


        //public void delete(Usuario objetoUsuario)
        //{
        //    try
        //    {
        //        //string delete = "delete from Usuario where idUsuario='" + objetoUsuario.IdUsuario + "')";
        //        comando = new SqlCommand("SPEliminarUsuario", objConexion.getConexion());
        //        comando.CommandType = CommandType.StoredProcedure;
        //        comando.Parameters.AddWithValue("@ID", objetoUsuario.IdUsuario);
        //        objConexion.getConexion().Open();
        //        comando.ExecuteNonQuery();
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    finally
        //    {
        //        objConexion.getConexion().Close();
        //        objConexion.cerrarConexion();
        //    }
        //}

        public string verificar(Giro objetoGiro)
        {

            string result;
            try
            {

                comando = new SqlCommand("SPValidarGiro", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@Nombre", objetoGiro.NombreGiro);
                comando.Parameters.AddWithValue("@Anio", objetoGiro.Anio);
                objConexion.getConexion().Open();
                comando.ExecuteNonQuery();
                SqlDataReader read = comando.ExecuteReader();
                bool hayRegistros = read.Read();
                if (hayRegistros)
                {
                    objetoGiro.IdGiro = Convert.ToInt32(read[0].ToString());
                    objetoGiro.NombreGiro = read[1].ToString();
                    objetoGiro.Anio = Convert.ToInt32(read[2].ToString());
                    objetoGiro.FechaInicio = Convert.ToDateTime(read[3].ToString());
                    objetoGiro.FechaFinal = Convert.ToDateTime(read[4].ToString());
                    result = read[1].ToString();       //PENDIENTE, no sé si vaya a funcionar.

                }
                else
                {
                    result = "";        //PENDIENTE  Recibir le mensaje con el código de error de BD.
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
            return result;
        }
        public bool find(Giro objetoGiro)
        {
            bool hayRegistros;
            try
            {

                comando = new SqlCommand("SPBuscarGiro", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", objetoGiro.IdGiro);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    objetoGiro.IdGiro = Convert.ToInt32(read[0].ToString());
                    objetoGiro.NombreGiro = read[1].ToString();
                    objetoGiro.Anio = Convert.ToInt32(read[2].ToString());
                    objetoGiro.FechaInicio = Convert.ToDateTime(read[3].ToString());
                    objetoGiro.FechaFinal = Convert.ToDateTime(read[4].ToString());
                    
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


        public List<Giro> findAll()
        {
            List<Giro> listaGiros = new List<Giro>();

            try
            {

                comando = new SqlCommand("SPMostrarUsuarios", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Giro objetoGiro = new Giro
                    {
                        IdGiro = Convert.ToInt32(read[0].ToString()),
                        NombreGiro = read[1].ToString(),
                        Anio = Convert.ToInt32(read[2].ToString()),
                        FechaInicio = Convert.ToDateTime(read[3].ToString()),
                        FechaFinal = Convert.ToDateTime(read[4].ToString()),
                    };
                    listaGiros.Add(objetoGiro);
                }
            }

            catch (Exception)
            {
                throw;  // PENDIENTE recibir el código de error.
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return listaGiros;
        }


        //public void update(Usuario objetoUsuario)
        //{
        //    try
        //    {
        //        //string update = "update Usuario set Nombre='" + objetoUsuario.NombreUsuario + "',Password='" + objetoUsuario.Password + "',EsAdministrador='" + objetoUsuario.TipoUsuario + "' where idUsuario='" + objetoUsuario.IdUsuario + "')";
        //        comando = new SqlCommand("SPEditarUsuario", objConexion.getConexion());
        //        comando.CommandType = CommandType.StoredProcedure;
        //        comando.Parameters.AddWithValue("@id", objetoUsuario.IdUsuario);
        //        comando.Parameters.AddWithValue("@Nombre", objetoUsuario.NombreUsuario);
        //        comando.Parameters.AddWithValue("@Password", objetoUsuario.Password);
        //        comando.Parameters.AddWithValue("@TipoUsuario", objetoUsuario.TipoUsuario);
        //        objConexion.getConexion().Open();
        //        comando.ExecuteNonQuery();

        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    finally
        //    {
        //        objConexion.getConexion().Close();
        //        objConexion.cerrarConexion();
        //    }
        //}
        //public List<CuentaAhorro> findAllCuentaAhorro(int id)
        //{
        //    List<CuentaAhorro> listaCuentaAhorro = new List<CuentaAhorro>();
        //    List<int> listaid = new List<int>();
        //    try
        //    {
        //        comando = new SqlCommand("SPMostrarCuentasUsuario", objConexion.getConexion());
        //        comando.CommandType = CommandType.StoredProcedure;
        //        comando.Parameters.AddWithValue("@Id", id);
        //        objConexion.getConexion().Open();
        //        SqlDataReader read = comando.ExecuteReader();
        //        while (read.Read())
        //        {
        //            CuentaAhorro objetoCuentaAhorro = new CuentaAhorro
        //            {
        //                IdCuentaAhorro = Convert.ToInt32(read[0].ToString()),
        //                IdTipoCuneta = Convert.ToInt32(read[1].ToString()),
        //                IdPersona = Convert.ToInt32(read[2].ToString()),
        //                NumeroCuenta = Convert.ToInt32(read[3].ToString()),
        //                Saldo = Convert.ToDecimal(read[4].ToString()),
        //                FechaCreacion = read[5].ToString(),
        //                NombreUsuarioPA = read[6].ToString(),
        //                NombreTipoCuenta = read[7].ToString(),
        //                IdUsuarioPA = Convert.ToInt32(read[8].ToString())
        //            };
        //            listaCuentaAhorro.Add(objetoCuentaAhorro);
        //        }

        //    }

        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    finally
        //    {
        //        objConexion.getConexion().Close();
        //        objConexion.cerrarConexion();
        //    }
        //    return listaCuentaAhorro;
        //}
    }
}
