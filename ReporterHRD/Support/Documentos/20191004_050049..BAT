@echo off
SET DIr_Orig=D:\ReporterHRD
SET Dir_Dest=D:\Copia\%date:~0,2%%date:~3,2%%date:~6,4%-%Time:~0,2%%Time:~3,2%
MKDIR %Dir_Dest%
XCOPY D:\ReporterHRD D:\Copia\"%date:~0,2%%date:~3,2%%date:~6,4%-%Time:~0,2%%Time:~3,2%\." /v /e /f /h /y