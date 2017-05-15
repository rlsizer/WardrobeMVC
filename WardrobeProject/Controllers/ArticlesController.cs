using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WardrobeProject.Models;

namespace WardrobeProject.Controllers
{
    public class ArticlesController : Controller
    {
        private WardrobeDBEntities db = new WardrobeDBEntities();

        // GET: Articles
        public ActionResult Index()
        {
            var articles = db.Articles.Include(a => a.ClothingType).Include(a => a.Color).Include(a => a.Occasion).Include(a => a.Season);
            return View(articles.ToList());
        }

        // GET: Articles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Article article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            return View(article);
        }

        // GET: Articles/Create
        public ActionResult Create()
        {
            ViewBag.ClothingTypeID = new SelectList(db.ClothingTypes, "ClothingTypeID", "ClothingType1");
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "ColorType");
            ViewBag.OccasionID = new SelectList(db.Occasions, "OccasionID", "OccasionType");
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "SeasonType");
            return View();
        }

        // POST: Articles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ArticleID,ArticleName,ArticleImage,ArticleType,ClothingTypeID,OccasionID,SeasonID,ColorID")] Article article)
        {
            if (ModelState.IsValid)
            {
                db.Articles.Add(article);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ClothingTypeID = new SelectList(db.ClothingTypes, "ClothingTypeID", "ClothingType1", article.ClothingTypeID);
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "ColorType", article.ColorID);
            ViewBag.OccasionID = new SelectList(db.Occasions, "OccasionID", "OccasionType", article.OccasionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "SeasonType", article.SeasonID);
            return View(article);
        }

        // GET: Articles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Article article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            ViewBag.ClothingTypeID = new SelectList(db.ClothingTypes, "ClothingTypeID", "ClothingType1", article.ClothingTypeID);
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "ColorType", article.ColorID);
            ViewBag.OccasionID = new SelectList(db.Occasions, "OccasionID", "OccasionType", article.OccasionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "SeasonType", article.SeasonID);
            return View(article);
        }

        // POST: Articles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ArticleID,ArticleName,ArticleImage,ArticleType,ClothingTypeID,OccasionID,SeasonID,ColorID")] Article article)
        {
            if (ModelState.IsValid)
            {
                db.Entry(article).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ClothingTypeID = new SelectList(db.ClothingTypes, "ClothingTypeID", "ClothingType1", article.ClothingTypeID);
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "ColorType", article.ColorID);
            ViewBag.OccasionID = new SelectList(db.Occasions, "OccasionID", "OccasionType", article.OccasionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "SeasonType", article.SeasonID);
            return View(article);
        }

        // GET: Articles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Article article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            return View(article);
        }

        // POST: Articles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Article article = db.Articles.Find(id);
            db.Articles.Remove(article);
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
