Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click

        
        LabelProfesional.Text = ""
        'ListMedicos.SelectedIndex = -1


        'GridFacturas.Visible = False
        'GridRegEnfermeria.Visible = True

        'If IsDate(TextFechaFin.Text) Then
        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        '    If ListIngsFacts.SelectedValue = 0 Then
        '        'GridFacturas.Visible = True
       
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
	


   


  

    
  
	
	
End Class
