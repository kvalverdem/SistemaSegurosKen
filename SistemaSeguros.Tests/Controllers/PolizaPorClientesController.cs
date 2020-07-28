using System;
using SistemaSeguros.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.Mvc;
using System.Collections.Generic;
using System.Web.Http.Results;
using System.Linq;
using System.Web.Http;

namespace SistemaSeguros.Tests.Controllers
{
    [TestClass]
    public class SistemaSegurosControllerTest
    {
        //Crear una póliza por cliente
        [TestMethod]
        public async System.Threading.Tasks.Task CrearPolizas()
        {
            ClientesController controlador = new ClientesController();
            ViewResult result = await controlador.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsNotNull(result.Model);

            List<Cliente> listaClientes = result.Model as List<Cliente>;
            for (int op = 0; op < listaClientes.Count; op++)
            {
                Cliente testCliente = listaClientes[op];
                //Crear una póliza
                SistemaSegurosAPIController ctrlAPI = new SistemaSegurosAPIController();

                PolizaPorCliente polizaPorCliente = new PolizaPorCliente();
                polizaPorCliente.FK_IDCliente = testCliente.Identificacion;
                polizaPorCliente.FK_IDEstado = 1;
                polizaPorCliente.InicioVigenciaPoliza = DateTime.Now;
                polizaPorCliente.MesesCobertura = 12;
                polizaPorCliente.FK_IDPoliza = 1;
                polizaPorCliente.PrecioPolizaAdquirida = 25000;
                //ctrlAPI.CrearNuevaPoliza(polizaPorCliente);

                List<CoberturaPorPolizaCliente> coberturas = new List<CoberturaPorPolizaCliente>();
                IHttpActionResult coberturasOrigen =  await ctrlAPI.GetCoberturas(polizaPorCliente.FK_IDPoliza);
                var coberturasOrigen2 = coberturasOrigen as OkNegotiatedContentResult<IQueryable<Cobertura>>;
                var cob = coberturasOrigen2.Content;
                string i = string.Empty;
                //for (int o = 0; o < coberturasOrigen.Count; o++)
                //{
                //    CoberturaPorPolizaCliente poltemp = new CoberturaPorPolizaCliente();
                //    poltemp.FK_IDCobertura = coberturasOrigen[o].ID_Cobertura;
                //    poltemp.PorcentajeCobertura = 10;
                //    coberturas.Add(poltemp);
                //}

                //ctrlAPI.SetCoberturas(coberturas);


            }


        }

        //Editar una póliza por cliente
        [TestMethod]
        public async System.Threading.Tasks.Task EditarPolizas()
        {
            ClientesController controlador = new ClientesController();
            ViewResult result = await controlador.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsNotNull(result.Model);

            List<Cliente> listaClientes = result.Model as List<Cliente>;
            for (int op = 0; op < listaClientes.Count; op++)
            {
                Cliente testCliente = listaClientes[op];
                //Crear una póliza
                PolizaPorClientesController ctrlPolizaCliente = new PolizaPorClientesController();
                ViewResult resultPolizaCliente = ctrlPolizaCliente.Create(testCliente.Identificacion, testCliente.Nombre + " " + testCliente.Apellidos, "1") as ViewResult;
                Assert.IsNotNull(resultPolizaCliente);


            }


        }

        //Eliminar una póliza por cliente
        [TestMethod]
        public async System.Threading.Tasks.Task EliminarPolizas()
        {
            ClientesController controlador = new ClientesController();
            ViewResult result = await controlador.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsNotNull(result.Model);

            List<Cliente> listaClientes = result.Model as List<Cliente>;
            for (int op = 0; op < listaClientes.Count; op++)
            {
                Cliente testCliente = listaClientes[op];
                //Crear una póliza
                PolizaPorClientesController ctrlPolizaCliente = new PolizaPorClientesController();
                ViewResult resultPolizaCliente = ctrlPolizaCliente.Create(testCliente.Identificacion, testCliente.Nombre + " " + testCliente.Apellidos, "1") as ViewResult;
                Assert.IsNotNull(resultPolizaCliente);


            }


        }
    }
}
