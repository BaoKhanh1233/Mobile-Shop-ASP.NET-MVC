using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDTDD.Models;

namespace WebDTDD.Controllers
{
    public class TimKiemController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        public JsonResult GetSearchValue(string search)
        {
            List<Timkiem> allsearch = data.SanPhams.Where(p => p.TenSP.Contains(search)).Select(p => new Timkiem
            {
                id = p.IdSP,
                name = p.TenSP

            }).ToList();
            return new JsonResult { Data = allsearch, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        // GET: Search
        [HttpPost]
        public ActionResult getTimKiem(FormCollection collection)
        {
            string sTukhoa = collection["txtTimkiem"].ToString();
            var lstSanPham = (from sp in data.SanPhams
                              where sp.TenSP.Contains(sTukhoa) && sp.SLTon > 0
                              select sp).ToList();

            if (lstSanPham != null && lstSanPham.Count() <= 0)
            {
                ViewBag.Thongbao = "Không tìm thấy sản phẩm nào!";
            }

            
            return View(lstSanPham.OrderBy(m => m.TenSP));
        }
        // GET: TimKiem
        public ActionResult Index()
        {
            return View();
        }
    }
}