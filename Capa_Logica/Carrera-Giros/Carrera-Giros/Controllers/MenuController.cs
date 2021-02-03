using System.Collections.Generic;
using System.Web.Mvc;
using model.entity;
using model.dao;
using System;

namespace Carrera_Giros.Controllers
{
    public class MenuController : Controller
    {

        private GiroDao objetoGiro;

        public MenuController()
        {
            objetoGiro = new GiroDao();
        }


        [HttpGet]
        public ActionResult Inicio()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Verify(Giro giro)
        {

            String nombre = objetoGiro.verificar(giro);
            
            if(nombre != "")
            {
                return RedirectToAction("/MenuGiro/" + giro.IdInstanciaGiro);
            }
            
            else
            {
                objetoGiro = new GiroDao();
                return RedirectToAction("/Inicio/");
            }
        }


        [HttpGet]
        public ActionResult MenuGiro(int Id) //int Id
        {
            //List<CuentaAhorro> lista = objetoGiro.findAllCuentaAhorro(Id);
            //idB = Id;
            Giro objGiro = new Giro(Id);
            objetoGiro.find(objGiro);
            
            //Giro user = new Giro(Id);
            //String username = user.NombreGiro;
            return View(objGiro);  //lista
        }   
        [HttpPost]
        public ActionResult MenuGiro(Giro user, int ID)
        {
            try
            {

                user.IdGiro = ID;

                return RedirectToAction("Menu/MenuGiro/" + ID);
            }
            catch
            {
                ViewBag.ErrorMessage = "Error al obtener el giro, para ver el error consulta la tabla de manejo de errores en la Base de datos";
                return View();
            }
        }


        [HttpPost]
        public ActionResult Regresar(String idGiro)
        {
            return RedirectToAction("/Inicio/" + idGiro);
        }
    }
}