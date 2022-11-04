


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

Partial Class PaginaBase
    Inherits System.Web.UI.Page




    Protected Sub Btnguardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnguardar.Click


        Dim ACTIVIDAD As String = Nota.text
        Dim Equipos As String = Codigo.text
        Dim temp As String = TextBox1.text
        Dim med As String
        Dim Estado As Integer = 1
        Dim area As String = List1area.text
        Dim nombrepc As String = SqlDataSourcePc1.SelectCommand()
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "Select TOP (1) Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_UbicacionesEquipos INNER JOIN Sis_HV_Equipos ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_Equipos.Serial=N'" & Equipos & "') ORDER BY Sis_HV_UbicacionesEquipos.NombreEquipo DESC"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()

        nombrepc = Rs(0)
        Rs.Close()
        timedate.Close()

        If String.IsNullOrEmpty(Nota.Text) Or area = "_" Then
            notavalida.Text = "No puede dejar campos blanco " & med & "   " & nombrepc
            Nota.Visible = True
            TextBox1.Visible = True
            Codigo.Visible = True
            Btnguardar.Visible = True
            List1area.Visible = True
        Else
            Dim solcit As String = Page.User.Identity.Name.ToString
            Dim sq As String
            Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
            Dim Rsa1983 As SqlDataReader
            Dim Coma123456 As New SqlCommand
            Coma123456.Connection = timd
            timd.Open()
            sq = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & solcit & "')"
            Coma123456 = New SqlCommand(sq, timd)
            Rsa1983 = Coma123456.ExecuteReader()
            Rsa1983.Read()
            med = Rsa1983(0)
            Rsa1983.Close()
            timd.Close()


            Dim asigna As String
            Dim actividad2 As String
            Dim sq22 As String
            Dim timd22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
            Dim Rsa198322 As SqlDataReader
            Dim Coma12345622 As New SqlCommand
            Coma12345622.Connection = timd22
            timd22.Open()
            sq22 = "SELECT case when Tecnico is null then 'PENDIENTE' else Tecnico end FROM Sis_HV_Equipos where Serial =N'" & Equipos & "' "
            Coma12345622 = New SqlCommand(sq22, timd22)
            Rsa198322 = Coma12345622.ExecuteReader()
            Rsa198322.Read()
            asigna = Rsa198322(0)

            Rsa198322.Close()
            timd22.Close()





            Dim Res As String
                Dim sq2 As String
                Dim timd2 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
                Dim Rsa19832 As SqlDataReader
                Dim Coma1234562 As New SqlCommand
                Coma1234562.Connection = timd2
                timd2.Open()
                sq2 = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & asigna & "')"
                Coma1234562 = New SqlCommand(sq2, timd2)
                Rsa19832 = Coma1234562.ExecuteReader()
                Rsa19832.Read()
                Res = Rsa19832(0)
                Rsa19832.Close()
                timd2.Close()


                actividad2 = "Of Sistemas asigna como responsable a : " & Res
                Dim Evento As String = "" & solcit & "_" & temp
                LabelMsg.Text() = "Su solicitud de " & nombrepc & ", se creo con el siguiente numéro " & Evento
                DataConsultas.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol, Nota, Id_Sol,Id_Job, Aud_Nov, Estado, Prioridad,Reabierto,Reasignado,Limt) VALUES (N'" & Evento & "','" & Equipos & "','" & temp & "','" & ACTIVIDAD & "','" & med & "','" & asigna & "','" & temp & "','" & Estado & "','192','0','0','0')"
                DataConsultas.Insert()
                DataH.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES (N'" & Evento & "','" & Equipos & "','" & nombrepc & "','Pendiente','" & temp & "','" & area & "','" & asigna & "','" & Estado & "','3','192')"
                DataH.Insert()
                DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Solicita, NotaSolicita, Date) VALUES (N'" & Evento & "','" & med & "','" & ACTIVIDAD & "','" & temp & "')"
                DataH0.Insert()

                DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & Evento & "','Of Sistemas','" & actividad2 & "','" & temp & "')"
                DataH0.Insert()
                Nota.Visible = False
                Label9.Visible = False
                TextBox1().Visible = False
                List1area.Visible = False
                q.Visible = False
                Label1.Visible = False
                Codigo.Visible = False
                Btnguardar.Visible = False







            End If
            Dim solcita As String = Page.User.Identity.Name.ToString
        Dim email As String
        Dim SQL22 As String
        Dim timedate22 As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True;")
        Dim Rs22 As SqlDataReader
        Dim C22 As New SqlCommand
        C22.Connection = timedate22
        timedate22.Open()
        SQL22 = "Select aspnet_Membership.email From aspnet_Users inner join aspnet_Membership on aspnet_Users.UserId =  aspnet_Membership.userId where aspnet_Users.UserName = N'" & solcita & "' "
        C22 = New SqlCommand(SQL22, timedate22)
        Rs22 = C22.ExecuteReader()
        Rs22.Read()

        email = Rs22(0)
        Rs22.Close()
        timedate22.Close()


        Dim nevento As String = "" & solcita & "_" & temp
        Dim correo As New System.Net.Mail.MailMessage
        correo.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")
        correo.To.Add(email)

        correo.Subject = "Solicitud " & nevento
        correo.Body = " Hola !!!" & vbNewLine & "" & med & "" & vbNewLine & "su solicitud fue:  " & ACTIVIDAD & " " & vbNewLine & " ------- En breve sera atendida por la oficina de Sistemas  ------"
        correo.IsBodyHtml = False
        correo.Priority = System.Net.Mail.MailPriority.Normal

        Dim smtp As New System.Net.Mail.SmtpClient

        smtp.Credentials = New System.Net.NetworkCredential("noreply@hrd.gov.co", "123456QWERTY")

        smtp.Host = "smtp.gmail.com"
        smtp.Port = 587 '// 465 // 587
        smtp.EnableSsl = True
        Try
            smtp.Send(correo)
            LabelError.Text = "Mensaje enviado satisfactoriamente"
        Catch ex As Exception
            '  LabelError.Text = "ERROR: " & ex.Message
        End Try

        Dim correo2 As New System.Net.Mail.MailMessage
        correo2.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")

        correo2.To.Add("noreply@hrd.gov.co")
        correo2.Subject = "Solicitud " & nevento
        correo2.Body = " Hola el usuario " & med & " " & vbNewLine & " Creo la siguiente Solicitud: " & vbNewLine & " " & ACTIVIDAD & " " & vbNewLine & " " & temp
        correo2.IsBodyHtml = False
        correo2.Priority = System.Net.Mail.MailPriority.Normal

        Dim smtp2 As New System.Net.Mail.SmtpClient

        smtp.Credentials = New System.Net.NetworkCredential("noreply@hrd.gov.co", "123456QWERTY")

        smtp2.Host = "smtp.gmail.com"
        smtp2.Port = 587 '// 465 // 587
        smtp2.EnableSsl = True
        Try
            LabelError.Text = "Mensaje enviado satisfactoriamente"
            smtp2.Send(correo2)

        Catch ex As Exception
            '   LabelError.Text = "ERROR: " & ex.Message
        End Try





    End Sub






    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, TextBox1.Load, DataTime.Load
        panelSolicitud.Visible = False


        Dim soli As String = Page.User.Identity.Name.ToString
        Dim dia As String
        Dim Hora As String
        Dim Horas As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT DATEPART(hour,  GETDATE()) AS DatePartInt, DATEPART(dw,  GETDATE()) AS DatePartInt2, CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108)"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        dia = Rs(1) '& SQL
        Hora = Rs(0)
        Horas = Rs(2)
        Rs.Close()
        timedate.Close()


    End Sub









End Class
