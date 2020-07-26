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
            var CoberturasPorPoliza = db.Cobertura.Where(cobertura => cobertura.Poliza.All(Pol => Pol.ID_Poliza == idPoliza )).Select(x => new { x.ID_Cobertura, x.Nombre, x.Descripcion, x.PrecioMensual });
            //var CoberturasPorPoliza = db.Cobertura.Select(x=>x.Poliza.Where(y=>y.ID_Poliza == x.))
            return Ok(await CoberturasPorPoliza.ToListAsync());
        }
        [HttpPost]
        [Route("~/api/AsignarCoberturasPorPoliza/")]
        public IHttpActionResult SetCoberturas([FromBody] List<CoberturaPorPolizaCliente> coberturas)
        {
            if (coberturas != null)
            {
                int lastID = db.PolizaPorCliente.Max(x => x.ID_PolizaCliente);
                coberturas.ForEach(x => x.FK_IDPolizaPorCliente = lastID);

                db.CoberturaPorPolizaCliente.ToList().RemoveAll(x => x.FK_IDPolizaPorCliente == lastID);
                db.CoberturaPorPolizaCliente.AddRange(coberturas);
                db.SaveChanges();
            }
            
            return Ok();
        }

        [HttpPost]
        [Route("~/api/CrearNuevaPoliza/")]
        public IHttpActionResult CrearNuevaPoliza([FromBody] PolizaPorCliente poliza)
        {
            if (poliza != null)
            {
                db.PolizaPorCliente.Add(poliza);
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