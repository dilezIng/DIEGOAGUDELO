Partial Class Varios_UESI_Inf_QX
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        LabelFechaInicio.Text = TextFechaIni.Text
        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)

        GridView1.DataBind()
    End Sub
End Class
