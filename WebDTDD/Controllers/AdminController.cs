using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using WebDTDD.Models;

namespace WebDTDD.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        MyDataDataContext db = new MyDataDataContext();
        md5 MD5 = new md5();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Managament()
        {
            var listacc = db.SanPhams.Where(p => p.TrangThai == true).ToList();
            ViewBag.tongaccount = listacc.Count;
            var listuser = db.NguoiDungs.Where(p => p.TrangThai == true).ToList();
            ViewBag.tonguser = listuser.Count;
            var listhd = db.DonHangs.ToList();
            ViewBag.tonghd = listhd.Count;
            var tongtien = db.DonHangs.Sum(m => m.TongTien).ToString();
            ViewBag.tongtien = tongtien;
            return View();
        }

        [HttpGet]
        public ActionResult CreateProduct()
        {

            return View(new SanPham());
        }

        [HttpPost]
        public ActionResult CreateProduct(FormCollection collection, SanPham s)
        {
            

            var E_tensp = collection["TenSP"];
            var E_gia = collection["GiaSP"];
            var E_manhinh = collection["ManHinh"];
            var E_vixuly = collection["ViXuLy"];
            var E_hinh1 = collection["HinhSP1"];      
            var E_slton = collection["SLTon"];
            var E_mota = collection["MoTaSP"];
            var E_bonho = collection["BoNho"];
            var E_mansx = collection["MaNSX"];

            SanPham checktendn = db.SanPhams.SingleOrDefault(n => n.TenSP == E_tensp);

         
            if (checktendn != null)
                {
                    ViewBag.thongbao = "Tên sản phẩm đã tồn tại";
                }
                else
                {
                    s.TenSP = E_tensp.ToString();
                    s.GiaSP = Convert.ToDecimal(E_gia);
                    s.ManHinh = E_manhinh.ToString();
                    s.ViXuLy = E_vixuly.ToString();
                    s.HinhSP1 = E_hinh1.ToString();                             
                    s.TrangThai = true;
                    s.MoTaSP = E_mota.ToString();
                    s.SLTon = Convert.ToInt32(E_slton);
                    s.BoNho = E_bonho.ToString();
                    s.MaNSX = Convert.ToInt32(E_mansx);
                    db.SanPhams.InsertOnSubmit(s);
                    db.SubmitChanges();
                    return RedirectToAction("ListSP");
                }
            //}
            return this.CreateProduct();
        }



        public ActionResult DetailUser(int id)
        {
            var D_user = db.NguoiDungs.Where(m => m.IdUser == id && m.TrangThai == true).First();
            return View(D_user);
        }
        public bool IsNumber(string pValue)
        {
            foreach (Char c in pValue)
            {
                if (!Char.IsDigit(c))
                    return false;
            }
            return true;
        }

        public string ProcessUpload(HttpPostedFileBase file)
        {
            if (file == null)
            {
                return "";
            }
            file.SaveAs(Server.MapPath("~/Content/img/" + file.FileName));
            return "/Content/img/" + file.FileName;
        }

        [HttpGet]
        public ActionResult EditProduct(int id)
        {
            SanPham find = db.SanPhams.FirstOrDefault(p => p.IdSP == id);
          
            return View(find);
        }
        [HttpPost]
        public ActionResult EditProduct(int id, FormCollection collection)
        {
            var s = db.SanPhams.First(m => m.IdSP == id);

            var E_tensp = collection["TenSP"];
            var E_gia = collection["GiaSP"];
            var E_manhinh = collection["ManHinh"];
            var E_vixuly = collection["ViXuLy"];
            var E_hinh1 = collection["HinhSP1"];         
            var E_slton = collection["SLTon"];
            var E_mota = collection["MoTaSP"];
            var E_bonho = collection["BoNho"];
            var E_mansx = collection["MaNSX"];

         
            s.IdSP = id;
            s.TenSP = E_tensp.ToString();
            s.GiaSP = Convert.ToDecimal(E_gia);
            s.ManHinh = E_manhinh.ToString();
            s.ViXuLy = E_vixuly.ToString();
            s.HinhSP1 = E_hinh1.ToString();     
            s.TrangThai = true;
            s.MoTaSP = E_mota.ToString();
            s.SLTon = Convert.ToInt32(E_slton);
            s.BoNho = E_bonho.ToString();
            s.MaNSX = Convert.ToInt32(E_mansx);
            //UpdateModel(s);               
            db.SanPhams.DeleteOnSubmit(s);
            db.SanPhams.InsertOnSubmit(s);
            db.SubmitChanges();
            return RedirectToAction("ListSP");
            //}
            //return this.EditProduct(id);
        }

        [HttpGet]
        public ActionResult CreateUser()
        {
            return View(new NguoiDung());
        }

        [HttpPost]
        public ActionResult CreateUser(FormCollection collection, NguoiDung us)
        {
            var TenUser = collection["TenUser"];
            var TaiKhoan = collection["TaiKhoan"];
            var MatKhau = MD5.GetMD5(collection["MatKhau"]);            
            var SDT = collection["sdt"];
            var Gmail = collection["Gmail"];
            var TrangThai = Convert.ToBoolean(collection["TrangThai"]);
            var QuyenDN = Convert.ToBoolean(collection["QuyenDN"]);
            NguoiDung checktendn = db.NguoiDungs.SingleOrDefault(n => n.TenUser == TenUser);
            if (checktendn != null)
            {
                ViewBag.thongbao = "Tên người dùng đã có";
            }
            else
            {
                us.TenUser = TenUser;
                us.TaiKhoan = TaiKhoan;
                us.MatKhau = MatKhau;
                us.SDT = SDT;
                us.Gmail = Gmail;
                us.TrangThai = true;                
                db.NguoiDungs.InsertOnSubmit(us);
                db.SubmitChanges();
                return RedirectToAction("TTUser");
            }
            return this.CreateUser();
        }

        [HttpGet]
        public ActionResult EditUser(int id)
        {
            NguoiDung find = db.NguoiDungs.FirstOrDefault(p => p.IdUser == id);

            return View(find);
        }
        [HttpPost]
        public ActionResult EditUser(int id, FormCollection collection)
        {
            var s = db.NguoiDungs.First(m => m.IdUser == id);

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
                db.SubmitChanges();
                return RedirectToAction("TTUser", "Admin");
            }
            return this.EditUser(id);
        }
        [HttpGet]
        public ActionResult DeleteUser(int? id)
        {

            var delete = db.NguoiDungs.First(p => p.IdUser == id);
            return View(delete);
        }


        [HttpPost]
        public ActionResult DeleteUser(int id, FormCollection collection)
        {
            try
            {
                var delete = db.NguoiDungs.Where(m => m.IdUser == id).First();
                delete.TrangThai = false;
                UpdateModel(delete);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("TTUser");
        }
        public ActionResult Ban()
        {
            var all_user = from tt in db.NguoiDungs where tt.TrangThai == false select tt;
            return View(all_user);
        }

        public ActionResult TTUser()
        {
            var all_user = from tt in db.NguoiDungs where tt.TrangThai == true select tt;
            return View(all_user);
        }

        [HttpGet]
        public ActionResult RestoreUser(int? id)
        {

            var restore = db.NguoiDungs.First(p => p.IdUser == id);
            return View(restore);
        }


        [HttpPost]
        public ActionResult RestoreUser(int id, FormCollection collection)
        {
            try
            {
                var restore = db.NguoiDungs.Where(m => m.IdUser == id).First();
                restore.TrangThai = true;
                UpdateModel(restore);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("Ban");
        }

        public ActionResult Bill()
        {
            var all_user = from tt in db.DonHangs select tt;
            return View(all_user);
        }

        public ActionResult DetailDH(int? id)
        {
            var listHD = db.DonHangs.Where(m => m.MaDH == id).First();
            return View(listHD);
        }

        public ActionResult Brand()
        {
            var listNSX = from tt in db.NSXes select tt;
            return View(listNSX);
        }

        [HttpGet]
        public ActionResult EditBrand(int? id)
        {
            if (id == null)
                return HttpNotFound();
            NSX find = db.NSXes.FirstOrDefault(p => p.MaNSX == id);
            if (find == null)
                return HttpNotFound();
            return View(find);
        }
        public ActionResult ListLH()
        {
            var all_user = from tt in db.LienHes select tt;
            return View(all_user);
        }

        public ActionResult ListSP()
        {
            var listSP = from tt in db.SanPhams where tt.TrangThai == true select tt;
            return View(listSP);
        }
        public ActionResult ListHD()
        {
            List<HoaDon> hd = new List<HoaDon>();
            List<DonHang> dh = db.DonHangs.Where(n => n.TrangThai == true).ToList();
            foreach (var item in dh)
            {
                HoaDon hd1 = new HoaDon(item.MaDH);
                hd.Add(hd1);
            }
            ViewBag.tongdoanhthu = TongDoanhThu(hd);
            return View(hd);
        }

        private decimal TongDoanhThu(List<HoaDon> hd)
        {
            decimal tdt = 0;
            foreach (var item in hd)
            {
                tdt = tdt + item.tongtien;
            }
            return tdt;
        }
        public ActionResult ListNews()
        {
            var listTT = from tt in db.TinTucs select tt;
            return View(listTT);
        }

        [HttpGet]
        public ActionResult DeleteProduct(int? id)
        {

            var delete = db.SanPhams.First(p => p.IdSP == id);
            return View(delete);
        }


        [HttpPost]
        public ActionResult DeleteProduct(int id, FormCollection collection)
        {
            try
            {
                var delete = db.SanPhams.Where(m => m.IdSP == id).First();
                delete.TrangThai = false;
                UpdateModel(delete);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("TTUser");
        }

        [HttpGet]
        public ActionResult CreateNews()
        {
            return View(new TinTuc());
        }

        [HttpPost]
        public ActionResult CreateNews(FormCollection collection, TinTuc s)
        {
            var E_tieude = collection["TieuDeTT"];
            var E_noidung = collection["NoiDungTT"];
            var E_hinhanh = collection["HinhTT"];
            TinTuc checktendn = db.TinTucs.SingleOrDefault(n => n.TieuDeTT == E_tieude);

            if (checktendn != null)
            {
                ViewBag.thongbao = "Bài viết đã có";
            }
            else
            {
                s.TieuDeTT = E_tieude.ToString();
                s.NoiDungTT = E_noidung.ToString();
                s.HinhTT = E_hinhanh.ToString();
                s.NgayDangTT = DateTime.Today;
                db.TinTucs.InsertOnSubmit(s);
                db.SubmitChanges();
                return RedirectToAction("ListNews");
            }
            return this.CreateNews();
        }

        [HttpGet]
        public ActionResult DeleteNews(int? id)
        {

            var delete = db.TinTucs.First(p => p.MaTT == id);
            return View(delete);
        }


        [HttpPost]
        public ActionResult DeleteNews(int id, FormCollection collection)
        {
            try
            {
                var delete = db.TinTucs.Where(m => m.MaTT == id).First();
                db.TinTucs.DeleteOnSubmit(delete);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("ListNews");
        }
        [HttpGet]
        public ActionResult DeleteLH(int? id)
        {

            var delete = db.LienHes.First(p => p.idLH == id);
            return View(delete);
        }


        [HttpPost]
        public ActionResult DeleteLH(int id, FormCollection collection)
        {
            try
            {
                var delete = db.LienHes.Where(m => m.idLH == id).First();
                db.LienHes.DeleteOnSubmit(delete);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RedirectToAction("ListLH");
        }
    }
}