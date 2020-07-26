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
    public class CoberturasController : Controller
    {
        private SistemaSegurosEntities db = new SistemaSegurosEntities();

        // GET: Coberturas
        public async Task<ActionResult> Index()
        {
            return View(await db.Cobertura.ToListAsync());
        }

        // GET: Coberturas/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cobertura cobertura = await db.Cobertura.FindAsync(id);
            if (cobertura == null)
            {
                return HttpNotFound();
            }
            return View(cobertura);
        }

        // GET: Coberturas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Coberturas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ID_Cobertura,Nombre,Descripcion,PrecioMensual")] Cobertura cobertura)
        {
            if (ModelState.IsValid)
            {
                db.Cobertura.Add(cobertura);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(cobertura);
        }

        // GET: Coberturas/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cobertura cobertura = await db.Cobertura.FindAsync(id);
            if (cobertura == null)
            {
                return HttpNotFound();
            }
            return View(cobertura);
        }

        // POST: Coberturas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ID_Cobertura,Nombre,Descripcion,PrecioMensual")] Cobertura cobertura)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cobertura).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(cobertura);
        }

        // GET: Coberturas/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cobertura cobertura = await db.Cobertura.FindAsync(id);
            if (cobertura == null)
            {
                return HttpNotFound();
            }
            return View(cobertura);
        }

        // POST: Coberturas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Cobertura cobertura = await db.Cobertura.FindAsync(id);
            db.Cobertura.Remove(cobertura);
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
