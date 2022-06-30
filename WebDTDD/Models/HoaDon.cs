using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDTDD.Models
{
    public class HoaDon
    {

        MyDataDataContext data = new MyDataDataContext();
        public int madh { get; set; }
        public string tensp { get; set; }
        public string tenkh { get; set; }
        public DateTime ngaydat { get; set; }
        public DateTime ngaygiao { get; set; }
        public string diachi { get; set; }
        public int soluong { get; set; }
        public decimal tongtien { get; set; }

        public HoaDon(int id)
        {
            madh = id;
            DonHang dh = data.DonHangs.First(n => n.MaDH == id);
            CTDonHang ct = data.CTDonHangs.First(n => n.MaDH == id);
            tensp = ct.SanPham.TenSP;
            tenkh = ct.NguoiDung.TenUser;
            ngaydat = dh.NgayDat.Value;
            ngaygiao = dh.NgayGiao.Value;
            diachi = dh.DiaChi;
            soluong = ct.SoLuongMua.Value;
            tongtien = dh.TongTien.Value;
        }

    }

}