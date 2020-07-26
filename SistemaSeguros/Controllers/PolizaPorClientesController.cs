using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SistemaSeguros;

namespace SistemaSeguros.Controllers
{
    public class PolizaPorClientesController : Controller
    {
        private SistemaSegurosEntities db = new SistemaSegurosEntities();

        // GET: PolizaPorClientes
        public async Task<ActionResult> Index(string idCliente, string nombreCompleto)
        {
            ViewBag.idCliente = idCliente;
            ViewBag.NombreCompleto = nombreCompleto;
            var polizaPorCliente = (!string.IsNullOrEmpty(idCliente)) ? db.PolizaPorCliente.Include(p => p.Cliente).Include(p => p.Poliza).Where(c => c.FK_IDCliente == idCliente) : db.PolizaPorCliente.Include(p => p.Cliente).Include(p => p.Poliza);
            return View(await polizaPorCliente.ToListAsync());
        }

        // GET: PolizaPorClientes/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PolizaPorCliente polizaPorCliente = await db.PolizaPorCliente.FindAsync(id);
            if (polizaPorCliente == null)
            {
                return HttpNotFound();
            }
            return View(polizaPorCliente);
        }

        // GET: PolizaPorClientes/Create
        public ActionResult Create(string idCliente, string nombreCompleto, string tipo)
        {
            ViewBag.idCliente = idCliente;
            ViewBag.nombreCompleto = nombreCompleto;
            ViewBag.tipo = tipo;
            ViewBag.FK_IDCliente = new SelectList(db.Cliente.Select(x => new { x.Identificacion, Nombre = (x.Identificacion+" - "+x.Nombre+" "+x.Apellidos) }), "Identificacion", "Nombre");
            ViewBag.FK_IDEstado = new SelectList(db.EstadoPoliza, "Codigo", "Descripcion");
            ViewBag.FK_IDPoliza = new SelectList(db.Poliza, "ID_Poliza", "Nombre");
            return View();
        }

        // POST: PolizaPorClientes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create()
        {
            return RedirectToAction("Index");

            //if (ModelState.IsValid)
            //{
            //    db.PolizaPorCliente.Add(polizaPorCliente);
            //    await db.SaveChangesAsync();
                
            //}

            //ViewBag.FK_IDCliente = new SelectList(db.Cliente, "Identificacion", "Nombre", polizaPorCliente.FK_IDCliente);
            //ViewBag.FK_IDEstado = new SelectList(db.EstadoPoliza, "Codigo", "Descripcion", polizaPorCliente.FK_IDEstado);
            //ViewBag.FK_IDPoliza = new SelectList(db.Poliza, "ID_Poliza", "Nombre", polizaPorCliente.FK_IDPoliza);
            //return View(polizaPorCliente);
        }

        // GET: PolizaPorClientes/Edit/5
        public async Task<ActionResult> Edit(int? id, string idCliente, string nombreCompleto, string tipo)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.idCliente = idCliente;
            ViewBag.nombreCompleto = nombreCompleto;
            ViewBag.tipo = tipo;
            PolizaPorCliente polizaPorCliente = await db.PolizaPorCliente.FindAsync(id);
            if (polizaPorCliente == null)
            {
                return HttpNotFound();
            }
            ViewBag.FK_IDCliente = new SelectList(db.Cliente, "Identificacion", "Nombre", polizaPorCliente.FK_IDCliente);
            ViewBag.FK_IDEstado = new SelectList(db.EstadoPoliza, "Codigo", "Descripcion", polizaPorCliente.FK_IDEstado);
            ViewBag.FK_IDPoliza = new SelectList(db.Poliza, "ID_Poliza", "Nombre", polizaPorCliente.FK_IDPoliza);
            return View(polizaPorCliente);
        }

        // POST: PolizaPorClientes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ID_PolizaCliente,FK_IDCliente,FK_IDPoliza,InicioVigenciaPoliza,PrecioPolizaAdquirida,MesesCobertura,FK_IDEstado")] PolizaPorCliente polizaPorCliente)
        {
            if (ModelState.IsValid)
            {
                db.Entry(polizaPorCliente).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.FK_IDCliente = new SelectList(db.Cliente, "Identificacion", "Nombre", polizaPorCliente.FK_IDCliente);
            ViewBag.FK_IDEstado = new SelectList(db.EstadoPoliza, "Codigo", "Descripcion", polizaPorCliente.FK_IDEstado);
            ViewBag.FK_IDPoliza = new SelectList(db.Poliza, "ID_Poliza", "Nombre", polizaPorCliente.FK_IDPoliza);
            return View(polizaPorCliente);
        }

        // GET: PolizaPorClientes/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PolizaPorCliente polizaPorCliente = await db.PolizaPorCliente.FindAsync(id);
            if (polizaPorCliente == null)
            {
                return HttpNotFound();
            }
            return View(polizaPorCliente);
        }

        // POST: PolizaPorClientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            PolizaPorCliente polizaPorCliente = await db.PolizaPorCliente.FindAsync(id);
            db.PolizaPorCliente.Remove(polizaPorCliente);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
