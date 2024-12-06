using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Charity.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Logout()
        {
            // Xóa thông tin đăng nhập (session, cookie, v.v.)
            Session.Clear();
            Session.Abandon();

            // Nếu sử dụng FormsAuthentication
            // FormsAuthentication.SignOut();

            // Chuyển hướng về trang chủ (ngoài Area)
            return RedirectToAction("TrangChu", "Home", new { area = "" });
        }
    }
}