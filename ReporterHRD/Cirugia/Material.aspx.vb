Imports System.Data.SqlClient
Imports System.Data

Public Class Cirugia_Material
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelPen.Text = GridView1.Rows.Count.ToString
    End Sub

End Class