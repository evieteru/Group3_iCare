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
    public class AssignPatientController : Controller
    {
        private Group3_iCARECBEntities1 db = new Group3_iCARECBEntities1();             //Instance of Entity Framework DbContext, provides access to database

        // GET: TreatmentRecords
        public ActionResult Index()                                                     //Retrieves a list of all entities from the database
        {
            var treatmentRecord = db.TreatmentRecord.Include(t => t.PatientRecord);     //Entity Framework method, retrieves related data from PatientRecord
            return View(treatmentRecord.ToList());                                      //Sends the list to the corresponding Index view
        }

        // GET: TreatmentRecords/Details/5
        public ActionResult Details(int? id)                                            //Fetches a single record based on the id
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TreatmentRecord treatmentRecord = db.TreatmentRecord.Find(id);              //Retrieves the entry with the matching primary key
            if (treatmentRecord == null)
            {
                return HttpNotFound();
            }
            return View(treatmentRecord);
        }

        // GET: TreatmentRecords/Create
        public ActionResult Create()
        {
            ViewBag.PatientID = new SelectList(db.PatientRecord, "PatientID", "Address");   //Populates a dropdown list of PatientIDs from PatientRecord for the user to select when creating a TreatmentRecord
            return View();
        }

        // POST: TreatmentRecords/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AssignmentID,UserID,PatientID,Description,TreatmentDate")] TreatmentRecord treatmentRecord) //Handles for submission to create a new record
        {
            if (ModelState.IsValid)
            {
                db.TreatmentRecord.Add(treatmentRecord);                           //Adds new record to the database
                db.SaveChanges();                                                  //Commits changes to the database
                return RedirectToAction("Index");
            }

            ViewBag.PatientID = new SelectList(db.PatientRecord, "PatientID", "Address", treatmentRecord.PatientID);
            return View(treatmentRecord);
        }

        // GET: TreatmentRecords/Edit/5
        public ActionResult Edit(int? id)                       //Fetches a record by id and displays existing data for editing
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TreatmentRecord treatmentRecord = db.TreatmentRecord.Find(id);
            if (treatmentRecord == null)
            {
                return HttpNotFound();
            }
            ViewBag.PatientID = new SelectList(db.PatientRecord, "PatientID", "Address", treatmentRecord.PatientID);
            return View(treatmentRecord);
        }

        // POST: TreatmentRecords/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AssignmentID,UserID,PatientID,Description,TreatmentDate")] TreatmentRecord treatmentRecord) //Submits edited data to update the record in the database
        {
            if (ModelState.IsValid)
            {
                db.Entry(treatmentRecord).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PatientID = new SelectList(db.PatientRecord, "PatientID", "Address", treatmentRecord.PatientID);
            return View(treatmentRecord);
        }

        // GET: TreatmentRecords/Delete/5
        public ActionResult Delete(int? id)         //Fetches record to confirm deletion
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TreatmentRecord treatmentRecord = db.TreatmentRecord.Find(id);
            if (treatmentRecord == null)
            {
                return HttpNotFound();
            }
            return View(treatmentRecord);
        }

        // POST: TreatmentRecords/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)         //Deletes from database
        {
            TreatmentRecord treatmentRecord = db.TreatmentRecord.Find(id);
            db.TreatmentRecord.Remove(treatmentRecord);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)     //cleanup method for when database connection is no longer needed
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
