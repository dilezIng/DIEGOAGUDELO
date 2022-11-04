Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click

        LabelSubTitulo.Text = ""
        LabelProfesional.Text = ""
        'ListMedicos.SelectedIndex = -1


        'GridFacturas.Visible = False
        'GridRegEnfermeria.Visible = True

        'If IsDate(TextFechaFin.Text) Then
        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        '    If ListIngsFacts.SelectedValue = 0 Then
        '        'GridFacturas.Visible = True
        LabelSubTitulo.Text = "Usuarios que registraron actividades"
        '    Else
        '        If ListAnuBloq.SelectedValue = "3" Then
        '            GridRegEnfermeria.DataBind()
        '            LabelSubTitulo.Text = "Ingresos Bloqueados (" & GridRegEnfermeria.Rows.Count.ToString & " Ingresos)"
        '            GridRegEnfermeria.Visible = True
        '        Else
        '            GridRegEnfermeria.DataBind()
        '            LabelSubTitulo.Text = "Ingresos Anulados (" & GridRegEnfermeria.Rows.Count.ToString & " Ingresos)"
        '            GridRegEnfermeria.Visible = True
        '        End If

        '    End If
        'End If

        'LabelCantProfs.Text = ListMedicos.Items.Count.ToString + " Profesionales encontrados"

    End Sub

Protected Sub BtnExportar_Click(sender As Object, e As System.EventArgs) Handles BtnExportar.Click

        GridFoliosMedico.AllowPaging = False
        GridFoliosMedico.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridFoliosMedico.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridFoliosMedico)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=MedicosFolios.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

    End Try
        GridFoliosMedico.AllowPaging = True



    End Sub
	

    Protected Sub GridResFactAnu_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridDetRegEnf.RowCommand
        Panel1_ModalPopupExtender.Show()
    End Sub

    Protected Sub GridResFactAnu_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridDetRegEnf.SelectedIndexChanged

        'GridTraza.Visible = True
        GridDetRegEnf.Visible = False

        BtnClose.Enabled = False
        BtnCerrarTraza.Visible = True



        'Panel2.Visible = True
        'Panel1_ModalPopupExtender.Show()

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


    Protected Sub ListMedicos_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListMedicos.SelectedIndexChanged

        GridFoliosMedico.DataBind()


    End Sub

    Protected Sub GridFoliosMedico_DataBound(sender As Object, e As System.EventArgs) Handles GridFoliosMedico.DataBound

        Try
            LabelProfesional.Text = ListMedicos.SelectedItem.Text + " - " + GridFoliosMedico.Rows.Count.ToString + " Folios encontrados."
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub ListMedicos_DataBound(sender As Object, e As System.EventArgs) Handles ListMedicos.DataBound

        LabelCantProfs.Text = ListMedicos.Items.Count.ToString + " Profesionales encontrados"

    End Sub
	
	
End Class
