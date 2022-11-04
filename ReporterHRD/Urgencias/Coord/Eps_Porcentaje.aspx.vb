Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web


Partial Class Eps_Porcentaje
    Inherits System.Web.UI.Page

    Protected Sub BtnConsulta_Click(sender As Object, e As EventArgs) Handles BtnConsulta.Click

        ' Dim INI As String = TextFechaIni.Text
        '  Dim SI As String = TextFechaFin.Text
        ' Dim SIN = SI + " 23:59:59"

        Labeltmes.Text = GridView1.Rows.Count.ToString
    End Sub


End Class
