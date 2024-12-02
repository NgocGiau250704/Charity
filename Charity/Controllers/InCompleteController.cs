using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Charity.Models;
using PagedList;
namespace Charity.Controllers
{
    public class InCompleteController : Controller
    {
        // GET: InComplete
        CharityWebsiteEntities db = new CharityWebsiteEntities();
        public ActionResult DuAnDangThucHien(int? page)
        {
            ViewBag.meta = "du-an-dang-thuc-hien";
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            var listProject = db.DuAns.Where(x => x.ProjectState == false).OrderByDescending(x => x.IDduan).ToPagedList(pageNumber, pageSize);
            return View(listProject);
        }
        public ActionResult Detail(int id)
        {

            var project = db.DuAns.FirstOrDefault(x => x.IDduan == id && x.ProjectState == false);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }
    }
}