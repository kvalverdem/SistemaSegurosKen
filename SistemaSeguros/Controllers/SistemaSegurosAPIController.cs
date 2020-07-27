using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SistemaSeguros;

namespace SistemaSeguros.Controllers
{
    public class SistemaSegurosAPIController : ApiController
    {
        private SistemaSegurosEntities db = new SistemaSegurosEntities();

        // GET: api/CoberturasAPI
        public IQueryable<Cobertura> GetCobertura()
        {
            return db.Cobertura;
        }
        [Route("~/api/ObtenerCoberturasPorPoliza/{idPoliza}")]
        public async Task<IHttpActionResult> GetCoberturas(int idPoliza)
        {
            var CoberturasPorPoliza = db.Poliza.Where(Pol => Pol.ID_Poliza == idPoliza ).FirstOrDefault().Cobertura.Select(x => new { x.ID_Cobertura, x.Nombre, x.Descripcion, x.PrecioMensual });
            //var CoberturasPorPoliza = db.Cobertura.Select(x=>x.Poliza.Where(y=>y.ID_Poliza == x.))
            return Ok(CoberturasPorPoliza.AsQueryable());
        }
        [HttpGet]
        [Route("~/api/ObtenerTiposPolizas")]
        public async Task<IHttpActionResult> ObtenerTiposPolizas()
        {
            var CoberturasPorPoliza = db.Poliza.Select(x => new { x.FK_TipoRiesgo, x.Nombre, x.ID_Poliza });
            return Ok(await CoberturasPorPoliza.ToListAsync());
        }
        [HttpGet]
        [Route("~/api/ObtenerEstadosPolizas")]
        public async Task<IHttpActionResult> ObtenerEstadosPolizas()
        {
            var CoberturasPorPoliza = db.EstadoPoliza.Select(x => new { x.Codigo, x.Descripcion });
            return Ok(await CoberturasPorPoliza.ToListAsync());
        }
        [HttpGet]
        [Route("~/api/ObtenerDatosPolizaCliente/{idPoliza}")]
        public async Task<IHttpActionResult> ObtenerDatosPolizaCliente(int idPoliza)
        {
            var CoberturasPorPoliza = db.PolizaPorCliente.Where(poliza => poliza.ID_PolizaCliente == idPoliza).Select(x => new { x.FK_IDEstado, x.FK_IDPoliza, x.InicioVigenciaPoliza, x.MesesCobertura, x.PrecioPolizaAdquirida });
            return Ok(await CoberturasPorPoliza.ToListAsync());
        }
        [HttpGet]
        [Route("~/api/ObtenerCoberturasPolizaCliente/{idPoliza}")]
        public async Task<IHttpActionResult> ObtenerCoberturasPolizaCliente(int idPoliza)
        {
            var innerGroupJoinQuery =
          (from cobCliente in db.CoberturaPorPolizaCliente
           join cobertura in db.Cobertura on cobCliente.FK_IDCobertura equals cobertura.ID_Cobertura
           select new
           {
               cobCliente.FK_IDPolizaPorCliente,
               cobCliente.PorcentajeCobertura,
               cobertura.Descripcion,
               cobertura.ID_Cobertura,
               cobertura.Nombre,
               cobertura.PrecioMensual
           }).Where(x => x.FK_IDPolizaPorCliente == idPoliza);
           return Ok(await innerGroupJoinQuery.ToListAsync());
        }
        [HttpGet]
        [Route("~/api/ObtenerTipoRiesgo/{idPoliza}")]
        public async Task<IHttpActionResult> ObtenerTipoRiesgo(int idPoliza)
        {
            var CoberturasPorPoliza = db.Poliza.Where(poliza => poliza.ID_Poliza == idPoliza).Select(x => new { x.FK_TipoRiesgo });
            return Ok(await CoberturasPorPoliza.ToListAsync());
        }
        [HttpPost]
        [Route("~/api/AsignarCoberturasPorPoliza")]
        public IHttpActionResult SetCoberturas([FromBody] List<CoberturaPorPolizaCliente> coberturas)
        {
            if (coberturas != null)
            {
                if (coberturas != null && coberturas.Count > 0)
                {
                    int lastID = db.PolizaPorCliente.Max(x => x.ID_PolizaCliente);
                    coberturas.ForEach(x => x.FK_IDPolizaPorCliente = lastID);

                    var query = (from a in db.CoberturaPorPolizaCliente
                                 where a.FK_IDPolizaPorCliente == lastID
                                 select a);

                    db.CoberturaPorPolizaCliente.RemoveRange(query);
                    db.CoberturaPorPolizaCliente.AddRange(coberturas);
                    db.SaveChanges();
                }
            }
            
            return Ok();
        }

