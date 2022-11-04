


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
        Dim Tipoman As Integer = TipoManList1.text
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
            Dim asigna As String = asignaList1.text
            Dim Res As String
            Dim sq2 As String
            Dim actividad2 As String
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
            LabelMsg.Text() = "Su solicitud de " & nombrepc & ", se creo con el siguiente numéro " & Evento
            DataConsultas.InsertCommand = "INSERT INTO Sis_HV_Novedad(Id_Evento, Id_Equipo, Fech_Sol, Nota, Id_Sol,Id_Job, Aud_Nov, Estado, Prioridad,Reabierto,Reasignado,Limt) VALUES (N'" & Evento & "','" & Equipos & "',convert( char(21), getdate(), 120 ) ,'" & ACTIVIDAD & "','" & med & "','" & asigna & "','" & temp & "','" & Estado & "','192','0','0','0')"
            DataConsultas.Insert()
            DataH.InsertCommand = "INSERT INTO Sis_HV_Historial(Id_Evento, Id_Equipo,NomEquipo, Actividad, Fech_En,Area,Id_Job, Estado,Tipo_Man, Prioridad)VALUES (N'" & Evento & "','" & Equipos & "','" & nombrepc & "','Pendiente',convert( char(21), getdate(), 120 ) ,'" & area & "','" & asigna & "','" & Estado & "','" & Tipoman & "','192')"
            DataH.Insert()
            DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Solicita, NotaSolicita, Date) VALUES (N'" & Evento & "','" & med & "','" & ACTIVIDAD & "',convert( char(21), getdate(), 120 ) )"
            DataH0.Insert()
            DataH0.InsertCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & Evento & "','" & med & "','" & actividad2 & "',convert( char(21), getdate(), 120 ))"
            DataH0.Insert()
            Nota.Visible = False
            Label9.Visible = False
            TextBox1().Visible = False
            List1area.Visible = False
            q.Visible = False
            Label1.Visible = False
            Codigo.Visible = False
            Btnguardar.Visible = False
            asignaList1.Visible = False

        End If

        Response.AddHeader("REFRESH", "1;Job_Plan.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, TextBox1.Load, DataTime.Load

        panelSolicitud.Visible = False
        Paneluser.visible = False
        Dim fech As String
        Dim soli As String = Page.User.Identity.Name.ToString
        panelSolicitud.Visible = True
        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Com2 As New SqlCommand
        Com2.Connection = timedate2
        timedate2.Open()
        SQL2 = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Com2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Com2.ExecuteReader()
        Rs2.Read()
        TextBox1.Text = Rs2(0)
        fech = Rs2(0)
        Rs2.Close()
        timedate2.Close()
        DataH.UpdateCommand = "UPDATE Sis_HV_Novedad SET Sis_HV_Novedad.Limt=1 , Sis_HV_Novedad.FechLimt = GETDATE()  FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento where ((DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol,  GETDATE()) > Sis_HV_Historial.Prioridad)) and  ((Sis_HV_Novedad.Estado%2)<>0) and (Sis_HV_Historial.Prioridad<>0)"
        DataH.Update()


    End Sub



    Protected Sub Nota_TextChanged(sender As Object, e As EventArgs) Handles Nota.TextChanged

    End Sub
End Class
