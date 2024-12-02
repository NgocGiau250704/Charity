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
    public class DuAnController : Controller
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
        // GET: Admin/DuAn
        public ActionResult Index()
        {
            var listDuAn = ojb.DuAns.Where(x => x.ProjectState == false).ToList();
            return View(listDuAn);
        }

        public ActionResult CompletedProject()
        {
            var listDuAn = ojb.DuAns.Where(x => x.ProjectState == true).ToList();
            return View(listDuAn);
        }
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> Add(DuAn model, HttpPostedFileBase ProjectImage)
        {
            if (ModelState.IsValid)
            {

                // Kiểm tra xem có tệp hình ảnh được tải lên không
                if (ProjectImage != null && ProjectImage.ContentLength > 0)
                {
                    // Kiểm tra và tạo thư mục lưu ảnh nếu chưa tồn tại
                    string path = Server.MapPath("/Content/img/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(ProjectImage.FileName);
                    string filePath = Path.Combine(path, fileName);
                    ProjectImage.SaveAs(filePath);
                    model.ProjectImage = fileName;
                }
                model.ProjectState = false;
                model.datebegin = DateTime.Now;
                model.meta = RemoveDiacriticsAndReplaceSpaces(model.ProjectName);

                // Lưu model vào cơ sở dữ liệu
                ojb.DuAns.Add(model);
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
            var news = ojb.DuAns.Find(id);
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
            var news = await ojb.DuAns.FindAsync(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            // Xóa mục khỏi database
            ojb.DuAns.Remove(news);
            await ojb.SaveChangesAsync();

            // Chuyển hướng về trang Index sau khi xóa
            return RedirectToAction("Index");
        }

        public ActionResult DeleteCompleted(int id)
        {
            // Tìm mục theo id
            var news = ojb.DuAns.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news); // Trả về view hiển thị thông tin để xác nhận xóa
        }

        [HttpPost, ActionName("DeleteCompleted")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmedCompleted(int id)
        {
            var news = await ojb.DuAns.FindAsync(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            // Xóa mục khỏi database
            ojb.DuAns.Remove(news);
            await ojb.SaveChangesAsync();

            // Chuyển hướng về trang Index sau khi xóa
            return RedirectToAction("CompletedProject");
        }

        public ActionResult Detail(int id)
        {
            // Tìm mục theo id
            var news = ojb.DuAns.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news); // Trả về view hiển thị thông tin để xác nhận xóa
        }

        public ActionResult Edit(int id)
        {
            // Tìm mục theo id
            var news = ojb.DuAns.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> Edit(DuAn model, HttpPostedFileBase ProjectImage)
        {
            if (ModelState.IsValid)
            {
                // Lấy bản ghi hiện có từ cơ sở dữ liệu
                var existingNews = await ojb.DuAns.FindAsync(model.IDduan);
                if (existingNews == null)
                {
                    return HttpNotFound();
                }

                // Kiểm tra xem có tệp ảnh mới được tải lên hay không
                if (ProjectImage != null && ProjectImage.ContentLength > 0)
                {
                    // Đường dẫn để lưu ảnh
                    string path = Server.MapPath("/Content/img/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    // Tạo tên tệp duy nhất bằng GUID để tránh trùng tên
                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(ProjectImage.FileName);
                    string filePath = Path.Combine(path, fileName);

                    // Lưu tệp ảnh mới
                    ProjectImage.SaveAs(filePath);

                    // Xóa ảnh cũ nếu có để tránh lưu trữ các tệp không cần thiết
                    if (!string.IsNullOrEmpty(existingNews.ProjectImage))
                    {
                        string oldFilePath = Path.Combine(path, existingNews.ProjectImage);
                        if (System.IO.File.Exists(oldFilePath))
                        {
                            System.IO.File.Delete(oldFilePath);
                        }
                    }

                    // Gán tên tệp mới cho thuộc tính của model
                    existingNews.ProjectImage = fileName;
                }

                // Cập nhật các thuộc tính khác của bản ghi
                existingNews.ProjectName = model.ProjectName;
                existingNews.Situation = model.Situation;
                existingNews.ProjectState = model.ProjectState;
                existingNews.TotalMoney = model.TotalMoney;
                existingNews.WayToSupport = model.WayToSupport;
                existingNews.Infor = model.Infor;
                existingNews.datebegin = DateTime.Now;
                existingNews.meta = RemoveDiacriticsAndReplaceSpaces(model.ProjectName);
                // Thêm các thuộc tính cần cập nhật khác nếu có

                // Lưu các thay đổi vào cơ sở dữ liệu
                await ojb.SaveChangesAsync();

                // Chuyển hướng về trang Index sau khi lưu thành công
                return RedirectToAction("Index");
            }

            // Trả về view với model nếu có lỗi xác thực
            return View(model);
        }

        public ActionResult EditCompleted(int id)
        {
            // Tìm mục theo id
            var news = ojb.DuAns.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> EditCompleted(DuAn model, HttpPostedFileBase ProjectImage)
        {
            if (ModelState.IsValid)
            {
                // Lấy bản ghi hiện có từ cơ sở dữ liệu
                var existingNews = await ojb.DuAns.FindAsync(model.IDduan);
                if (existingNews == null)
                {
                    return HttpNotFound();
                }

                // Kiểm tra xem có tệp ảnh mới được tải lên hay không
                if (ProjectImage != null && ProjectImage.ContentLength > 0)
                {
                    // Đường dẫn để lưu ảnh
                    string path = Server.MapPath("/Content/img/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    // Tạo tên tệp duy nhất bằng GUID để tránh trùng tên
                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(ProjectImage.FileName);
                    string filePath = Path.Combine(path, fileName);

                    // Lưu tệp ảnh mới
                    ProjectImage.SaveAs(filePath);

                    // Xóa ảnh cũ nếu có để tránh lưu trữ các tệp không cần thiết
                    if (!string.IsNullOrEmpty(existingNews.ProjectImage))
                    {
                        string oldFilePath = Path.Combine(path, existingNews.ProjectImage);
                        if (System.IO.File.Exists(oldFilePath))
                        {
                            System.IO.File.Delete(oldFilePath);
                        }
                    }

                    // Gán tên tệp mới cho thuộc tính của model
                    existingNews.ProjectImage = fileName;
                }

                // Cập nhật các thuộc tính khác của bản ghi
                existingNews.ProjectName = model.ProjectName;
                existingNews.Situation = model.Situation;
                existingNews.ProjectState = model.ProjectState;
                existingNews.TotalMoney = model.TotalMoney;
                existingNews.WayToSupport = model.WayToSupport;
                existingNews.Infor = model.Infor;
                existingNews.datebegin = DateTime.Now;
                existingNews.meta = RemoveDiacriticsAndReplaceSpaces(model.ProjectName);
                // Thêm các thuộc tính cần cập nhật khác nếu có

                // Lưu các thay đổi vào cơ sở dữ liệu
                await ojb.SaveChangesAsync();

                // Chuyển hướng về trang Index sau khi lưu thành công
                return RedirectToAction("CompletedProject");
            }

            // Trả về view với model nếu có lỗi xác thực
            return View(model);
        }

    }


}