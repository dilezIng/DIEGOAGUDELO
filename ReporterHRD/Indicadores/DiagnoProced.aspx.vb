
Partial Class Indicadores_DiagnoProced
    Inherits System.Web.UI.Page

    Protected Sub ListaAños_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListaAños.SelectedIndexChanged

        ListAños.DataBind()
        ListAños.Visible = True
        LabelAño.Text = ListaAños.SelectedItem.Text
    End Sub
End Class
