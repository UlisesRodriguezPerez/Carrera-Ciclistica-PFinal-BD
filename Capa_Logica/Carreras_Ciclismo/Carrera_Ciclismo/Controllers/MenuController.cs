Using System.Collections.Generic;
Using System.Web.Mvc;
Using model.entity;
Using model.dao;
Using System;


Namespace Carreras_Ciclismo.Controllers
{
    Public Class MenuController :  Controller
    {
        Private UsuarioDao objetoUsuario;
        Public MenuController()
        {
            objetoUsuario = New UsuarioDao();
        }
        // GET: Menu
        [HttpGet]
        Public ActionResult Inicio()
        {
            Return View();
        }

        [HttpPost]
        Public ActionResult Verify(Usuario usuario)
            {

            String tipo = objetoUsuario.verificar(usuario);
            //System.Diagnostics.Debug.WriteLine(tipo);
            If(tipo == "Admin")
            {
                Return RedirectToAction("/MenuAdmin/" + usuario.IdUsuario);
            }
            ElseIf(tipo == "Normal")
            {
                //user = New Usuario();
                Return RedirectToAction("/MenuNormal/" + usuario.IdUsuario);
            }
            Else
            {
                usuario = New Usuario();
                Return RedirectToAction("/Inicio/");
            }
        }
        [HttpGet]
        Public ActionResult MenuAdmin()
        {
            //Usuario usuario = New Usuario(ID);
            //objetoUsuario.find(usuario);
            Return View();
        }

        [HttpGet]
        Public ActionResult MenuNormal(int Id) //int Id
        {
            List<CuentaAhorro> lista = objetoUsuario.findAllCuentaAhorro(Id);
            Usuario user = New Usuario(Id);
            String username = user.NombreUsuario;
            Return View(lista);  //lista
        }
        [HttpPost]
        Public ActionResult MenuNormal(Usuario user, int ID)
        {
            Try
            {

                user.IdUsuario = ID;

                Return RedirectToAction("Menu/MenuNormal/" + ID);
            }
            Catch
            {
                ViewBag.ErrorMessage = "Error al obtener el usuario, para ver el error consulta la tabla de manejo de errores en la Base de datos";
                Return View();
            }
        }


        [HttpPost]
        Public ActionResult Regresar(String idUsuario)
        {
            Return RedirectToAction("/Inicio/" + idUsuario);
        }

    }
}