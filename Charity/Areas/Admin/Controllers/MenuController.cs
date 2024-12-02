using Charity.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Charity.Areas.Admin.Controllers
{
    public class MenuController : Controller
    {
        CharityWebsiteEntities ojb = new CharityWebsiteEntities();

        public static string RemoveDiacriticsAndReplaceSpaces(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
                return string.Empty;

            // Chuyển đổi tiếng Việt có dấu thành không dấu
            string normalizedString = input.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();
            foreach (var c in normalizedString)
            {
                // Chỉ thêm các ký tự không phải dấu (NonSpacingMark)
                if (CharUnicodeInfo.GetUnicodeCategory(c) != System.Globalization.UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(c);
                }
            }

            // Chuyển chuỗi đã loại bỏ dấu trở lại về dạng Form C
            string noDiacritics = sb.ToString().Normalize(NormalizationForm.FormC);

            // Thay thế các khoảng trắng bằng dấu gạch ngang và loại bỏ các ký tự không phải chữ cái và số
            string result = Regex.Replace(noDiacritics, @"\s+", "-");  // Thay thế khoảng trắng thành "-"
            result = Regex.Replace(result, @"[^a-zA-Z0-9\-]", "");    // Loại bỏ các ký tự đặc biệt, chỉ giữ chữ cái, số và dấu gạch ngang

            return result.ToLower(); // Trả về chuỗi viết thường
        }
        // GET: Admin/Menu
        public ActionResult Index()
        {
            var listDuAn = ojb.Menus.ToList();
            return View(listDuAn);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Menu model)
        {
            if (ModelState.IsValid)
            {
                model.datebegin = DateTime.Now;

                model.meta = RemoveDiacriticsAndReplaceSpaces(model.name);
                // Lưu model vào cơ sở dữ liệu
                ojb.Menus.Add(model);
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
            var news = ojb.Menus.Find(id);
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
            var news = await ojb.Menus.FindAsync(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            // Xóa mục khỏi database
            ojb.Menus.Remove(news);
            await ojb.SaveChangesAsync();

            // Chuyển hướng về trang Index sau khi xóa
            return RedirectToAction("Index");
        }

        public ActionResult Detail(int id)
        {
            var news = ojb.Menus.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news);
        }

        public ActionResult Edit(int id)
        {
            var news = ojb.Menus.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Menu model)
        {

            if (ModelState.IsValid)
            {
                var existingNews = ojb.Menus.Find(model.id);
                if (existingNews == null)
                {
                    return HttpNotFound();
                }


                // Cập nhật các thuộc tính khác của bản ghi
                existingNews.name = model.name;
                existingNews.meta = RemoveDiacriticsAndReplaceSpaces(model.name);
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