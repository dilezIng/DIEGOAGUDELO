
Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click

        LabelSubTitulo.Text = ""
        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        LabelSubTitulo.Text = "Resumen de Auditoria Médica"
        
    End Sub



    Protected Sub GridResFactAnu_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridDetRegEnf.RowCommand
        Panel1_ModalPopupExtender.Show()
    End Sub

    Protected Sub GridResFactAnu_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridDetRegEnf.SelectedIndexChanged

        'GridTraza.Visible = True
        GridDetRegEnf.Visible = False

        BtnClose.Enabled = False
        BtnCerrarTraza.Visible = True




    End Sub

    Protected Sub BtnCerrarTraza_Click(sender As Object, e As System.EventArgs) Handles BtnCerrarTraza.Click

        ' GridTraza.Visible = False
        GridDetRegEnf.Visible = True

        BtnClose.Enabled = True
        BtnCerrarTraza.Visible = False

        Panel1_ModalPopupExtender.Show()

    End Sub

    Protected Sub ListIngsFacts_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListIngsFacts.SelectedIndexChanged

        If ListIngsFacts.SelectedValue = "0" Then
            ListAnuBloq.Visible = False
        Else
            ListAnuBloq.Visible = True
        End If

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Panel1.GroupingText = GridView1.SelectedRow.Cells(0).Text + " - " + GridView1.SelectedRow.Cells(1).Text
        LabelDetalle.Text = "Facts: <strong>" + GridView1.SelectedRow.Cells(2).Text + "</strong> Val. Facts: <strong>" + GridView1.SelectedRow.Cells(3).Text + "</strong>   Val. Aceptado: <strong>" + GridView1.SelectedRow.Cells(4).Text + "</strong> Val. Obj: <strong>" + GridView1.SelectedRow.Cells(5).Text + "</strong> Val Sportado: <strong>" + GridView1.SelectedRow.Cells(6).Text + "</strong>"
        Panel1_ModalPopupExtender.Show()

    End Sub
End Class
