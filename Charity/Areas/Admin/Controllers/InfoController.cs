using Charity.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Charity.Areas.Admin.Controllers
{
    public class InfoController : Controller
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
            var listDuAn = ojb.Abouts.ToList();
            return View(listDuAn);
        }

        public ActionResult Add()
        {

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> Add(About model, HttpPostedFileBase image1, HttpPostedFileBase image2)
        {
            if (ModelState.IsValid)
            {

                // Kiểm tra xem có tệp hình ảnh được tải lên không
                if (image1 != null && image1.ContentLength > 0)
                {
                    // Kiểm tra và tạo thư mục lưu ảnh nếu chưa tồn tại
                    string path = Server.MapPath("/Content/img/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    // Tạo tên tệp mới với GUID để tránh trùng lặp tên
                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(image1.FileName);
                    string filePath = Path.Combine(path, fileName);


                    image1.SaveAs(filePath);


                    // Gán đường dẫn ảnh vào thuộc tính của model
                    model.image1 = fileName;
                }
                if (image2 != null && image2.ContentLength > 0)
                {
                    // Kiểm tra và tạo thư mục lưu ảnh nếu chưa tồn tại
                    string path = Server.MapPath("/Content/img/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    // Tạo tên tệp mới với GUID để tránh trùng lặp tên
                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(image2.FileName);
                    string filePath = Path.Combine(path, fileName);


                    image2.SaveAs(filePath);


                    // Gán đường dẫn ảnh vào thuộc tính của model
                    model.image2 = fileName;
                }
                model.hide = true;
                model.datebegin = DateTime.Now;
                model.meta = RemoveDiacriticsAndReplaceSpaces(model.MoTaNgan);

                // Lưu model vào cơ sở dữ liệu
                ojb.Abouts.Add(model);
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
            var news = ojb.Abouts.Find(id);
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
            var news = await ojb.Abouts.FindAsync(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            // Xóa mục khỏi database
            ojb.Abouts.Remove(news);
            await ojb.SaveChangesAsync();

            // Chuyển hướng về trang Index sau khi xóa
            return RedirectToAction("Index");
        }

        public ActionResult Detail(int id)
        {
            // Tìm mục theo id
            var news = ojb.Abouts.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news); // Trả về view hiển thị thông tin để xác nhận xóa
        }

        public ActionResult Edit(int id)
        {
            // Tìm mục theo id
            var news = ojb.Abouts.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> Edit(About model, HttpPostedFileBase image1, HttpPostedFileBase image2)
        {
            if (ModelState.IsValid)
            {
                // Lấy bản ghi hiện có từ cơ sở dữ liệu
                var existingNews = await ojb.Abouts.FindAsync(model.id);
                if (existingNews == null)
                {
                    return HttpNotFound();
                }

                // Đường dẫn đến thư mục lưu ảnh
                string path = Server.MapPath("/Content/img/");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                // Xử lý ảnh 1
                if (image1 != null && image1.ContentLength > 0)
                {
                    // Tạo tên tệp mới
                    string fileName1 = Guid.NewGuid().ToString() + "_" + Path.GetFileName(image1.FileName);
                    string filePath1 = Path.Combine(path, fileName1);

                    // Lưu tệp ảnh mới
                    image1.SaveAs(filePath1);

                    // Xóa ảnh cũ nếu có
                    if (!string.IsNullOrEmpty(existingNews.image1))
                    {
                        string oldFilePath1 = Path.Combine(path, existingNews.image1);
                        if (System.IO.File.Exists(oldFilePath1))
                        {
                            System.IO.File.Delete(oldFilePath1);
                        }
                    }

                    // Gán tên tệp mới cho thuộc tính của model
                    existingNews.image1 = fileName1;
                }

                // Xử lý ảnh 2
                if (image2 != null && image2.ContentLength > 0)
                {
                    // Tạo tên tệp mới
                    string fileName2 = Guid.NewGuid().ToString() + "_" + Path.GetFileName(image2.FileName);
                    string filePath2 = Path.Combine(path, fileName2);

                    // Lưu tệp ảnh mới
                    image2.SaveAs(filePath2);

                    // Xóa ảnh cũ nếu có
                    if (!string.IsNullOrEmpty(existingNews.image2))
                    {
                        string oldFilePath2 = Path.Combine(path, existingNews.image2);
                        if (System.IO.File.Exists(oldFilePath2))
                        {
                            System.IO.File.Delete(oldFilePath2);
                        }
                    }

                    // Gán tên tệp mới cho thuộc tính của model
                    existingNews.image2 = fileName2;
                }

                // Cập nhật các thuộc tính khác của bản ghi
                existingNews.MoTaDayDu = model.MoTaDayDu;
                existingNews.MoTaNgan = model.MoTaNgan;
                existingNews.datebegin = DateTime.Now;
                existingNews.hide = model.hide;
                existingNews.meta = RemoveDiacriticsAndReplaceSpaces(model.MoTaNgan);

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