using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDTDD.Models;
using WebDTDD.MoMo;

namespace WebDTDD.Controllers
{
    public class CartController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        public List<Giohang> Laygiohang()
        {
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<Giohang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult ThemGioHang(int id, string strURL)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.Find(n => n.idsp == id);
            if (sanpham == null)
            {
                sanpham = new Giohang(id);
                lstGiohang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.sl++;
                sanpham.thanhtien = sanpham.gia * sanpham.sl;
                return Redirect(strURL);
            }
        }
        
        public int TongSoLuong()
        {
            int tsl = 0;
            List<Giohang> lstGiohang = Session["GioHang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Sum(n => n.sl);
            }
            return tsl;
        }
        public int TongSoLuongSanPham()
        {
            int tsl = 0;
            List<Giohang> lstGiohang = Session["GioHang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Count;
            }
            return tsl;
        }
        public double TongTien()
        {
            double tt = 0;
            List<Giohang> lstGiohang = Session["GioHang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                tt = lstGiohang.Sum(n => Convert.ToDouble(n.gia));
            }
            return tt;
        }
        public ActionResult GioHang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return View(lstGiohang);
        }
        public ActionResult GioHangPartial()
        {

            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return PartialView();
        }
        public ActionResult XoaGioHang(int id)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.idsp == id);
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.idsp == id);
                return RedirectToAction("GioHang");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult CapnhatGioHang(int id, FormCollection collection)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.idsp == id);
            if (sanpham != null)
            {
                sanpham.sl = int.Parse(collection["txtSoLg"].ToString());
                sanpham.thanhtien = sanpham.gia * sanpham.sl;
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaTatCaGioHang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("GioHang");
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "User");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("HomePage", "Shop");
            }
            List<Giohang> lstGioHang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return View(lstGioHang);
        }
        public ActionResult DatHang(FormCollection collection)
        {
            
            DonHang dh = new DonHang();
            NguoiDung kh = (NguoiDung)Session["TaiKhoan"];
            List<Giohang> gh = Laygiohang();

            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["NgayGiao"]);
            var diachi = collection["DiaChi"];
            decimal? tong = 0;
            foreach (var item in gh)
            {
                tong = tong + item.thanhtien;
            }

            dh.NgayDat = DateTime.Now;
            dh.NgayGiao = DateTime.Parse(ngaygiao);
            dh.DiaChi = diachi;
          
            dh.TongTien = tong;
            dh.TrangThai = false;

            data.DonHangs.InsertOnSubmit(dh);
            data.SubmitChanges();
            int index = 0;
            DonHang dhlast = new DonHang();
            foreach (var item in data.DonHangs)
            {
                index = index + 1;
                if(index == data.DonHangs.Count())
                {
                    dhlast = item;
                }
            }
           
            foreach (var item in gh)
            {
                CTDonHang ctdh = new CTDonHang();
                ctdh.MaDH = dhlast.MaDH;
                ctdh.IdSP = item.idsp;
                ctdh.SoLuongMua = item.sl;
                ctdh.Gia = (decimal)item.gia;
                ctdh.IdUser = kh.IdUser;
                data.SubmitChanges();
                data.CTDonHangs.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            
            return RedirectToAction("PaymentMoMo", "Cart");

        }
        public ActionResult XacnhanDonhang()
        {
            return View();
        }
     
        public ActionResult PaymentMoMo()
        {
            var lstGioHang = Laygiohang();
            
            //request params need to request to MoMo system
            string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
            string partnerCode = "MOMOKBOU20220616";
            string accessKey = "4YMVqU96ZIip1V5O";
            string serectkey = "JBV76vvQBZJ4SuVz3dtHtGNA1L6p4iT3";
            string orderInfo = "Thanh toán điện thoại";
            string returnUrl = "https://localhost:44376/Cart/ConfirmPaymentClient";
            string notifyurl = "http://ba1adf48beba.ngrok.io/Home/SavePayment"; //lưu ý: notifyurl không được sử dụng localhost, có thể sử dụng ngrok để public localhost trong quá trình test

            string amount = lstGioHang.Sum(p => p.thanhtien).ToString();
            
            string orderid = DateTime.Now.Ticks.ToString();
            string requestId = DateTime.Now.Ticks.ToString();
            string extraData = "";

            //Before sign HMAC SHA256 signature
            string rawHash = "partnerCode=" +
                partnerCode + "&accessKey=" +
                accessKey + "&requestId=" +
                requestId + "&amount=" +
                amount + "&orderId=" +
                orderid + "&orderInfo=" +
                orderInfo + "&returnUrl=" +
                returnUrl + "&notifyUrl=" +
                notifyurl + "&extraData=" +
                extraData;

            MoMoSecurity crypto = new MoMoSecurity();
            //sign signature SHA256
            string signature = crypto.signSHA256(rawHash, serectkey);

            //build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }

            };

            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());

            JObject jmessage = JObject.Parse(responseFromMomo);
            Session["Giohang"] = null;
            return Redirect(jmessage.GetValue("payUrl").ToString());

        }


        //Khi thanh toán xong ở cổng thanh toán Momo, Momo sẽ trả về một số thông tin, trong đó có errorCode để check thông tin thanh toán
        //errorCode = 0 : thanh toán thành công (Request.QueryString["errorCode"])
        //Tham khảo bảng mã lỗi tại: https://developers.momo.vn/#/docs/aio/?id=b%e1%ba%a3ng-m%c3%a3-l%e1%bb%97i

        public ActionResult ReturnUrl()
        {
            string param = Request.QueryString.ToString().Substring(0, Request.QueryString.ToString().IndexOf("signature") - 1);
            param = Server.UrlDecode(param);
            MoMoSecurity crypto = new MoMoSecurity();
            string secretkey = ConfigurationManager.AppSettings["serectkey"].ToString();
            string signature = crypto.signSHA256(param, secretkey);
            if (signature != Request["signature"].ToString())
            {
                ViewBag.message = "Thông tin request không hợp lệ";
            }
            if (!Request.QueryString["errorCode"].Equals("0"))
            {
                ViewBag.message = "Thanh toán thành công";
                
            }
            else
            {
                ViewBag.message = "Thanh toán thành công";
                
            }
            return View();
        }


        public ActionResult ConfirmPaymentClient()
        {
            //hiển thị thông báo cho người dùng
            int index = 0;
            DonHang dhlast = new DonHang();
            foreach (var item in data.DonHangs)
            {
                index = index + 1;
                if (index == data.DonHangs.Count())
                {
                    dhlast = item;
                }
            }
            dhlast.TrangThai = true;
            data.DonHangs.DeleteOnSubmit(dhlast);
            data.DonHangs.InsertOnSubmit(dhlast);
            data.SubmitChanges();
            return RedirectToAction("XacnhanDonhang", "Cart");
        }

        [HttpPost]
        public void SavePayment()
        {
            //cập nhật dữ liệu vào db
        }
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }
    }
}