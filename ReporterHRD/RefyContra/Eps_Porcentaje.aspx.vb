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
        Lbtodos.text = GridView2.Rows.Count.ToString
    End Sub
Protected Sub BtnExportar2_Click(sender As Object, e As System.EventArgs) Handles BtnExportar2.Click

        GridView2.AllowPaging = False
        GridView2.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridView2.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridView2)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=Pediatria_URG.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

        End Try
        GridView2.AllowPaging = True



    End Sub
	

End Class
