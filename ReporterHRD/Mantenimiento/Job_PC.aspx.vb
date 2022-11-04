


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
        Paneluser.visible = False


        Dim ACTIVIDAD As String = Nota.text
        Dim Equipos As String = Codigo.text
        Dim temp As String = TextBox1.text
        Dim med As String
        Dim Estado As Integer = 1
        Dim area As String = List1area.text
        Dim nombrepc As String = SqlDataSourcePc1.SelectCommand()
        ' Dim Tiemp As String = fecha.text
        ' Dim Hr As String = Hora.text
        ' Dim DAT As String = datetimesql.text
        ' Dim USER108 As String = "" & Page.User.Identity.Name.ToString

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


                actividad2 = "Oficina Gestión de la Información asigna como responsable a : " & Res
                Dim Evento As String = "" & solcit & "_" & temp
                LabelMsg.Text() = "Su soporte de " & nombrepc & ", se creo con el siguiente numéro " & Evento
                DataConsultas.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol, Nota, Id_Sol,Id_Job, Aud_Nov, Estado, Prioridad,Reabierto,Reasignado,Limt) VALUES (N'" & Evento & "','" & Equipos & "',GETDATE(),'" & ACTIVIDAD & "','" & med & "','" & asigna & "','" & temp & "','" & Estado & "','72','0','0','0')"
                DataConsultas.Insert()
                DataH.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES (N'" & Evento & "','" & Equipos & "','" & nombrepc & "','Pendiente',CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8),GETDATE(), 108) ,'" & area & "','" & asigna & "','" & Estado & "','3','72')"
                DataH.Insert()
                DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Solicita, NotaSolicita, Date) VALUES (N'" & Evento & "','" & med & "','" & ACTIVIDAD & "',GETDATE())"
                DataH0.Insert()

                DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & Evento & "','Oficina Gestión de la Información','" & actividad2 & "','" & temp & "')"
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
        Dim timedate22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=ASPNETDB;User ID=sa;Password=Hrd2021Gi")
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
        correo.From = New System.Net.Mail.MailAddress("noreplypach@gmail.com")
        correo.To.Add(email)

        correo.Subject = "Soporte " & nevento
        correo.Body = " Hola !!!" & vbNewLine & "" & med & "" & vbNewLine & "su soporte fue:  " & ACTIVIDAD & " " & vbNewLine & " ------- En breve sera atendida por la oficina de Gestiòn de la Informaciòn  ------"
        correo.IsBodyHtml = False
        correo.Priority = System.Net.Mail.MailPriority.Normal

        Dim smtp As New System.Net.Mail.SmtpClient

        smtp.Credentials = New System.Net.NetworkCredential("noreplypach@gmail.com", "hrdpach2021")

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
        correo2.From = New System.Net.Mail.MailAddress("noreplypach@gmail.com")

        correo2.To.Add("noreplypach@gmail.com")
        correo2.Subject = "Soporte " & nevento
        correo2.Body = " Hola el usuario " & med & " " & vbNewLine & " Creo el siguiente Soporte: " & vbNewLine & " " & ACTIVIDAD & " " & vbNewLine & " " & temp
        correo2.IsBodyHtml = False
        correo2.Priority = System.Net.Mail.MailPriority.Normal

        Dim smtp2 As New System.Net.Mail.SmtpClient

        smtp.Credentials = New System.Net.NetworkCredential("noreplypach@gmail.com", "hrdpach2021")

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
        Paneluser.visible = False

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

        If dia < 10 Then


            If Hora > -1 Then

                If Hora < 25 Then

                    If String.IsNullOrEmpty(soli) Then



                        Paneluser.visible = True
                        Nota.Visible = False
                        Label9.Visible = False
                        TextBox1().Visible = False
                        List1area.Visible = False
                        q.Visible = False
                        Label1.Visible = False
                        Codigo.Visible = False
                        Btnguardar.Visible = False


                    Else

                        panelSolicitud.Visible = True
                        Dim SQL2 As String
                        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
                        Dim Rs2 As SqlDataReader
                        Dim Com2 As New SqlCommand
                        Com2.Connection = timedate2
                        timedate2.Open()
                        SQL2 = "SELECT CONVERT (VARCHAR(10), GETDATE(), 101) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
                        Com2 = New SqlCommand(SQL2, timedate2)
                        Rs2 = Com2.ExecuteReader()
                        Rs2.Read()
                        TextBox1.Text = Rs2(0) '& SQL
                        Rs2.Close()
                        timedate2.Close()

                    End If
                Else

                    LabelMsg.Text() = "Plataforma habilitada de Lunes a Viernes desde las 08:00H hasta las 18:00H -- Oficina De Sistemas Soporte Celular 3102151554 "

                    panelSolicitud.Visible = False
                    Paneluser.visible = False
                    Nota.Visible = False
                    Label9.Visible = False
                    TextBox1().Visible = False
                    List1area.Visible = False
                    q.Visible = False
                    Label1.Visible = False
                    Codigo.Visible = False
                    Btnguardar.Visible = False

                End If
            Else
                LabelMsg.Text() = "Plataforma habilitada de Lunes a Viernes desde las 08:00H hasta las 18:00H -- Oficina De Sistemas Soporte Celular 3102151554 "


                Paneluser.visible = False
                Nota.Visible = False
                Label9.Visible = False
                TextBox1().Visible = False
                List1area.Visible = False
                q.Visible = False
                Label1.Visible = False
                Codigo.Visible = False
                Btnguardar.Visible = False


            End If

        Else
            LabelMsg.Text() = "Plataforma habilitada de Lunes a Viernes desde las 08:00H hasta las 18:00H -- Oficina De Sistemas Soporte Celular 3102151554 "
            Paneluser.visible = False
            Nota.Visible = False
            Label9.Visible = False
            TextBox1().Visible = False
            List1area.Visible = False
            q.Visible = False
            Label1.Visible = False
            Codigo.Visible = False
            Btnguardar.Visible = False
            panelSolicitud.Visible = False

        End If
      '  DataH.UpdateCommand = "UPDATE Sis_HV_Novedad SET Sis_HV_Novedad.Limt=1 , Sis_HV_Novedad.FechLimt = GETDATE() FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento where ((DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol,  CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108)) > Sis_HV_Historial.Prioridad)) and  ((Sis_HV_Novedad.Estado%2)<>0) and (Sis_HV_Historial.Prioridad<>0)"
      '  DataH.Update()
    End Sub









End Class
