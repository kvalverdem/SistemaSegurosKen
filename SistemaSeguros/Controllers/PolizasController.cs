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
    public class PolizasController : Controller
    {
        private SistemaSegurosEntities db = new SistemaSegurosEntities();

        // GET: Polizas
        public async Task<ActionResult> Index()
        {
            var poliza = db.Poliza.Include(p => p.TipoRiesgo);
            return View(await poliza.ToListAsync());
        }

        // GET: Polizas/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Poliza poliza = await db.Poliza.FindAsync(id);
            if (poliza == null)
            {
                return HttpNotFound();
            }
            return View(poliza);
        }

        // GET: Polizas/Create
        public ActionResult Create()
        {
            ViewBag.FK_TipoRiesgo = new SelectList(db.TipoRiesgo, "ID_Riesgo", "Nombre");
            return View();
        }

        // POST: Polizas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ID_Poliza,Nombre,Descripcion,FK_TipoRiesgo")] Poliza poliza)
        {
            if (ModelState.IsValid)
            {
                db.Poliza.Add(poliza);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.FK_TipoRiesgo = new SelectList(db.TipoRiesgo, "ID_Riesgo", "Nombre", poliza.FK_TipoRiesgo);
            return View(poliza);
        }

        // GET: Polizas/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Poliza poliza = await db.Poliza.FindAsync(id);
            if (poliza == null)
            {
                return HttpNotFound();
            }
            ViewBag.FK_TipoRiesgo = new SelectList(db.TipoRiesgo, "ID_Riesgo", "Nombre", poliza.FK_TipoRiesgo);
            return View(poliza);
        }

        // POST: Polizas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ID_Poliza,Nombre,Descripcion,FK_TipoRiesgo")] Poliza poliza)
        {
            if (ModelState.IsValid)
            {
                db.Entry(poliza).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.FK_TipoRiesgo = new SelectList(db.TipoRiesgo, "ID_Riesgo", "Nombre", poliza.FK_TipoRiesgo);
            return View(poliza);
        }

        // GET: Polizas/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Poliza poliza = await db.Poliza.FindAsync(id);
            if (poliza == null)
            {
                return HttpNotFound();
            }
            return View(poliza);
        }

        // POST: Polizas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Poliza poliza = await db.Poliza.FindAsync(id);
            db.Poliza.Remove(poliza);
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
