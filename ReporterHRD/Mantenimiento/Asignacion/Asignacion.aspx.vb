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



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, TextBoxev.Load

        Dim oo As Integer
        Dim Hora As String
        Dim ingreso As Integer
        Dim i As Integer
        Dim f As Integer
        'NOVHIS.visible = False
        'Panel_Info.Visible = false
        'Panel_Asignar.Visible = False
        Paprobados.Visible = True
        Paprobar.Visible = True
		'Prioridad.visible = false
			Panel_Asignar.Visible = false
			
        LabelEstadoForm4.Text = " " + GridEvento.Rows.Count.ToString
        LabelEstadoForm1.Text = " " + GridEvento2.Rows.Count.ToString
        Label1.Text = " " + Gridopen.Rows.Count.ToString
        LabelEstadoForm3.Text = " " + pendiente.Rows.Count.ToString
        Label2.Text = " " + GridView1.Rows.Count.ToString
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
		  Dim caracteres As String
        caracteres = Page.User.Identity.Name.ToString
	'If caracteres = "SUA09" Then
	'		Prioridad.visible = True
	'		Panel_Asignar.Visible = True
	'		Panel_Info.Visible = True
     '   End If
      '  If caracteres = "sua009" Then
		'	Prioridad.visible = True
		'	Panel_Asignar.Visible = True
		'	Panel_Info.Visible = True
        'End If
    End Sub

    Protected Sub GridEvento_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento.SelectedIndexChanged
		Dim caracteres As String
			caracteres = Page.User.Identity.Name.ToString
		If caracteres = "SUA09" Then
			Prioridad.visible = true
			Panel_Asignar.Visible = True
        End If
        If caracteres = "sua009" Then
			Prioridad.visible = true
			Panel_Asignar.Visible = True
        End If

        Codigo.Text = GridEvento.SelectedValue.ToString

        Panel_Info.Visible = False
        NOVHIS.visible = True
        Panel_Asignar.Visible = false
        Paprobados.Visible = False
        Paprobar.Visible = False

        Dim Even As String = Codigo.Text
        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Co2 As New SqlCommand
        Co2.Connection = timedate2
        timedate2.Open()
        SQL2 = "Select Id_Job From Sis_HV_Historial WHERE (Id_Evento =N'" & Even & "')"
        Co2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Co2.ExecuteReader()
        Rs2.Read()
          If Rs2(0) = "Pendiente" Then
         Panel_Asignar.Visible = True
        
          Else
                 Panel_Asignar.Visible = True
			Prioridad.visible = False
		 	If caracteres = "SUA09" Then
			Prioridad.visible = true
			Panel_Asignar.Visible = True
			End If
			If caracteres = "sua009" Then
			Prioridad.visible = true
			Panel_Asignar.Visible = True
			End If
          End If
        Rs2.Close()
        timedate2.Close()


 



        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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
       ' Reasignado.Text = Rs(11)
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
Dim caracteres As String
        caracteres = Page.User.Identity.Name.ToString
 
   If caracteres = "SUA009" Then
         Prioridad.visible = True
Panel_Asignar.Visible = True
        End If
        If caracteres = "sua009" Then
     Prioridad.visible = True
