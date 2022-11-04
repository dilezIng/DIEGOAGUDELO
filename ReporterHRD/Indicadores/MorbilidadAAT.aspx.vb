Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Partial Class Facturacion_ResumenFacturacion
    Inherits System.Web.UI.Page

    Dim Funciones As New FunBasicas

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If IsDate(TextFechaFin.Text) And IsDate(TextFechaFin.Text) Then 'And ListaTipPlanesBeneficio.Items.Count > 0 Then
            LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)

            'DataListTriage.DataBind()

        Else
            LabelMsg.Text = "DEBE SELECCIONAR UNA FECHA DE INICIO Y UNA FECHA FINAL"
        End If

    End Sub

End Class
