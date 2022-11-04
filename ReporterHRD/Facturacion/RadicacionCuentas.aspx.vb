
Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click

        LabelSubTitulo.Text = ""
        GridPrincipal.Visible = False
        'GridIngresosBloq.Visible = False

        If IsDate(TextFechaFin.Text) Then
            LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
            '    If ListIngsFacts.SelectedValue = 0 Then
            GridPrincipal.Visible = True
            'GridPrincipal.DataBind()
            '        LabelSubTitulo.Text = "Facturas Anuladas (por Usuario)"
            '    Else
            '        If ListAnuBloq.SelectedValue = "3" Then
            '            GridIngresosBloq.DataBind()
            '            LabelSubTitulo.Text = "Ingresos Bloqueados (" & GridIngresosBloq.Rows.Count.ToString & " Ingresos)"
            '            GridIngresosBloq.Visible = True
            '        Else
            '            GridIngresosBloq.DataBind()
            '            LabelSubTitulo.Text = "Ingresos Anulados (" & GridIngresosBloq.Rows.Count.ToString & " Ingresos)"
            '            GridIngresosBloq.Visible = True
            '        End If

            '    End If
        End If

    End Sub

    Protected Sub GridFacturas_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridPrincipal.SelectedIndexChanged

        Panel1_ModalPopupExtender.Show()
        Panel1.GroupingText = GridPrincipal.SelectedDataKey.Item(1).ToString

    End Sub

    'Protected Sub GridResFactAnu_DataBound(sender As Object, e As System.EventArgs) Handles GridResFactAnu.DataBound

    '    Panel1.Height = -1

    '    If GridResFactAnu.Rows.Count > 10 Then
    '        Panel1.Height = 600
    '    End If

    'End Sub

    Protected Sub GridResFactAnu_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridResFactAnu.RowCommand
        Panel1_ModalPopupExtender.Show()
    End Sub

    Protected Sub GridResFactAnu_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridResFactAnu.SelectedIndexChanged

        GridTraza.Visible = True
        GridResFactAnu.Visible = False

        BtnClose.Enabled = False
        BtnCerrarTraza.Visible = True




        'Panel2.Visible = True
        'Panel1_ModalPopupExtender.Show()

    End Sub

    Protected Sub BtnCerrarTraza_Click(sender As Object, e As System.EventArgs) Handles BtnCerrarTraza.Click

        GridTraza.Visible = False
        GridResFactAnu.Visible = True

        BtnClose.Enabled = True
        BtnCerrarTraza.Visible = False

        Panel1_ModalPopupExtender.Show()

    End Sub

    'Protected Sub ListIngsFacts_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListIngsFacts.SelectedIndexChanged

    '    If ListIngsFacts.SelectedValue = "0" Then
    '        ListAnuBloq.Visible = False
    '    Else
    '        ListAnuBloq.Visible = True

    '    End If


    'End Sub
End Class
