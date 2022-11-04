
Partial Class Sistemas_Bitacora_PMP_Categorias
    Inherits System.Web.UI.UserControl

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Label1.Text = Now.TimeOfDay.ToString
    End Sub
End Class
