
Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If User.Identity.IsAuthenticated = True Then
            Label1.Text = "No tiene los privilegios suficientes para realizar la acción solicitada."
            Label1.ForeColor = Drawing.Color.Red
        Else
            Label1.Text = "La ultima sesión caduco por inactividad. Hay que autenticarse de nuevo."
            Label1.ForeColor = Drawing.Color.Blue
        End If

    End Sub
End Class
