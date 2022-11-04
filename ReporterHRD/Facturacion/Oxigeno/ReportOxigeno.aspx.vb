Imports System.IO
Imports System.Text
Imports System.Collections.Generic
Imports System.Web
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration

Public Class ReportOxigeno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load




    End Sub

    Protected Sub BtnBuscar_Click(sender As System.Object, e As System.EventArgs) Handles BtnBuscar.Click



        GridView1.Visible = True
        GridView3.Visible = False
    End Sub


    Protected Sub BtnBuscarL_Click(sender As System.Object, e As System.EventArgs) Handles BtnBuscarL.Click


        GridView1.Visible = False
        GridView3.Visible = True
    End Sub

End Class