

Imports System.Drawing
Imports System.Configuration
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Mvc
Imports System.Net.Mail.MailMessage
Imports System.EnterpriseServices.Internal

Public Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ''      Panasi.visible = False
        ''    Pantisop.visible = False
        ''  PanVarios.visible = False
        edit_even.Visible = False

        Btn1.visible = True
        Btn2.visible = True
        Btn3.visible = True

    End Sub

    Protected Sub Btn1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn1.Click
        Panasi.visible = True
        Pantisop.visible = False
        PanVarios.visible = False

        Btn1.visible = False
        Btn2.visible = True
        Btn3.visible = True
    End Sub
    Protected Sub Btn2_Click(sender As Object, e As EventArgs) Handles Btn2.Click
        Panasi.visible = False
        Pantisop.visible = True
        PanVarios.visible = False

        Btn1.visible = True
        Btn2.visible = False
        Btn3.visible = True
    End Sub
    Protected Sub Btn3_Click(sender As Object, e As EventArgs) Handles Btn3.Click
        Panasi.visible = False
        Pantisop.visible = False
        PanVarios.visible = False

        Btn1.visible = True
        Btn2.visible = True
        Btn3.visible = False

        Dim Equipos As String = Serial.text
        Dim asigna As String = asignaList1.text

    End Sub
    Protected Sub Btng1_Click(sender As Object, e As EventArgs) Handles Btng1.Click

        Dim Equipos As String = Serial.text
        Dim asigna As String = asignaList1.text
        Dim solcit As String = Page.User.Identity.Name.ToString
        Dim Hora As String
        Dim IDD As String


        Dim SQLa As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        Hora = Rsa(0)


        Rsa.Close()
        timedatea.Close()
        IDD = " " & Equipos & " " & asigna
        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Equipos SET Tecnico=N'" & asigna & "' where Serial= N'" & Equipos & "'"
        SqlDataVarios.Update()
        SqlDataVarios.InsertCommand = "INSERT Sis_Hv_Audubica( Id_ubicaciones,Usuario,Dates) VALUES ('" & IDD & "','" & solcit & "','" & Hora & "')"
        SqlDataVarios.Insert()
        Panasi.visible = False


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim Tipo As String = TextBox1.text
        Dim IDD As Integer
        Dim IDtemp As String
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT top 1 Id from  Sis_HV_TiposMantenimiento order by Id desc"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()

        IDtemp = Rsa(0)
        Rsa.Close()
        timedatea.Close()

        IDD = IDtemp + 1
        SqlDataVarios.InsertCommand = "INSERT  Sis_HV_TiposMantenimiento( Id,Tipo_Man) VALUES ('" & IDD & "','" & Tipo & "')"
        SqlDataVarios.Insert()

    End Sub



    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim Hora As String
        Dim SQLa As String

        Dim Coma As New SqlCommand

        Dim i As String



        Dim y As Integer = 1884

        While (y <= 2312)


            Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
            Dim Rsa2 As SqlDataReader
            Dim Coma2 As New SqlCommand
            Dim SQLa2 As String
            Dim even2 As String
            Coma.Connection = timedatea2
            timedatea2.Open()


            SQLa2 = "SELECT (Case when Id_Evento is null then 'A' else Id_Evento end) , (Case when Id_Evento is null then '1' else  DATEADD(hour, 100, Sis_HV_Historial.Fech_En) end) , (Case when Id_Evento is null then '1' else  DATEADD(hour, 160, Sis_HV_Historial.Fech_En) end) FROM Sis_HV_Historial WHERE Estado=5 and (id=" & y & ")"
            '    SQLa2 = "SELECT (Case when Id_Evento is null then '1' else Id_Evento end)  FROM Sis_HV_Historial WHERE (Estado=5) and (id=" & i & ")"
            Coma2 = New SqlCommand(SQLa2, timedatea2)
            Rsa2 = Coma2.ExecuteReader()
            If Rsa2.Read() Then
                ' Rsa2.Read()
                If String.IsNullOrEmpty(Rsa2(0)) Then
                Else
                    even2 = Rsa2(0)

                    i = Rsa2(1)

                    Hora = Rsa2(2)

                    SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='" & Hora & ":00'   where (Estado=2) and Id_Job='ASI001'  and (Id_Evento='" & even2 & "')"
                    SqlDataVarios.Update()




                    Label1.TEXT = "TERMINADO"
                End If

                Rsa2.Close()
                timedatea2.Close()
            End If
            y = y + 1
        End While












        Dim i2 As Integer = 1896



        Dim i3 As Integer = 2269

        Dim i4 As Integer = 2300



    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

        Dim Hora As String
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()

        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()


        Dim i As Integer = 1882

        While (i <= 2312)


            Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
            Dim Rsa2 As SqlDataReader
            Dim Coma2 As New SqlCommand
            Dim SQLa2 As String
            Dim even As String
            Coma.Connection = timedatea2
            timedatea2.Open()

            SQLa2 = "SELECT (Case when Id_Evento is null then '1' else Id_Evento end)  FROM Sis_HV_Historial WHERE Id_Job='ASI003' and (id=" & i & ")"

            Coma2 = New SqlCommand(SQLa2, timedatea2)
            Rsa2 = Coma2.ExecuteReader()
            Rsa2.Read()
            If Rsa2(0) = "1" Then
            Else even = Rsa2(0)




                SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=5 where Id_Job='ASI003' and Estado=1 and (Id_Evento='" & even & "')"
                SqlDataVarios.Update()
                SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=5 where Id_Job='ASI003' and Estado=1 and (Id_Evento='" & even & "')"
                SqlDataVarios.Update()

            End If

            Rsa2.Close()
            timedatea2.Close()
            i = i + 1
        End While

        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Id_Job='ASI003',Estado= 1 where Estado= 5 and (Id=1250)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Id_Job='ASI003',Estado= 1 where Estado= 5 and (Id=1255)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Id_Job='ASI003',Estado= 1 where Estado= 5 and (Id=1263)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Id_Job='ASI003',Estado= 1 where Estado= 5 and (Id=1264)"
        SqlDataVarios.Update()


        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial Set Id_Job='ASI003',Estado= 1 where Estado= 5 and (Id=1879)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial Set Id_Job='ASI003',Estado= 1 where Estado= 5 and (Id=1871)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial Set Id_Job='ASI003',Estado= 1 where Estado= 5 and (Id=1880)"
        SqlDataVarios.Update()




        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Prioridad=168 where Id_Job='ASI003' and (Id=1250)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Prioridad=168 where Id_Job='ASI003' and (Id=1255)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Prioridad=168 where Id_Job='ASI003' and (Id=1263)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Prioridad=168 where Id_Job='ASI003' and (Id=1264)"
        SqlDataVarios.Update()


        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Prioridad=168 where Id_Job='ASI003' and (Id=1879)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Prioridad=168 where Id_Job='ASI003' and (Id=1871)"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Prioridad=168 where Id_Job='ASI003' and (Id=1880)"
        SqlDataVarios.Update()



        ''SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Id_Job='ASI003' where Estado= 5"
        ''SqlDataVarios.Update()



    End Sub

    Protected Sub Btn4_Click(sender As Object, e As EventArgs) Handles Btn4.Click

        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=1 where Id_Evento='ASI001_11/08/2020 14:45:13'"
        SqlDataVarios.Update()

        SqlDataVarios.UpdateCommand = "UPDATE Sis_HV_NOVHIST set Evento ='ASI001_12/08/2020 17:54:53' where Evento='ASI001_11/08/2020 14:45:13'"
        SqlDataVarios.Update()


    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click


        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:00','CNDY387537','10/20/2020 10:00:00','10/20/2020 10:00:00','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:01','CND8BBC1RX','10/20/2020 10:00:01','10/20/2020 10:00:01','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:02','CNDY387967','10/20/2020 10:00:02','10/20/2020 10:00:02','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:03','CNF8H6LL7Z','10/20/2020 10:00:03','10/20/2020 10:00:03','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:04','CNF8H6N005','10/20/2020 10:00:04','10/20/2020 10:00:04','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:05','CNGS394294','10/20/2020 10:00:05','10/20/2020 10:00:05','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:06','CNCCDB30Z5','10/20/2020 10:00:06','10/20/2020 10:00:06','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:07','CNBCH3T083','10/20/2020 10:00:07','10/20/2020 10:00:07','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:08','CNBCH471KG','10/20/2020 10:00:08','10/20/2020 10:00:08','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:09','CNBK582858','10/20/2020 10:00:09','10/20/2020 10:00:09','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:10','CNB9H72BD2','10/20/2020 10:00:10','10/20/2020 10:00:10','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:11','E8BY246719','10/20/2020 10:00:11','10/20/2020 10:00:11','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:12','CNBCH3T07M','10/20/2020 10:00:12','10/20/2020 10:00:12','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:13','CNBK464489','10/20/2020 10:00:13','10/20/2020 10:00:13','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:14','CNB0J01079','10/20/2020 10:00:14','10/20/2020 10:00:14','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:15','CNB0J01300','10/20/2020 10:00:15','10/20/2020 10:00:15','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:16','CNGS346674','10/20/2020 10:00:16','10/20/2020 10:00:16','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:17','VND3B56051','10/20/2020 10:00:17','10/20/2020 10:00:17','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:18','CNB9134049','10/20/2020 10:00:18','10/20/2020 10:00:18','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:19','CNBK481461','10/20/2020 10:00:19','10/20/2020 10:00:19','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:20','CNBCH3T07S','10/20/2020 10:00:20','10/20/2020 10:00:20','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:21','PDB0010407','10/20/2020 10:00:21','10/20/2020 10:00:21','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:22','E8BY430240','10/20/2020 10:00:22','10/20/2020 10:00:22','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:23','VND4834347','10/20/2020 10:00:23','10/20/2020 10:00:23','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:24','CNB0060196','10/20/2020 10:00:24','10/20/2020 10:00:24','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:25','VND4735286','10/20/2020 10:00:25','10/20/2020 10:00:25','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:26','VND3B56033','10/20/2020 10:00:26','10/20/2020 10:00:26','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:27','VND4834337','10/20/2020 10:00:27','10/20/2020 10:00:27','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:28','CNDCG9R1B1','10/20/2020 10:00:28','10/20/2020 10:00:28','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:29','CN008I16R15001','10/20/2020 10:00:29','10/20/2020 10:00:29','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:30','CNB0060195','10/20/2020 10:00:30','10/20/2020 10:00:30','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:31','VND4835115','10/20/2020 10:00:31','10/20/2020 10:00:31','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:32','VND3805882','10/20/2020 10:00:32','10/20/2020 10:00:32','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:33','VNB3N27992','10/20/2020 10:00:33','10/20/2020 10:00:33','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:34','VND4805077','10/20/2020 10:00:34','10/20/2020 10:00:34','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:35','VND4805092','10/20/2020 10:00:35','10/20/2020 10:00:35','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:36','CNCCDB30GG','10/20/2020 10:00:36','10/20/2020 10:00:36','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:37','CNCCDB30JR','10/20/2020 10:00:37','10/20/2020 10:00:37','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:38','CNDCGBK2SM','10/20/2020 10:00:38','10/20/2020 10:00:38','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:39','CNDCG9R1B3','10/20/2020 10:00:39','10/20/2020 10:00:39','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:40','CNDCG9R1B6','10/20/2020 10:00:40','10/20/2020 10:00:40','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:41','CNBCD8Q1R2','10/20/2020 10:00:41','10/20/2020 10:00:41','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:42','CNDY438589','10/20/2020 10:00:42','10/20/2020 10:00:42','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:43','CNDY441013','10/20/2020 10:00:43','10/20/2020 10:00:43','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:44','CNDY279862','10/20/2020 10:00:44','10/20/2020 10:00:44','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:45','HAF0143433','10/20/2020 10:00:45','10/20/2020 10:00:45','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:46','HAF0204851','10/20/2020 10:00:46','10/20/2020 10:00:46','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:47','HAF0143449','10/20/2020 10:00:47','10/20/2020 10:00:47','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:48','CNCCDB30J9','10/20/2020 10:00:48','10/20/2020 10:00:48','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:49','CNDCG9R1B1','10/20/2020 10:00:49','10/20/2020 10:00:49','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:50','CNDCG9R19D','10/20/2020 10:00:50','10/20/2020 10:00:50','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:51','KBC0064288','10/20/2020 10:00:51','10/20/2020 10:00:51','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:52','CNBK464493','10/20/2020 10:00:52','10/20/2020 10:00:52','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:53','W98Y143749','10/20/2020 10:00:53','10/20/2020 10:00:53','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:54','PDB0010199','10/20/2020 10:00:54','10/20/2020 10:00:54','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:55','PDB0011636','10/20/2020 10:00:55','10/20/2020 10:00:55','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:56','RVYZ002824','10/20/2020 10:00:56','10/20/2020 10:00:56','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol,Aud_Nov,Nota,Id_Sol,Id_Job,  Estado, Prioridad) VALUES ('sua011_20/10/2020 10:00:57','VND3B26028','10/20/2020 10:00:57','10/20/2020 10:00:57','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','GONZALEZ CARDOZO EMERSON FRANCISCO','ASI001','1','1080')"
        SqlDataVarios.Insert()

        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:00','CNDY387537','HP LASERJET 4015N','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:00','MANTENIMIENTO','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:01','CND8BBC1RX','HP M1212nf','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:01','SECRETARIA GERENCIA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:02','CNDY387967','HP LASERJET 4015','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:02','REVISORIA FISCAL','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:03','CNF8H6LL7Z','HP LASERJET 425DN','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:03','FACTURACION STA ROSA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:04','CNF8H6N005','HP LASERJET 425DN','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:04','INFORMACION','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:05','CNGS394294','HP LASERJET COLOR 2025','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:05','GESTION INFORMACION','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:06','CNCCDB30Z5','HP LASERJET M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:06','LECTURA RAYOS X','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:07','CNBCH3T083','HP LASERJET M605','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:07','CONSULTA EXTERNA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:08','CNBCH471KG','HP LASERJET M605','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:08','CONSULTA EXTERNA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:09','CNBK582858','HP LASERJET 1020','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:09','TALENTO HUMANO','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:10','CNB9H72BD2','HP M127','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:10','CARTERA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:11','E8BY246719','EPSON FX 890','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:11','CONTABILIDAD','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:12','CNBCH3T07M','HP LASERJET M605','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:12','CARTERA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:13','CNBK464489','HP LASERJET 1020','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:13','ARCHIVO CENTRAL','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:14','CNB0J01079','HP LASERJET 1020','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:14','UROLOGIA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:15','CNB0J01300','HP LASERJET 1020','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:15','SIGAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:16','CNGS346674','HP LASERJET CP2025','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:16','COMUNICACIONES','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:17','VND3B56051','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:17','CARDIOLOGÍA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:18','CNB9134049','HP LASERJET 1020','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:18','CONTROL INTERNO','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:19','CNBK481461','HP LASERJET 1020','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:19','CONSULTORIO 5 CONSULTA EXTERNA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:20','CNBCH3T07S','HP LASERJET M605','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:20','OBSERVACION ADULTOS URG','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:21','PDB0010407','FUSORA M605','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:21','OBSERVACION ADULTOS URG','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:22','E8BY430240','EPSON FX 890','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:22','TESORERIA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:23','VND4834347','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:23','TESORERIA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:24','CNB0060196','HP LASERJET 1020','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:24','PRESUPUESTO','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:25','VND4735286','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:25','PAGOS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:26','VND3B56033','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:26','COORDINACIÓN SANTA ROSA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:27','VND4834337','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:27','FACTURACIÓN SEDE SATIVA SUR','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:28','CNDCG9R1B1','HP LASERJET M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:28','FARMACIA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:29','CN008I16R15001','FUSORA M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:29','FARMACIA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:30','CNB0060195','HP LASERJET 1020','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:30','ALMACEN','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:31','VND4835115','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:31','COORDINACION INTERNACION','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:32','VND3805882','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:32','BODEGA FARMACIA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:33','VNB3N27992','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:33','SUBGERENCIA CIENTIFICA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:34','VND4805077','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:34','ECOGRAFO SALA DE PARTOS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:35','VND4805092','HP LASERJET 1006','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:35','CONSULTORIO SALA DE PARTOS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:36','CNCCDB30GG','HP laserjet M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:36','TALENTO HUMANO','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:37','CNCCDB30JR','HP laserjet M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:37','CALIDAD','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:38','CNDCGBK2SM','HP laserjet M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:38','ESTACION ENFERMERIA BLOQUE B1','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:39','CNDCG9R1B3','Hp Laserjet M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:39','GESTION INFORMACION estaba farmacia','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:40','CNDCG9R1B6','HP laserjet M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:40','ASEGURAMIENTO','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:41','CNBCD8Q1R2','HP laserjet M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:41','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:42','CNDY438589','HP LASERJET P4015','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:42','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:43','CNDY441013','HP LASERJET P4015','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:43','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:44','CNDY279862','HP LASERJET P4015','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:44','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:45','HAF0143433','FUSORA P4015N','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:45','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:46','HAF0204851','FUSORA P4015N','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:46','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:47','HAF0143449','FUSORA P4015N','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:47','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:48','CNCCDB30J9','HP LASERJET M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:48','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:49','CNDCG9R1B1','HP LASERJET M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:49','FARMACIA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:50','CNDCG9R19D','HP LASERJET M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:50','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:51','KBC0064288','FUSORA M602','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:51','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:52','CNBK464493','HP LASERJET 1020','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:52','CONTABILIDAD','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:53','W98Y143749','MULTIFUNCIONAL EPSON L575','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:53','SATIVA SUR','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:54','PDB0010199','fusora M605','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:54','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:55','PDB0011636','FUSORA M605','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:55','OFICINA DE SISTEMAS','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:56','RVYZ002824','SCANNER EPSON GT-S85','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:56','REFERENCIA Y CONTRAREFERENCIA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES ('sua011_20/10/2020 10:00:57','VND3B26028','HP LaserJet P1606 dn','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:57','SALA DE CIRUGÍA','ASI001','1','5','1080')"
        SqlDataVarios.Insert()


        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:00','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:00')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:01','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:01')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:02','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:02')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:03','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:03')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:04','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:04')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:05','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:05')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:06','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:06')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:07','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:07')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:08','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:08')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:09','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:09')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:10','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:10')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:11','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:11')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:12','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:12')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:13','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:13')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:14','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:14')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:15','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:15')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:16','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:16')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:17','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:17')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:18','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:18')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:19','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:19')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:20','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:20')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:21','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:21')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:22','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:22')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:23','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:23')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:24','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:24')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:25','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:25')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:26','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:26')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:27','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:27')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:28','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:28')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:29','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:29')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:30','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:30')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:31','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:31')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:32','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:32')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:33','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:33')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:34','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:34')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:35','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:35')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:36','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:36')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:37','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:37')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:38','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:38')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:39','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:39')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:40','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:40')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:41','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:41')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:42','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:42')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:43','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:43')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:44','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:44')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:45','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:45')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:46','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:46')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:47','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:47')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:48','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:48')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:49','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:49')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:50','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:50')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:51','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:51')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:52','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:52')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:53','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:53')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:54','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:54')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:55','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:55')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:56','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:56')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:57','GONZALEZ CARDOZO EMERSON FRANCISCO','Mantenimiento preventivo de dispositivo según CONTRATO 220-2020','20/10/2020 10:00:57')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:00','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:00')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:01','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:01')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:02','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:02')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:03','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:03')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:04','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:04')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:05','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:05')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:06','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:06')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:07','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:07')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:08','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:08')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:09','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:09')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:10','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:10')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:11','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:11')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:12','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:12')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:13','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:13')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:14','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:14')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:15','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:15')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:16','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:16')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:17','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:17')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:18','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:18')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:19','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:19')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:20','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:20')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:21','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:21')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:22','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:22')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:23','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:23')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:24','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:24')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:25','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:25')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:26','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:26')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:27','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:27')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:28','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:28')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:29','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:29')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:30','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:30')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:31','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:31')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:32','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:32')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:33','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:33')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:34','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:34')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:35','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:35')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:36','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:36')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:37','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:37')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:38','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:38')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:39','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:39')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:40','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:40')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:41','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:41')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:42','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:42')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:43','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:43')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:44','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:44')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:45','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:45')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:46','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:46')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:47','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:47')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:48','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:48')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:49','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:49')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:50','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:50')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:51','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:51')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:52','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:52')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:53','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:53')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:54','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:54')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:55','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:55')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:56','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:56')"
        SqlDataVarios.Insert()
        SqlDataVarios.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES ('sua011_20/10/2020 10:00:57','GONZALEZ CARDOZO EMERSON FRANCISCO','Asigna como responsable a JOHANA MILENA GUTIERREZ P.','20/10/2020 10:00:57')"
        SqlDataVarios.Insert()




    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='24/03/2020 16:53:00'   where  (Id_Evento='sua011_18/03/2020 16:53:58')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='25/03/2020 16:54:00'   where  (Id_Evento='sua011_19/03/2020 16:54:00')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='31/03/2020 16:54:00'   where  (Id_Evento='sua011_25/03/2020 16:54:12')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='31/03/2020 16:54:00'   where  (Id_Evento='sua011_25/03/2020 16:54:13')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='31/03/2020 16:54:00'   where  (Id_Evento='sua011_25/03/2020 16:54:14')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='01/04/2020 16:54:00'   where  (Id_Evento='sua011_26/03/2020 16:54:15')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='01/04/2020 16:54:00'   where  (Id_Evento='sua011_26/03/2020 16:54:16')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='01/04/2020 16:54:00'   where  (Id_Evento='sua011_26/03/2020 16:54:18')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='02/04/2020 16:54:00'   where  (Id_Evento='sua011_27/03/2020 16:54:19')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='02/04/2020 16:54:00'   where  (Id_Evento='sua011_27/03/2020 16:54:20')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='06/04/2020 16:54:00'   where  (Id_Evento='sua011_31/03/2020 16:54:27')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='06/04/2020 16:54:00'   where  (Id_Evento='sua011_31/03/2020 16:54:28')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='06/04/2020 16:54:00'   where  (Id_Evento='sua011_31/03/2020 16:54:29')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='06/04/2020 16:54:00'   where  (Id_Evento='sua011_31/03/2020 16:54:30')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='08/04/2020 16:54:00'   where  (Id_Evento='sua011_02/04/2020 16:54:35')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='08/04/2020 16:54:00'   where  (Id_Evento='sua011_02/04/2020 16:54:36')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='08/04/2020 16:54:00'   where  (Id_Evento='sua011_02/04/2020 16:54:37')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='08/04/2020 16:54:00'   where  (Id_Evento='sua011_02/04/2020 16:54:38')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='09/04/2020 16:54:00'   where  (Id_Evento='sua011_03/04/2020 16:54:39')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='09/04/2020 16:54:00'   where  (Id_Evento='sua011_03/04/2020 16:54:40')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='09/04/2020 16:54:00'   where  (Id_Evento='sua011_03/04/2020 16:54:41')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='09/04/2020 16:54:00'   where  (Id_Evento='sua011_03/04/2020 16:54:42')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='12/04/2020 16:54:00'   where  (Id_Evento='sua011_06/04/2020 16:54:43')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='12/04/2020 16:54:00'   where  (Id_Evento='sua011_06/04/2020 16:54:44')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='12/04/2020 16:54:00'   where  (Id_Evento='sua011_06/04/2020 16:54:45')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='12/04/2020 16:54:00'   where  (Id_Evento='sua011_06/04/2020 16:54:46')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='13/04/2020 16:54:00'   where  (Id_Evento='sua011_07/04/2020 16:54:48')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='13/04/2020 16:54:00'   where  (Id_Evento='sua011_07/04/2020 16:54:50')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='14/04/2020 16:54:00'   where  (Id_Evento='sua011_08/04/2020 16:54:51')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='14/04/2020 16:54:00'   where  (Id_Evento='sua011_08/04/2020 16:54:52')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='14/04/2020 16:54:00'   where  (Id_Evento='sua011_08/04/2020 16:54:53')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='14/04/2020 16:54:00'   where  (Id_Evento='sua011_08/04/2020 16:54:54')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='19/04/2020 16:54:00'   where  (Id_Evento='sua011_13/04/2020 16:54:55')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='19/04/2020 16:54:00'   where  (Id_Evento='sua011_13/04/2020 16:54:56')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='19/04/2020 16:54:00'   where  (Id_Evento='sua011_13/04/2020 16:54:57')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='19/04/2020 16:54:00'   where  (Id_Evento='sua011_13/04/2020 16:54:58')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='20/04/2020 16:54:00'   where  (Id_Evento='sua011_14/04/2020 16:54:59')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='20/04/2020 16:55:00'   where  (Id_Evento='sua011_14/04/2020 16:55:00')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='20/04/2020 16:56:00'   where  (Id_Evento='sua011_14/04/2020 16:56:00')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='21/04/2020 16:56:00'   where  (Id_Evento='sua011_15/04/2020 16:56:02')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='21/04/2020 16:56:00'   where  (Id_Evento='sua011_15/04/2020 16:56:03')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='21/04/2020 16:56:00'   where  (Id_Evento='sua011_15/04/2020 16:56:04')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='21/04/2020 16:56:00'   where  (Id_Evento='sua011_15/04/2020 16:56:05')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='22/04/2020 16:56:00'   where  (Id_Evento='sua011_16/04/2020 16:56:06')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='22/04/2020 16:56:00'   where  (Id_Evento='sua011_16/04/2020 16:56:07')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='22/04/2020 16:56:00'   where  (Id_Evento='sua011_16/04/2020 16:56:09')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='23/04/2020 16:56:00'   where  (Id_Evento='sua011_17/04/2020 16:56:10')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='23/04/2020 16:56:00'   where  (Id_Evento='sua011_17/04/2020 16:56:11')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='23/04/2020 16:56:00'   where  (Id_Evento='sua011_17/04/2020 16:56:12')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='23/04/2020 16:56:00'   where  (Id_Evento='sua011_17/04/2020 16:56:13')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='26/04/2020 16:56:00'   where  (Id_Evento='sua011_20/04/2020 16:56:14')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='26/04/2020 16:56:00'   where  (Id_Evento='sua011_20/04/2020 16:56:15')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='26/04/2020 16:56:00'   where  (Id_Evento='sua011_20/04/2020 16:56:16')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='26/04/2020 16:56:00'   where  (Id_Evento='sua011_20/04/2020 16:56:17')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='27/04/2020 16:56:00'   where  (Id_Evento='sua011_21/04/2020 16:56:18')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='27/04/2020 16:56:00'   where  (Id_Evento='sua011_21/04/2020 16:56:19')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='27/04/2020 16:56:00'   where  (Id_Evento='sua011_21/04/2020 16:56:20')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='27/04/2020 16:56:00'   where  (Id_Evento='sua011_21/04/2020 16:56:21')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='28/04/2020 16:56:00'   where  (Id_Evento='sua011_22/04/2020 16:56:22')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='28/04/2020 16:56:00'   where  (Id_Evento='sua011_22/04/2020 16:56:23')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='28/04/2020 16:56:00'   where  (Id_Evento='sua011_22/04/2020 16:56:24')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='28/04/2020 16:56:00'   where  (Id_Evento='sua011_22/04/2020 16:56:25')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='29/04/2020 16:56:00'   where  (Id_Evento='sua011_23/04/2020 16:56:26')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='29/04/2020 16:56:00'   where  (Id_Evento='sua011_23/04/2020 16:56:27')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='29/04/2020 16:56:00'   where  (Id_Evento='sua011_23/04/2020 16:56:28')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='29/04/2020 16:56:00'   where  (Id_Evento='sua011_23/04/2020 16:56:29')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='30/04/2020 16:56:00'   where  (Id_Evento='sua011_24/04/2020 16:56:30')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='30/04/2020 16:56:00'   where  (Id_Evento='sua011_24/04/2020 16:56:31')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='30/04/2020 16:56:00'   where  (Id_Evento='sua011_24/04/2020 16:56:32')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='30/04/2020 16:56:00'   where  (Id_Evento='sua011_24/04/2020 16:56:33')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='03/05/2020 16:56:00'   where  (Id_Evento='sua011_27/04/2020 16:56:34')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='03/05/2020 16:56:00'   where  (Id_Evento='sua011_27/04/2020 16:56:35')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='03/05/2020 16:56:00'   where  (Id_Evento='sua011_27/04/2020 16:56:36')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='16/07/2020 16:56:00'   where  (Id_Evento='sua011_10/07/2020 16:56:37')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='16/07/2020 16:56:00'   where  (Id_Evento='sua011_10/07/2020 16:56:38')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='16/07/2020 16:56:00'   where  (Id_Evento='sua011_10/07/2020 16:56:39')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='16/07/2020 16:56:00'   where  (Id_Evento='sua011_10/07/2020 16:56:40')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='19/07/2020 16:56:00'   where  (Id_Evento='sua011_13/07/2020 16:56:41')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='19/07/2020 16:56:00'   where  (Id_Evento='sua011_13/07/2020 16:56:42')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='19/07/2020 16:56:00'   where  (Id_Evento='sua011_13/07/2020 16:56:43')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='19/07/2020 16:56:00'   where  (Id_Evento='sua011_13/07/2020 16:56:44')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='20/07/2020 16:56:00'   where  (Id_Evento='sua011_14/07/2020 16:56:45')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='20/07/2020 16:56:00'   where  (Id_Evento='sua011_14/07/2020 16:56:46')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='20/07/2020 16:56:00'   where  (Id_Evento='sua011_14/07/2020 16:56:47')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='20/07/2020 16:56:00'   where  (Id_Evento='sua011_14/07/2020 16:56:48')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='21/07/2020 16:56:00'   where  (Id_Evento='sua011_15/07/2020 16:56:49')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='21/07/2020 16:56:00'   where  (Id_Evento='sua011_15/07/2020 16:56:50')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='21/07/2020 16:56:00'   where  (Id_Evento='sua011_15/07/2020 16:56:51')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='21/07/2020 16:56:00'   where  (Id_Evento='sua011_15/07/2020 16:56:52')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='22/07/2020 16:56:00'   where  (Id_Evento='sua011_16/07/2020 16:56:53')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='22/07/2020 16:56:00'   where  (Id_Evento='sua011_16/07/2020 16:56:54')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='22/07/2020 16:56:00'   where  (Id_Evento='sua011_16/07/2020 16:56:55')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='22/07/2020 16:56:00'   where  (Id_Evento='sua011_16/07/2020 16:56:56')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='23/07/2020 16:56:00'   where  (Id_Evento='sua011_17/07/2020 16:56:57')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='23/07/2020 16:56:00'   where  (Id_Evento='sua011_17/07/2020 16:56:58')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='23/07/2020 16:56:00'   where  (Id_Evento='sua011_17/07/2020 16:56:59')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='23/07/2020 16:57:00'   where  (Id_Evento='sua011_17/07/2020 16:57:00')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='27/07/2020 16:57:00'   where  (Id_Evento='sua011_21/07/2020 16:57:01')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='27/07/2020 16:57:00'   where  (Id_Evento='sua011_21/07/2020 16:57:02')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='27/07/2020 16:57:00'   where  (Id_Evento='sua011_21/07/2020 16:57:03')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='27/07/2020 16:57:00'   where  (Id_Evento='sua011_21/07/2020 16:57:04')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='28/07/2020 16:57:00'   where  (Id_Evento='sua011_22/07/2020 16:57:05')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='28/07/2020 16:57:00'   where  (Id_Evento='sua011_22/07/2020 16:57:06')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='28/07/2020 16:57:00'   where  (Id_Evento='sua011_22/07/2020 16:57:07')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='28/07/2020 16:57:00'   where  (Id_Evento='sua011_22/07/2020 16:57:08')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='29/07/2020 16:52:00'   where  (Id_Evento='sua011_23/07/2020 16:52:00')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='29/07/2020 16:52:00'   where  (Id_Evento='sua011_23/07/2020 16:52:01')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='29/07/2020 16:52:00'   where  (Id_Evento='sua011_23/07/2020 16:52:02')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='29/07/2020 16:52:00'   where  (Id_Evento='sua011_23/07/2020 16:52:03')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='30/07/2020 16:52:00'   where  (Id_Evento='sua011_24/07/2020 16:52:04')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='30/07/2020 16:52:00'   where  (Id_Evento='sua011_24/07/2020 16:52:05')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='30/07/2020 16:52:00'   where  (Id_Evento='sua011_24/07/2020 16:52:06')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='30/07/2020 16:52:00'   where  (Id_Evento='sua011_24/07/2020 16:52:07')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='02/08/2020 16:52:00'   where  (Id_Evento='sua011_27/07/2020 16:52:08')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='02/08/2020 16:52:00'   where  (Id_Evento='sua011_27/07/2020 16:52:09')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='02/08/2020 16:52:00'   where  (Id_Evento='sua011_27/07/2020 16:52:10')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='02/08/2020 16:52:00'   where  (Id_Evento='sua011_27/07/2020 16:52:11')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='03/08/2020 16:52:00'   where  (Id_Evento='sua011_28/07/2020 16:52:12')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='03/08/2020 16:52:00'   where  (Id_Evento='sua011_28/07/2020 16:52:13')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='03/08/2020 16:52:00'   where  (Id_Evento='sua011_28/07/2020 16:52:14')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='03/08/2020 16:52:00'   where  (Id_Evento='sua011_28/07/2020 16:52:15')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='04/08/2020 16:52:00'   where  (Id_Evento='sua011_29/07/2020 16:52:16')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='04/08/2020 16:52:00'   where  (Id_Evento='sua011_29/07/2020 16:52:17')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='04/08/2020 16:52:00'   where  (Id_Evento='sua011_29/07/2020 16:52:18')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='04/08/2020 16:52:00'   where  (Id_Evento='sua011_29/07/2020 16:52:19')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='05/08/2020 16:52:00'   where  (Id_Evento='sua011_30/07/2020 16:52:20')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='05/08/2020 16:52:00'   where  (Id_Evento='sua011_30/07/2020 16:52:21')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='05/08/2020 16:52:00'   where  (Id_Evento='sua011_30/07/2020 16:52:22')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='05/08/2020 16:52:00'   where  (Id_Evento='sua011_30/07/2020 16:52:23')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='06/08/2020 16:52:00'   where  (Id_Evento='sua011_31/07/2020 16:52:24')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='06/08/2020 16:52:00'   where  (Id_Evento='sua011_31/07/2020 16:52:25')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='06/08/2020 16:52:00'   where  (Id_Evento='sua011_31/07/2020 16:52:26')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='06/08/2020 16:52:00'   where  (Id_Evento='sua011_31/07/2020 16:52:27')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='10/05/2020 16:56:00'   where  (Id_Evento='sua011_04/05/2020 16:56:17')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='10/05/2020 16:56:00'   where  (Id_Evento='sua011_04/05/2020 16:56:18')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='10/05/2020 16:56:00'   where  (Id_Evento='sua011_04/05/2020 16:56:19')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='10/05/2020 16:56:00'   where  (Id_Evento='sua011_04/05/2020 16:56:20')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='11/05/2020 16:56:00'   where  (Id_Evento='sua011_05/05/2020 16:56:21')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='11/05/2020 16:56:00'   where  (Id_Evento='sua011_05/05/2020 16:56:22')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='11/05/2020 16:56:00'   where  (Id_Evento='sua011_05/05/2020 16:56:23')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='11/05/2020 16:56:00'   where  (Id_Evento='sua011_05/05/2020 16:56:24')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='12/05/2020 16:56:00'   where  (Id_Evento='sua011_06/05/2020 16:56:25')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='12/05/2020 16:56:00'   where  (Id_Evento='sua011_06/05/2020 16:56:26')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='12/05/2020 16:56:00'   where  (Id_Evento='sua011_06/05/2020 16:56:27')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='12/05/2020 16:56:00'   where  (Id_Evento='sua011_06/05/2020 16:56:28')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='13/05/2020 16:56:00'   where  (Id_Evento='sua011_07/05/2020 16:56:29')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='13/05/2020 16:56:00'   where  (Id_Evento='sua011_07/05/2020 16:56:30')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='13/05/2020 16:56:00'   where  (Id_Evento='sua011_07/05/2020 16:56:31')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='13/05/2020 16:56:00'   where  (Id_Evento='sua011_07/05/2020 16:56:32')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='14/05/2020 16:56:00'   where  (Id_Evento='sua011_08/05/2020 16:56:49')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='14/05/2020 16:56:00'   where  (Id_Evento='sua011_08/05/2020 16:56:50')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='17/05/2020 16:56:00'   where  (Id_Evento='sua011_11/05/2020 16:56:53')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='17/05/2020 16:56:00'   where  (Id_Evento='sua011_11/05/2020 16:56:54')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='17/05/2020 16:56:00'   where  (Id_Evento='sua011_05/11/2020 16:56:55')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='17/05/2020 16:56:00'   where  (Id_Evento='sua011_05/11/2020 16:56:56')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='17/05/2020 16:56:00'   where  (Id_Evento='sua011_05/11/2020 16:56:57')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='17/05/2020 16:56:00'   where  (Id_Evento='sua011_05/11/2020 16:56:58')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='17/06/2020 16:56:00'   where  (Id_Evento='sua011_06/11/2020 16:56:59')"
        SqlDataVarios.Update()
        SqlDataVarios.UpdateCommand = "UPDATE  Sis_HV_Historial SET Aud_Time_Act='17/06/2020 16:57:00'   where  (Id_Evento='sua011_06/11/2020 16:57:00')"
        SqlDataVarios.Update()				

Label1.TEXT = "TERMINADO"



    End Sub
End Class