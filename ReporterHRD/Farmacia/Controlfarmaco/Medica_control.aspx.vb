﻿Imports System.IO
Imports System.Text
Imports System.Collections.Generic
Imports System.Web
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click

        LabelInfo.Text = LabelFechaFin.Text+ " yy " +TextFechaIni.Text

        If IsDate(TextFechaIni.Text) Then 'And IsDate(TextFechaIniTras.Text) And IsDate(TextFechaFinTras.Text) Then
            FunActualizar()
        Else
            LabelInfo.Text = TextFechaIni.Text
            LabelInfo.ForeColor = Color.Red
        End If

    End Sub


    Private Function FunActualizar()

        LabelFechaFin.Text = CDate(TextFechaIni.Text).AddDays(1)
        'LabelFechaFinTraslado.Text = CDate(TextFechaFin.Text).AddDays(1)

        GridView1.DataBind()

        LabelInfo.Text = "" 'GridView1.Rows.Count.ToString + " registros encontrados."
        LabelInfo.ForeColor = Color.Black


    End Function




    Protected Sub DataGridView_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles DataGridView.Selecting

    End Sub
    Protected Sub TextFechaIni_TextChanged(sender As Object, e As EventArgs) Handles TextFechaIni.TextChanged

    End Sub

    
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

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
            Response.AddHeader("Content-Disposition", "attachment;filename=Seguimiento_Farmaco.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

    End Try
        GridView1.AllowPaging = True



    End Sub
	
	
End Class
