USE [BlazorDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.InsertUserDetails
    @username NVARCHAR(100),
    @address NVARCHAR(500),
    @cellnumber NVARCHAR(50),
    @emailid NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.userdetails (username, address, cellnumber, emailid)
    VALUES (@username, @address, @cellnumber, @emailid);
END
GO
