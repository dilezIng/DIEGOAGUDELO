
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class Tablas_Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
   

        SqlDataSource1.ConnectionString = TextBox2.Text

        'DataBDUsuarios.UpdateCommand = TextConsulta.Text
        'SqlDataSource1.Update()
        Label1.Text = TextConsulta.Text.Substring(0, 6).ToUpper

        If Label1.Text = "SELECT" Or Label1.Text = "EXEC s" Then
            SqlDataSource1.SelectCommand = TextConsulta.Text
            GridView1.Visible = True
            GridView1.DataBind()
            Label1.Text = GridView1.Rows.Count.ToString & " registros encontrados."
        Else
            Try
                SqlDataSource1.UpdateCommand = TextConsulta.Text
                Label1.Text = "Se realizaron cambios en " + SqlDataSource1.Update().ToString + " Registros."
                'Label1.Text = "Se realizaron cambios en " + DataBDUsuarios.Update().ToString + " Registros. (BD Usuarios)"
                Label1.ForeColor = Drawing.Color.Green
            Catch ex As Exception
                Label1.Text = ex.Message
                Label1.ForeColor = Drawing.Color.Red
                'Label1.Text = SqlDataSource1.UpdateCommand
            End Try

        End If

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        Dim i As Integer
        Label1.Text = ""
        For i = 0 To GridView1.Rows.Count - 1
            'CrearUsuario(GridView1.Rows(i).Cells(0).Text, GridView1.Rows(i).Cells(1).Text, GridView1.Rows(i).Cells(2).Text)

            SqlDataSource2.UpdateCommand = "UPDATE  User_Puente SET GuidBDUser = CAST('" & GuidUs(GridView1.Rows(i).Cells(0).Text) & "' AS uniqueidentifier) WHERE (NomUsuarioSistema = '" + GridView1.Rows(i).Cells(0).Text + "')"
            SqlDataSource2.Update()

            'Label1.Text = Label1.Text + " !! " + Membership.FindUsersByName.
        Next

        'SqlDataSource1.Insert()

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        SqlDataSource1.Delete()
    End Sub


    Public Function CrearUsuario(ByVal NomUser As String, ByVal Contrasena As String, ByVal Correo As String)

        Dim NuevoUsuario As MembershipUser

        Try

        NuevoUsuario = Membership.CreateUser(NomUser.ToLower, Contrasena, Correo.ToLower) '.ChangePasswordQuestion("Hectorr++", "camilo++", "camilo--")
        Catch ex As Exception
            Label1.Text = Label1.Text + "- " + ex.Message
        End Try

    End Function


    Private Function GuidUs(ByVal NomUs As String) As String

        Dim Conexion As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True")
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "Select UserId FROM aspnet_Users WHERE UserName = N'" & NomUs & "'"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            Return "00000000-0000-0000-0000-000000000000"
        End If

    End Function

End Class
