using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class InstanciaCorredor
    {
        //Creamos los atributos de la clase.
        private int idInstanciaGiroPorEquipo;
        private int id;
        private int idCorredor;
        private string nombreCorredor;
        private string nombreEquipo;
        private string tiempoTotal;
        private int sumaPuntosMontana;
        private int sumaPuntosRegulares;
        private string nombreGiro;
        private int numeroCamisa;
        private int anio;


        public InstanciaCorredor() { }

        public InstanciaCorredor(int pInstanciaCorredor)
        {
            this.id = pInstanciaCorredor;
        }

        //Creamos un constructor con la llave primaria.
        public InstanciaCorredor(int pInstanciaCorredor, int idInstanciaGiroPorEquipo, int id, int idCorredor, string nombreCorredor, string nombreEquipo, string tiempoTotal, int sumaPuntosMontana, int sumaPuntosRegulares, string nombreGiro, int numeroCamisa, int anio)
        {
            this.id = pInstanciaCorredor;
            this.idInstanciaGiroPorEquipo = idInstanciaGiroPorEquipo;
            this.id = id;
            this.idCorredor = idCorredor;
            this.nombreCorredor = nombreCorredor;
            this.nombreEquipo = nombreEquipo;
            this.tiempoTotal = tiempoTotal;
            this.sumaPuntosMontana = sumaPuntosMontana;
            this.sumaPuntosRegulares = sumaPuntosRegulares;
            this.nombreGiro = nombreGiro;
            this.numeroCamisa = numeroCamisa;
            this.anio = anio;
        }

        public int IdInstanciaGiroPorEquipo { get => idInstanciaGiroPorEquipo; set => idInstanciaGiroPorEquipo = value; }
        public int Id { get => id; set => id = value; }
        public int IdCorredor { get => idCorredor; set => idCorredor = value; }
        public string NombreCorredor { get => nombreCorredor; set => nombreCorredor = value; }
        public string NombreEquipo { get => nombreEquipo; set => nombreEquipo = value; }
        public string TiempoTotal { get => tiempoTotal; set => tiempoTotal = value; }
        public int SumaPuntosMontana { get => sumaPuntosMontana; set => sumaPuntosMontana = value; }
        public int SumaPuntosRegulares { get => sumaPuntosRegulares; set => sumaPuntosRegulares = value; }
        public string NombreGiro { get => nombreGiro; set => nombreGiro = value; }
        public int NumeroCamisa { get => numeroCamisa; set => numeroCamisa = value; }
        public int Anio { get => anio; set => anio = value; }

        //Constructor con todos los campos.

    }
}