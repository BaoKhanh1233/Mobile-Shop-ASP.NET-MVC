using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDTDD.Models;
using WebDTDD.MoMo;

namespace WebDTDD.Controllers
{
    public class HomeController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Contact([Bind(Include = "idLH,HoTen,Gmail,YeuCau,NgayLH")] LienHe lienhe)
        {
            if (ModelState.IsValid)
            {
                lienhe.NgayLH = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                data.LienHes.InsertOnSubmit(lienhe);
                data.SubmitChanges();
                return RedirectToAction("Success", "Home");
            }
            return View(lienhe);
        }
        public ActionResult Success()
        {
            return View();
        }
    
        public ActionResult GioiThieu()
        {
            return View();
        }
      
    }
}