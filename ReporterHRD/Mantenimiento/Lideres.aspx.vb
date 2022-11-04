Imports System.Drawing
Imports System.Configuration
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Mvc

Partial Class Lideres
    Inherits System.Web.UI.Page

    Dim updta As String = "1"


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, TextBoxev.Load

        If updta = "2" Then

            Label6.Visible = True
            '' updta = "ini"
            Label6.Text = updta + " si cambia"
            Response.AddHeader("REFRESH", "10;Lideres.aspx")

            updta = "3"
        Else

            Label6.Visible = True
            Label6.Text = updta + " no cambia"


        End If



        If updta = "3" Then

            Label6.Visible = True
            '' updta = "ini"
            Label6.Text = updta + " si cambia a 3"
            Response.AddHeader("REFRESH", "2;Lideres.aspx")


            updta = "4"
        End If

        Dim Hora As String
        Panel_Info.Visible = True
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Encuesta.Visible = False
        GridEvento2.Visible = False
        pendiente0.Visible = False
        pendiente.Visible = False

        histor.Visible = False
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT GETDATE() AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        TextBoxev.Text = Rsa(0)
        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()
        '  User.Text = Page.User.Identity.Name.ToString
        'User.Text = Page.User.Identity.IsAuthenticated.ToString
        User.Text = Page.User.Identity.Name.ToString
        Dim useer As String = Page.User.Identity.Name.ToString
        User0.text = useer

        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Id_Evento, case when count (Id_Evento) < 0 then 1 else 0 end, Tipo_Man from [Sis_HV_Historial]  where (DATEDIFF(Hour, Aud_Time_cierre, ( GETDATE())) >48) and Tipo_Man<>5 and (Estado=2) group by Id_Evento,Tipo_Man  "
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
    
        Rsa2.Close()
        timedatea2.Close()



        If String.IsNullOrEmpty(Page.User.Identity.Name.ToString) Then
            Panel_Info.Visible = False
            Panel_Asignar.Visible = False
            Panel_Asignar2.Visible = False
            Label1.text = "Por favor ingrese con el usuario de Lider de Area"

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



      '  DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Sis_HV_Novedad.Limt=1 , Sis_HV_Novedad.FechLimt = N'" & Hora & "' FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol,  CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108)) > Sis_HV_Historial.Prioridad where ((Sis_HV_Novedad.Estado%2)<>0) and Sis_HV_Historial.Prioridad<>0"
      '  DataNov.Update()


        Dim solcit6 As String = Page.User.Identity.Name.ToString
        Dim validar As Integer = 1
        Dim sq6 As String
        Dim timd6 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi;")
        Dim Rsa19836 As SqlDataReader
        Dim Coma1234566 As New SqlCommand
        Coma1234566.Connection = timd6
        timd6.Open()
        sq6 = "Select top 1 Lider From Sis_HV_Dependencias where ( Lider =  N'" & solcit6 & "')"
        Coma1234566 = New SqlCommand(sq6, timd6)
        Rsa19836 = Coma1234566.ExecuteReader()

        If Rsa19836.Read() Then
            validar = 2
        End If

        Rsa19836.Close()
        timd6.Close()




        Dim sq6q As String
        Dim timd6q As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi;")
        Dim Rsa19836q As SqlDataReader
        Dim Coma1234566q As New SqlCommand
        Coma1234566q.Connection = timd6q
        timd6q.Open()
        sq6q = "Select top 1 Colaborador From Sis_HV_Dependencias where ( Colaborador =  N'" & solcit6 & "')"
        Coma1234566q = New SqlCommand(sq6q, timd6q)
        Rsa19836q = Coma1234566q.ExecuteReader()

        If Rsa19836q.Read() Then
            validar = 2
        End If

        Rsa19836q.Close()
        timd6q.Close()

        If validar = 1 Then

            Panel_Info.Visible = False
            Panel_Asignar.Visible = False
            Panel_Asignar2.Visible = False
            Label1.text = "Por favor ingrese con el usuario de Lider de Area"

        End If

        Response.AddHeader("REFRESH", "600;Lideres.aspx")
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

    Protected Sub pendiente0_SelectedIndexChanged (ByVal sender As Object, ByVal e As System.EventArgs) Handles pendiente0.SelectedIndexChanged
      TextBox1.Text = pendiente0.SelectedValue.ToString
        TextBox2.Text = pendiente0.SelectedValue.ToString
        '   LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = True
        Panel_Info.Visible = False
        histor.Visible = True
        Encuesta.Visible = False
      '  LabelMsg1.Visible = False
        Dim Even As String = pendiente0.SelectedValue.ToString
     '   Dim SQL As String
     '   Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
     '   Dim Rs As SqlDataReader
     '   Dim Com As New SqlCommand
        Dim solcit As String
      '  Com.Connection = timedate
     '   timedate.Open()
     '   SQL = "Select Id_Evento,Id_Job From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
   '     Com = New SqlCommand(SQL, timedate)
     '   Rs = Com.ExecuteReader()
    '    Rs.Read()
       ' Codigo1.Text = Rs(0)
        'solcit = Rs(1)

     '   Rs.Close()
  '      timedate.Close()







        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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

                DataNov1.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=1  WHERE (Id_Evento =N'" & Even & "')"
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
                correo.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")
                correo.To.Add(email)

                correo.Subject = "Solicitud " & Even
                correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- En breve sera atendida por la oficina de Sistemas  ------"
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
                    LabelError.Text = "ERROR: " & ex.Message
                End Try

                Dim correo2 As New System.Net.Mail.MailMessage
                correo2.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")

                correo2.To.Add("noreply@hrd.gov.co")
                correo2.Subject = "Solicitud " & Even
                correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Anexo a la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                correo2.IsBodyHtml = False
                correo2.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp2 As New System.Net.Mail.SmtpClient

                smtp2.Credentials = New System.Net.NetworkCredential("noreply@hrd.gov.co", "123456QWERTY")

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
                correo.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")
                correo.To.Add(email)

                correo.Subject = "Solicitud " & Even
                correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación para el cierre fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " -------  Usted cerro esta solicitud  ------"
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
                    LabelError.Text = "ERROR: " & ex.Message
                End Try

                Dim correo2 As New System.Net.Mail.MailMessage
                correo2.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")

                correo2.To.Add("noreply@hrd.gov.co")
                correo2.Subject = "Solicitud " & Even
                correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Cerro la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                correo2.IsBodyHtml = False
                correo2.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp2 As New System.Net.Mail.SmtpClient

                smtp2.Credentials = New System.Net.NetworkCredential("noreply@hrd.gov.co", "123456QWERTY")

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
                        DataHis1.UpdateCommand = "UPDATE Sis_HV_Historial SET Estado=3, Obs_Cierre=N'" & Obser & "', Aud_Time_cierre=N'" & Temp & "', Id_Cierre=N'" & useer & "'  WHERE (Id_Evento =N'" & Even & "')"
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
                                DataNov1.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                                DataNov1.Insert()

                            Catch Exc As Exception
                                Response.Write("Error: " & Exc.Message)
                            End Try
                        Else
                            '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                            DataNov1.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                            DataNov1.Insert()

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
                        correo.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")
                        correo.To.Add(email)

                        correo.Subject = "Solicitud " & Even
                        correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación para Reabrir fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Usted Reabrio esta solicitud  ------"
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
                            LabelError.Text = "ERROR: " & ex.Message
                        End Try

                        Dim correo2 As New System.Net.Mail.MailMessage
                        correo2.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")

                        correo2.To.Add("noreply@hrd.gov.co")
                        correo2.Subject = "Solicitud " & Even
                        correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Reabrio la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                        correo2.IsBodyHtml = False
                        correo2.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp2 As New System.Net.Mail.SmtpClient

                        smtp2.Credentials = New System.Net.NetworkCredential("noreply@hrd.gov.co", "123456QWERTY")

                        smtp2.Host = "smtp.gmail.com"
                        smtp2.Port = 587 '// 465 // 587
                        smtp2.EnableSsl = True
                        Try
                            smtp2.Send(correo2)

                        Catch ex As Exception
                        End Try


                        Dim correo3 As New System.Net.Mail.MailMessage
                        correo3.From = New System.Net.Mail.MailAddress("sistemas@hrd.gov.co")

                        correo3.To.Add("sistemas@hrd.gov.co")
                        correo3.Subject = "REABRIERON Solicitud " & Even
                        correo3.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Reabrio la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                        correo3.IsBodyHtml = False
                        correo3.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp3 As New System.Net.Mail.SmtpClient

                        smtp3.Credentials = New System.Net.NetworkCredential("sistemas@hrd.gov.co", "Adelantehrd2019")

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
                                DataNov1.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                                DataNov1.Insert()

                            Catch Exc As Exception
                                Response.Write("Error: " & Exc.Message)
                            End Try
                        Else
                            '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                            DataNov1.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                            DataNov1.Insert()

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
                        correo.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")
                        correo.To.Add(email)

                        correo.Subject = "Solicitud " & Even
                        correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación para reabrir fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Usted Reabrio esta solicitud  ------"
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
                            LabelError.Text = "ERROR: " & ex.Message
                        End Try

                        Dim correo2 As New System.Net.Mail.MailMessage
                        correo2.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")

                        correo2.To.Add("noreply@hrd.gov.co")
                        correo2.Subject = "Solicitud " & Even
                        correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Reabrio la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                        correo2.IsBodyHtml = False
                        correo2.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp2 As New System.Net.Mail.SmtpClient

                        smtp2.Credentials = New System.Net.NetworkCredential("noreply@hrd.gov.co", "123456QWERTY")

                        smtp2.Host = "smtp.gmail.com"
                        smtp2.Port = 587 '// 465 // 587
                        smtp2.EnableSsl = True
                        Try
                            smtp2.Send(correo2)

                        Catch ex As Exception
                        End Try


                        Dim correo3 As New System.Net.Mail.MailMessage
                        correo3.From = New System.Net.Mail.MailAddress("sistemas@hrd.gov.co")

                        correo3.To.Add("sistemas@hrd.gov.co")
                        correo3.Subject = "REABRIERON Solicitud " & Even
                        correo3.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Reabrio la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                        correo3.IsBodyHtml = False
                        correo3.Priority = System.Net.Mail.MailPriority.Normal

                        Dim smtp3 As New System.Net.Mail.SmtpClient

                        smtp3.Credentials = New System.Net.NetworkCredential("sistemas@hrd.gov.co", "Adelantehrd2019")

                        smtp3.Host = "smtp.gmail.com"
                        smtp3.Port = 587 '// 465 // 587
                        smtp3.EnableSsl = True
                        Try
                            smtp3.Send(correo3)

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


        If updta = "2" Then

            Label6.Visible = True
            '      Label6.Text = updta + " si cambia"
            Response.AddHeader("REFRESH", "10;Lideres.aspx")

            updta = "2"
        Else

            Label6.Visible = True
            ' Label6.Text = updta + " no cambia "

            updta = "2"
        End If

        Response.AddHeader("REFRESH", "10;Lideres.aspx")


    End Sub



    Protected Sub GridEvento2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento2.SelectedIndexChanged
        TextBox1.Text = GridEvento2.SelectedValue.ToString
        TextBox2.Text = GridEvento2.SelectedValue.ToString

        Panel_Asignar.Visible = True
        Panel_Asignar2.Visible = False
        Panel_Info.Visible = False
        histor.Visible = True
        Encuesta.Visible = False
        LabelMsg1.Visible = False
        Dim Even As String = GridEvento2.SelectedValue.ToString
        Dim SQL As String
        Dim solcit As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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

        Response.AddHeader("REFRESH", "5;Lideres.aspx")


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

                '  DataNov0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Solicita, NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                '   DataNov0.Insert()

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
                        DataNov1.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date, Archivo) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "','" & fn & "')"
                        DataNov1.Insert()

                    Catch Exc As Exception
                        Response.Write("Error: " & Exc.Message)
                    End Try
                Else
                    '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                    DataNov1.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Solicita,NotaSolicita,Date) VALUES (N'" & Even & "','" & useer & "','" & Obser & "','" & Temp & "')"
                    DataNov1.Insert()

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
                correo.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")
                correo.To.Add(email)

                correo.Subject = "Solicitud " & Even
                correo.Body = " Hola !!!" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & useer & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Su observación fue:  " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Oficina de Sistemas HRD  ------"
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
                    LabelError.Text = "ERROR: " & ex.Message
                End Try

                Dim correo2 As New System.Net.Mail.MailMessage
                correo2.From = New System.Net.Mail.MailAddress("noreply@hrd.gov.co")

                correo2.To.Add("noreply@hrd.gov.co")
                correo2.Subject = "Solicitud " & Even
                correo2.Body = " Hola el usuario " & useer & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " Anexo la Solicitud: " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Obser & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " " & Temp
                correo2.IsBodyHtml = False
                correo2.Priority = System.Net.Mail.MailPriority.Normal

                Dim smtp2 As New System.Net.Mail.SmtpClient

                smtp2.Credentials = New System.Net.NetworkCredential("noreply@hrd.gov.co", "123456QWERTY")

                smtp2.Host = "smtp.gmail.com"
                smtp2.Port = 587 '// 465 // 587
                smtp2.EnableSsl = True
                Try
                    smtp2.Send(correo2)

                Catch ex As Exception
                End Try



            End If



        End If




        Label5.Text = Even
        updta = "2"


    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click

        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text
        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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

        updta = "2"
        Response.AddHeader("REFRESH", "3;Lideres.aspx")
    End Sub
    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text


        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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
        updta = "2"
        Response.AddHeader("REFRESH", "3;Lideres.aspx")

    End Sub
    Protected Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton3.Click
        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text
        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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

        updta = "2"
        Response.AddHeader("REFRESH", "3;Lideres.aspx")
    End Sub

    Protected Sub ImageButton4_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton4.Click
        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text
        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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

        updta = "2"
        Response.AddHeader("REFRESH", "3;Lideres.aspx")

    End Sub
    Protected Sub ImageButton5_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton5.Click



        Dim temp As String = TextBoxev.Text
        Dim Even As String = Label5.Text

        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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

        updta = "2"
        Response.AddHeader("REFRESH", "3;Lideres.aspx")

    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Panel_Info.Visible = True
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Encuesta.Visible = False
        GridEvento2.Visible = True
        pendiente0.Visible = False
        pendiente.Visible = False
        Panel23.Visible = True
        Panel1.Visible = False
        Panel2.Visible = False
    End Sub
    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Panel_Info.Visible = True
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Encuesta.Visible = False
        GridEvento2.Visible = False
        pendiente0.Visible = True
        pendiente.Visible = False
        Panel23.Visible = False
        Panel1.Visible = True
        Panel2.Visible = False

    End Sub
    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Panel_Info.Visible = True
        Panel_Asignar.Visible = False
        Panel_Asignar2.Visible = False
        Encuesta.Visible = False
        GridEvento2.Visible = False
        pendiente0.Visible = False
        pendiente.Visible = True
        Panel23.Visible = False
        Panel1.Visible = False
        Panel2.Visible = True
    End Sub
End Class
