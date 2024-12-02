using Charity.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Charity.Controllers
{
    public class LayoutController : Controller
    {
        CharityWebsiteEntities db = new CharityWebsiteEntities();
        // GET: Layout
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult getMenu()
        {
            var menu = db.Menus.ToList();
            return PartialView(menu);
        }
        public ActionResult getSubmenu(int id)
        {
            var submenu = db.submenus.Where(x => x.idparent == id).ToList();
            if(!submenu.Any())
            {
                return null;
            }
            return PartialView(submenu);
        }
        public ActionResult getContactFooter()
        {
            var contactfooter = db.ContactInfors.FirstOrDefault();
            return PartialView(contactfooter);
        }
        public ActionResult getMenuFooter()
        {
            var menufooter = db.Menus.ToList();
            return PartialView(menufooter);
        }
        public ActionResult getSubmenuFooter(int id)
        {
            var submenu = db.submenus.Where(x => x.idparent == id).ToList();
            if (!submenu.Any())
            {
                return null;
            }
            return PartialView(submenu);
        }
    }
}