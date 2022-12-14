/*
   jueves, 6 de junio de 201910:15:42 a. m.
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
CREATE TABLE dbo.Tmp_Sis_HV_Novedad
	(
	Id int NOT NULL IDENTITY (1, 1),
	Id_Evento varchar(MAX) NOT NULL,
	Id_Equipo varchar(MAX) NOT NULL,
	Fech_Sol datetime2(7) NOT NULL,
	Nota nvarchar(MAX) NOT NULL,
	Id_Sol varchar(MAX) NOT NULL,
	Id_Job varchar(MAX) NULL,
	Aud_Nov varchar(50) NOT NULL,
	Estado int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Sis_HV_Novedad SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Sis_HV_Novedad ON
GO
IF EXISTS(SELECT * FROM dbo.Sis_HV_Novedad)
	 EXEC('INSERT INTO dbo.Tmp_Sis_HV_Novedad (Id, Id_Evento, Id_Equipo, Fech_Sol, Nota, Id_Sol, Id_Job, Aud_Nov, Estado)
		SELECT Id, Id_Evento, Id_Equipo, Fech_Sol, Nota, Id_Sol, Id_Job, Aud_Nov, Estado FROM dbo.Sis_HV_Novedad WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Sis_HV_Novedad OFF
GO
DROP TABLE dbo.Sis_HV_Novedad
GO
EXECUTE sp_rename N'dbo.Tmp_Sis_HV_Novedad', N'Sis_HV_Novedad', 'OBJECT' 
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Sis_HV_Novedad', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Sis_HV_Novedad', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Sis_HV_Novedad', 'Object', 'CONTROL') as Contr_Per 