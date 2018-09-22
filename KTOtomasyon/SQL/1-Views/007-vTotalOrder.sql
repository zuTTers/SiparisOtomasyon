USE [KTOtomasyon]
GO

/****** Object:  View [dbo].[vTotalOrder]    Script Date: 23.9.2018 02:16:08 ******/
DROP VIEW [dbo].[vTotalOrder]
GO

/****** Object:  View [dbo].[vTotalOrder]    Script Date: 23.9.2018 02:16:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- SELECT * FROM [vTotalOrder]

CREATE VIEW [dbo].[vTotalOrder]
AS
SELECT  ISNULL(ROW_NUMBER() OVER(ORDER BY SUM(ORDET.TotalPrice)),0) Sira,
		DATEPART(YYYY,ORS.CreatedDate) Yil,
		DATEPART(mm,ORS.CreatedDate) Ay, 
		DATEPART(WW,ORS.CreatedDate) Hafta,		
		COUNT(ORS.Order_Id) SipMiktar,
		SUM(ORDET.TotalPrice) SipTutar		  
FROM Orders ORS
INNER JOIN OrderDetail ORDET ON ORS.Order_Id = ORDET.Order_Id 
GROUP BY DATEPART(mm,ORS.CreatedDate),DATEPART(YYYY,ORS.CreatedDate),DATEPART(WW,ORS.CreatedDate)

GO


