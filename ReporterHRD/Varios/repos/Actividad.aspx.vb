Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web

Public Class Actividad
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Panelmantenimiento.Visible = False
        Dim user As String
        user = Page.User.Identity.Name.ToString

        If user = "SUA009" Then
            Panelmantenimiento.Visible = True


        End If
        If user = "sua009" Then
            Panelmantenimiento.Visible = True


        End If
        If user = "CRY036" Then
            Panelmantenimiento.Visible = True


        End If
        If user = "cry036" Then
            Panelmantenimiento.Visible = True


        End If

    End Sub


End Class