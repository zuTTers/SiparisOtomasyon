USE [KTOtomasyon]
GO

/****** Object:  StoredProcedure [dbo].[CalenderCreator]    Script Date: 23.9.2018 02:17:28 ******/
DROP PROCEDURE [dbo].[CalenderCreator]
GO

/****** Object:  StoredProcedure [dbo].[CalenderCreator]    Script Date: 23.9.2018 02:17:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- exec CalenderCreator '2018-01-01','2019-01-01'
-- select * from Calendar
CREATE PROC [dbo].[CalenderCreator]
(
	@StartDate DATETIME,
	@EndDate DATETIME
)
AS
BEGIN
DROP TABLE [Calendar]
END

CREATE TABLE [Calendar]
(
    [CalendarDate] DATETIME
)

WHILE @StartDate <= @EndDate
      BEGIN
             INSERT INTO [Calendar]
             (
                   CalendarDate
             )
             SELECT
                   @StartDate

             SET @StartDate = DATEADD(dd, 1, @StartDate)
      END
GO


