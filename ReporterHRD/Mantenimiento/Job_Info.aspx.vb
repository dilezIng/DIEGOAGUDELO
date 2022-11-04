


Imports System.Drawing
Imports System.Configuration
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web




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
        Dim nombrepc As String = Codigo.text




        If String.IsNullOrEmpty(Nota.Text) Or area = "_" Then
            notavalida.Text = "No puede dejar campos blanco " & med
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
            Dim Evento As String = "" & solcit & "_" & temp

            DataConsultas.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol, Nota, Id_Sol,Id_Job, Aud_Nov, Estado, Prioridad,Reabierto,Reasignado,Limt) VALUES (N'" & Evento & "','" & Equipos & "',GETDATE() ,'" & ACTIVIDAD & "','" & med & "','Pendiente','" & temp & "','" & Estado & "','0','0','0','0')"
            DataConsultas.Insert()
            DataH.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado, Prioridad) VALUES (N'" & Evento & "','" & Equipos & "','" & nombrepc & "','Pendiente',CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8),GETDATE(), 108),'" & area & "','Pendiente','" & Estado & "','0')"
            DataH.Insert()

            Nota.Visible = False
            Label9.Visible = False
            TextBox1().Visible = False
            List1area.Visible = False
            q.Visible = False
            Label1.Visible = False
            Codigo.Visible = False
            Btnguardar.Visible = False
            FileUpload.Visible = False

            Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload.FileName), Date.Now, Path.GetExtension(FileUpload.FileName))
            If Not FileUpload.PostedFile Is Nothing And FileUpload.PostedFile.ContentLength > 0 Then

                '  fn = Evento & "_" & fn
                Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                Try
                    FileUpload.PostedFile.SaveAs(SaveLocation)
                    Response.Write("El archivo se adjunto con exito.")
                    DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Evento & "','" & med & "','" & ACTIVIDAD & "','" & temp & "','" & fn & "')"
                    DataH0.Insert()

                Catch Exc As Exception
                    Response.Write("Error: " & Exc.Message)
                End Try
            Else
                '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Evento & "','" & med & "','" & ACTIVIDAD & "','" & temp & "')"
                DataH0.Insert()

            End If

            LabelMsg.Text() = "Su soporte se creo con el siguiente numéro: " & Evento & "    " & fn


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
            correo.Body = " Hola !!!" & vbNewLine & "" & med & "" & vbNewLine & "Su soporte fue:  " & ACTIVIDAD & " " & vbNewLine & " ------- En breve sera atendida por la oficina de Gestiòn de la Informaciòn ------"
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
                smtp2.Send(correo2)

            Catch ex As Exception
            End Try

        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, TextBox1.Load, DataTime.Load
        LabelMsg.Visible = True
        panelSolicitud.Visible = False
        Paneluser.visible = False

        Dim soli As String = Page.User.Identity.Name.ToString
        Dim dia As String
        Dim Hora As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT DATEPART(hour,  GETDATE()) AS DatePartInt, DATEPART(dw,  GETDATE()) AS DatePartInt2"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        dia = Rs(1) '& SQL
        Hora = Rs(0)

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
                        SQL2 = "select CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8),GETDATE(), 108)"
                        Com2 = New SqlCommand(SQL2, timedate2)
                        Rs2 = Com2.ExecuteReader()
                        Rs2.Read()
                        TextBox1.Text = Rs2(0) '& SQL
                        Rs2.Close()
                        timedate2.Close()

                    End If
                Else
                    LabelMsg.Visible = True
                    LabelMsg.Text() = "                         Plataforma habilitada Las 24 Horas -- Oficina De Sistemas Soporte Celular 3102151554 "

                    panelSolicitud.Visible = False
                    Paneluser.visible = False


                End If
            Else
                LabelMsg.Visible = True
                LabelMsg.Text() = "                         Plataforma habilitada Las 24 Horas -- Oficina De Sistemas Soporte Celular 3102151554 "
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
            LabelMsg.Visible = True
            LabelMsg.Text() = "                         Plataforma habilitada Las 24 Horas -- Oficina De Sistemas Soporte Celular 3102151554 "
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

        If dia > 5 Then

            Label6.Visible = True
            Label6.Text() = "                         Plataforma habilitada Las 24 Horas -- Oficina De Sistemas Soporte Celular 3102151554 "
        End If
        If Hora < 8 Then
            Label6.Visible = True
            Label6.Text() = "                         Plataforma habilitada Las 24 Horas -- Oficina De Sistemas Soporte Celular 3102151554 "
        End If
        If Hora > 17 Then

            Label6.Visible = True
            Label6.Text() = "                         Plataforma habilitada Las 24 Horas -- Oficina De Sistemas Soporte Celular 3102151554 "
        End If

    End Sub

End Class
