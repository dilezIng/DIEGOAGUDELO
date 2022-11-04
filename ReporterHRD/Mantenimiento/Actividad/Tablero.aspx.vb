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

        Panel_Info.Visible = True




        Dim SQLa As String
        Dim timedatea As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
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
        Dim timedatea2 As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
        Dim Rsa2 As SqlDataReader
        Dim Coma2 As New SqlCommand
        Coma2.Connection = timedatea2
        timedatea2.Open()
        SQLa2 = "SELECT  Id_Evento from [Sis_HV_Historial]  where (DATEDIFF(Hour, Aud_Time_Act, ( CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) )) >48) and (Estado=2) group by Id_Evento  "
        Coma2 = New SqlCommand(SQLa2, timedatea2)
        Rsa2 = Coma2.ExecuteReader()
        Rsa2.Read()

        If Rsa2.Read() Then
            num = Rsa2(0)

            Rsa2.Close()
            timedatea2.Close()
        End If

        Rsa2.Close()
        timedatea2.Close()

        Response.AddHeader("REFRESH", "60;/Mantenimiento/Tablero.aspx")
        LabelEstadoForm4.Text = " " + GridEvento.Rows.Count.ToString

        Label1.Text = " " + Gridopen.Rows.Count.ToString
    End Sub


End Class
