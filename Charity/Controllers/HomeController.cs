using Charity.Models;
using Microsoft.Ajax.Utilities;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Charity.Controllers
{
    public class HomeController : Controller
    {
        CharityWebsiteEntities db = new CharityWebsiteEntities();
        public ActionResult TrangChu()
        {
            return View();
        }
        public ActionResult getAbout()
        {
            ViewBag.meta = "ve-chung-toi";
            var firstAbout = db.Abouts.FirstOrDefault();
            return PartialView(firstAbout);
        }
        public ActionResult getComplete()
        {
            ViewBag.meta = "du-an-da-hoan-thanh";
            var complete = db.DuAns.Where(x => x.ProjectState == true)
                                      .OrderByDescending(x => x.IDduan)
                                      .Take(3).ToList();
            return PartialView(complete);
        }
        public ActionResult getInComplete()
        {
            ViewBag.meta = "du-an-dang-thuc-hien";
            var incomplete = db.DuAns.Where(x => x.ProjectState == false)
                                      .OrderByDescending(x => x.IDduan)
                                      .Take(3).ToList();
            return PartialView(incomplete);
        }
        public ActionResult VeChungToi()
        {
            var firstAbout = db.Abouts.FirstOrDefault();
            return View(firstAbout);
        }

        public ActionResult DuAnDaHoanThanh()
        {
            return View();
        }

        public ActionResult DuAnDangThucHien()
        {
            return View();
        }

        
        public ActionResult DongGop()
        {
            var infordonate = db.InforDonates.ToList();
            return View(infordonate);
        }

        public ActionResult DanhSachUngHo(string searchName, int? searchDay, int? searchMonth, int? searchYear, int? page)
        {
            ViewBag.meta = "danh-sach-ung-ho";
            var donations = db.Donates.AsQueryable();

            if (!string.IsNullOrEmpty(searchName))
            {
                donations = donations.Where(d => d.PersonDonateName.Contains(searchName));
            }

            if (searchDay.HasValue)
            {
                donations = donations.Where(d => d.datebegin.Value.Day == searchDay.Value);
            }
            if (searchMonth.HasValue)
            {
                donations = donations.Where(d => d.datebegin.Value.Month == searchMonth.Value);
            }

            if (searchYear.HasValue)
            {
                donations = donations.Where(d => d.datebegin.Value.Year == searchYear.Value);
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);

            return View(donations.OrderBy(d => d.datebegin).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(string username, string password)
        {
            var user = db.UserAccounts.FirstOrDefault(u => u.username == username && u.password == password);
            if (user != null)
            {
                // Authentication successful, redirect to admin page
                FormsAuthentication.SetAuthCookie(username, false);
                return RedirectToAction("Index", "Home", new { area = "Admin" });
            }
            else
            {
                // Authentication failed, show error message
                ViewBag.ErrorMessage = "Tên người dùng hoặc mật khẩu không đúng.";
                return View();
            }
        }
    }
} 