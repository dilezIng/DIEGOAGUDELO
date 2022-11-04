
Partial Class UserAdmin_Roles
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Roles.CreateRole(TextBox1.Text)
        GridView1.DataBind()
        TextBox1.Text = ""
        GridView1.SelectedIndex = -1

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Button2.Enabled = True
        Button2.Text = "Eliminar Role " & GridView1.SelectedDataKey.Value.ToString
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        Roles.DeleteRole(GridView1.SelectedDataKey.Value.ToString)
        Button2.Enabled = False
        GridView1.DataBind()
        GridView1.SelectedIndex = -1

    End Sub
End Class
