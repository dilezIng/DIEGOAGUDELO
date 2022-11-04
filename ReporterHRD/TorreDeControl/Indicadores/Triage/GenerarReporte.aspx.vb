
Partial Class Indicadores_Triage_GenerarReporte
    Inherits System.Web.UI.Page

    Protected Sub ListMeses_Load(sender As Object, e As System.EventArgs) Handles ListMeses.Load

        If IsPostBack = False Then ListMeses.DataBind()

        LabelTextMes.Text = ListMeses.SelectedItem.Text.ToUpper



    End Sub

    Protected Sub ListMeses_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListMeses.SelectedIndexChanged

        ReportViewer1.LocalReport.Refresh()

    End Sub
End Class
