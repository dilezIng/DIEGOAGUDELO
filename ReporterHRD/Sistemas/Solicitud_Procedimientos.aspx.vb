Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web


Partial Class Urgencias_Estancia
    Inherits System.Web.UI.Page

    Protected Sub BtnConsulta_Click(sender As Object, e As EventArgs) Handles BtnConsulta.Click



        LabelFolio.Text = GridView1.Rows.Count.ToString + " Solicitudes encontradas" ' + Rsa(ClientID) 'DataGridEstancia.Rows.count.ToString + " Pacientes encontrados"

    End Sub

End Class
