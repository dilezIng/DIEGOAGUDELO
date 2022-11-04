Imports System.Drawing
Imports System.Configuration
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Mvc

Partial Class Mantenimiento_Solicitudes
    Inherits System.Web.UI.Page

    Dim Ano As Int16 = 1


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, TextBoxev.Load
        Response.AddHeader("REFRESH", "600;Solicitudes.aspx")

        If Ano = 2 Then
            Response.AddHeader("REFRESH", "1;Solicitudes.aspx")
            LabelMsg1.Visible = True
            Ano = 1
            LabelMsg1.Text = Ano

        Else

            LabelMsg1.Visible = False
        End If

        Dim Hora As String
        Panel_Info.Visible = True
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Encuesta.Visible = False

        histor.Visible = False
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        TextBoxev.Text = Rsa(0)
        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()
        ' User.Text = Page.User.Identity.Name.ToString

        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Id_Evento, case when count (Id_Evento) < 0 then 1 else 0 end, Tipo_Man from [Sis_HV_Historial]  where ((CONVERT(datetime,GETDATE(),20)) >48) and (Estado=2) group by Id_Evento,Tipo_Man "
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
        Rsa2.Read()

        If Rsa2.Read() Then
            num = Rsa2(0)
            DataNov.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & num & "','Of Infraestructura','Cierre automatico del sistema despues de 48 Hrs de ser resuelta la solicitud,  ',GETDATE()) "
            DataNov.Insert()
            DataHis.UpdateCommand = "UPDATE Sis_HV_Historial SET Sis_HV_Historial.Estado=4, Id_Cierre='Of Infraestructura', Obs_Cierre ='Cierre automatico del sistema despues de 48 Hrs de ser resuelta la solicitud' ,Aud_Time_Cierre = GETDATE()   from [dbo].[Sis_HV_Historial]  where Id_Evento= N'" & num & "'"
            DataHis.Update()

            DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Sis_HV_Novedad.Estado=4 from [dbo].[Sis_HV_Novedad]  where Id_Evento= N'" & num & "'"
            DataNov.Update()
            DataEncuesta.InsertCommand = "INSERT INTO Encuesta(Fecha, Resultado,Tipo_Man, Evento ) VALUES (GETDATE(),'5','" & Rsa2(2) & "', '" & num & "') "
            DataEncuesta.Insert()
            Rsa2.Close()
            timedatea2.Close()
        End If

        Rsa2.Close()
        timedatea2.Close()

        DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Sis_HV_Novedad.Limt=1 , Sis_HV_Novedad.FechLimt = GETDATE() FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento where ((DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol,  GETDATE()) > Sis_HV_Historial.Prioridad)) and  ((Sis_HV_Novedad.Estado%2)<>0) and (Sis_HV_Historial.Prioridad<>0)"
        DataNov.Update()

        If String.IsNullOrEmpty(Page.User.Identity.Name.ToString) Then
            Panel_Info.Visible = False
            Panel_Asignar.Visible = False
            Panel_Asignar2.Visible = False
            Label1.text = "Por favor ingrese con el usuario con que creo la solicitud"

        Else

            Dim solcit As String = Page.User.Identity.Name.ToString
            Dim sq As String
            Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
            Dim Rsa1983 As SqlDataReader
            Dim Coma123456 As New SqlCommand
            Coma123456.Connection = timd
            timd.Open()
            sq = "SELECT USUDESCRI FROM GENUSUARIO where ( USUNOMBRE = N'" & solcit & "')"
            Coma123456 = New SqlCommand(sq, timd)
            Rsa1983 = Coma123456.ExecuteReader()
            Rsa1983.Read()
            User.Text = Rsa1983(0)
            Rsa1983.Close()
            timd.Close()


        End If







    End Sub

    Protected Sub pendiente_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles pendiente.SelectedIndexChanged
        TextBox1.Text = pendiente.SelectedValue.ToString
        TextBox2.Text = pendiente.SelectedValue.ToString
        Encuesta.Visible = False
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Panel_Info.Visible = False
        LabelMsg1.Visible = False
        histor.Visible = True
    End Sub

    Protected Sub pendiente0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles pendiente0.SelectedIndexChanged
        TextBox1.Text = pendiente0.SelectedValue.ToString
        TextBox2.Text = pendiente0.SelectedValue.ToString
        '   LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = True
        Panel_Info.Visible = False
        histor.Visible = True
        Encuesta.Visible = False
        LabelMsg1.Visible = False
        Dim Even As String = pendiente0.SelectedValue.ToString
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Dim solcit As String
        Com.Connection = timedate
        timedate.Open()
        SQL = "Select Id_Evento,Id_Job From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo1.Text = Rs(0)
        solcit = Rs(1)

        Rs.Close()
        timedate.Close()


        Dim sq As String
        Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa1983 As SqlDataReader
        Dim Coma123456 As New SqlCommand
        Coma123456.Connection = timd
        timd.Open()
        sq = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & solcit & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        If Rsa1983.Read() Then
            Encargado.Text = Rsa1983(0)
            Encargado1.Text = Rsa1983(0)
        Else
            Encargado.Text = "Sin asignar"
            Encargado1.Text = "Sin asignar"
        End If
        Rsa1983.Close()
        timd.Close()





        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Com2 As New SqlCommand
        Com2.Connection = timedate2
        timedate2.Open()
        SQL2 = "Select * From Sis_HV_Historial WHERE (Id_Evento =N'" & Even & "')"
        Com2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Com2.ExecuteReader()
        Rs2.Read()
        Nota1.Text = Rs2(4)
        fentrega1.text = Rs2(5)
        Rs2.Close()
        timedate2.Close()


    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        LabelMsg1.Visible = False
        Dim Even As String = Codigo1.Text
        Dim Obser As String = Observacion1.Text
        Dim Estad As String = Estado1.Text
        Dim Temp As String = TextBoxev.Text
        Dim useer As String
        Dim dia As String
        Dim Hora As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
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
        useer = Rsa1983(0)
        Rsa1983.Close()

        If String.IsNullOrEmpty(Obser) Then
            Alarma1.Text = " Por favor hacer una observación"
            Panel_Asignar.Visible = False
            Panel_Asignar2.Visible = True
            Panel_Info.Visible = False
            histor.Visible = True

        Else
            If Estad = 1 Then
                DataHis1.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=1 , Obs_Cierre=N'" & Obser & "', Aud_Time_cierre=N'" & Temp & "', Id_Cierre=N'" & useer & "'  WHERE (Id_Evento =N'" & Even & "')"
                DataHis1.Update()

                DataNov1.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=1 WHERE (Id_Evento =N'" & Even & "')"
                DataNov1.Update()


                Encuesta.Visible = False
                Panel_Asignar.Visible = False
                Panel_Asignar2.Visible = False
                Panel_Info.Visible = True
                histor.Visible = False
                LabelMsg1.Visible = False

                Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload.FileName), Date.Now, Path.GetExtension(FileUpload.FileName))
                If Not FileUpload.PostedFile Is Nothing And FileUpload.PostedFile.ContentLength > 0 Then

                    '  fn = Evento & "_" & fn
                    Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                    Try
                        FileUpload.PostedFile.SaveAs(SaveLocation)
                        Response.Write("El archivo se adjunto con exito.")
                        DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                        DataH0.Insert()

                    Catch Exc As Exception
                        Response.Write("Error: " & Exc.Message)
                    End Try
                Else
                    '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                    DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                    DataH0.Insert()

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


                Dim nevento As String = "" & solcita & "_" & Temp
                Dim correo As New System.Net.Mail.MailMessage
                correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
                correo.To.Add(email)

                correo.Subject = "Solicitud " & Even
                correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- En breve sera atendida por la oficina de Infraestructura  ------"
                correo.IsBodyHtml = False
                correo.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp As New System.Net.Mail.SmtpClient

                smtp.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                smtp.Host = "smtp.gmail.com"
                smtp.Port = 587 '// 465 // 587
                smtp.EnableSsl = True
                Try
                    smtp.Send(correo)
                    LabelError.Text = "Mensaje enviado satisfactoriamente"
                Catch ex As Exception
                    LabelError.Text = "ERROR: " & ex.Message
                End Try

                Dim correo2 As New System.Net.Mail.MailMessage
                correo2.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")

                correo2.To.Add("ingmantenimientohrd@gmail.com")
                correo2.Subject = "Solicitud " & Even
                correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Anexo a la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                correo2.IsBodyHtml = False
                correo2.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp2 As New System.Net.Mail.SmtpClient

                smtp2.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                smtp2.Host = "smtp.gmail.com"
                smtp2.Port = 587 '// 465 // 587
                smtp2.EnableSsl = True
                Try
                    smtp2.Send(correo2)

                Catch ex As Exception
                End Try
            End If
            If Estad = 4 Then
                DataHis1.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=4 , Obs_Cierre=N'" & Obser & "', Aud_Time_cierre=N'" & Temp & "', Id_Cierre=N'" & useer & "'  WHERE (Id_Evento =N'" & Even & "')"
                DataHis1.Update()

                DataNov1.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=4 WHERE (Id_Evento =N'" & Even & "')"
                DataNov1.Update()



                Encuesta.Visible = True
                Label5.Text = Even
                Panel_Asignar.Visible = False
                Panel_Asignar2.Visible = False
                Panel_Info.Visible = False
                histor.Visible = False
                LabelMsg1.Visible = False




                Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload.FileName), Date.Now, Path.GetExtension(FileUpload.FileName))
                If Not FileUpload.PostedFile Is Nothing And FileUpload.PostedFile.ContentLength > 0 Then

                    '  fn = Evento & "_" & fn
                    Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                    Try
                        FileUpload.PostedFile.SaveAs(SaveLocation)
                        Response.Write("El archivo se adjunto con exito.")
                        DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                        DataH0.Insert()

                    Catch Exc As Exception
                        Response.Write("Error: " & Exc.Message)
                    End Try
                Else
                    '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                    DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                    DataH0.Insert()

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


                Dim nevento As String = "" & solcita & "_" & Temp
                Dim correo As New System.Net.Mail.MailMessage
                correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
                correo.To.Add(email)

                correo.Subject = "Solicitud " & Even
                correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación para el cierre fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " -------  Usted cerro esta solicitud  ------"
                correo.IsBodyHtml = False
                correo.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp As New System.Net.Mail.SmtpClient

                smtp.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                smtp.Host = "smtp.gmail.com"
                smtp.Port = 587 '// 465 // 587
                smtp.EnableSsl = True
                Try
                    smtp.Send(correo)
                    LabelError.Text = "Mensaje enviado satisfactoriamente"
                Catch ex As Exception
                    LabelError.Text = "ERROR: " & ex.Message
                End Try

                Dim correo2 As New System.Net.Mail.MailMessage
                correo2.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")

                correo2.To.Add("ingmantenimientohrd@gmail.com")
                correo2.Subject = "Solicitud " & Even
                correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Cerro la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                correo2.IsBodyHtml = False
                correo2.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp2 As New System.Net.Mail.SmtpClient

                smtp2.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                smtp2.Host = "smtp.gmail.com"
                smtp2.Port = 587 '// 465 // 587
                smtp2.EnableSsl = True
                Try
                    smtp2.Send(correo2)

                Catch ex As Exception
                End Try





            End If
            If Estad = 3 Then
                If dia > 5 Then
                    If Hora > 18 Or Hora < 8 Then
                        LabelMsg1.Visible = True
                        LabelMsg1.Text() = " No es posible atender su sulicitud en este momento "
                    Else
                        DataHis1.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=3 , Obs_Cierre=N'" & Obser & "', Aud_Time_cierre=N'" & Temp & "', Id_Cierre=N'" & useer & "'  WHERE (Id_Evento =N'" & Even & "')"
                        DataHis1.Update()

                        DataNov1.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=3, Reabierto=1 WHERE (Id_Evento =N'" & Even & "')"
                        DataNov1.Update()


                        Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload.FileName), Date.Now, Path.GetExtension(FileUpload.FileName))
                        If Not FileUpload.PostedFile Is Nothing And FileUpload.PostedFile.ContentLength > 0 Then

                            '  fn = Evento & "_" & fn
                            Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                            Try
                                FileUpload.PostedFile.SaveAs(SaveLocation)
                                Response.Write("El archivo se adjunto con exito.")
                                DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                                DataNov01.Insert()

                            Catch Exc As Exception
                                Response.Write("Error: " & Exc.Message)
                            End Try
                        Else
                            '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                            DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                            DataNov01.Insert()

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


                        Dim nevento As String = "" & solcita & "_" & Temp
                        Dim correo As New System.Net.Mail.MailMessage
                        correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
                        correo.To.Add(email)

                        correo.Subject = "Solicitud " & Even
                        correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación para Reabrir fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Usted Reabrio esta solicitud  ------"
                        correo.IsBodyHtml = False
                        correo.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp As New System.Net.Mail.SmtpClient

                        smtp.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                        smtp.Host = "smtp.gmail.com"
                        smtp.Port = 587 '// 465 // 587
                        smtp.EnableSsl = True
                        Try
                            smtp.Send(correo)
                            LabelError.Text = "Mensaje enviado satisfactoriamente"
                        Catch ex As Exception
                            LabelError.Text = "ERROR: " & ex.Message
                        End Try

                        Dim correo2 As New System.Net.Mail.MailMessage
                        correo2.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")

                        correo2.To.Add("ingmantenimientohrd@gmail.com")
                        correo2.Subject = "Solicitud " & Even
                        correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Reabrio la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                        correo2.IsBodyHtml = False
                        correo2.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp2 As New System.Net.Mail.SmtpClient

                        smtp2.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                        smtp2.Host = "smtp.gmail.com"
                        smtp2.Port = 587 '// 465 // 587
                        smtp2.EnableSsl = True
                        Try
                            smtp2.Send(correo2)

                        Catch ex As Exception
                        End Try


                        Dim correo3 As New System.Net.Mail.MailMessage
                        correo3.From = New System.Net.Mail.MailAddress("Infraestructura@hrd.gov.co")

                        correo3.To.Add("Infraestructura@hrd.gov.co")
                        correo3.Subject = "REABRIERON Solicitud " & Even
                        correo3.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Reabrio la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                        correo3.IsBodyHtml = False
                        correo3.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp3 As New System.Net.Mail.SmtpClient

                        smtp3.Credentials = New System.Net.NetworkCredential("Infraestructura@hrd.gov.co", "Adelantehrd2019")

                        smtp3.Host = "smtp.gmail.com"
                        smtp3.Port = 587 '// 465 // 587
                        smtp3.EnableSsl = True
                        Try
                            smtp3.Send(correo3)

                        Catch ex As Exception
                        End Try



                    End If
                Else
                    If Hora < 18 Or Hora > 8 Then
                        DataHis1.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=N'" & Estad & "' , Obs_Cierre=N'" & Obser & "', Aud_Time_cierre=N'" & Temp & "', Id_Cierre=N'" & useer & "'  WHERE (Id_Evento =N'" & Even & "')"
                        DataHis1.Update()

                        DataNov1.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=N'" & Estad & "', Reabierto=1 WHERE (Id_Evento =N'" & Even & "')"
                        DataNov1.Update()



                        Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload.FileName), Date.Now, Path.GetExtension(FileUpload.FileName))
                        If Not FileUpload.PostedFile Is Nothing And FileUpload.PostedFile.ContentLength > 0 Then

                            '  fn = Evento & "_" & fn
                            Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                            Try
                                FileUpload.PostedFile.SaveAs(SaveLocation)
                                Response.Write("El archivo se adjunto con exito.")
                                DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                                DataNov01.Insert()

                            Catch Exc As Exception
                                Response.Write("Error: " & Exc.Message)
                            End Try
                        Else
                            '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                            DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                            DataNov01.Insert()

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


                        Dim nevento As String = "" & solcita & "_" & Temp
                        Dim correo As New System.Net.Mail.MailMessage
                        correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
                        correo.To.Add(email)

                        correo.Subject = "Solicitud " & Even
                        correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación para reabrir fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Usted Reabrio esta solicitud  ------"
                        correo.IsBodyHtml = False
                        correo.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp As New System.Net.Mail.SmtpClient

                        smtp.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                        smtp.Host = "smtp.gmail.com"
                        smtp.Port = 587 '// 465 // 587
                        smtp.EnableSsl = True
                        Try
                            smtp.Send(correo)
                            LabelError.Text = "Mensaje enviado satisfactoriamente"
                        Catch ex As Exception
                            LabelError.Text = "ERROR: " & ex.Message
                        End Try

                        Dim correo2 As New System.Net.Mail.MailMessage
                        correo2.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")

                        correo2.To.Add("ingmantenimientohrd@gmail.com")
                        correo2.Subject = "REABRIERON Solicitud " & Even
                        correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Reabrio la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                        correo2.IsBodyHtml = False
                        correo2.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp2 As New System.Net.Mail.SmtpClient

                        smtp2.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                        smtp2.Host = "smtp.gmail.com"
                        smtp2.Port = 587 '// 465 // 587
                        smtp2.EnableSsl = True
                        Try
                            smtp2.Send(correo2)

                        Catch ex As Exception
                        End Try



                    Else


                        LabelMsg1.Visible = True
                        LabelMsg1.Text() = " No es posible atender su sulicitud en este momento "
                    End If
                End If
            End If

        End If

        Label5.Text = Even

    End Sub



    Protected Sub GridEvento2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento2.SelectedIndexChanged
        TextBox1.Text = GridEvento2.SelectedValue.ToString
        TextBox2.Text = GridEvento2.SelectedValue.ToString
        '   LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        Panel_Asignar.Visible = True
        Panel_Asignar2.Visible = False
        Panel_Info.Visible = False
        histor.Visible = True
        Encuesta.Visible = False
        LabelMsg1.Visible = False
        Dim Even As String = GridEvento2.SelectedValue.ToString
        Dim SQL As String
        Dim solcit As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand

        Com.Connection = timedate
        timedate.Open()
        SQL = "Select Id_Evento,Id_Job From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo.Text = Rs(0)
        solcit = Rs(1)


        Rs.Close()
        timedate.Close()


        Dim sq As String
        Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa1983 As SqlDataReader
        Dim Coma123456 As New SqlCommand
        Coma123456.Connection = timd
        timd.Open()
        sq = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & solcit & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        If Rsa1983.Read() Then
            Encargado.Text = Rsa1983(0)
            Encargado1.Text = Rsa1983(0)
        Else
            Encargado.Text = "Sin asignar"
            Encargado1.Text = "Sin asignar"
        End If
        Rsa1983.Close()
        timd.Close()




        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Com2 As New SqlCommand
        Com2.Connection = timedate2
        timedate2.Open()
        SQL2 = "Select * From Sis_HV_Historial WHERE (Id_Evento =N'" & Even & "')"
        Com2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Com2.ExecuteReader()
        Rs2.Read()
        Nota.Text = Rs2(4)
        fentrega.text = Rs2(5)
        Rs2.Close()
        timedate2.Close()
        Label5.Text = Even
    End Sub


    Protected Sub BtnAsignar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAsignar.Click
        LabelMsg1.Visible = False
        Dim Even As String = Codigo.Text
        Dim Obser As String = Observacion.Text
        Dim Estad As String = Estado.Text
        Dim Temp As String = TextBoxev.Text
        Dim useer As String
        Dim dia As String
        Dim Hora As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
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
        useer = Rsa1983(0)
        Rsa1983.Close()

        If String.IsNullOrEmpty(Obser) Then
            Alarma.Text = " Por favor hacer una observación"
            Panel_Asignar.Visible = True
            Panel_Asignar2.Visible = False
            Panel_Info.Visible = False
            histor.Visible = True

        Else
            If Estad = 1 Then
                DataHis.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=1 , Obs_Cierre=N'" & Obser & "', Aud_Time_cierre=N'" & Temp & "', Id_Cierre=N'" & useer & "'  WHERE (Id_Evento =N'" & Even & "')"
                DataHis.Update()

                DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=1 WHERE (Id_Evento =N'" & Even & "')"
                DataNov.Update()

                DataNov0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Solicita, NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                DataNov0.Insert()

                Encuesta.Visible = False
                Panel_Asignar.Visible = False
                Panel_Asignar2.Visible = False
                Panel_Info.Visible = True
                histor.Visible = False
                LabelMsg1.Visible = False




                Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload0.FileName), Date.Now, Path.GetExtension(FileUpload0.FileName))
                If Not FileUpload0.PostedFile Is Nothing And FileUpload0.PostedFile.ContentLength > 0 Then

                    '  fn = Evento & "_" & fn
                    Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                    Try
                        FileUpload0.PostedFile.SaveAs(SaveLocation)
                        Response.Write("El archivo se adjunto con exito.")
                        DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                        DataNov01.Insert()

                    Catch Exc As Exception
                        Response.Write("Error: " & Exc.Message)
                    End Try
                Else
                    '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                    DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                    DataNov01.Insert()

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


                Dim nevento As String = "" & solcita & "_" & Temp
                Dim correo As New System.Net.Mail.MailMessage
                correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
                correo.To.Add(email)

                correo.Subject = "Solicitud " & Even
                correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Oficina de Infraestructura HRD  ------"
                correo.IsBodyHtml = False
                correo.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp As New System.Net.Mail.SmtpClient

                smtp.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                smtp.Host = "smtp.gmail.com"
                smtp.Port = 587 '// 465 // 587
                smtp.EnableSsl = True
                Try
                    smtp.Send(correo)
                    LabelError.Text = "Mensaje enviado satisfactoriamente"
                Catch ex As Exception
                    LabelError.Text = "ERROR: " & ex.Message
                End Try

                Dim correo2 As New System.Net.Mail.MailMessage
                correo2.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")

                correo2.To.Add("ingmantenimientohrd@gmail.com")
                correo2.Subject = "Solicitud " & Even
                correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Anexo la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                correo2.IsBodyHtml = False
                correo2.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp2 As New System.Net.Mail.SmtpClient

                smtp2.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                smtp2.Host = "smtp.gmail.com"
                smtp2.Port = 587 '// 465 // 587
                smtp2.EnableSsl = True
                Try
                    smtp2.Send(correo2)

                Catch ex As Exception
                End Try



            End If
            If Estad = 4 Then
                DataHis.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=4 , Obs_Cierre=N'" & Obser & "', Aud_Time_cierre=N'" & Temp & "', Id_Cierre=N'" & useer & "'  WHERE (Id_Evento =N'" & Even & "')"
                DataHis.Update()

                DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=4 WHERE (Id_Evento =N'" & Even & "')"
                DataNov.Update()


                Encuesta.Visible = True
                Label5.Text = Even
                Panel_Asignar.Visible = False
                Panel_Asignar2.Visible = False
                Panel_Info.Visible = False
                histor.Visible = False
                LabelMsg1.Visible = False




                Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload0.FileName), Date.Now, Path.GetExtension(FileUpload0.FileName))
                If Not FileUpload0.PostedFile Is Nothing And FileUpload0.PostedFile.ContentLength > 0 Then

                    '  fn = Evento & "_" & fn
                    Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                    Try
                        FileUpload0.PostedFile.SaveAs(SaveLocation)
                        Response.Write("El archivo se adjunto con exito.")
                        DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                        DataNov01.Insert()

                    Catch Exc As Exception
                        Response.Write("Error: " & Exc.Message)
                    End Try
                Else
                    '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                    DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                    DataNov01.Insert()

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


                Dim nevento As String = "" & solcita & "_" & Temp
                Dim correo As New System.Net.Mail.MailMessage
                correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
                correo.To.Add(email)

                correo.Subject = "Solicitud " & Even
                correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación para el cierre fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Usted Cerro esta solicitud  ------"
                correo.IsBodyHtml = False
                correo.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp As New System.Net.Mail.SmtpClient

                smtp.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                smtp.Host = "smtp.gmail.com"
                smtp.Port = 587 '// 465 // 587
                smtp.EnableSsl = True
                Try
                    smtp.Send(correo)
                    LabelError.Text = "Mensaje enviado satisfactoriamente"
                Catch ex As Exception
                    LabelError.Text = "ERROR: " & ex.Message
                End Try

                Dim correo2 As New System.Net.Mail.MailMessage
                correo2.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")

                correo2.To.Add("ingmantenimientohrd@gmail.com")
                correo2.Subject = "Solicitud " & Even
                correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Cerro la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                correo2.IsBodyHtml = False
                correo2.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp2 As New System.Net.Mail.SmtpClient

                smtp2.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                smtp2.Host = "smtp.gmail.com"
                smtp2.Port = 587 '// 465 // 587
                smtp2.EnableSsl = True
                Try
                    smtp2.Send(correo2)

                Catch ex As Exception
                End Try






            End If
            If Estad = 3 Then
                If dia > 5 Then
                    If Hora > 18 Or Hora < 8 Then
                        LabelMsg1.Visible = True
                        LabelMsg1.Text() = " No es posible atender su sulicitud en este momento "
                    Else
                        DataHis.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=3 , Obs_Cierre=N'" & Obser & "', Aud_Time_cierre=N'" & Temp & "', Id_Cierre=N'" & useer & "'  WHERE (Id_Evento =N'" & Even & "')"
                        DataHis.Update()

                        DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=3, Reabierto=1 WHERE (Id_Evento =N'" & Even & "')"
                        DataNov.Update()




                        Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload0.FileName), Date.Now, Path.GetExtension(FileUpload0.FileName))
                        If Not FileUpload0.PostedFile Is Nothing And FileUpload0.PostedFile.ContentLength > 0 Then

                            '  fn = Evento & "_" & fn
                            Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                            Try
                                FileUpload0.PostedFile.SaveAs(SaveLocation)
                                Response.Write("El archivo se adjunto con exito.")
                                DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                                DataNov01.Insert()

                            Catch Exc As Exception
                                Response.Write("Error: " & Exc.Message)
                            End Try
                        Else
                            '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                            DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                            DataNov01.Insert()

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


                        Dim nevento As String = "" & solcita & "_" & Temp
                        Dim correo As New System.Net.Mail.MailMessage
                        correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
                        correo.To.Add(email)

                        correo.Subject = "Solicitud " & Even
                        correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación para reabrir fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Usted Reabrio esta solicitud  ------"
                        correo.IsBodyHtml = False
                        correo.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp As New System.Net.Mail.SmtpClient

                        smtp.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                        smtp.Host = "smtp.gmail.com"
                        smtp.Port = 587 '// 465 // 587
                        smtp.EnableSsl = True
                        Try
                            smtp.Send(correo)
                            LabelError.Text = "Mensaje enviado satisfactoriamente"
                        Catch ex As Exception
                            LabelError.Text = "ERROR: " & ex.Message
                        End Try

                        Dim correo2 As New System.Net.Mail.MailMessage
                        correo2.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")

                        correo2.To.Add("ingmantenimientohrd@gmail.com")
                        correo2.Subject = "REABRIERON Solicitud " & Even
                        correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Reabrio la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                        correo2.IsBodyHtml = False
                        correo2.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp2 As New System.Net.Mail.SmtpClient

                        smtp2.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                        smtp2.Host = "smtp.gmail.com"
                        smtp2.Port = 587 '// 465 // 587
                        smtp2.EnableSsl = True
                        Try
                            smtp2.Send(correo2)

                        Catch ex As Exception
                        End Try











                    End If
                Else
                    If Hora < 18 Or Hora > 8 Then
                        DataHis.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=N'" & Estad & "' , Obs_Cierre=N'" & Obser & "', Aud_Time_cierre=N'" & Temp & "', Id_Cierre=N'" & useer & "'  WHERE (Id_Evento =N'" & Even & "')"
                        DataHis.Update()

                        DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=N'" & Estad & "', Reabierto=1 WHERE (Id_Evento =N'" & Even & "')"
                        DataNov.Update()


                        Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload0.FileName), Date.Now, Path.GetExtension(FileUpload0.FileName))
                        If Not FileUpload0.PostedFile Is Nothing And FileUpload0.PostedFile.ContentLength > 0 Then

                            '  fn = Evento & "_" & fn
                            Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                            Try
                                FileUpload0.PostedFile.SaveAs(SaveLocation)
                                Response.Write("El archivo se adjunto con exito.")
                                DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                                DataNov01.Insert()

                            Catch Exc As Exception
                                Response.Write("Error: " & Exc.Message)
                            End Try
                        Else
                            '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                            DataNov01.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                            DataNov01.Insert()

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


                        Dim nevento As String = "" & solcita & "_" & Temp
                        Dim correo As New System.Net.Mail.MailMessage
                        correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
                        correo.To.Add(email)

                        correo.Subject = "Solicitud " & Even
                        correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación para reabrir fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Usted Reabrio esta solicitud  ------"
                        correo.IsBodyHtml = False
                        correo.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp As New System.Net.Mail.SmtpClient

                        smtp.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                        smtp.Host = "smtp.gmail.com"
                        smtp.Port = 587 '// 465 // 587
                        smtp.EnableSsl = True
                        Try
                            smtp.Send(correo)
                            LabelError.Text = "Mensaje enviado satisfactoriamente"
                        Catch ex As Exception
                            LabelError.Text = "ERROR: " & ex.Message
                        End Try

                        Dim correo2 As New System.Net.Mail.MailMessage
                        correo2.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")

                        correo2.To.Add("ingmantenimientohrd@gmail.com")
                        correo2.Subject = "REABRIERON Solicitud " & Even
                        correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Reabrio la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                        correo2.IsBodyHtml = False
                        correo2.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp2 As New System.Net.Mail.SmtpClient

                        smtp2.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

                        smtp2.Host = "smtp.gmail.com"
                        smtp2.Port = 587 '// 465 // 587
                        smtp2.EnableSsl = True
                        Try
                            smtp2.Send(correo2)

                        Catch ex As Exception
                        End Try




                    Else


                        LabelMsg1.Visible = True
                        LabelMsg1.Text() = " No es posible atender su sulicitud en este momento "
                    End If
                End If
            End If

        End If




        Label5.Text = Even

    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click

        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text
        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Tipo_Man from [Sis_HV_Historial]  where Id_Evento =N'" & Even & "'  "
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
        Rsa2.Read()
        num = Rsa2(0)
        Rsa2.Close()
        timedatea2.Close()
        DataEncuesta.InsertCommand = "INSERT INTO Encuesta(Fecha, Resultado,Tipo_Man, Evento ) VALUES ('" & temp & "','1', '" & num & "'  ,'" & Even & "' ) "
        DataEncuesta.Insert()
        histor.Visible = False
        Encuesta.Visible = False
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Panel_Info.Visible = True
        LabelMsg1.Visible = False
        Response.AddHeader("REFRESH", "5;Solicitudes.aspx")


    End Sub
    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text


        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Tipo_Man from [Sis_HV_Historial]  where Id_Evento =N'" & Even & "'  "
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
        Rsa2.Read()
        num = Rsa2(0)
        Rsa2.Close()
        timedatea2.Close()




        DataEncuesta.InsertCommand = "INSERT INTO Encuesta(Fecha, Resultado,Tipo_Man, Evento ) VALUES ('" & temp & "','2', '" & num & "'  ,'" & Even & "') "
        DataEncuesta.Insert()
        Encuesta.Visible = False
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Panel_Info.Visible = True
        LabelMsg1.Visible = False
        histor.Visible = False
        Ano = 2
    End Sub
    Protected Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton3.Click
        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text
        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Tipo_Man from [Sis_HV_Historial]  where Id_Evento =N'" & Even & "'  "
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
        Rsa2.Read()
        num = Rsa2(0)
        Rsa2.Close()
        timedatea2.Close()

        DataEncuesta.InsertCommand = "INSERT INTO Encuesta(Fecha, Resultado,Tipo_Man, Evento ) VALUES ('" & temp & "','3', '" & num & "'  ,'" & Even & "') "
        DataEncuesta.Insert()
        Encuesta.Visible = False
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Panel_Info.Visible = True
        LabelMsg1.Visible = False
        histor.Visible = False
        Response.AddHeader("REFRESH", "1;Solicitudes.aspx")

    End Sub

    Protected Sub ImageButton4_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton4.Click
        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text
        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Tipo_Man from [Sis_HV_Historial]  where Id_Evento =N'" & Even & "'  "
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
        Rsa2.Read()
        num = Rsa2(0)
        Rsa2.Close()
        timedatea2.Close()

        DataEncuesta.InsertCommand = "INSERT INTO Encuesta(Fecha, Resultado,Tipo_Man, Evento ) VALUES ('" & temp & "','4', '" & num & "'  ,'" & Even & "') "
        DataEncuesta.Insert()
        Encuesta.Visible = False
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Panel_Info.Visible = True
        LabelMsg1.Visible = False
        histor.Visible = False
        Response.AddHeader("REFRESH", "1;Solicitudes.aspx")
    End Sub
    Protected Sub ImageButton5_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton5.Click



        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text

        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Tipo_Man from [Sis_HV_Historial]  where Id_Evento =N'" & Even & "'  "
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
        Rsa2.Read()
        num = Rsa2(0)
        Rsa2.Close()
        timedatea2.Close()

        DataEncuesta.InsertCommand = "INSERT INTO Encuesta(Fecha, Resultado,Tipo_Man, Evento ) VALUES ('" & temp & "','5', '" & num & "'  ,'" & Even & "') "
        DataEncuesta.Insert()
        Encuesta.Visible = False
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Panel_Info.Visible = True
        LabelMsg1.Visible = False
        histor.Visible = False
        Response.AddHeader("REFRESH", "1;Solicitudes.aspx")
    End Sub



End Class
