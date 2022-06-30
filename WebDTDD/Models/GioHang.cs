using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDTDD.Models
{
    public class Giohang
    {
        MyDataDataContext data = new MyDataDataContext();
        public int idsp { get; set; }
        
        public string tensp { get; set; }
        public string bonho { get; set; }
        public decimal? gia { get; set; }
        public int sl { get; set; }
        public string hinh { get; set; }
        public decimal? thanhtien { get; set; }
        public Giohang(int id)
        {
            idsp = id;
            SanPham acc = data.SanPhams.Single(n => n.IdSP == id);
            tensp = acc.TenSP;
            bonho = acc.BoNho;
            gia = acc.GiaSP;
            hinh = acc.HinhSP1;
            sl = 1;
            thanhtien = acc.GiaSP;
            
        }
    }
}