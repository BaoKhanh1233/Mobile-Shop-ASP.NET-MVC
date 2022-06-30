using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDTDD.Models;


namespace WebDTDD.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        MyDataDataContext data = new MyDataDataContext();
        md5 MD5 = new md5();
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(FormCollection collection, NguoiDung us)
        {
            var TenUser = collection["TenUser"];
            var TaiKhoan = collection["TaiKhoan"];
            var MatKhau = MD5.GetMD5(collection["MatKhau"]);
            var MatKhauXacNhan = collection["MatKhauXacNhan"];
            var SDT = collection["sdt"];
            var Gmail = collection["Gmail"];
            var TrangThai = Convert.ToBoolean(collection["TrangThai"]);
            var QuyenDN = Convert.ToBoolean(collection["QuyenDN"]);
            NguoiDung checktendn = data.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == TaiKhoan);
            if (String.IsNullOrEmpty(TenUser))
            {
                ViewData["Loi1"] = "Phải nhập tên người dùng!";
            }
            else if (String.IsNullOrEmpty(TaiKhoan))
            {
                ViewData["Loi2"] = "Phải nhập tên đăng nhập!";
            }

            else if (String.IsNullOrEmpty(MatKhau))
            {
                ViewData["Loi3"] = "Phải nhập mật khẩu!";
            }
            else if (String.IsNullOrEmpty(MatKhauXacNhan))
            {
                ViewData["NhapMKXN"] = "Phải nhập mật khẩu xác nhận!";
            }

            else if (String.IsNullOrEmpty(Gmail))
            {
                ViewData["Loi4"] = "Phải nhập gmail!";
            }
            else if (String.IsNullOrEmpty(SDT))
            {
                ViewData["Loi5"] = "Phải nhập số điện thoại!";
            }
         
            else
            {
                if (checktendn != null)
                {
                    ViewBag.ThongBao = "Tên đăng nhập đã tồn tại";
                }
                else
                {
                    if (!MatKhau.Equals(MD5.GetMD5(MatKhauXacNhan)))
                    {
                        ViewData["MatKhauGiongNhau"] = "Mật khẩu và mật khẩu xác nhận phải giống nhau";
                    }
                    else
                    {
                        us.TenUser = TenUser;
                        us.TaiKhoan = TaiKhoan;
                        us.MatKhau = MatKhau;
                        us.SDT = SDT;
                        us.Gmail = Gmail;
                        us.TrangThai = true;
                        us.QuyenDN = true;
                        data.NguoiDungs.InsertOnSubmit(us);
                        data.SubmitChanges();
                        return RedirectToAction("DangNhap");
                    }
                }
               
            }
            return this.DangKy();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            var TaiKhoan = collection["TaiKhoan"];
            var MatKhau = MD5.GetMD5(collection["MatKhau"]);
            if (String.IsNullOrEmpty(TaiKhoan))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập!";
            }
            if (String.IsNullOrEmpty(MatKhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu!";
            }
            NguoiDung us = data.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == TaiKhoan && n.MatKhau == MatKhau && n.TrangThai == true);       
             if (us.QuyenDN == true)
            {
                ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                Session["TaiKhoan"] = us;
                return RedirectToAction("HomePage", "Shop");
            }
            else if (us.QuyenDN == false)
            {
                ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                Session["TaiKhoan"] = us;
                return RedirectToAction("Managament", "Admin");
            }          
            else 
            {
                ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";             
            }

            return View();
        }
        [HttpGet]
        public ActionResult DangXuat()
        {
            Session.Clear();
            return RedirectToAction("HomePage", "Shop");
        }
        // GET: User
        [HttpGet]
        public ActionResult Edit(int id)
        {
            NguoiDung find = data.NguoiDungs.FirstOrDefault(p => p.IdUser == id);
            return View(find);
        }

        [HttpPost]
        public ActionResult Edit(FormCollection collection, int id)
        {
            var s = data.NguoiDungs.First(m => m.IdUser == id);

            var tenUser = collection["TenUser"];
            var matKhau = collection["MatKhau"];
            var gmail = collection["Gmail"];
            var sdt = collection["SDT"];
            
            if (String.IsNullOrEmpty(tenUser))
            {
                ViewData["Loi1"] = "Phải nhập tên người dùng!";
            }
            else if (String.IsNullOrEmpty(matKhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu!";
            }
            else if (String.IsNullOrEmpty(gmail))
            {
                ViewData["Loi3"] = "Phải nhập gmail!";
            }
            else if (String.IsNullOrEmpty(sdt))
            {
                ViewData["Loi4"] = "Phải nhập số điện thoại!";
            }
           
            else
            {
                s.TenUser = tenUser;
                s.MatKhau = matKhau;
                s.Gmail = gmail;
                s.SDT = sdt;   
                UpdateModel(s);
                data.SubmitChanges();
                return RedirectToAction("HomePage","Shop");
            }
            return this.Edit(id);
        }
        public ActionResult Index()
        {
            return View();
        }
    }
}