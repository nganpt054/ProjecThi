USE [LAPTOP]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
ALTER TABLE [dbo].[QLSanPham] DROP CONSTRAINT [FK_QLSanPham_QLLoaiSanPham]
GO
ALTER TABLE [dbo].[hoadon] DROP CONSTRAINT [FK_hoadon_QLTaiKhoan]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] DROP CONSTRAINT [FK_ChiTietHoaDon_QLSanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] DROP CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
/****** Object:  Table [dbo].[QLLoaiSanPham]    Script Date: 12/18/2021 10:13:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QLLoaiSanPham]') AND type in (N'U'))
DROP TABLE [dbo].[QLLoaiSanPham]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 12/18/2021 10:13:26 PM ******/
DROP VIEW [dbo].[View_1]
GO
/****** Object:  Table [dbo].[QLSanPham]    Script Date: 12/18/2021 10:13:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QLSanPham]') AND type in (N'U'))
DROP TABLE [dbo].[QLSanPham]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/18/2021 10:13:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChiTietHoaDon]') AND type in (N'U'))
DROP TABLE [dbo].[ChiTietHoaDon]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 12/18/2021 10:13:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hoadon]') AND type in (N'U'))
DROP TABLE [dbo].[hoadon]
GO
/****** Object:  Table [dbo].[QLTaiKhoan]    Script Date: 12/18/2021 10:13:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QLTaiKhoan]') AND type in (N'U'))
DROP TABLE [dbo].[QLTaiKhoan]
GO
/****** Object:  Table [dbo].[QLTaiKhoan]    Script Date: 12/18/2021 10:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLTaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[GhiChu] [int] NULL,
 CONSTRAINT [PK_QLTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 12/18/2021 10:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[makh] [int] NOT NULL,
	[NgayMua] [date] NULL,
	[damua] [bit] NOT NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/18/2021 10:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QLSanPham]    Script Date: 12/18/2021 10:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLSanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[MaLoaiSanPham] [int] NOT NULL,
	[GiaCa] [bigint] NULL,
	[Anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_QLSanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 12/18/2021 10:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT dbo.QLTaiKhoan.ID, dbo.ChiTietHoaDon.MaChiTietHD, dbo.QLTaiKhoan.HoTen, dbo.QLSanPham.TenSanPham, dbo.ChiTietHoaDon.SoLuongMua, dbo.QLSanPham.GiaCa, 
                  dbo.QLSanPham.GiaCa * dbo.ChiTietHoaDon.SoLuongMua AS ThanhTien, dbo.ChiTietHoaDon.damua
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                  dbo.QLSanPham ON dbo.ChiTietHoaDon.MaSP = dbo.QLSanPham.MaSP INNER JOIN
                  dbo.QLTaiKhoan ON dbo.hoadon.makh = dbo.QLTaiKhoan.ID
GO
/****** Object:  Table [dbo].[QLLoaiSanPham]    Script Date: 12/18/2021 10:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLLoaiSanPham](
	[MaLoaiSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSanPham] [nvarchar](50) NULL,
 CONSTRAINT [PK_QLLoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (1, 6, 1, 4, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (2, 12, 1, 5, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (3, 6, 1, 7, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (4, 12, 1, 7, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (5, 6, 1, 8, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (6, 10, 1, 8, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (7, 10, 1, 10, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (8, 8, 1, 10, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (9, 9, 3, 11, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSP], [SoLuongMua], [MaHoaDon], [damua]) VALUES (10, 10, 2, 11, 1)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (1, 3, CAST(N'2021-12-16' AS Date), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (2, 3, CAST(N'2021-12-16' AS Date), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (3, 3, CAST(N'2021-12-16' AS Date), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (4, 3, CAST(N'2021-12-16' AS Date), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (5, 3, CAST(N'2021-12-16' AS Date), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (6, 3, CAST(N'2021-12-16' AS Date), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (7, 1, CAST(N'2021-12-16' AS Date), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (8, 3, CAST(N'2021-12-16' AS Date), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (9, 3, CAST(N'2021-12-16' AS Date), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (10, 1, CAST(N'2021-12-16' AS Date), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (11, 1, CAST(N'2021-12-18' AS Date), 0)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[QLLoaiSanPham] ON 

INSERT [dbo].[QLLoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (1, N'BaLo')
INSERT [dbo].[QLLoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (2, N'Máy Ảnh')
INSERT [dbo].[QLLoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (3, N'Sách')
INSERT [dbo].[QLLoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (4, N'Camera')
INSERT [dbo].[QLLoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (5, N'Laptop')
INSERT [dbo].[QLLoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (6, N'Đồ gia dụng')
INSERT [dbo].[QLLoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (7, N'Áo')
SET IDENTITY_INSERT [dbo].[QLLoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[QLSanPham] ON 

INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (1, N'Áo ba lỗ', 7, 100000, N'image/anh1.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (2, N'Áo thun nam', 7, 200000, N'image/anh2.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (3, N'Áo thun hè', 7, 50000, N'image/anh3.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (4, N'Máy ảnh sonic', 2, 300000, N'image/anh4.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (5, N'Máy ảnh canon', 2, 400000, N'image/anh5.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (6, N'Đắc nhân tâm', 3, 50000, N'image/anh6.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (7, N'Nhà lãnh đạo không chức danh', 3, 60000, N'image/anh6.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (8, N'Bếp điện từ', 6, 100000, N'image/anh7.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (9, N'Bếp hồng ngoại', 6, 100000, N'image/anh8.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (10, N'Đồng hồ', 6, 20000, N'image/anh9.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (11, N'Macbook', 5, 2000000, N'image/anh10.jpg')
INSERT [dbo].[QLSanPham] ([MaSP], [TenSanPham], [MaLoaiSanPham], [GiaCa], [Anh]) VALUES (12, N'Laptop Dell', 5, 2000000, N'image/anh11.jpg')
SET IDENTITY_INSERT [dbo].[QLSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[QLTaiKhoan] ON 

INSERT [dbo].[QLTaiKhoan] ([ID], [HoTen], [DiaChi], [TenDangNhap], [MatKhau], [GhiChu]) VALUES (1, N'Huỳnh Tiến Anh', N'Huế', N'tienanh', N'123', 1)
INSERT [dbo].[QLTaiKhoan] ([ID], [HoTen], [DiaChi], [TenDangNhap], [MatKhau], [GhiChu]) VALUES (2, N'Admin', NULL, N'admin', N'123', 0)
INSERT [dbo].[QLTaiKhoan] ([ID], [HoTen], [DiaChi], [TenDangNhap], [MatKhau], [GhiChu]) VALUES (3, N'Lê Nguyên Trí', N'', N'tri123', N'123', 1)
INSERT [dbo].[QLTaiKhoan] ([ID], [HoTen], [DiaChi], [TenDangNhap], [MatKhau], [GhiChu]) VALUES (4, N'Nguyễn Kim Ngàn', N'Huế', N'ngan123', N'123', 1)
SET IDENTITY_INSERT [dbo].[QLTaiKhoan] OFF
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_hoadon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[hoadon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_QLSanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[QLSanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_QLSanPham]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_QLTaiKhoan] FOREIGN KEY([makh])
REFERENCES [dbo].[QLTaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_QLTaiKhoan]
GO
ALTER TABLE [dbo].[QLSanPham]  WITH CHECK ADD  CONSTRAINT [FK_QLSanPham_QLLoaiSanPham] FOREIGN KEY([MaLoaiSanPham])
REFERENCES [dbo].[QLLoaiSanPham] ([MaLoaiSanPham])
GO
ALTER TABLE [dbo].[QLSanPham] CHECK CONSTRAINT [FK_QLSanPham_QLLoaiSanPham]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 38
               Left = 608
               Bottom = 201
               Right = 802
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 43
               Left = 316
               Bottom = 206
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "QLSanPham"
            Begin Extent = 
               Top = 36
               Left = 856
               Bottom = 199
               Right = 1061
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "QLTaiKhoan"
            Begin Extent = 
               Top = 76
               Left = 22
               Bottom = 233
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
