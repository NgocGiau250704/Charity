using Charity.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using PagedList;
namespace Charity.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        CharityWebsiteEntities db = new CharityWebsiteEntities();
        public ActionResult TinTucSuKien(int? page)
        {
            ViewBag.meta = "tin-tuc-su-kien";
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var news = db.News.OrderByDescending(x => x.IDnews).ToPagedList(pageNumber, pageSize);
            return View(news);
        }
        public ActionResult Detail(int id)
        {
            var news = db.News.FirstOrDefault(x => x.IDnews == id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }
    }
}