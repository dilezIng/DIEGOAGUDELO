Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Imports System.IO


Partial Class UserAdmin_CreacionMasivaUsuarios
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        Dim i As Integer
        Dim vbNomUs As String

        Label1.Text = ""

        For i = 0 To GridView1.Rows.Count - 1

            vbNomUs = NomUsDgh(GridView1.Rows(i).Cells(0).Text)

            If UsExiste(vbNomUs) = True Then
                Label1.Text = Label1.Text + "Existe" + "<BR />" 'Label1.Text + "<BR />" + vbNomUs
            Else
                Try
                    CrearUsuario(vbNomUs.Trim, "$IndiC2018", vbNomUs + "_indi@hrd.gov.co")
                    Label1.Text = Label1.Text + "Creado: " + vbNomUs + "<BR />"
                Catch ex As Exception
                    Label1.Text = Label1.Text + "Error: " + vbNomUs + " (" + ex.Message + ")<BR />"
                End Try
            End If
        Next

    End Sub

    Private Function NomUsDgh(ByVal IdUsDg As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT OID, USUNOMBRE, USUDESCRI  FROM GENUSUARIO  WHERE OID = " + IdUsDg

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(1)
        Else
            Return "00000"
        End If

    End Function

    Private Function UsExiste(ByVal NomUsDg As String) As Boolean

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbConnDB_Usuarios").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT UserName FROM aspnet_Users WHERE UserName = N'" + NomUsDg + "'"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If

    End Function


    Public Function CrearUsuario(ByVal NomUser As String, ByVal Contrasena As String, ByVal Correo As String)


        Dim NuevoUsuario As MembershipUser
        NuevoUsuario = Membership.CreateUser(NomUser, Contrasena, Correo.ToLower) 


    End Function

End Class