        [HttpPost]
        [Route("~/api/CrearNuevaPoliza")]
        public IHttpActionResult CrearNuevaPoliza([FromBody] PolizaPorCliente poliza)
        {
            if (poliza != null)
            {
                db.PolizaPorCliente.Add(poliza);
                db.SaveChanges();
            }
            return Ok();
        }
        [HttpPost]
        [Route("~/api/EditarPolizaCliente/")]
        public  IHttpActionResult EditarPolizaCliente([FromBody] PolizaPorCliente poliza)
        {
            var query = (from a in db.PolizaPorCliente
                         where a.ID_PolizaCliente == poliza.ID_PolizaCliente
                         select a).FirstOrDefault();

            query.FK_IDCliente = poliza.FK_IDCliente;
            query.FK_IDEstado = poliza.FK_IDEstado;
            query.FK_IDPoliza = poliza.FK_IDPoliza;
            query.InicioVigenciaPoliza = poliza.InicioVigenciaPoliza;
            query.MesesCobertura = poliza.MesesCobertura;
            query.PrecioPolizaAdquirida = poliza.PrecioPolizaAdquirida;

            db.SaveChanges();

            return Ok();
        }
        [HttpPost]
        [Route("~/api/ActualizarCoberturasPoliza/")]
        public IHttpActionResult ActualizarCoberturasPoliza([FromBody] List<CoberturaPorPolizaCliente> coberturas)
        {
            if (coberturas != null && coberturas.Count > 0)
            {
                int idPolCliente = coberturas.First().FK_IDPolizaPorCliente;
                var query = (from a in db.CoberturaPorPolizaCliente
                             where a.FK_IDPolizaPorCliente == idPolCliente
                             select a);

                db.CoberturaPorPolizaCliente.RemoveRange(query);
                db.CoberturaPorPolizaCliente.AddRange(coberturas);
                db.SaveChanges();
            }

            return Ok();
        }
        [HttpPost]
        [Route("~/api/EliminarPolizaCliente/")]
        public IHttpActionResult EliminarPolizaCliente([FromBody] PolizaPorCliente poliza)
        {
            if (poliza != null)
            {
                var query = (from a in db.CoberturaPorPolizaCliente
                             where a.FK_IDPolizaPorCliente == poliza.ID_PolizaCliente
                             select a);

                db.CoberturaPorPolizaCliente.RemoveRange(query);

                var query2 = (from a in db.PolizaPorCliente
                             where a.ID_PolizaCliente == poliza.ID_PolizaCliente
                             select a);
                db.PolizaPorCliente.RemoveRange(query2);
                db.SaveChanges();
            }

            return Ok();
        }

        // GET: api/CoberturasAPI/5
        [ResponseType(typeof(Cobertura))]
        public async Task<IHttpActionResult> GetCobertura(int id)
        {
            Cobertura cobertura = await db.Cobertura.FindAsync(id);
            if (cobertura == null)
            {
                return NotFound();
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // PUT: api/CoberturasAPI/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutCobertura(int id, Cobertura cobertura)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != cobertura.ID_Cobertura)
            {
                return BadRequest();
            }

            db.Entry(cobertura).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CoberturaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/CoberturasAPI
        [ResponseType(typeof(Cobertura))]
        public async Task<IHttpActionResult> PostCobertura(Cobertura cobertura)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Cobertura.Add(cobertura);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = cobertura.ID_Cobertura }, cobertura);
        }

        // DELETE: api/CoberturasAPI/5
        [ResponseType(typeof(Cobertura))]
        public async Task<IHttpActionResult> DeleteCobertura(int id)
        {
            Cobertura cobertura = await db.Cobertura.FindAsync(id);
            if (cobertura == null)
            {
                return NotFound();
            }

            db.Cobertura.Remove(cobertura);
            await db.SaveChangesAsync();

            return Ok(cobertura);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CoberturaExists(int id)
        {
            return db.Cobertura.Count(e => e.ID_Cobertura == id) > 0;
        }
    }
}