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
    public class ManageAccountsController : Controller
    {
        private Group3_iCARECBEntities1 db = new Group3_iCARECBEntities1();

        // GET: ManageAccounts
        public ActionResult Index()
        {
            var iCareUser = db.iCareUser.Include(i => i.iCareAdmin).Include(i => i.iCareWorker).Include(i => i.UserRole);
            return View(iCareUser.ToList());
        }

        // GET: ManageAccounts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            iCareUser iCareUser = db.iCareUser.Find(id);
            if (iCareUser == null)
            {
                return HttpNotFound();
            }
            return View(iCareUser);
        }

        // GET: ManageAccounts/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.iCareAdmin, "UserID", "adminEmail");
            ViewBag.UserID = new SelectList(db.iCareWorker, "UserID", "Profession");
            ViewBag.PermissionID = new SelectList(db.UserRole, "PermissionID", "PermissionName");
            return View();
        }

        // POST: ManageAccounts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserID,PermissionID,FullName")] iCareUser iCareUser)
        {
            if (ModelState.IsValid)
            {
                db.iCareUser.Add(iCareUser);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.iCareAdmin, "UserID", "adminEmail", iCareUser.UserID);
            ViewBag.UserID = new SelectList(db.iCareWorker, "UserID", "Profession", iCareUser.UserID);
            ViewBag.PermissionID = new SelectList(db.UserRole, "PermissionID", "PermissionName", iCareUser.PermissionID);
            return View(iCareUser);
        }

        // GET: ManageAccounts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            iCareUser iCareUser = db.iCareUser.Find(id);
            if (iCareUser == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.iCareAdmin, "UserID", "adminEmail", iCareUser.UserID);
            ViewBag.UserID = new SelectList(db.iCareWorker, "UserID", "Profession", iCareUser.UserID);
            ViewBag.PermissionID = new SelectList(db.UserRole, "PermissionID", "PermissionName", iCareUser.PermissionID);
            return View(iCareUser);
        }

        // POST: ManageAccounts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserID,PermissionID,FullName")] iCareUser iCareUser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(iCareUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.iCareAdmin, "UserID", "adminEmail", iCareUser.UserID);
            ViewBag.UserID = new SelectList(db.iCareWorker, "UserID", "Profession", iCareUser.UserID);
            ViewBag.PermissionID = new SelectList(db.UserRole, "PermissionID", "PermissionName", iCareUser.PermissionID);
            return View(iCareUser);
        }

        // GET: ManageAccounts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            iCareUser iCareUser = db.iCareUser.Find(id);
            if (iCareUser == null)
            {
                return HttpNotFound();
            }
            return View(iCareUser);
        }

        // POST: ManageAccounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            iCareUser iCareUser = db.iCareUser.Find(id);
            db.iCareUser.Remove(iCareUser);
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
