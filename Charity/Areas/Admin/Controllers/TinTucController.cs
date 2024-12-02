using Charity.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Charity.Helpers;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Text;

namespace Charity.Areas.Admin.Controllers
{
    public class TinTucController : Controller
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

        public ActionResult Index()
        {
            var listDuAn = ojb.News.ToList();
            return View(listDuAn);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> Add(News model, HttpPostedFileBase NewsImage)
        {
            if (ModelState.IsValid)
            {

                // Kiểm tra xem có tệp hình ảnh được tải lên không
                if (NewsImage != null && NewsImage.ContentLength > 0)
                {
                    // Kiểm tra và tạo thư mục lưu ảnh nếu chưa tồn tại
                    string path = Server.MapPath("/Content/img/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    // Tạo tên tệp mới với GUID để tránh trùng lặp tên
                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(NewsImage.FileName);
                    string filePath = Path.Combine(path, fileName);


                    NewsImage.SaveAs(filePath);


                    // Gán đường dẫn ảnh vào thuộc tính của model
                    model.NewsImage = fileName;
                }
                model.hide = true;
                model.datebegin = DateTime.Now;
                model.meta = RemoveDiacriticsAndReplaceSpaces(model.NewsName);

                // Lưu model vào cơ sở dữ liệu
                ojb.News.Add(model);
                await ojb.SaveChangesAsync();

                // Chuyển hướng về trang Index sau khi lưu thành công
                return RedirectToAction("Index");


            }

            // Trả về view với model nếu có lỗi
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            // Tìm mục theo id
            var news = ojb.News.Find(id);
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
            var news = await ojb.News.FindAsync(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            // Xóa mục khỏi database
            ojb.News.Remove(news);
            await ojb.SaveChangesAsync();

            // Chuyển hướng về trang Index sau khi xóa
            return RedirectToAction("Index");
        }

        public ActionResult Detail(int id)
        {
            // Tìm mục theo id
            var news = ojb.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news); // Trả về view hiển thị thông tin để xác nhận xóa
        }

        public ActionResult Edit(int id)
        {
            // Tìm mục theo id
            var news = ojb.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news); 
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> Edit(News model, HttpPostedFileBase NewsImage)
        {
            if (ModelState.IsValid)
            {
                // Lấy bản ghi hiện có từ cơ sở dữ liệu
                var existingNews = await ojb.News.FindAsync(model.IDnews);
                if (existingNews == null)
                {
                    return HttpNotFound();
                }

                // Kiểm tra xem có tệp ảnh mới được tải lên hay không
                if (NewsImage != null && NewsImage.ContentLength > 0)
                {
                    // Đường dẫn để lưu ảnh
                    string path = Server.MapPath("/Content/img/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    // Tạo tên tệp duy nhất bằng GUID để tránh trùng tên
                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(NewsImage.FileName);
                    string filePath = Path.Combine(path, fileName);

                    // Lưu tệp ảnh mới
                    NewsImage.SaveAs(filePath);

                    // Xóa ảnh cũ nếu có để tránh lưu trữ các tệp không cần thiết
                    if (!string.IsNullOrEmpty(existingNews.NewsImage))
                    {
                        string oldFilePath = Path.Combine(path, existingNews.NewsImage);
                        if (System.IO.File.Exists(oldFilePath))
                        {
                            System.IO.File.Delete(oldFilePath);
                        }
                    }

                    // Gán tên tệp mới cho thuộc tính của model
                    existingNews.NewsImage = fileName;
                }

                // Cập nhật các thuộc tính khác của bản ghi
                existingNews.NewsName = model.NewsName;
                existingNews.Descrpition = model.Descrpition;
                existingNews.datebegin = DateTime.Now;
                existingNews.hide = model.hide;
                existingNews.meta = RemoveDiacriticsAndReplaceSpaces(model.NewsName);
                // Thêm các thuộc tính cần cập nhật khác nếu có

                // Lưu các thay đổi vào cơ sở dữ liệu
                await ojb.SaveChangesAsync();

                // Chuyển hướng về trang Index sau khi lưu thành công
                return RedirectToAction("Index");
            }

            // Trả về view với model nếu có lỗi xác thực
            return View(model);
        }



    }


}