Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient


Public Class Modificar_Plan
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UpdatePanel1.Visible = True
        PanelInicio.Visible = True
        '   PanelModificar.Visible = True
        '  UpdatePanel1.Visible = False

    End Sub


    Protected Sub GridEvento_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento.SelectedIndexChanged

        TextBox1.Text = GridEvento.SelectedValue.ToString

        PanelInicio.Visible = False
        ' PanelModificar.Visible = True
        'UpdatePanel1.Visible = False
    End Sub







End Class