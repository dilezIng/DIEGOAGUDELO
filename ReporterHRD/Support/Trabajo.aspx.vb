﻿Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI.WebControls

Public Class Mantenimiento_Trabajo
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, TextBox1.Load, DataTime.Load, TextBoxev.load

        Dim MAN As String = "MAN"
        Dim man2 As String = "man"
        Dim AMA As String = "AMA"
        Dim ama2 As String = "ama"
        Dim useer As String = Page.User.Identity.Name.ToString
        Dim caracteres As String

        If String.IsNullOrEmpty(useer) Then

            History.Visible = False
            Panelmantenimiento.Visible = False
            Panel_evento.Visible = False
            oo.Visible = False
            TabContainer1.Visible = False
            Label2.Text = "   <<<<---- Usuario sin autorización ---->>>>"

        Else
            caracteres = useer.Substring(0, 3)
        End If

        If caracteres = MAN Then
            History.Visible = False
            Panelmantenimiento.Visible = False
            Panel_evento.Visible = True
            oo.Visible = True

        ElseIf caracteres = man2 Then
            History.Visible = False
            Panelmantenimiento.Visible = False
            Panel_evento.Visible = True
            oo.Visible = True

        End If

        If caracteres = AMA Then
            History.Visible = False
            Panelmantenimiento.Visible = False
            Panel_evento.Visible = True
            oo.Visible = True
        ElseIf caracteres = ama2 Then
            History.Visible = False
            Panelmantenimiento.Visible = False
            Panel_evento.Visible = True
            oo.Visible = True

        End If


 If caracteres = "sua" Then
            History.Visible = False
            Panelmantenimiento.Visible = False
            Panel_evento.Visible = True
            oo.Visible = True
        ElseIf caracteres = "SUA" Then
            History.Visible = False
            Panelmantenimiento.Visible = False
            Panel_evento.Visible = True
            oo.Visible = True

        End If





        If caracteres <> AMA Then
            If caracteres <> ama2 Then
                If caracteres <> MAN Then
                    If caracteres <> man2 Then
                        History.Visible = False
                        Panelmantenimiento.Visible = False
                        Panel_evento.Visible = False
                        oo.Visible = False
                        TabContainer1.Visible = False
                        Label2.Text = "   <<<<---- Usuario sin autorización ---->>>>"
                    End If
                End If
            End If




        End If



        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        TextBox1.Text = Rs(0)
        Rs.Close()
        timedate.Close()
        Dim Hora As String
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
        User.Text = Page.User.Identity.Name.ToString
        User0.Text = Page.User.Identity.Name.ToString
        User2.Text = Page.User.Identity.Name.ToString

        LabelEstadoForm4.Text = " " + GridEvento.Rows.Count.ToString
        LabelEstadoForm1.Text = " " + GridEvento2.Rows.Count.ToString
        Label3.Text = "  " + Gridopen.Rows.Count.ToString
        LabelEstadoForm3.Text = " " + pendiente.Rows.Count.ToString + " Terminados " + GridView3.Rows.Count.ToString


        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Id_Evento, case when count (Id_Evento) < 0 then 1 else 0 end, Tipo_Man from [Sis_HV_Historial]  where ((CONVERT(datetime,GETDATE(),20)) >48) and (Estado=2) group by Id_Evento,Tipo_Man  "
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
        Rsa2.Read()

        If Rsa2.Read() Then
            num = Rsa2(0)
            DataNov.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & num & "','Of Infraestructura','Cierre automatico del sistema despues de 48 Hrs de ser resuelta la solicitud,  ','" & Hora & "') "
            DataNov.Insert()
            DataHis.UpdateCommand = "UPDATE Sis_HV_Historial SET Sis_HV_Historial.Estado=4, Id_Cierre ='Of Infraestructura', Obs_Cierre ='Cierre automatico del sistema despues de 48 Hrs de ser resuelta la solicitud' ,Aud_Time_Cierre = N'" & Hora & "'   from [dbo].[Sis_HV_Historial]  where Id_Evento= N'" & num & "'"
            DataHis.Update()

            DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Sis_HV_Novedad.Estado=4 from [dbo].[Sis_HV_Novedad]  where Id_Evento= N'" & num & "'"
            DataNov.Update()


            DataHis.InsertCommand = "INSERT INTO Encuesta(Fecha, Resultado,Tipo_Man, Evento ) VALUES (GETDATE(),'5','" & Rsa2(2) & "', '" & num & "') "
            DataHis.Insert()

            Rsa2.Close()
            timedatea2.Close()
        End If

        Rsa2.Close()
        timedatea2.Close()

       ' DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Sis_HV_Novedad.Limt=1 , Sis_HV_Novedad.FechLimt = CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8),GETDATE(), 108)  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol,  CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108)) > Sis_HV_Historial.Prioridad where Sis_HV_Novedad.Estado<4 and Sis_HV_Historial.Prioridad<>0"
        'DataNov.Update()
    End Sub

    Protected Sub Btnguardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnguardar.Click



        If String.IsNullOrEmpty(Nota.text) Then
            notavalida.text = "No puede dejar campos en blanco"
            Panel_evento.Visible = False 'True
            Panelmantenimiento.Visible = True 'False
        Else

            Dim Even As String = Labelevent.Text
            Dim Act As String = Nota.text

            Dim Aud As String = TextBoxev.text
            Dim Estado As Integer = ListEstado.Text
            Dim reali As String
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
            reali = Rsa1983(0)
            Rsa1983.Close()
            timd.Close()


            LabelMsg().Text = "Evento Registrado: " & Even & " Fecha cierre del Evento: " & Aud
            DataConsultas.UpdateCommand = "UPDATE Sis_HV_Historial SET Actividad=N'" & Act & "', Fech_En =N'" & Aud & "',Aud_Time_Act =N'" & Aud & "', Estado=" & Estado & " WHERE (Id_Evento =N'" & Even & "')"
            DataConsultas.Update()
            Dataevent.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=" & Estado & " WHERE (Id_Evento =N'" & Even & "')"
            Dataevent.Update()

            Panel_evento.Visible = True
            Panelmantenimiento.Visible = False


            Dim fn As String = String.Format("{1:yyyyMMdd_hhmmss}.{2}", Path.GetFileNameWithoutExtension(FileUpload.FileName), Date.Now, Path.GetExtension(FileUpload.FileName))
            If Not FileUpload.PostedFile Is Nothing And FileUpload.PostedFile.ContentLength > 0 Then

                '  fn = Evento & "_" & fn
                Dim SaveLocation As String = Server.MapPath("Documentos") & "/" & fn
                Try
                    FileUpload.PostedFile.SaveAs(SaveLocation)
                    Response.Write("El archivo se adjunto con exito.")
                    Dataevent0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Realiza, NotaRealiza,Date, Archivo) VALUES (N'" & Even & "','" & reali & "','" & Act & "','" & Aud & "','" & fn & "')"
                    Dataevent0.Insert()

                Catch Exc As Exception
                    Response.Write("Error: " & Exc.Message)
                End Try
            Else
                '  Response.Write("Por favor seleccione el archivo a adjuntar.")
                Dataevent0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,Realiza, NotaRealiza,Date) VALUES (N'" & Even & "','" & reali & "','" & Act & "','" & Aud & "')"
                Dataevent0.Insert()

            End If



            Dim solcita As String
            Dim SQL As String
            Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
            Dim Rs As SqlDataReader
            Dim Com As New SqlCommand
            Com.Connection = timedate
            timedate.Open()
            SQL = "Select Id_Sol From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
            Com = New SqlCommand(SQL, timedate)
            Rs = Com.ExecuteReader()
            Rs.Read()
            solcita = Rs(0)
            Rs.Close()
            timedate.Close()


            Dim solcita2 As String
            Dim sq223 As String
            Dim timd2 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
            Dim Rsa19832 As SqlDataReader
            Dim Coma1234562 As New SqlCommand
            Coma1234562.Connection = timd2
            timd2.Open()
            sq223 = "SELECT USUNOMBRE FROM GENUSUARIO where ( USUDESCRI = N'" & solcita & "')"
            Coma1234562 = New SqlCommand(sq223, timd2)
            Rsa19832 = Coma1234562.ExecuteReader()
            Rsa19832.Read()
            solcita2 = Rsa19832(0)
            Rsa19832.Close()
            timd2.Close()


            Dim email As String
            Dim SQL22 As String
            Dim timedate22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=ASPNETDB;User ID=sa;Password=Hrd2021Gi")
            Dim Rs22 As SqlDataReader
            Dim C22 As New SqlCommand
            C22.Connection = timedate22
            timedate22.Open()
            SQL22 = "Select aspnet_Membership.email From aspnet_Users inner join aspnet_Membership on aspnet_Users.UserId =  aspnet_Membership.userId where aspnet_Users.UserName = N'" & solcita2 & "' "
            C22 = New SqlCommand(SQL22, timedate22)
            Rs22 = C22.ExecuteReader()
            Rs22.Read()

            email = Rs22(0)
            Rs22.Close()
            timedate22.Close()


            ' Dim nevento As String = "" & solcita & "_" & Temp
            Dim correo As New System.Net.Mail.MailMessage
            correo.From = New System.Net.Mail.MailAddress("ingmantenimientohrd@gmail.com")
            correo.To.Add(email)

            correo.Subject = "Solicitud " & Even
            correo.Body = "Buen día " & vbNewLine & " " & vbNewLine & "" & vbNewLine & "" & reali & "" & vbNewLine & " " & vbNewLine & "" & vbNewLine & "Contesto a su colicitud :  " & Act & " " & vbNewLine & " " & vbNewLine & "" & vbNewLine & " ------- Oficina de Infraestructura HRD  ------"
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

        End If

        Response.AddHeader("REFRESH", "1;Trabajo.aspx")




    End Sub

    Protected Sub pendiente_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles pendiente.SelectedIndexChanged

        History.Visible = True
        oo.Visible = False
        TextBox2.Text = pendiente.SelectedValue.ToString
        Labelevent.Text = pendiente.SelectedValue.ToString

        LabelMsg.Text() = "" & pendiente.SelectedValue.ToString
        Panelmantenimiento.Visible = False
        Panel_evento.Visible = False

    End Sub

    Protected Sub GridView3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView3.SelectedIndexChanged

        History.Visible = True
        oo.Visible = False
        TextBox2.Text = GridView3.SelectedValue.ToString
        Labelevent.Text = GridView3.SelectedValue.ToString

        LabelMsg.Text() = "" & GridView3.SelectedValue.ToString
        Panelmantenimiento.Visible = False
        Panel_evento.Visible = False

    End Sub



    Protected Sub GridEvento_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento.SelectedIndexChanged
        History.Visible = True
        TextBox2.Text = GridEvento.SelectedValue.ToString
        Labelevent.Text = GridEvento.SelectedValue.ToString

        LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        Panelmantenimiento.Visible = True
        Panel_evento.Visible = False
        Dim Even As String = Labelevent.Text
        Dim solcit As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "Select Id_Equipo, Id_Sol From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo.Text = Rs(0)
        Codigo2.Text = Rs(0)
        solcit = Rs(1)
        Label4.text = Rs(1)
        Rs.Close()
        timedate.Close()



        ' Response.Redirect("/Infraestructura/Bitacora_PMP/PaginaBase.aspx")


    End Sub
    Protected Sub GridEvento2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento2.SelectedIndexChanged
        History.Visible = True
        TextBox2.Text = GridEvento2.SelectedValue.ToString
        Labelevent.Text = GridEvento2.SelectedValue.ToString

        LabelMsg.Text() = "" & GridEvento2.SelectedValue.ToString
        Panelmantenimiento.Visible = True
        Panel_evento.Visible = False

        Dim Even As String = Labelevent.Text
        Dim solcit As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand

        Com.Connection = timedate
        timedate.Open()
        SQL = "Select Id_Equipo, Id_Sol From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo.Text = Rs(0)
        Codigo2.Text = Rs(0)
        solcit = Rs(1)
        Label4.text = Rs(1)
        Rs.Close()
        timedate.Close()




        '  Response.Redirect("/Infraestructura/Bitacora_PMP/PaginaBase.aspx")

    End Sub

    Protected Sub Gridopen_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Gridopen.SelectedIndexChanged
        History.Visible = True

        Labelevent.Text = Gridopen.SelectedValue.ToString
        TextBox2.Text = Gridopen.SelectedValue.ToString

        LabelMsg.Text() = "" & Gridopen.SelectedValue.ToString
        Panelmantenimiento.Visible = True
        Panel_evento.Visible = False
        Dim Even As String = Labelevent.Text
        Dim solcit As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DBSUPPORT;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand

        Com.Connection = timedate
        timedate.Open()
        SQL = "Select Id_Equipo, Id_Sol From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo.Text = Rs(0)
        Codigo2.Text = Rs(0)
        solcit = Rs(1)
        Label4.text = Rs(1)
        Rs.Close()
        timedate.Close()



    End Sub

End Class