


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








            Dim asigna As String
            Dim actividad2 As String
            Dim sq22 As String
            Dim timd22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
            Dim Rsa198322 As SqlDataReader
            Dim Coma12345622 As New SqlCommand
            Coma12345622.Connection = timd22
            timd22.Open()
            sq22 = "SELECT top 1 Id_Job FROM Sis_HV_Historial where (Id_Job like '%AMA%') order by Id desc"
            Coma12345622 = New SqlCommand(sq22, timd22)
            Rsa198322 = Coma12345622.ExecuteReader()
            Rsa198322.Read()
            asigna = Rsa198322(0)

            Rsa198322.Close()
            timd22.Close()

           

asigna = "AMA005"
          

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


            actividad2 = "Of Infraestructura asigna como responsable a : " & Res

            LabelMsg.Text() = "Su solicitud de " & nombrepc & ", se creo con el siguiente numéro " & Evento
            DataConsultas.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol, Nota, Id_Sol,Id_Job, Aud_Nov, Estado, Prioridad,Reabierto,Reasignado) VALUES (N'" & Evento & "','" & Equipos & "',GETDATE(),'" & ACTIVIDAD & "','" & med & "','" & asigna & "','" & temp & "','" & Estado & "','192','0','0')"
            DataConsultas.Insert()
            DataH.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES (N'" & Evento & "','" & Equipos & "','" & nombrepc & "','Pendiente',CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8),GETDATE(), 108) ,'" & area & "','" & asigna & "','" & Estado & "','3','192')"
            DataH.Insert()
            DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Solicita, NotaSolicita, Date) VALUES (N'" & Evento & "','" & med & "','" & ACTIVIDAD & "','" & temp & "')"
            DataH0.Insert()

            DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & Evento & "','Of Infraestructura','" & actividad2 & "','" & temp & "')"
            DataH0.Insert()




            LabelMsg.Text() = "Su solicitud se creo con el siguiente numéro: " & Evento & "    " & fn


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
            correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
            correo.To.Add(email)

            correo.Subject = "Solicitud " & nevento
            correo.Body = " Hola !!!" & vbNewLine & "" & med & "" & vbNewLine & "Su solicitud fue:  " & ACTIVIDAD & " " & vbNewLine & " ------- En breve sera atendida por la oficina de Infraestructura  ------"
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
                '  LabelError.Text = "ERROR: " & ex.Message
            End Try

            Dim correo2 As New System.Net.Mail.MailMessage
            correo2.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")

            correo2.To.Add("ingmantenimientohrd@gmail.com")
            correo2.Subject = "Solicitud " & nevento
            correo2.Body = " Hola el usuario " & med & " " & vbNewLine & " Creo la siguiente Solicitud: " & vbNewLine & " " & ACTIVIDAD & " " & vbNewLine & " " & temp
            correo2.IsBodyHtml = False
            correo2.Priority = System.Net.Mail.MailPriority.Normal

            Dim smtp2 As New System.Net.Mail.SmtpClient

            smtp.Credentials = New System.Net.NetworkCredential("ingmantenimientohrd@gmail.com", "123456789HRD")

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
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=ASPNETDB;User ID=sa;Password=Hrd2021Gi")
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

        If dia < 25 Then


            If Hora >= 0 Then

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
                        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=ASPNETDB;User ID=sa;Password=Hrd2021Gi")
                        Dim Rs2 As SqlDataReader
                        Dim Com2 As New SqlCommand
                        Com2.Connection = timedate2
                        timedate2.Open()
                        SQL2 = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
                        Com2 = New SqlCommand(SQL2, timedate2)
                        Rs2 = Com2.ExecuteReader()
                        Rs2.Read()
                        TextBox1.Text = Rs2(0) '& SQL
                        Rs2.Close()
                        timedate2.Close()

                    End If
                Else
                    LabelMsg.Visible = True
                    LabelMsg.Text() = "Plataforma habilitada las 24 Horas -- Oficina De Infraestructura Soporte celular 3157810230 "

                    panelSolicitud.Visible = False
                    Paneluser.visible = False
                    '   Nota.Visible = False
                    '   Label9.Visible = False
                    '   TextBox1().Visible = False
                    ''   List1area.Visible = False
                    '   q.Visible = False
                    '  Label1.Visible = False
                    '  Codigo.Visible = False
                    '  Btnguardar.Visible = False

                End If
            Else
                LabelMsg.Visible = True
                LabelMsg.Text() = "Plataforma habilitada las 24 Horas -- Oficina De Infraestructura Soporte celular 3157810230 "
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
            LabelMsg.Text() = "Plataforma habilitada las 24 Horas -- Oficina De Infraestructura Soporte celular 3157810230 "
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

            Label11.Visible = True
            Label11.Text() = "                         Plataforma habilitada las 24 Horas -- Oficina De Infraestructura Soporte celular 3157810230 "
        End If
        If Hora < 8 Then
            Label11.Visible = True
            Label11.Text() = "                         Plataforma habilitada las 24 Horas -- Oficina De Infraestructura Soporte celular 3157810230 "
        End If
        If Hora > 17 Then

            Label11.Visible = True
            Label11.Text() = "                         Plataforma habilitada las 24 Horas -- Oficina De Infraestructura Soporte celular 3157810230 "
        End If


    End Sub









End Class
