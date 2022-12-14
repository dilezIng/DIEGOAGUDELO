/*
   jueves, 6 de junio de 201910:16:49 a. m.
   Usuario: 
   Servidor: .\SQLEXPRESS
   Base de datos: 
   Aplicación: 
*/

/* Para evitar posibles problemas de pérdida de datos, debe revisar este script detalladamente antes de ejecutarlo fuera del contexto del diseñador de base de datos.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Sis_HV_Historial
	(
	Id int NOT NULL IDENTITY (1, 1),
	Id_Evento varchar(MAX) NOT NULL,
	Id_Equipo varchar(50) NOT NULL,
	Actividad nvarchar(MAX) NULL,
	Fech_En nvarchar(50) NULL,
	Hora_En varchar(50) NULL,
	Id_Job varchar(50) NULL,
	Aud_Time_Act varchar(50) NULL,
	Estado int NOT NULL,
	Id_Cierre varchar(50) NULL,
	Obs_Cierre nvarchar(MAX) NULL,
	Aud_Time_cierre varchar(50) NULL,
	Tipo_Man int NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Sis_HV_Historial SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Sis_HV_Historial ON
GO
IF EXISTS(SELECT * FROM dbo.Sis_HV_Historial)
	 EXEC('INSERT INTO dbo.Tmp_Sis_HV_Historial (Id, Id_Evento, Id_Equipo, Actividad, Fech_En, Hora_En, Id_Job, Aud_Time_Act, Estado, Id_Cierre, Obs_Cierre, Aud_Time_cierre, Tipo_Man)
		SELECT Id, Id_Evento, Id_Equipo, Actividad, Fech_En, Hora_En, Id_Job, Aud_Time_Act, Estado, Id_Cierre, Obs_Cierre, Aud_Time_cierre, Tipo_Man FROM dbo.Sis_HV_Historial WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Sis_HV_Historial OFF
GO
DROP TABLE dbo.Sis_HV_Historial
GO
EXECUTE sp_rename N'dbo.Tmp_Sis_HV_Historial', N'Sis_HV_Historial', 'OBJECT' 
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Sis_HV_Historial', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Sis_HV_Historial', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Sis_HV_Historial', 'Object', 'CONTROL') as Contr_Per 