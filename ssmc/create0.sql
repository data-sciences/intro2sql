/*

weaves

This is the SQL Server equivalent of the create database command.
You have to specify a lot more engineering.
Where to put the files. What logs to keep and where.

And a lot of configuration options.
A lot of ANSI compatibility features are turned off.
ANSI compatibility is following the standard.

You would only need to put ANSI compatibility on if you wanted to migrate
your system to another database - Oracle, for example. 

*/

CREATE DATABASE [Contacts] ON  PRIMARY 
( NAME = N'Contacts', FILENAME = N'E:\cache\mssql\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Contacts.mdf' , SIZE = 2048KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Contacts_log', FILENAME = N'E:\cache\mssql\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Contacts_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Contacts] SET COMPATIBILITY_LEVEL = 100
GO
ALTER DATABASE [Contacts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Contacts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Contacts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Contacts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Contacts] SET ARITHABORT OFF 
GO
ALTER DATABASE [Contacts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Contacts] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Contacts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Contacts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Contacts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Contacts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Contacts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Contacts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Contacts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Contacts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Contacts] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Contacts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Contacts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Contacts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Contacts] SET  READ_WRITE 
GO
ALTER DATABASE [Contacts] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Contacts] SET  MULTI_USER 
GO
ALTER DATABASE [Contacts] SET PAGE_VERIFY CHECKSUM  
GO
USE [Contacts]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [Contacts] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
