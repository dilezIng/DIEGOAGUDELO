Imports System.IO
Imports System.Text
Imports System.Collections.Generic
Imports System.Web
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration


Public Class RegOxigeno2
    Inherits System.Web.UI.Page
    Dim vbFunciones As New FunBasicas
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim user As String
        Dim caracteres As String
        caracteres = Page.User.Identity.Name.ToString
        Panel1.Visible = True
        Panel2.Visible = False
        Paneldisponible.Visible = False

        Button2.Visible = False
        lBuSER.TEXT = caracteres





    End Sub


    '' Selecciona una solicitud a gestionar

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

        Dim ingreso As Integer = GridView1.SelectedValue.ToString

        Panel1.Visible = False
        Panel2.Visible = True
        LbIngreso.Text = ingreso
        Button2.Visible = True

        Paneldisponible.visible = True


        Dim hir As String
        Dim SQLa22 As String
        Dim timedatea22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa22 As SqlDataReader
        Dim Coma22 As New SqlCommand
        Coma22.Connection = timedatea22
        timedatea22.Open()
        SQLa22 = "select top 1 Solicitud,Paciente,Nombre_Paciente,Fecha_Ini, Hora_Ini,Hora_Fin,Sum_id,Litros from O2_Sum_Paciente Where (Ingreso =" & ingreso & ") "
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()

        LbDocumento.text = "Cedula :" + Rsa22(1)
        LbPaciente.Text = " Nombre :" + Rsa22(2)
        Rsa22.Close()
        timedatea22.Close()

    End Sub



    '' Boton Regresar
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel1.Visible = True
        Panel2.Visible = False


    End Sub
    '' Boton guarda el Inicio del Oxigeno


End Class
