Imports System.Drawing
Imports System.Configuration
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Mvc

Partial Class Mantenimiento_Asignacion_Asignacion
    Inherits System.Web.UI.Page

Protected Sub BtnExportar2_Click(sender As Object, e As System.EventArgs) Handles BtnExportar2.Click

        pendiente.AllowPaging = False
        pendiente.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            pendiente.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(pendiente)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=PARA FIRMA DE APROBACIÒN.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

    End Try
        pendiente.AllowPaging = True



    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, TextBoxev.Load
        Dim i As Integer
        Dim f As Integer
        Dim oo As Integer
        Dim Hora As String
        NOVHIS.visible = False
        Panel_Info.Visible = True
        Panel_Asignar.Visible = False
        Paprobados.Visible = True
        Paprobar.Visible = True
        LabelEstadoForm4.Text = " " + GridEvento.Rows.Count.ToString
        LabelEstadoForm1.Text = " " + GridEvento2.Rows.Count.ToString
        Label1.Text = " " + Gridopen.Rows.Count.ToString
        LabelEstadoForm3.Text = pendiente.Rows.Count.ToString
        Label2.Text = " " + GridView1.Rows.Count.ToString
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=5454;User ID=sa;Password=Hrd2021Gi")
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

      
        Dim num As String
        Dim SQLa2 As String
        Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=5454;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Id_Evento,  Tipo_Man from [Sis_HV_Historial]  where (datediff(hour,(CONVERT(datetime,Fech_En,103)),(CONVERT(datetime,GETDATE(),20)))>48) and (Estado=2) and Tipo_Man <>5"
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
        Rsa2.Read()

	  
		  
		  
		     If Rsa2.Read() Then
            num = Rsa2(0)
            DataNov.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & num & "','Of Infraestructura','Cierre automatico del sistema despues de 48 Hrs de ser resuelta la solicitud',( CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) ) ) "
            DataNov.Insert()
            DataHis.UpdateCommand = "UPDATE Sis_HV_Historial SET Sis_HV_Historial.Estado=4, Id_Cierre ='Of Infraestructura', Obs_Cierre ='Cierre automatico del sistema despues de 48 Hrs de ser resuelta la solicitud' ,Aud_Time_Cierre = ( CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) )   from Sis_HV_Historial  where Id_Evento= N'" & num & "'"
            DataHis.Update()

            DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Sis_HV_Novedad.Estado=4 from Sis_HV_Novedad where Id_Evento= N'" & num & "'"
            DataNov.Update()


            DataHis.InsertCommand = "INSERT INTO Encuesta(Fecha, Resultado,Tipo_Man, Evento ) VALUES ( ( CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) ) ,'5','" & Rsa2(1) & "', '" & num & "') "
            DataHis.Insert()
            DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Sis_HV_Novedad.Limt=1 FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol,  CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108)) > Sis_HV_Historial.Prioridad where Sis_HV_Novedad.Estado<4 and Sis_HV_Historial.Prioridad<>0"
            DataNov.Update()
            Rsa2.Close()
            timedatea2.Close()
        End If

        Rsa2.Close()
        timedatea2.Close()


     '   DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad Set Sis_HV_Novedad.Limt=1 , Sis_HV_Novedad.FechLimt =  GETDATE()  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento where ((DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol,  CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108)) > Sis_HV_Historial.Prioridad)) and  ((Sis_HV_Novedad.Estado%2)<>0) and (Sis_HV_Historial.Prioridad<>0)"
      '  DataNov.Update()
  

    End Sub
