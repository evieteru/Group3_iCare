using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Group3_iCareAPP.Models;

namespace Group3_iCareAPP.Controllers
{
    public class DisplayPaletteController : Controller
    {
        private Group3_iCARECBEntities1 db = new Group3_iCARECBEntities1();

        // GET: DisplayPalette
        public ActionResult Index()
        {
            var documentMetadata = db.DocumentMetadata.Include(d => d.iCareUser).Include(d => d.PatientRecord);
            return View(documentMetadata.ToList());
        }

        // GET: DisplayPalette/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DocumentMetadata documentMetadata = db.DocumentMetadata.Find(id);
            if (documentMetadata == null)
            {
                return HttpNotFound();
            }
            return View(documentMetadata);
        }

        // GET: DisplayPalette/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.iCareUser, "UserID", "FullName");
            ViewBag.PatientID = new SelectList(db.PatientRecord, "PatientID", "Address");
            return View();
        }

        // POST: DisplayPalette/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DocumentID,DocumentName,CreationDate,PatientID,UserID")] DocumentMetadata documentMetadata)
        {
            if (ModelState.IsValid)
            {
                documentMetadata.DocumentID = Guid.NewGuid();
                db.DocumentMetadata.Add(documentMetadata);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.iCareUser, "UserID", "FullName", documentMetadata.UserID);
            ViewBag.PatientID = new SelectList(db.PatientRecord, "PatientID", "Address", documentMetadata.PatientID);
            return View(documentMetadata);
        }

        // GET: DisplayPalette/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DocumentMetadata documentMetadata = db.DocumentMetadata.Find(id);
            if (documentMetadata == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.iCareUser, "UserID", "FullName", documentMetadata.UserID);
            ViewBag.PatientID = new SelectList(db.PatientRecord, "PatientID", "Address", documentMetadata.PatientID);
            return View(documentMetadata);
        }

        // POST: DisplayPalette/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DocumentID,DocumentName,CreationDate,PatientID,UserID")] DocumentMetadata documentMetadata)
        {
            if (ModelState.IsValid)
            {
                db.Entry(documentMetadata).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.iCareUser, "UserID", "FullName", documentMetadata.UserID);
            ViewBag.PatientID = new SelectList(db.PatientRecord, "PatientID", "Address", documentMetadata.PatientID);
            return View(documentMetadata);
        }

        // GET: DisplayPalette/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DocumentMetadata documentMetadata = db.DocumentMetadata.Find(id);
            if (documentMetadata == null)
            {
                return HttpNotFound();
            }
            return View(documentMetadata);
        }

        // POST: DisplayPalette/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            DocumentMetadata documentMetadata = db.DocumentMetadata.Find(id);
            db.DocumentMetadata.Remove(documentMetadata);
            db.SaveChanges();
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
