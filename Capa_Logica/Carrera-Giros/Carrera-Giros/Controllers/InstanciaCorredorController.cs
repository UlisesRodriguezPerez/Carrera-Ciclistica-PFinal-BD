using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;

using model.dao;

namespace Carrera_Giros.Controllers
{
    
    public class InstanciaCorredorController : Controller
    {
        
        private InstanciaCorredorDao objetoInstanciaCorredorDao;

        //private CuentaAhorroDao objetoCuentaAhorro;
        

        public InstanciaCorredorController()
        {
            objetoInstanciaCorredorDao = new InstanciaCorredorDao();
        }

        [HttpGet]
        public ActionResult MasRegulares(int Id)
        {
            List<InstanciaCorredor> lista = objetoInstanciaCorredorDao.find10MejoresRegulares(Id);
            return View(lista);
        }

        [HttpGet]
        public ActionResult MejoresGiroTiempo(int Id)
        {
            List<InstanciaCorredor> lista = objetoInstanciaCorredorDao.find10MejoresTiempo(Id);
            return View(lista);
        }

        [HttpGet]
        public ActionResult MejoresGiroMontana(int Id)
        {
            List<InstanciaCorredor> lista = objetoInstanciaCorredorDao.find10MejoresMontana(Id);
            return View(lista);
        }

        [HttpGet]
        public ActionResult Find(int Id)
        {
   
            InstanciaCorredor objInstanciaCorredor = new InstanciaCorredor(Id);
            objetoInstanciaCorredorDao.find(objInstanciaCorredor);
            return View(objInstanciaCorredor);
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