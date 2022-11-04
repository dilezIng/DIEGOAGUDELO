Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Partial Class Tablero_Internacion
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        LabelPacientes.Text = "" + GridView1.Rows.Count.ToString
        Panel1.Visible = True
        Panel2.Visible = False


    End Sub

    Protected Sub BtnConsulta_Click(sender As Object, e As EventArgs) Handles BtnConsulta.Click
        LabelPacientes.Text = "" + GridView1.Rows.Count.ToString
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged

        Dim Folio As Integer = GridView2.SelectedValue.ToString
        Panel1.Visible = False
        Panel2.Visible = True
        Folio1.Text = Folio





    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

        Dim ingreso As Integer = GridView1.SelectedValue.ToString


        Panel1.Visible = False
        Panel2.Visible = True
        Ingreso1.Text = ingreso

    End Sub




    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel1.Visible = True
        Panel2.Visible = False
        Response.AddHeader("REFRESH", "0;Tablero_Internacion.aspx")
    End Sub
End Class
