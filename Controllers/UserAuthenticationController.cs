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
    public class UserAuthenticationController : Controller
    {
        private Group3_iCARECBEntities1 db = new Group3_iCARECBEntities1();

        // GET: UserAuthentication
        public ActionResult Index()
        {
            var userPassword = db.UserPassword.Include(u => u.iCareUser);
            return View(userPassword.ToList());
        }

        // GET: UserAuthentication/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserPassword userPassword = db.UserPassword.Find(id);
            if (userPassword == null)
            {
                return HttpNotFound();
            }
            return View(userPassword);
        }

        // GET: UserAuthentication/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.iCareUser, "UserID", "FullName");
            return View();
        }

        // POST: UserAuthentication/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserID,EncryptedPassword,ExpirationDate,LastChanged,PasswordID,UserName")] UserPassword userPassword)
        {
            if (ModelState.IsValid)
            {
                db.UserPassword.Add(userPassword);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.iCareUser, "UserID", "FullName", userPassword.UserID);
            return View(userPassword);
        }

        // GET: UserAuthentication/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserPassword userPassword = db.UserPassword.Find(id);
            if (userPassword == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.iCareUser, "UserID", "FullName", userPassword.UserID);
            return View(userPassword);
        }

        // POST: UserAuthentication/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserID,EncryptedPassword,ExpirationDate,LastChanged,PasswordID,UserName")] UserPassword userPassword)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userPassword).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.iCareUser, "UserID", "FullName", userPassword.UserID);
            return View(userPassword);
        }

        // GET: UserAuthentication/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserPassword userPassword = db.UserPassword.Find(id);
            if (userPassword == null)
            {
                return HttpNotFound();
            }
            return View(userPassword);
        }

        // POST: UserAuthentication/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserPassword userPassword = db.UserPassword.Find(id);
            db.UserPassword.Remove(userPassword);
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
