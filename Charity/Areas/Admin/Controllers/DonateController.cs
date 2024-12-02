
using Charity.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Charity.Areas.Admin.Controllers
{
    public class DonateController : Controller
    {
        CharityWebsiteEntities ojb = new CharityWebsiteEntities();
        public ActionResult Index()
        {
            var listDuAn = ojb.Donates.ToList();
            return View(listDuAn);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Donate model)
        {
            if (ModelState.IsValid)
            {
                model.hide = true;
                model.datebegin = DateTime.Now;


                // Lưu model vào cơ sở dữ liệu
                ojb.Donates.Add(model);
                ojb.SaveChanges();

                // Chuyển hướng về trang Index sau khi lưu thành công
                return RedirectToAction("Index");


            }

            // Trả về view với model nếu có lỗi
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            // Tìm mục theo id
            var news = ojb.Donates.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news); // Trả về view hiển thị thông tin để xác nhận xóa
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var news = await ojb.Donates.FindAsync(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            // Xóa mục khỏi database
            ojb.Donates.Remove(news);
            await ojb.SaveChangesAsync();

            // Chuyển hướng về trang Index sau khi xóa
            return RedirectToAction("Index");
        }

        public ActionResult Detail(int id)
        {
            var news = ojb.Donates.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news);
        }

        public ActionResult Edit(int id)
        {
            var news = ojb.Donates.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Donate model)
        {

            if (ModelState.IsValid)
            {
                var existingNews = ojb.Donates.Find(model.IDdonate);
                if (existingNews == null)
                {
                    return HttpNotFound();
                }


                // Cập nhật các thuộc tính khác của bản ghi
                existingNews.PersonDonateName = model.PersonDonateName;
                existingNews.DonateMoney = model.DonateMoney;
                existingNews.Infor = model.Infor;
                existingNews.datebegin = DateTime.Now;

                // Lưu các thay đổi vào cơ sở dữ liệu
                ojb.SaveChanges();

                // Chuyển hướng về trang Index sau khi lưu thành công
                return RedirectToAction("Index");
            }

            // Trả về view với model nếu có lỗi xác thực
            return View(model);
        }
    }


}
