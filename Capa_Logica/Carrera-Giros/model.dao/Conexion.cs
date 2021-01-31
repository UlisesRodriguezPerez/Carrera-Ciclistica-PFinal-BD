using System;
using System.Collections.Generic;
using System.Data.SqlClient;
// Librería para usar comandos sql
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.dao
{
    public class Conexion
    {
        //patron singleton
        private static Conexion objConexion = null;
        private SqlConnection conexion;

        //Constructor donde agregaremos la cadena de conexión con SqlServer.
        private Conexion()
        {

            conexion = new SqlConnection("Data Source =DESKTOP-FBGDAQE; Initial Catalog = ProyectoFinal_BD; Integrated Security = True");
            //conexion = new SqlConnection("Data Source =LAPTOP-RHFFFTGS; Initial Catalog = ProyectoFinal_BD; Integrated Security = True");
        }


        public static Conexion saberEstado()
        {
            if (objConexion == null)
            {
                objConexion = new Conexion();
            }
            return objConexion;
        }

        public SqlConnection getConexion()
        {
            return conexion;
        }
        public void cerrarConexion()
        {
            objConexion = null;
        }
    }
}
