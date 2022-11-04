
Partial Class UserAdmin_Index
    Inherits System.Web.UI.Page


    Protected Sub FormNuevoUsuario1_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormNuevoUsuario1.CreatedUser

        Roles.AddUserToRole(FormNuevoUsuario1.UserName, ListRoles.SelectedValue)
        Panel1.Visible = False

    End Sub

  
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoginStatus1.LogoutText = "Terminar Sesión de Trabajo de " & User.Identity.Name
    End Sub
End Class