Protected Sub BtnExportar_Click(sender As Object, e As System.EventArgs) Handles BtnExportar.Click

        GridView1.AllowPaging = False
        GridView1.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridView1.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridView1)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=Mantenimientos.xls")
            Response.Charset = "UTF-8"
            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

    End Try
        GridView1.AllowPaging = True
    End Sub


    Protected Sub GridEvento_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento.SelectedIndexChanged

        Codigo.Text = GridEvento.SelectedValue.ToString

        Panel_Info.Visible = False
        NOVHIS.visible = True
        Dim Even As String = Codigo.Text
        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=5454;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Co2 As New SqlCommand
        Co2.Connection = timedate2
        timedate2.Open()
        SQL2 = "Select Actividad From Sis_HV_Historial WHERE (Id_Evento =N'" & Even & "')"
        Co2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Co2.ExecuteReader()
        Rs2.Read()
        If Rs2(0) = "Pendiente" Then
            Panel_Asignar.Visible = True

        Else
            Panel_Asignar.Visible = False
        End If
        Rs2.Close()
        timedate2.Close()




        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=5454;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "Select * From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo.Text = Rs(1)
        Solicita.Text = Rs(5)
        Label3.text = Rs(5)
        Nota.Text = Rs(4)
        Reasignado.Text = Rs(11)
        Rs.Close()
        timedate.Close()





    End Sub

    Protected Sub Gridopen_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Gridopen.SelectedIndexChanged
        Codigo.Text = Gridopen.SelectedValue.ToString
        NOVHIS.visible = True
        TextBox1.Text = Gridopen.SelectedValue.ToString
        '   LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        Panel_Asignar.Visible = False
        Panel_Info.Visible = False
        Paprobados.Visible = False
        Paprobar.Visible = False
    End Sub

    Protected Sub pendiente_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles pendiente.SelectedIndexChanged
        Codigo.Text = pendiente.SelectedValue.ToString
        NOVHIS.visible = True
        TextBox1.Text = pendiente.SelectedValue.ToString
        '   LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        Panel_Asignar.Visible = False
        Panel_Info.Visible = False
        Paprobados.Visible = False
        Paprobar.Visible = False
        Paprobados.Visible = False
        Paprobar.Visible = False

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Codigo.Text = GridView1.SelectedValue.ToString
        NOVHIS.visible = True
        TextBox1.Text = GridView1.SelectedValue.ToString
        '   LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        Panel_Asignar.Visible = False
        Panel_Info.Visible = False
        Paprobados.Visible = False
        Paprobar.Visible = False
    End Sub


    Protected Sub GridEvento2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento2.SelectedIndexChanged

        Codigo.Text = GridEvento2.SelectedValue.ToString
        '   LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        NOVHIS.visible = True

        Panel_Info.Visible = False
        Panel_Asignar.Visible = True

        Dim Even As String = Codigo.Text
        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=5454;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Co2 As New SqlCommand
        Co2.Connection = timedate2
        timedate2.Open()
        SQL2 = "Select Actividad From Sis_HV_Historial WHERE (Id_Evento =N'" & Even & "')"
        Co2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Co2.ExecuteReader()
        Rs2.Read()
        'If Rs2(0) = "Pendiente" Then
        'Panel_Asignar.Visible = True
        '       Else
        'Panel_Asignar.Visible = False
        'End If
        Rs2.Close()
        timedate2.Close()

        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=5454;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand

        Com.Connection = timedate
        timedate.Open()
        SQL = "Select * From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo.Text = Rs(1)
        Solicita.Text = Rs(5)
        Label3.text = Rs(5)
        Nota.Text = Rs(4)
        Reasignado.Text = Rs(11)
        Rs.Close()
        timedate.Close()




    End Sub


    Protected Sub BtnAsignar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAsignar.Click

        Dim Even As String = Codigo.Text
        Dim Tipo As Integer = Tip_Man.Text
        Dim Job As String = Id_Job.Text
        Dim res As String
        Dim HMasigna As String = TextBoxev.Text
        Dim Priori As String = Prioridad.Text
        Dim Joba As String = Page.User.Identity.Name.ToString
        Dim numasigna As Integer = Reasignado.Text + 1
        Dim asigna As String
        Dim ACTIVIDAD As String
        Dim sq As String
        Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa1983 As SqlDataReader
        Dim Coma123456 As New SqlCommand
        Coma123456.Connection = timd
        timd.Open()
        sq = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & Joba & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        asigna = Rsa1983(0)
        Rsa1983.Close()
        timd.Close()
        Dim sq2 As String
        Dim timd2 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa19832 As SqlDataReader
        Dim Coma1234562 As New SqlCommand
        Coma1234562.Connection = timd2
        timd2.Open()
        sq2 = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & Job & "')"
        Coma1234562 = New SqlCommand(sq2, timd2)
        Rsa19832 = Coma1234562.ExecuteReader()
        Rsa19832.Read()
        res = Rsa19832(0)
        Rsa19832.Close()
        timd2.Close()


        ACTIVIDAD = " " & asigna & " asigna como responsable a : " & res

        'LabelMsg.Text() = "Fecha Mantenimiento: " & Tim & " Fecha Registro: " & Aud & " equipo: " ' & Even2
        DataHis.UpdateCommand = "UPDATE Sis_HV_Historial SET Id_Job=N'" & Job & "' , Tipo_Man=" & Tipo & " , Prioridad=N'" & Priori & "' WHERE (Id_Evento =N'" & Even & "')"
        DataHis.Update()

        DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Id_Job=N'" & Job & "', Aud_Nov=N'" & HMasigna & "', Prioridad=N'" & Priori & "'   , Reasignado=N'" & numasigna & "' WHERE (Id_Evento =N'" & Even & "')"
        DataNov.Update()

        DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & Even & "','" & Joba & "','" & ACTIVIDAD & "','" & HMasigna & "')"
        DataH0.Insert()
        Response.AddHeader("REFRESH", "1;Asignar.aspx")
    End Sub


    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        If DropDownList1.SelectedValue = "1" Then
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) ORDER BY Fecha_Entrega DESC"
        Else
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Id_Job = N'" & DropDownList1.SelectedValue.ToString & "' )  ORDER BY Fecha_Entrega DESC"
        End If


        GridView1.DataBind()

    End Sub
    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList2.SelectedIndexChanged

        If DropDownList2.SelectedValue = "1" Then
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) ORDER BY Fecha_Entrega DESC"
        Else
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Novedad.Id_Sol = N'" & DropDownList2.SelectedValue.ToString & "' )  ORDER BY Fecha_Entrega DESC"
        End If


        GridView1.DataBind()


    End Sub
    Protected Sub DropDownList3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList3.SelectedIndexChanged

        If DropDownList3.SelectedValue = "1" Then
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) ORDER BY Fecha_Entrega DESC"
        Else
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Area = N'" & DropDownList3.SelectedValue.ToString & "' )  ORDER BY Fecha_Entrega DESC"
        End If


        GridView1.DataBind()

    End Sub
    Protected Sub DropDownList4_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList4.SelectedIndexChanged


        If DropDownList3.SelectedValue = "1" Then
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) ORDER BY Fecha_Entrega DESC"
        Else
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Tipo_Man= " & DropDownList4.SelectedValue.ToString & " )  ORDER BY Fecha_Entrega DESC"
        End If


        GridView1.DataBind()

    End Sub

    Private Function FunActualizar()

        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)


        GridView1.DataBind()

        LabelInfo.Text = ""
        LabelInfo.ForeColor = Color.Black


    End Function






    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        LabelInfo.Text = ""

        If IsDate(TextFechaIni.Text) And IsDate(TextFechaFin.Text) Then 'And IsDate(TextFechaIniTras.Text) And IsDate(TextFechaFinTras.Text) Then
            FunActualizar()
        Else
            LabelInfo.Text = "La Fecha Inicial y/o la Fecha Final no son válidas."
            LabelInfo.ForeColor = Color.Red
        End If



        LabelInfo.Text = "Solicitudes Realizadas " + GridView1.Rows.Count.ToString

        Dim Inicio As String = TextFechaIni.text
        Dim Final As String = LabelFechaFin.Text



        SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND  (Sis_HV_Novedad.Fech_Sol BETWEEN N'" & Inicio & "' AND N'" & Final & "')  ORDER BY Fecha_Entrega DESC"


        GridView1.DataBind()




    End Sub
    Protected Sub restman_Click(sender As Object, e As EventArgs) Handles restman.Click

        Dim Inicio As String = DropDownList1.text
        Dim Final As String = DropDownList4.Text

        SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Id_Job = N'" & Inicio & "' ) and (Sis_HV_Historial.Tipo_Man= " & Final & ") ORDER BY Fecha_Entrega DESC"

        GridView1.DataBind()

        LabelInfo.Text = "Solicitudes Realizadas " + GridView1.Rows.Count.ToString

    End Sub
    Protected Sub solres_Click(sender As Object, e As EventArgs) Handles solres.Click

        Dim Sol As String = DropDownList2.text
        Dim Job As String = DropDownList1.Text

        SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) < 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Id_Job = N'" & Job & "' ) and (Sis_HV_Novedad.Id_Sol= N'" & Sol & "') ORDER BY Fecha_Entrega DESC"

        GridView1.DataBind()

        LabelInfo.Text = "Solicitudes Realizadas " + GridView1.Rows.Count.ToString

    End Sub
End Class
