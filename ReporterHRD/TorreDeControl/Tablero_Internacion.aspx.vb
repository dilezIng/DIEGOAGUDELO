Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Partial Class Tablero_Internacion
Inherits System.Web.UI.Page
Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Panel1.Visible = True
        Panel2.Visible = False

   Response.AddHeader("REFRESH", "180;Tablero_Internacion.aspx")
    End Sub

  

End Class
