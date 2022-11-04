
Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        LabelDiagnostico.Text = GridView1.SelectedRow.Cells(2).Text & " (" & GridView1.SelectedRow.Cells(3).Text & ")"

        Panel1_ModalPopupExtender.Show()

    End Sub

    Protected Sub GridView1_DataBound(sender As Object, e As System.EventArgs) Handles GridView1.DataBound

        LabelCantPacs.Text = GridView1.Rows.Count.ToString + " Diagnósticos encontrados"

    End Sub
End Class
