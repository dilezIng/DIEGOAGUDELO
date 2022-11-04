Imports System.Data
Imports System.Data.SqlClient


Partial Class PaginaBase
    Inherits System.Web.UI.Page

    'Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
    '    'LoginStatus1.LogoutText = "Terminar Sesión de Trabajo de " + LoginName1.Page.User.Identity.Name
    'End Sub

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated

        FormView1.Visible = False
        GridView1.Visible = True

        SqlDataSource1.DataBind()
        GridView1.DataBind()

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        GridView1.Visible = False
        FormView1.Visible = True
    End Sub

    Protected Sub FormView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs) Handles FormView1.PageIndexChanging
        GridView1.Visible = True
        FormView1.Visible = False
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim NombreVb As TextBox
        Dim RolesVb As DropDownList
        Dim ExistiaEnRoleVb As Label

        NombreVb = Me.FormView1.Row.FindControl("UserNameTextBox")
        RolesVb = Me.FormView1.Row.FindControl("ListRoles")
        ExistiaEnRoleVb = Me.FormView1.Row.FindControl("LabelRoleEx")

        If Roles.IsUserInRole(NombreVb.Text, RolesVb.SelectedValue) = False Then
            Roles.AddUserToRole(NombreVb.Text, RolesVb.SelectedValue)
            FormView1.DataBind()
        Else
            ExistiaEnRoleVb.Text = "Imposible Agregar " + NombreVb.Text & " al Role " + RolesVb.SelectedValue + " porque ya pertenecia a él."
            ExistiaEnRoleVb.Visible = True
        End If


    End Sub


    Protected Sub ButtonQuitar_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim NombreVb As TextBox
        Dim RolesVb As DropDownList
        Dim ExistiaEnRoleVb As Label

        NombreVb = Me.FormView1.Row.FindControl("UserNameTextBox")
        RolesVb = Me.FormView1.Row.FindControl("ListRoles")
        ExistiaEnRoleVb = Me.FormView1.Row.FindControl("LabelRoleEx")

        If Roles.IsUserInRole(NombreVb.Text, RolesVb.SelectedValue) = False Then
            ExistiaEnRoleVb.Text = "Imposible Eliminar el usuario " + NombreVb.Text & " del Role " + RolesVb.SelectedValue + " porque no pertenecia a él."
            ExistiaEnRoleVb.Visible = True
        Else

            Roles.RemoveUserFromRole(NombreVb.Text, RolesVb.SelectedValue)
            FormView1.DataBind()
        End If


    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim NombreVb As TextBox
        Dim ElimVb As Label
        Dim BtnElimVB As Button

        ElimVb = Me.FormView1.Row.FindControl("LabelEliminarUser")
        BtnElimVB = Me.FormView1.Row.FindControl("Button2")
        NombreVb = Me.FormView1.Row.FindControl("UserNameTextBox")

        Membership.DeleteUser(NombreVb.Text)
        ElimVb.Visible = False
        BtnElimVB.Visible = False
        GridView1.Visible = True
        FormView1.Visible = False

        GridView1.DataBind()
        GridView1.SelectedIndex = -1
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ElimVb As Label
        Dim BtnElimVB As Button
        Dim NombreVb As TextBox

        NombreVb = Me.FormView1.Row.FindControl("UserNameTextBox")
        ElimVb = Me.FormView1.Row.FindControl("LabelEliminarUser")
        BtnElimVB = Me.FormView1.Row.FindControl("Button2")

        ElimVb.Visible = True
        ElimVb.Text = "Está ústed seguro que quiere eliminar al usuario " + NombreVb.Text + "?  "
        BtnElimVB.Visible = True

    End Sub

    Protected Sub UpdateCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        GridView1.Visible = True
        FormView1.Visible = False
        GridView1.DataBind()

    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim NombreVb As TextBox
        Dim IdUsuarioVb As Label
        Dim EsAnonimoVb As CheckBox

        'Dim Update1 As SqlDataSource
        'Update1 = Me.FormView1.Row.FindControl("Roles")

        NombreVb = Me.FormView1.Row.FindControl("UserNameTextBox")
        IdUsuarioVb = Me.FormView1.Row.FindControl("IdUsuario")
        EsAnonimoVb = Me.FormView1.Row.FindControl("IsAnonymousCheckBox")
        '' Membership.Provider.UnlockUser(NombreVb.Text)
        'Membership.Provider.

        SqlDataSource3.UpdateCommand = "UPDATE aspnet_Users SET IsAnonymous = '" & EsAnonimoVb.Checked _
        & "', UserName = '" & NombreVb.Text & "' WHERE (UserId = '" & IdUsuarioVb.Text & "')"
        SqlDataSource3.Update()

    End Sub

    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        'Dim Update1 As SqlDataSource

        'Update1 = Me.FormView1.Row.FindControl("Roles")

        '' NombreVb = Me.FormView1.Row.FindControl("UserNameTextBox")
        'Membership.Provider.UnlockUser(NombreVb.Text)
        ''membership.Provider.Ge

        'Update1.Update()
    End Sub



    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()> _
    Public Shared Function BusqUsuarioDGH(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText

        StrConsulta = "SELECT USUNOMBRE + N' - ' + USUDESCRI AS NomUsuario FROM  GENUSUARIO WHERE (USUESTADO = 1) AND (USUDESCRI + N' (' + USUNOMBRE + N')' LIKE N'%" & filtro & "%') ORDER BY NomUsuario"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Dim i As Integer
            For i = 0 To objDS.Tables(0).Rows.Count - 1
                Lista.Add(objDS.Tables(0).Rows(i).Item(0).ToString)
            Next
        End If

        Return Lista

    End Function

    Private Function FunUsExiste(ByVal NomUsuario As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT OID FROM  GENUSUARIO WHERE (USUESTADO = 1) AND (USUNOMBRE + N' - ' + USUDESCRI = N'" & NomUsuario & "')"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            Return "0"
        End If

    End Function

    Protected Sub BtnAsociar_Click(sender As Object, e As System.EventArgs)

        Dim vblabel, vblabel1 As Label
        Dim vbTextbox As TextBox

        vblabel = FormView1.FindControl("LabelIdUsDgh")
        vbTextbox = FormView1.FindControl("TextUsEntrego")

        vblabel.Text = FunUsExiste(vbTextbox.Text)

        If vblabel.Text = "0" Then
            vblabel.Text = "Usuario seleccionado inválido."
        Else

            DataConsultas.UpdateCommand = "UPDATE aspnet_Users  SET IdUsDgh = " & vblabel.Text & " WHERE  (UserId = '" & GridView1.SelectedValue.ToString & "')"
            DataConsultas.Update()
        End If

        vblabel.Text = FunNomUsDgh(vblabel.Text)

    End Sub


    Private Function FunNomUsDgh(ByVal IdUsuario As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT USUNOMBRE + N' - ' + USUDESCRI FROM  GENUSUARIO WHERE  (OID =" & IdUsuario & ")"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            Return "No tiene usuario asociado."
        End If

    End Function

    Protected Sub FormView1_DataBound(sender As Object, e As System.EventArgs) Handles FormView1.DataBound


        Dim vblabel, vblabel1 As Label
        'Dim vbTextbox As TextBox

        vblabel = FormView1.FindControl("LabelIdUsDg")
        vblabel1 = FormView1.FindControl("LabelIdUsDgh")
        'vbTextbox = FormView1.FindControl("TextUsEntrego")

        vblabel1.Text = "No se ha asignado un usuario de DGH a este usuario."
        If IsNumeric(vblabel.Text) Then vblabel1.Text = FunNomUsDgh(vblabel.Text)
        'vblabel1.Text = FunNomUsDgh(vblabel.Text)


    End Sub


End Class
