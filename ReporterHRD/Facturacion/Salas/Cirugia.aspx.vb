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
        ' fecha = "" & TextFechaIni.Text
        LabelCant.Text = "Nº Procedimientos : " & GridView1.Rows.Count.ToString

        '' CONSULTA.Visible = True

        BtnRegresar.Visible = True
        Label1.Visible = False
        TextFechaIni.Visible = False
        BtnConsulta.Visible = False

        If IsDate(TextFechaIni.Text) Then 'And IsDate(TextFechaIniTras.Text) And IsDate(TextFechaFinTras.Text) Then
            FunActualizar()
        Else
            LabelInfo.Text = "Fecha NO válida."
            LabelInfo.ForeColor = Color.Red
        End If
    End Sub

    Private Function FunActualizar()

        '  LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        'LabelFechaFinTraslado.Text = CDate(TextFechaFin.Text).AddDays(1)

        GridView1.DataBind()

        LabelInfo.Text = " " '' + GridView1.Rows.Count.ToString + " registros encontrados."
        LabelInfo.ForeColor = Color.DarkRed



    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        GridView1.Visible = False
        BtnRegresar.Visible = False
        Label1.Visible = True
        BtnConsulta.Visible = True
        TextFechaIni.Visible = True


    End Sub


    Protected Sub BtnRegresar_Click(sender As Object, e As EventArgs) Handles BtnRegresar.Click


        Response.Redirect("Cirugia.aspx")

        GridView1.Visible = False
        BtnConsulta.Visible = True





    End Sub
End Class
