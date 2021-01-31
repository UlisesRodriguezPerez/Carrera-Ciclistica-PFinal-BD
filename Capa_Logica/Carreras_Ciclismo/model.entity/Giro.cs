using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class Giro
    {
        //Creamos los atributos de la clase.
        private int idGiro;
        private string nombreGiro;
        private int anio;
        private DateTime fechaInicio;
        private DateTime fechaFinal;


        public Giro() { }

        //Creamos un constructor con la llave primaria.
        public Giro(int pIdGiro)
        {
            this.idGiro = pIdGiro;
        }

        //Constructor con todos los campos.
        public Giro(int pIdGiro, string pNombreGiro, int anio, DateTime fechaInicio, DateTime fechaFinal)
        {
            this.idGiro = pIdGiro;
            this.nombreGiro = pNombreGiro;
            this.anio = anio;
            this.fechaInicio = fechaInicio;
            this.fechaFinal = fechaFinal;
        }

        public int IdGiro { get => idGiro; set => idGiro = value; }
        public string NombreGiro { get => nombreGiro; set => nombreGiro = value; }
        public int Anio { get => anio; set => anio = value; }
        public DateTime FechaInicio { get => fechaInicio; set => fechaInicio = value; }
        public DateTime FechaFinal { get => fechaFinal; set => fechaFinal = value; }
    }
}