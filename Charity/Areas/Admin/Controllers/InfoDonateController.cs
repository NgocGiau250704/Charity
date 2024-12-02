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
    public class InfoDonateController : Controller
    {
        CharityWebsiteEntities ojb = new CharityWebsiteEntities();
        public ActionResult Index()
        {
            var listDuAn = ojb.InforDonates.ToList();
            return View(listDuAn);
        }


        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> Add(InforDonate model, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {

                // Kiểm tra xem có tệp hình ảnh được tải lên không
                if (Image != null && Image.ContentLength > 0)
                {
                    // Kiểm tra và tạo thư mục lưu ảnh nếu chưa tồn tại
                    string path = Server.MapPath("/Content/img/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    // Tạo tên tệp mới với GUID để tránh trùng lặp tên
                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(Image.FileName);
                    string filePath = Path.Combine(path, fileName);


                    Image.SaveAs(filePath);


                    // Gán đường dẫn ảnh vào thuộc tính của model
                    model.Image = fileName;
                }
                model.hide = true;
                model.datebegin = DateTime.Now;
               

                // Lưu model vào cơ sở dữ liệu
                ojb.InforDonates.Add(model);
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
            var news = ojb.InforDonates.Find(id);
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
            var news = await ojb.InforDonates.FindAsync(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            // Xóa mục khỏi database
            ojb.InforDonates.Remove(news);
            await ojb.SaveChangesAsync();

            // Chuyển hướng về trang Index sau khi xóa
            return RedirectToAction("Index");
        }

        public ActionResult Detail(int id)
        {
            // Tìm mục theo id
            var news = ojb.InforDonates.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news); // Trả về view hiển thị thông tin để xác nhận xóa
        }

        public ActionResult Edit(int id)
        {
            // Tìm mục theo id
            var news = ojb.InforDonates.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> Edit(InforDonate model, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                // Lấy bản ghi hiện có từ cơ sở dữ liệu
                var existingNews = await ojb.InforDonates.FindAsync(model.id);
                if (existingNews == null)
                {
                    return HttpNotFound();
                }

                // Kiểm tra xem có tệp ảnh mới được tải lên hay không
                if (Image != null && Image.ContentLength > 0)
                {
                    // Đường dẫn để lưu ảnh
                    string path = Server.MapPath("/Content/img/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    // Tạo tên tệp duy nhất bằng GUID để tránh trùng tên
                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(Image.FileName);
                    string filePath = Path.Combine(path, fileName);

                    // Lưu tệp ảnh mới
                    Image.SaveAs(filePath);

                    // Xóa ảnh cũ nếu có để tránh lưu trữ các tệp không cần thiết
                    if (!string.IsNullOrEmpty(existingNews.Image))
                    {
                        string oldFilePath = Path.Combine(path, existingNews.Image);
                        if (System.IO.File.Exists(oldFilePath))
                        {
                            System.IO.File.Delete(oldFilePath);
                        }
                    }

                    // Gán tên tệp mới cho thuộc tính của model
                    existingNews.Image = fileName;
                }

                // Cập nhật các thuộc tính khác của bản ghi
              
                existingNews.Message = model.Message;
                existingNews.Beneficiary = model.Beneficiary;
                existingNews.Banknumber = model.Banknumber;
                existingNews.Bank = model.Bank;
                existingNews.datebegin = DateTime.Now;
                existingNews.hide = model.hide;
              
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