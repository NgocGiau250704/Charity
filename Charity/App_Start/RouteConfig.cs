using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Charity
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("DongGop", "{meta}",
            new { controller = "Home", action = "DongGop" },
            new RouteValueDictionary
            {
                { "meta", "dong-gop" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute("DangNhap", "{meta}",
            new { controller = "Home", action = "DangNhap" },
            new RouteValueDictionary
            {
                { "meta", "dang-nhap" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute("TrangChu", "{meta}",
            new { controller = "Home", action = "TrangChu" },
            new RouteValueDictionary
            {
                { "meta", "trang-chu" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute("VeChungToi", "{meta}",
            new { controller = "Home", action = "VeChungToi" },
            new RouteValueDictionary
            {
                { "meta", "ve-chung-toi" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute("DuAnDaHoanThanh","{meta}/{page}",
            defaults: new { controller = "Complete", action = "DuAnDaHoanThanh", page = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "meta", "du-an-da-hoan-thanh" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute("DetailComplete", "{type}/{meta}/{id}",
            defaults: new { controller = "Complete", action = "Detail", id = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "du-an-da-hoan-thanh" }
            },
            namespaces: new[] { "Charity.Controllers" });
            
            routes.MapRoute("DuAnDangThucHien", "{meta}/{page}",
            new { controller = "InComplete", action = "DuAnDangThucHien", page = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "meta", "du-an-dang-thuc-hien" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute("DetailInComplete", "{type}/{meta}/{id}",
            defaults: new { controller = "InComplete", action = "Detail", id = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "du-an-dang-thuc-hien" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute("TinTucSuKien", "{meta}/{page}",
            new { controller = "News", action = "TinTucSuKien", page = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "meta", "tin-tuc-su-kien" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute("DetailNews", "{type}/{meta}/{id}",
            defaults: new { controller = "News", action = "Detail", id = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "tin-tuc-su-kien" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute("DanhSachUngHo", "{meta}/{page}",
            new { controller = "Home", action = "DanhSachUngHo", page=UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "meta", "danh-sach-ung-ho" }
            },
            namespaces: new[] { "Charity.Controllers" });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "TrangChu", id = UrlParameter.Optional },
                namespaces: new[] { "Charity.Controllers" }

            );
        }
    }
}
