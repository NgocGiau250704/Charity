using Charity.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Charity.Helpers;
namespace Charity.Controllers
{
    public class CompleteController : Controller
    {
        // GET: Complete
        CharityWebsiteEntities db = new CharityWebsiteEntities();
        public ActionResult DuAnDaHoanThanh(int? page)
        {
            ViewBag.meta = "du-an-da-hoan-thanh";
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            var listProject = db.DuAns.Where(x => x.ProjectState == true).OrderByDescending(x => x.IDduan).ToPagedList(pageNumber, pageSize);
            return View(listProject);
        }
        public ActionResult Detail(int id)
        {
            var project = db.DuAns.FirstOrDefault(x => x.IDduan == id && x.ProjectState == true);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }
    }
}