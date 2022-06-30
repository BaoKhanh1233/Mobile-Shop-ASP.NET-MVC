using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDTDD.Models;

namespace WebDTDD.Controllers
{
    public class ShopController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        // GET: Shop
        public ActionResult HomePage()
        {
           

            var all_account = from tt in data.SanPhams 
                              where tt.TrangThai == true 
                              select tt;
            return View(all_account);
        }
        public ActionResult ProductDetail(int id)
        {
            SanPham D_phone = data.SanPhams.Where(m => m.IdSP == id).First();           
            return View(D_phone);
        }
        public ActionResult Apple(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SanPhams
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 1
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));  
        }
        public ActionResult SamSung(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SanPhams
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 2
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Xiaomi(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SanPhams
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 3
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Oppo(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SanPhams
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 4
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Vivo(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SanPhams
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.MaNSX == 5
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult TinTuc()
        {           
            var all_account = from tt in data.TinTucs                              
                              select tt;
            return View(all_account);
        }
    }
}