Panel_Asignar.Visible = True
        End If


        Codigo.Text = GridEvento2.SelectedValue.ToString
        '   LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        NOVHIS.visible = True

        Panel_Info.Visible = False
        Panel_Asignar.Visible = False

        Dim Even As String = Codigo.Text
        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Co2 As New SqlCommand
        Co2.Connection = timedate2
        timedate2.Open()
        SQL2 = "Select Id_Job From Sis_HV_Historial WHERE (Id_Evento =N'" & Even & "')"
        Co2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Co2.ExecuteReader()
        Rs2.Read()
        If Rs2(0) = "Pendiente" Then
        Panel_Asignar.Visible = True
		
               Else
        Panel_Asignar.Visible = True
		Prioridad.visible = False
        End If
        Rs2.Close()
        timedate2.Close()

 

        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
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
      '  Reasignado.Text = Rs(11)
        Rs.Close()
        timedate.Close()




    End Sub


    Protected Sub BtnAsignar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAsignar.Click

        Dim Even As String = Codigo.Text
        Dim Tipo As Integer = Tip_Man.Text
        Dim Job As String = Id_Job.Text
        Dim res As String
        Dim HMasigna As String = TextBoxev.Text
        Dim Priori As String
        Dim Priori2 As Integer 
		Dim caracteres As String
        caracteres = Page.User.Identity.Name.ToString
 
				
	
		
	
        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Co2 As New SqlCommand
        Co2.Connection = timedate2
        timedate2.Open()
        SQL2 = "Select Prioridad,Id_Job From Sis_HV_Historial WHERE (Id_Evento =N'" & Even & "')"
        Co2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Co2.ExecuteReader()
        Rs2.Read()
		If Rs2(1) = "Pendiente" Then
				Priori  = Prioridad.Text
				Priori2   = Prioridad.Text
               Else
		
	If caracteres = "SUA009" Then
			Prioridad.visible = True
			Panel_Asignar.Visible = True
			Priori  = Prioridad.Text
			Priori2   = Prioridad.Text
			else
			Priori  = Rs2(0)
			Priori2  = Rs2(0)
		
        End If
        If caracteres = "sua009" Then
			Prioridad.visible = True
			Panel_Asignar.Visible = True
				Priori  = Prioridad.Text
				Priori2   = Prioridad.Text
         else
			Priori  = Rs2(0)
			Priori2  = Rs2(0)
        End If
		
		
        Panel_Asignar.Visible = False
        End If
        Rs2.Close()
        timedate2.Close()



	
		
		
		
        Dim Joba As String = Page.User.Identity.Name.ToString
      ''  Dim numasigna As Integer = Reasignado.Text + 1
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

        Priori2 = Priori2 / 24
        Priori2 = Math.Round(Priori2, 1)
        ACTIVIDAD = " " & asigna & " asigna como responsable a : " & res & " con un tiempo de " & Priori2 & " días."

        'LabelMsg.Text() = "Fecha Mantenimiento: " & Tim & " Fecha Registro: " & Aud & " equipo: " ' & Even2
        DataHis.UpdateCommand = "UPDATE Sis_HV_Historial SET Id_Job=N'" & Job & "' , Tipo_Man=" & Tipo & " , Prioridad=N'" & Priori & "' WHERE (Id_Evento =N'" & Even & "')"
        DataHis.Update()

        DataNov.UpdateCommand = "UPDATE Sis_HV_Novedad SET Id_Job=N'" & Job & "', Aud_Nov=N'" & HMasigna & "', Prioridad=N'" & Priori & "'    WHERE (Id_Evento =N'" & Even & "')"   
'', Reasignado=N'" & numasigna & "'
        DataNov.Update()

        DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & Even & "','" & Joba & "','" & ACTIVIDAD & "','" & HMasigna & "')"
        DataH0.Insert()
        Response.AddHeader("REFRESH", "1;Asignacion.aspx")
    End Sub




    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        If DropDownList1.SelectedValue = "1" Then
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) ORDER BY Fecha_Entrega DESC"
        Else
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Id_Job = N'" & DropDownList1.SelectedValue.ToString & "' )  ORDER BY Fecha_Entrega DESC"
        End If


        GridView1.DataBind()

    End Sub
    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList2.SelectedIndexChanged

        If DropDownList2.SelectedValue = "1" Then
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) ORDER BY Fecha_Entrega DESC"
        Else
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Novedad.Id_Sol = N'" & DropDownList2.SelectedValue.ToString & "' )  ORDER BY Fecha_Entrega DESC"
        End If


        GridView1.DataBind()


    End Sub
    Protected Sub DropDownList3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList3.SelectedIndexChanged

        If DropDownList3.SelectedValue = "1" Then
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) ORDER BY Fecha_Entrega DESC"
        Else
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Area = N'" & DropDownList3.SelectedValue.ToString & "' )  ORDER BY Fecha_Entrega DESC"
        End If


        GridView1.DataBind()

    End Sub
    Protected Sub DropDownList4_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList4.SelectedIndexChanged


        If DropDownList3.SelectedValue = "1" Then
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) ORDER BY Fecha_Entrega DESC"
        Else
            SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Tipo_Man= " & DropDownList4.SelectedValue.ToString & " )  ORDER BY Fecha_Entrega DESC"
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



        SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND  (Sis_HV_Novedad.Fech_Sol  BETWEEN CONVERT(DATETIME, '" & Inicio & "', 102) AND CONVERT(DATETIME, '" & Final & "', 102)) ORDER BY Fecha_Entrega DESC"


        GridView1.DataBind()




    End Sub
    Protected Sub restman_Click(sender As Object, e As EventArgs) Handles restman.Click

        Dim Inicio As String = DropDownList1.text
        Dim Final As String = DropDownList4.Text

        SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Id_Job = N'" & Inicio & "' ) and (Sis_HV_Historial.Tipo_Man= " & Final & ") ORDER BY Fecha_Entrega DESC"

        GridView1.DataBind()

        LabelInfo.Text = "Solicitudes Realizadas " + GridView1.Rows.Count.ToString

    End Sub
    Protected Sub solres_Click(sender As Object, e As EventArgs) Handles solres.Click

        Dim Sol As String = DropDownList2.text
        Dim Job As String = DropDownList1.Text

        SqlDataSource2.SelectCommand = "SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación , Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id   WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Historial.Id_Job = N'" & Job & "' ) and (Sis_HV_Novedad.Id_Sol= N'" & Sol & "') ORDER BY Fecha_Entrega DESC"

        GridView1.DataBind()

        LabelInfo.Text = "Solicitudes Realizadas " + GridView1.Rows.Count.ToString

    End Sub
End Class
