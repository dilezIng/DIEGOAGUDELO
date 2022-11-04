
Partial Class Hospitalizacion_Censo_Camas
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        LabelPacientes.Text = "" + GridView1.Rows.Count.ToString

    End Sub





    Protected Sub BtnConsulta_Click(sender As Object, e As EventArgs) Handles BtnConsulta.Click
        LabelPacientes.Text = "" + GridView1.Rows.Count.ToString
    End Sub
End Class
