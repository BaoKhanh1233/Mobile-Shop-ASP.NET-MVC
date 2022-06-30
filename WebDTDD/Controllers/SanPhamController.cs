using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDTDD.Models;

namespace WebDTDD.Controllers
{
    public class SanPhamController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        public ActionResult LocSP1(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SanPhams
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.GiaSP < 5000000
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult LocSP2(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SanPhams
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.GiaSP >= 5000000 && tt.GiaSP <=10000000
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult LocSP3(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SanPhams
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.GiaSP >= 10000000 && tt.GiaSP <= 20000000
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        public ActionResult LocSP4(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            //var acc = data.SanPhams.Where(p => p.MaNSX == 1 && p.TrangThai == true).ToList();
            var all_account = from tt in data.SanPhams
                              where tt.TrangThai == true && tt.SLTon > 0 && tt.GiaSP > 20000000
                              select tt;
            return View(all_account.ToPagedList(pageNum, pageSize));
        }
        // GET: SanPham
        public ActionResult Index()
        {
            return View();
        }
    }
}