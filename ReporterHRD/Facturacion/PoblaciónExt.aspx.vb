Imports System.IO
Imports System.Text
Imports System.Collections.Generic
Imports System.Web
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class PoblaciónExt
    Inherits System.Web.UI.Page



    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click


        LabelInfo.Text = ""

        If IsDate(TextFechaIni.Text) And IsDate(TextFechaFin.Text) Then
            FunActualizar()
        Else
            LabelInfo.Text = "La Fecha Inicial y/o la Fecha Final no son válidas."
            LabelInfo.ForeColor = Color.Red
        End If

    End Sub


    Private Function FunActualizar()

        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        GridView1.DataBind()
        LabelInfo.ForeColor = Color.Black
        BtnExportar.Enabled = False

    End Function


    Protected Sub BtnExportar_Click(sender As Object, e As System.EventArgs) Handles BtnExportar.Click

        Try
            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm

            pagina.EnableEventValidation = True
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridView1)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=data.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()


        Catch ex As Exception

        End Try



    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub


End Class
