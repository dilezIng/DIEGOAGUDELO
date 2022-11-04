
Partial Class PaginaMaestra
    Inherits System.Web.UI.MasterPage


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        'Label1.Text =
        Menu1.FindItem("0").Enabled = False

        If Page.User.Identity.IsAuthenticated = True Then
            Login1.Visible = False
            Menu1.FindItem("0").Enabled = True
            LoginStatus1.Visible = True
            LoginStatus1.LogoutText = "Cerrar Sesión de " & Page.User.Identity.Name.ToString
        Else
            Login1.Visible = True
            LoginStatus1.Visible = False
            Menu1.FindItem("0").Enabled = False
        End If

    End Sub
    Protected Sub Menu1_MenuItemClick(sender As Object, e As MenuEventArgs) Handles Menu1.MenuItemClick

    End Sub
End Class

