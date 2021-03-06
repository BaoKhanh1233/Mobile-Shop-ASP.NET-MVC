USE [WebsiteDT]
GO
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 25/06/2022 8:54:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonHang](
	[IdUser] [int] NOT NULL,
	[IdSP] [int] NOT NULL,
	[MaDH] [int] NOT NULL,
	[SoLuongMua] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC,
	[IdSP] ASC,
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 25/06/2022 8:54:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[IdDanhGia] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](250) NULL,
	[Sao] [tinyint] NULL,
	[NgayDanhGia] [datetime] NULL,
	[IdUser] [int] NOT NULL,
	[IdSP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 25/06/2022 8:54:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[DiaChi] [nvarchar](200) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 25/06/2022 8:54:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[idLH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Gmail] [varchar](120) NULL,
	[YeuCau] [nvarchar](150) NULL,
	[NgayLH] [datetime] NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[idLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 25/06/2022 8:54:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[TenUser] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](20) NULL,
	[MatKhau] [varchar](130) NULL,
	[Gmail] [varchar](120) NULL,
	[SDT] [char](10) NULL,
	[TrangThai] [bit] NULL,
	[QuyenDN] [bit] NULL,
 CONSTRAINT [PK__NguoiDun__B7C92638A6292971] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NSX]    Script Date: 25/06/2022 8:54:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NSX](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](20) NULL,
	[HinhNSX] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 25/06/2022 8:54:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[IdSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[GiaSP] [decimal](18, 0) NULL,
	[ManHinh] [nvarchar](50) NULL,
	[ViXuLy] [varchar](50) NULL,
	[HinhSP1] [char](50) NULL,
	[SLTon] [int] NULL,
	[MoTaSP] [nvarchar](max) NULL,
	[BoNho] [nvarchar](10) NULL,
	[TrangThai] [bit] NULL,
	[MaNSX] [int] NOT NULL,
 CONSTRAINT [PK__SanPham__B77012876DD868A8] PRIMARY KEY CLUSTERED 
(
	[IdSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 25/06/2022 8:54:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[TieuDeTT] [nvarchar](250) NULL,
	[NoiDungTT] [nvarchar](max) NULL,
	[HinhTT] [char](50) NULL,
	[NgayDangTT] [date] NULL,
 CONSTRAINT [PK__TinTuc__27250079FC88E0A8] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CTDonHang] ([IdUser], [IdSP], [MaDH], [SoLuongMua], [Gia]) VALUES (15, 14, 3039, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([IdUser], [IdSP], [MaDH], [SoLuongMua], [Gia]) VALUES (15, 41, 3040, 1, CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([IdUser], [IdSP], [MaDH], [SoLuongMua], [Gia]) VALUES (15, 45, 3041, 1, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([IdUser], [IdSP], [MaDH], [SoLuongMua], [Gia]) VALUES (16, 8, 3042, 1, CAST(3200000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([IdUser], [IdSP], [MaDH], [SoLuongMua], [Gia]) VALUES (16, 14, 3043, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([IdUser], [IdSP], [MaDH], [SoLuongMua], [Gia]) VALUES (16, 45, 3044, 1, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([IdUser], [IdSP], [MaDH], [SoLuongMua], [Gia]) VALUES (18, 15, 3046, 1, CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([IdUser], [IdSP], [MaDH], [SoLuongMua], [Gia]) VALUES (18, 41, 3045, 1, CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([IdUser], [IdSP], [MaDH], [SoLuongMua], [Gia]) VALUES (18, 46, 3047, 1, CAST(3000000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [NgayGiao], [DiaChi], [TongTien], [TrangThai]) VALUES (3039, CAST(N'2022-06-25T13:03:45.697' AS DateTime), CAST(N'2022-06-27T00:00:00.000' AS DateTime), N'Tiền Giang', CAST(2500000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [NgayGiao], [DiaChi], [TongTien], [TrangThai]) VALUES (3040, CAST(N'2022-06-25T13:09:58.060' AS DateTime), CAST(N'2022-06-30T00:00:00.000' AS DateTime), N'HaNoi', CAST(3000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [NgayGiao], [DiaChi], [TongTien], [TrangThai]) VALUES (3041, CAST(N'2022-06-25T13:11:42.033' AS DateTime), CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'Huế', CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [NgayGiao], [DiaChi], [TongTien], [TrangThai]) VALUES (3042, CAST(N'2022-06-25T13:12:58.683' AS DateTime), CAST(N'2022-07-02T00:00:00.000' AS DateTime), N'Hồ Chí Minh', CAST(3200000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [NgayGiao], [DiaChi], [TongTien], [TrangThai]) VALUES (3043, CAST(N'2022-06-25T13:14:43.120' AS DateTime), CAST(N'2022-06-28T00:00:00.000' AS DateTime), N'Đà Nẵng', CAST(2500000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [NgayGiao], [DiaChi], [TongTien], [TrangThai]) VALUES (3044, CAST(N'2022-06-25T13:15:22.647' AS DateTime), CAST(N'2022-06-29T00:00:00.000' AS DateTime), N'Hà Giang', CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [NgayGiao], [DiaChi], [TongTien], [TrangThai]) VALUES (3045, CAST(N'2022-06-25T13:17:05.220' AS DateTime), CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'Long An', CAST(3000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [NgayGiao], [DiaChi], [TongTien], [TrangThai]) VALUES (3046, CAST(N'2022-06-25T13:17:47.910' AS DateTime), CAST(N'2022-06-28T00:00:00.000' AS DateTime), N'Kiên Giang', CAST(4000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [NgayGiao], [DiaChi], [TongTien], [TrangThai]) VALUES (3047, CAST(N'2022-06-25T13:18:30.647' AS DateTime), CAST(N'2022-06-29T00:00:00.000' AS DateTime), N'Phú Quốc', CAST(3000000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([idLH], [HoTen], [Gmail], [YeuCau], [NgayLH]) VALUES (1, N'Nguyễn Thị Lan Anh', N'abc@gmail.com', N'Tốt', CAST(N'2022-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[LienHe] ([idLH], [HoTen], [Gmail], [YeuCau], [NgayLH]) VALUES (2, N'Nguyễn Thị Đào', N'tranphuoc17012001@gmail.com', N'ABC', CAST(N'2022-06-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[LienHe] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (8, N'Hoai', N'hoai', N'E10ADC3949BA59ABBE56E057F20F883E', N'hoai@gmail.com', N'0789336131', 1, 1)
INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (9, N'Khánh', N'khanh', N'E10ADC3949BA59ABBE56E057F20F883E', N'khanh@gmail.com', N'0799456133', 1, 1)
INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (11, N'Phương', N'phuong', N'E10ADC3949BA59ABBE56E057F20F883E', N'phuong@gmail.com', N'0229456134', 1, 1)
INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (12, N'Hoài', N'hoai', N'E10ADC3949BA59ABBE56E057F20F883E', N'hoai1@gmail.com', N'0785558802', 1, 1)
INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (13, N'Võ', N'vo', N'E10ADC3949BA59ABBE56E057F20F883E', N'vo@gmail.com', N'0789451130', 1, 1)
INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (14, N'Thái', N'thai', N'E10ADC3949BA59ABBE56E057F20F883E', N'thai1@gmail.com', N'0789422237', 1, 1)
INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (15, N'Trọng Phước', N'phuoc1', N'E10ADC3949BA59ABBE56E057F20F883E', N'trongphuoc@gmail.com', N'0989456113', 1, 1)
INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (16, N'Thanh Phước', N'phuoc2', N'25F9E794323B453885F5181F1B624D0B', N'thanhphuoc@gmail.com', N'0799922220', 1, 1)
INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (18, N'Bảo Khánh', N'khanh1', N'25F9E794323B453885F5181F1B624D0B', N'bkhanh1@gmail.com', N'0784126896', 1, 1)
INSERT [dbo].[NguoiDung] ([IdUser], [TenUser], [TaiKhoan], [MatKhau], [Gmail], [SDT], [TrangThai], [QuyenDN]) VALUES (19, N'Admin', N'admin', N'202CB962AC59075B964B07152D234B70', N'admin1@gmail.com', N'0981082260', 1, 0)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[NSX] ON 

INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [HinhNSX]) VALUES (1, N'Apple', NULL)
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [HinhNSX]) VALUES (2, N'SamSung', NULL)
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [HinhNSX]) VALUES (3, N'Xiaomi', NULL)
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [HinhNSX]) VALUES (4, N'Oppo', NULL)
INSERT [dbo].[NSX] ([MaNSX], [TenNSX], [HinhNSX]) VALUES (5, N'ViVo', NULL)
SET IDENTITY_INSERT [dbo].[NSX] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (1, N'Iphone 13 pro', CAST(18000000 AS Decimal(18, 0)), N'OLED6.1"Super Retina XD', N'Apple A15 ', N'/Content/img/Ip13-1.jpg                           ', 100, N'Một trong những tuyệt tác của Apple đáng nhớ nhất năm 2021 chắc chắn không thể thiếu cái tên iPhone 13 Pro. Sang chảnh về thiết kế, vượt trội về hiệu năng, quay phim chuyên nghiệp, pin "trâu", iPhone 13 Pro hứa hẹn sẽ mang đến những khoảnh khắc đầy thú vị cho bạn mỗi ngày.', N'128 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (4, N'Iphone 12 mini', CAST(16000000 AS Decimal(18, 0)), N'OLED6.1"Super Retina XDR', N'Apple A14 Bionic', N'/Content/img/Ip12 mini-1.jpg                      ', 100, N'Điện thoại iPhone 12 mini 64 GB tuy là phiên bản thấp nhất trong bộ 4 iPhone 12 series, nhưng vẫn sở hữu những ưu điểm vượt trội về kích thước nhỏ gọn, tiện lợi, hiệu năng đỉnh cao, tính năng sạc nhanh cùng bộ camera chất lượng cao.', N'64 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (5, N'Iphone 11 pro MAX', CAST(14000000 AS Decimal(18, 0)), N'OLED6.5"Super Retina XDR', N'Apple A13 Bionic', N'/Content/img/Ip11 pro MAX-1.jpg                   ', 100, N'Trong năm 2019 thì chiếc smartphone được nhiều người mong muốn sở hữu trên tay và sử dụng nhất không ai khác chính là iPhone 11 Pro Max 64GB tới từ nhà Apple.', N'64 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (6, N'Iphone X', CAST(10000000 AS Decimal(18, 0)), N'OLED5.8"Super Retina', N'Apple A11 Bionic', N'/Content/img/IpX-1.jpg                            ', 100, N'iPhone X 64 GB là cụm từ được rất nhiều người mong chờ muốn biết và tìm kiếm trên Google bởi đây là chiếc điện thoại mà Apple kỉ niệm 10 năm iPhone đầu tiên được bán ra.', N'64 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (7, N'Samsung Galaxy M51', CAST(6300000 AS Decimal(18, 0)), N'Super AMOLED Plus6.7"Full HD+', N'Snapdragon 730', N'/Content/img/SS Galaxy M51-1.jpg                  ', 100, N'AGalaxy M51 thuộc thế hệ Galaxy M đến từ Samsung và được nằm trong phân khúc giá tầm trung. Máy được nâng cấp và cải tiến với camera góc siêu rộng, dung lượng pin siêu khủng cùng vẻ ngoài sang trọng và thời thượng.', N'128 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (8, N'Samsung Galaxy AO3s', CAST(3200000 AS Decimal(18, 0)), N'PLS LCD6.5"HD+'', N''MediaTek MT6765', N'MediaTek MT6765', N'/Content/img/SS Galaxy AO3s-1.jpg                 ', 100, N'Nhằm đem đến cho người dùng thêm sự lựa chọn trong phân khúc, Samsung đã cho ra mắt thêm một chiếc điện thoại giá rẻ với tên gọi Galaxy A03s. So với người tiền nhiệm Galaxy A02s, thiết bị sẽ có một số nâng cấp mới, đây hứa hẹn sẽ là sản phẩm đáng để bạn trải nghiệm.', N'64 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (9, N'Samsung Galaxy Z Fold3 5G', CAST(22000000 AS Decimal(18, 0)), N'Dynamic AMOLED 2XChính 7.6 & Phụ 6.2"Full HD+', N'Snapdragon 888', N'/Content/img/SS Galaxy Z Fold3 5G-1.jpg           ', 100, N'Galaxy Z Fold3 5G, chiếc điện thoại được nâng cấp toàn diện về nhiều mặt, đặc biệt đây là điện thoại màn hình gập đầu tiên trên thế giới có camera ẩn (08/2021). Sản phẩm sẽ là một “cú hit” của Samsung góp phần mang đến những trải nghiệm mới cho người dùng.', N'256 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (10, N'Samsung Galaxy M53', CAST(9000000 AS Decimal(18, 0)), N'Super AMOLED Plus6.7"Full HD+', N'MediaTek Dimensity 900 5G', N'/Content/img/SS Galaxy M53-1.jpg                  ', 100, N'Có lẽ 2022 là một năm bùng nổ của nhà Samsung, khi hãng liên tục trình làng nhiều sản phẩm có cấu hình mạnh mẽ cùng một mức giá bán hợp lý trên thị trường smartphone tầm trung và giá rẻ, tiêu biểu trong số đó có Samsung Galaxy M53 được xem là cái tên được cộng đồng người dùng tích cực quan tâm và săn đón kể cả khi chưa ra mắt.', N'256 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (11, N'Xiaomi 11T Pro 5G', CAST(12000000 AS Decimal(18, 0)), N'AMOLED6.67"Full HD+', N'Snapdragon 888', N'/Content/img/X11T pro-1.jpeg                      ', 100, N'Xiaomi 11T Pro 5G 8GB sử dụng con chip Snapdragon 888 mạnh mẽ, camera chính 108 MP, hỗ trợ sạc nhanh 120 W, màn hình rộng với tốc độ làm tươi lên đến 120 Hz, tận hưởng trải nghiệm tuyệt vời trong từng khoảnh khắc.', N'256 GB', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (12, N'Xiaomi 12', CAST(15000000 AS Decimal(18, 0)), N'AMOLED6.28"Full HD+', N'Snapdragon 8 Gen 1 8 nhân', N'/Content/img/X12-1.jpg                            ', 100, N'Xiaomi đang dần khẳng định chỗ đứng của mình trong phân khúc điện thoại flagship bằng việc ra mắt Xiaomi 12 với bộ thông số ấn tượng, máy có một thiết kế gọn gàng, hiệu năng mạnh mẽ, màn hình hiển thị chi tiết cùng khả năng chụp ảnh sắc nét nhờ trang bị ống kính đến từ Sony.', N'256 GB', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (13, N'Xiaomi Redmi Note 10 Pro', CAST(1200000 AS Decimal(18, 0)), N'AMOLED6.67"Full HD+', N'Snapdragon 732G', N'/Content/img/X10 pro-1.jpg                        ', 100, N'Kế thừa và nâng cấp từ thế hệ trước, Xiaomi đã cho ra mắt điện thoại Xiaomi Redmi Note 10 Pro (8GB/128GB) sở hữu một thiết kế cao cấp, sang trọng bên cạnh cấu hình vô cùng mạnh mẽ, hứa hẹn mang đến sự cạnh tranh lớn trong phân khúc smartphone tầm trung.', N'128 GB', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (14, N'Xiaomi Redmi 9A', CAST(1700000 AS Decimal(18, 0)), N'IPS LCD6.53"HD+', N'MediaTek Helio G25', N'/Content/img/X9A-1.jpg                            ', 100, N'Điện thoại Redmi 9A là chiếc smartphone đến từ Xiaomi hướng tới nhóm khách hàng đang tìm kiếm cho mình một sản phẩm với cấu hình tốt giá thành phải chăng, cũng như được trang bị đầy đủ các tính năng ấn tượng.', N'32 GB', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (15, N'OPPO A16', CAST(4000000 AS Decimal(18, 0)), N'IPS LCD6.52"HD+', N' MediaTek Helio G35', N'/Content/img/OP A16-1.jpg                         ', 100, N'OPPO A16 - sản phẩm giá rẻ đến từ nhà OPPO, đây là một chiếc điện thoại cân bằng ở mọi khía cạnh trong tầm giá, máy có thiết kế đẹp mắt, sử dụng CPU gaming đến từ MediaTek cùng viên pin siêu trâu.', N'32 GB', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (16, N'OPPO A95', CAST(5500000 AS Decimal(18, 0)), N'AMOLED6.43"Full HD+', N'Snapdragon 662', N'/Content/img/OP A95-1.jpg                         ', 100, N'Bên cạnh phiên bản 5G, OPPO còn bổ sung phiên bản OPPO A95 4G với giá thành phải chăng tập trung vào thiết kế năng động, sạc nhanh và hiệu năng đa nhiệm ấn tượng sẽ giúp cho cuộc sống của bạn thêm phần hấp dẫn, ngập tràn niềm vui.', N'128 GB', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (17, N'OPPO Reno5 5G', CAST(8500000 AS Decimal(18, 0)), N'AMOLED6.43"Full HD+', N' Snapdragon 765G', N'/Content/img/OP Reno5-1.jpg                       ', 100, N'OPPO đã trình làng OPPO Reno5 5G phiên bản kết nối 5G internet siêu nhanh ra thị trường. Chiếc điện thoại với hàng loạt các tính năng nổi bật cùng vẻ ngoài thời thượng giúp tôn lên vẻ sang trọng cho người sở hữu.', N'128 GB', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (18, N'OPPO Find X5 Pro', CAST(15000000 AS Decimal(18, 0)), N'AMOLED6.7"Quad HD+ (2K+)', N'Snapdragon 8 Gen 1 8 nhân', N'/Content/img/OP Find X5-1.jpg                     ', 100, N'OPPO Find X5 Pro 5G có lẽ là cái tên sáng giá được xướng tên trong danh sách điện thoại có thiết kế ấn tượng trong năm 2022, khi máy được hãng cho ra mắt với một diện mạo độc lạ chưa từng có, cùng với đó là những nâng cấp về chất lượng ở camera nhờ sự hợp tác với nhà sản xuất máy ảnh Hasselblad. ', N'256 GB', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (22, N'Iphone 14 mini', CAST(21000000 AS Decimal(18, 0)), N'Super Retina XDR OLED', N'Apple A14 Bionic (5 nm)', N'/Content/img/Ip14 mini-1.jpg                      ', 100, N'Một trong những tuyệt tác của Apple đáng nhớ nhất năm 2022 chắc chắn không thể thiếu cái tên iPhone 14. Sang chảnh về thiết kế, vượt trội về hiệu năng, quay phim chuyên nghiệp, pin "trâu", iPhone 14  hứa hẹn sẽ mang đến những khoảnh khắc đầy thú vị cho bạn mỗi ngày.', N'256 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (24, N'Iphone 4', CAST(3000000 AS Decimal(18, 0)), N'LED-backlit IPS LCD3.5"DVGA', N'IMG PowerVR SGX535', N'/Content/img/Ip4-4.jpg                            ', 100, N'Kể từ khi ra đời, iPhone dù thế hệ nào luôn được coi là tiêu chuẩn khi nói smartphone và là tiêu chuẩn để các hãng điện thoại khác cải thiện các sản phẩm của mình. Nếu như iPhone ra đời đã tạo nên định nghĩa của việc trải nghiệm smartphone thì iPhone 4 ra đời đã tạo nên định nghĩa mới cho đẳng cấp trong thiết kế của smartphone.', N'8 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (26, N'Iphone 5', CAST(4000000 AS Decimal(18, 0)), N'LED-backlit IPS LCD4"DVGA', N'
Apple A6 2 nhân', N'/Content/img/Ip5-1.jpg                            ', 100, N'Sau bao tháng ngày mong chờ, cả thế giới Công nghệ đã được đón nhận sự ra đời của siêu phẩm điện thoại thông minh iPhone 5, một trong những chiếc điện thoại được mong mỏi nhất năm 2012. Với những cải tiến mạnh mẽ cả về mặt thiết kế lẫn phần cứng, nên ngay từ khi lên kệ, iPhone 5 liên tục cháy hàng. iPhone 5 hứa hẹn sẽ tiếp tục khẳng định vị trí dẫn đầu trên thị trường Smartphone hiện nay.', N'16 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (27, N'Iphone 6', CAST(5000000 AS Decimal(18, 0)), N'LED-backlit IPS LCD4.7"Retina HD', N'Apple A8 2 nhân', N'/Content/img/Ip6-1.jpg                            ', 100, N'iPhone 6 là một trong những smartphone được yêu thích nhất của Apple. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot".', N'32 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (28, N'Iphone 7', CAST(7000000 AS Decimal(18, 0)), N'LED-backlit IPS LCD4.7"Retina HD', N'Apple A10 Fusion', N'/Content/img/Ip7-1.jpg                            ', 100, N'iPhone 7 là chiếc smartphone có thiết kế kim loại nguyên khối cuối cùng của Apple, nhưng đồng thời lại sở hữu “hàng tá” tính năng mới xuất hiện lần đầu như: nút home cảm ứng lực, khả năng kháng bụi nước, âm thanh stereo 2 kênh. Và đặc biệt, hiệu năng từ con chip A10 Fusion vẫn tỏ ra rất ổn định ở thời điểm hiện tại.', N'128 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (29, N'Iphone 8', CAST(8000000 AS Decimal(18, 0)), N'LED-backlit IPS LCD4.7"Retina HD', N'Apple A11 Bionic', N'/Content/img/Ip8-1.jpg                            ', 100, N'iPhone 8 64GB nổi bật với điểm nhấn mặt lưng kính và mặt trước giữ nguyên thiết kế như iPhone 7, cùng với đó là hàng loạt công nghệ đáng mong đợi như sạc nhanh, không dây hay hỗ trợ thực tế ảo AR.', N'64 GB', 1, 1)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (30, N'Samsung Galaxy A33 5G 6GB', CAST(7000000 AS Decimal(18, 0)), N'Super AMOLED6.4"Full HD+', N'Exynos 1280 8 nhân', N'/Content/img/SS Galaxy A33-1.jpg                  ', 100, N'Samsung Galaxy A33 5G 6GB ra mắt vào ngày 17/03, được xem là bản cập nhật khá lớn so với thế hệ tiền nhiệm Galaxy A32 về thiết kế đến thông số kỹ thuật bên trong, nhằm mang đến vẻ ngoài đẹp mắt cũng như cạnh tranh trực tiếp ở phần hiệu năng đối với các đối thủ cùng phân khúc giá.', N'128 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (31, N'Samsung Galaxy Note 20', CAST(15000000 AS Decimal(18, 0)), N'Super AMOLED Plus6.7"Full HD+', N'Exynos 990', N'/Content/img/SS Galaxy 20-1.jpg                   ', 100, N'Tháng 8/2020, smartphone Galaxy Note 20 chính thức được lên kệ, với thiết kế camera trước nốt ruồi quen thuộc, cụm camera hình chữ nhật mới lạ cùng với vi xử lý Exynos 990 cao cấp của chính điện thoại Samsung chắc hẳn sẽ mang lại một trải nghiệm thú vị cùng hiệu năng mạnh mẽ.', N'256 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (33, N'Samsung Galaxy Z Flip3 5G ', CAST(21000000 AS Decimal(18, 0)), N'Dynamic AMOLED 2XChính 6.7" & Phụ 1.9"Full HD+', N'Snapdragon 888', N'/Content/img/SS Galaxy Z Flip3-2.jpg              ', 100, N'Trong sự kiện Galaxy Unpacked hồi 11/8, Samsung đã chính thức trình làng mẫu điện thoại màn hình gập thế hệ mới mang tên Galaxy Z Flip3 5G 128GB. Đây là một siêu phẩm với màn hình gập dạng vỏ sò cùng nhiều điểm cải tiến và thông số ấn tượng, sản phẩm chắc chắn sẽ thu hút được rất nhiều sự quan tâm của người dùng, đặc biệt là phái nữ.', N'128 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (34, N'Samsung Galaxy S22 5G', CAST(17000000 AS Decimal(18, 0)), N'Dynamic AMOLED 2X6.1"Full HD+', N'Snapdragon 8 Gen 1 8 nhân', N'/Content/img/SS Galaxy S22-1.jpg                  ', 100, N'Samsung Galaxy S22 ra mắt với diện mạo vô cùng tinh tế và trẻ trung, mang trong mình thiết kế phẳng theo xu hướng thịnh hành, màn hình 120 Hz mượt mà, cụm camera AI 50 MP và bộ xử lý đến từ Qualcomm.', N'128 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (35, N'Samsung Galaxy S9', CAST(5500000 AS Decimal(18, 0)), N'Super AMOLED5.8"Quad HD+ (2K+)', N'Exynos 9810', N'/Content/img/SS Galaxy S9-1.jpg                   ', 100, N'Siêu phẩm Samsung Galaxy S9 chính thức ra mắt mang theo hàng loạt cải tiến, tính năng cao cấp như camera thay đổi khẩu độ, quay phim siêu chậm 960 fps, AR Emoji... nhanh chóng gây sốt làng công nghệ.', N'64 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (36, N'Samsung Galaxy J7 Prime', CAST(7000000 AS Decimal(18, 0)), N'PLS TFT LCD5.5"Full HD', N'Exynos 7870', N'/Content/img/SS Galaxy J7-1.jpg                   ', 100, N'Galaxy J7 Prime xứng đáng là cái tên hàng đầu trong danh sách chọn smartphone phổ thông của giới trẻ khi nhận được nhiều đánh giá tích cực về thiết kế, thời lượng pin lâu dài và camera chụp hình chất lượng tốt.', N'32 GB', 1, 2)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (37, N'OPPO Reno7', CAST(10000000 AS Decimal(18, 0)), N'AMOLED6.43"Full HD+', N'Snapdragon 695 5G 8 nhân', N'/Content/img/OP Reno7 Z-1.jpg                     ', 100, N'OPPO đã trình làng mẫu Reno7 Z 5G với thiết kế OPPO Glow độc quyền, camera mang hiệu ứng như máy DSLR chuyên nghiệp cùng viền sáng kép, máy có một cấu hình mạnh mẽ và đạt chứng nhận xếp hạng A về độ mượt.', N'128 GB', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (40, N'OPPO A76', CAST(6000000 AS Decimal(18, 0)), N'IPS LCD6.56"HD+', N'Snapdragon 680 8 nhân', N'/Content/img/OP A76-1.jpg                         ', 100, N'OPPO A76 4G ra mắt với thiết kế trẻ trung, hiệu năng ổn định, màn hình 90 Hz mượt mà cùng viên pin trâu cho thời gian sử dụng lâu dài phù hợp cho mọi đối tượng người dùng.', N'128 GB', 1, 4)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (41, N'Xiaomi Redmi 9C', CAST(3000000 AS Decimal(18, 0)), N'IPS LCD6.53"HD+', N'MediaTek Helio G35', N'/Content/img/X Redmi 9C-1.jpg                     ', 100, N'Điện thoại Xiaomi Redmi 9C (3GB/64GB), smartphone nổi bật trong phân khúc điện thoại giá rẻ với thiết kế tinh tế sang trọng, hiệu năng mạnh mẽ Helio G35 mới, viên pin dung lượng khủng, cùng bộ 3 AI camera bắt trọn mọi khoảnh khắc.', N'64 GB', 1, 3)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (42, N'Vivo Y55', CAST(5000000 AS Decimal(18, 0)), N'AMOLED6.44"Full HD+', N'Snapdragon 680 8 nhân', N'/Content/img/V Y55-1.jpg                          ', 100, N'Vivo Y55 là một cái tên sáng giá dành cho những ai đang muốn chọn mua một chiếc điện thoại phục vụ việc chơi game nhờ cấu hình ổn định trên mức giá phải chăng, kèm với đó là khả năng chụp ảnh sắc nét hỗ trợ bạn trong các công việc nhiếp ảnh cực kỳ dễ dàng.', N'128 GB', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (43, N'Vivo V21 5G', CAST(6000000 AS Decimal(18, 0)), N'AMOLED6.44"Full HD+', N'MediaTek Dimensity 800U 5G', N'/Content/img/V V21-1.jpg                          ', 100, N'Chụp selfie bùng nổ trong đêm, thiết kế mới hiện đại đón đầu xu hướng, cùng với đó là tốc độ kết nối mạng 5G hàng đầu, tất cả những tính năng ấn tượng này đều có trong Vivo V21 5G mẫu điện thoại cận cao cấp đến từ Vivo.', N'128 GB', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (44, N'Vivo X80', CAST(15000000 AS Decimal(18, 0)), N'AMOLED 6.78" Full HD+', N'MediaTek Dimensity 9000 8 nhân', N'/Content/img/V X80-1.jpg                          ', 100, N'Là một chiếc flagship hàng đầu trong ngành của Vivo dành cho năm 2022, Vivo X80 mang những thông số ấn tượng như màn hình AMOLED 120 Hz chất lượng, chạy vi xử lý Dimensity 9000 cao cấp đến từ MediaTek và khả năng chụp ảnh sắc nét nhờ cảm biến máy ảnh Sony.', N'256 GB', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (45, N'Vivo Y01', CAST(2000000 AS Decimal(18, 0)), N'IPS LCD6.51"HD+', N'MediaTek Helio P35', N'/Content/img/V Y01-1.jpg                          ', 100, N'Vivo Y01 được trình làng với một bộ thông số kỹ thuật ấn tượng trong tầm giá, sở hữu những ưu điểm như: Màn hình kích thước lớn, hiệu năng ổn định và thời gian sử dụng lâu dài, được xem là thiết bị phù hợp với những bạn học sinh - sinh viên cho các công việc học tập hay giải trí nhẹ nhàng sau những phút giây căng thẳng.', N'32 GB', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (46, N'Vivo Y53s', CAST(3000000 AS Decimal(18, 0)), N'IPS LCD6.58"Full HD+', N'MediaTek Helio G80', N'/Content/img/V Y53-1.jpg                          ', 100, N'Vivo mang đến niềm vui cho mọi người tin dùng khi hãng chính thức tung ra chiếc điện thoại Vivo Y53s với những tính năng tiên tiến đi cùng hiệu năng mạnh mẽ. Đặc biệt, smartphone lại còn sở hữu mức giá hấp dẫn trong phân khúc tầm trung đầy hứa hẹn.', N'128 GB', 1, 5)
INSERT [dbo].[SanPham] ([IdSP], [TenSP], [GiaSP], [ManHinh], [ViXuLy], [HinhSP1], [SLTon], [MoTaSP], [BoNho], [TrangThai], [MaNSX]) VALUES (1010, N'Iphone 14 Pro', CAST(20000000 AS Decimal(18, 0)), N'OLED6.1"Super Retina XD', N'Apple A16', N'/Content/img/Ip14 mini-1.jpg                      ', 100, N'Một trong những tuyệt tác của Apple đáng nhớ nhất năm 2023 chắc chắn không thể thiếu cái tên iPhone 14 Pro. Sang chảnh về thiết kế, vượt trội về hiệu năng, quay phim chuyên nghiệp, pin "trâu", iPhone 14 Pro hứa hẹn sẽ mang đến những khoảnh khắc đầy thú vị cho bạn mỗi ngày.', N'128 GB', 0, 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTT], [TieuDeTT], [NoiDungTT], [HinhTT], [NgayDangTT]) VALUES (1013, N'Samsung Galaxy Z Flip4 lần đầu lộ ảnh thực tế, không có thay đổi lớn về thiết kế', N'https://cellphones.com.vn/sforum/samsung-galaxy-z-flip4-lan-dau-lo-anh-thuc-te-khong-co-thay-doi-lon-ve-thiet-ke', N'/Content/img/tintucsamsung.jpg                    ', CAST(N'2022-06-15' AS Date))
INSERT [dbo].[TinTuc] ([MaTT], [TieuDeTT], [NoiDungTT], [HinhTT], [NgayDangTT]) VALUES (1014, N'Hé lộ những thông tin quan trọng đầu tiên về Xiaomi Redmi Note 12', N'https://cellphones.com.vn/sforum/he-lo-nhung-thong-tin-quan-trong-dau-tien-ve-xiaomi-redmi-note-12', N'/Content/img/tintucredmi.jpg                      ', CAST(N'2022-06-17' AS Date))
INSERT [dbo].[TinTuc] ([MaTT], [TieuDeTT], [NoiDungTT], [HinhTT], [NgayDangTT]) VALUES (1015, N'Mời bạn tải về bộ hình nền chất lượng cao của iOS 16', N'https://cellphones.com.vn/sforum/moi-ban-tai-ve-bo-hinh-nen-chat-luong-cao-cua-ios-16', N'/Content/img/tintuciphone.jpg                     ', CAST(N'2022-06-18' AS Date))
INSERT [dbo].[TinTuc] ([MaTT], [TieuDeTT], [NoiDungTT], [HinhTT], [NgayDangTT]) VALUES (1016, N'Vivo X80 series chính thức ra mắt tại Việt Nam vào ngày 15/6', N'https://cellphones.com.vn/sforum/vivo-x80-series-chinh-thuc-ra-mat-tai-viet-nam-vao-ngay-15-6', N'/Content/img/tintucvivo.jpeg                      ', CAST(N'2022-06-19' AS Date))
INSERT [dbo].[TinTuc] ([MaTT], [TieuDeTT], [NoiDungTT], [HinhTT], [NgayDangTT]) VALUES (1017, N'OPPO K10 5G ra mắt: MediaTek Dimensity 810, sạc nhanh 33W, giá 5.2 triệu đồng', N'https://cellphones.com.vn/sforum/oppo-k10-5g-ra-mat-mediatek-dimensity-810-sac-nhanh-33w-gia-5-2-trieu-dong', N'/Content/img/tintucoppo.jpg                       ', CAST(N'2022-06-20' AS Date))
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_NguoiDung] FOREIGN KEY([IdUser])
REFERENCES [dbo].[NguoiDung] ([IdUser])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_NguoiDung]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_SanPham] FOREIGN KEY([IdSP])
REFERENCES [dbo].[SanPham] ([IdSP])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__MaNSX__34C8D9D1] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NSX] ([MaNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__MaNSX__34C8D9D1]
GO
