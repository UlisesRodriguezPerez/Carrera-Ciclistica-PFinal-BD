using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;

using model.dao;

namespace Carrera_Giros.Controllers
{

    public class InstanciaEquipoController : Controller
    {

        private InstanciaEquipoDao objetoInstanciaEquipoDao;

      


        public InstanciaEquipoController()
        {
            objetoInstanciaEquipoDao = new InstanciaEquipoDao();
        }

        
        [HttpGet]
        public ActionResult MejoresGiroTiempoEquipo(int Id)
        {
            List<InstanciaEquipo> lista = objetoInstanciaEquipoDao.find3MejoresTiempo(Id);
            return View(lista);
        }


        [HttpGet]
        public ActionResult Find(int Id)
        {

            InstanciaEquipo objInstanciaEquipo = new InstanciaEquipo(Id);
            objetoInstanciaEquipoDao.find(objInstanciaEquipo);
            return View(objInstanciaEquipo);
        }

        [HttpPost]
        public ActionResult Find(string ID)
        {
            return RedirectToAction("Inicio" + ID);
        }


        [HttpPost]
        public ActionResult FindAll(string ID)
        {
            return RedirectToAction("Inicio" + ID);
        }

    }
}