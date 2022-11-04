Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Imports System.Drawing
Imports System.Configuration
Imports Microsoft.Office



Partial Class Facturacion_Ciruguia
    Inherits System.Web.UI.Page

    Protected Sub BtnConsulta_Click(sender As Object, e As EventArgs) Handles BtnConsulta.Click
        GridView1.Visible = True
        'Dim fecha As String
        ' fecha = "" & NCuenta.Text
        LabelCant.Text = "Nº Procedimientos : " & GridView1.Rows.Count.ToString

        '' CONSULTA.Visible = True
        BtnExport.Visible = True
        BtnRegresar.Visible = True
        Label1.Visible = False
        NCuenta.Visible = False
        BtnConsulta.Visible = False


    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BtnExport.Visible = False
        GridView1.Visible = False
        BtnRegresar.Visible = False
        Label1.Visible = True
        BtnConsulta.Visible = True
        NCuenta.Visible = True


    End Sub

    Protected Sub BtnExport_Click(sender As Object, e As EventArgs) Handles BtnExport.Click

        GridView1.AllowPaging = False
        GridView1.DataSource = SqlDataCirugia

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
            Response.AddHeader("Content-Disposition", "attachment;filename=Cirugia.xls")
            Response.ContentEncoding = System.Text.Encoding.UTF8

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()

        Catch ex As Exception

        End Try
        GridView1.AllowPaging = True

    End Sub
    Protected Sub BtnRegresar_Click(sender As Object, e As EventArgs) Handles BtnRegresar.Click


        Response.Redirect("CxC.aspx")
        BtnExport.Visible = False
        GridView1.Visible = False
        BtnConsulta.Visible = True





    End Sub
End Class
