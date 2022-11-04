Imports System.IO
Imports System.Text
Imports System.Collections.Generic
Imports System.Web
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class PaginaBase
    Inherits System.Web.UI.Page



    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click


        LabelInfo.Text = ""

        If IsDate(TextFechaIni.Text) And IsDate(TextFechaFin.Text) And IsDate(TextFechaIniTras.Text) And IsDate(TextFechaFinTras.Text) Then
            'ListEntidades.Items.Clear()
            'ListEntidades.Items.Add(0)
            'ListEntidades.Items(0).Value = "0"
            'ListEntidades.Items(0).Text = "Todos"

            FunActualizar()
        Else
            LabelInfo.Text = "La Fecha Inicial y/o la Fecha Final no son válidas."
            LabelInfo.ForeColor = Color.Red
        End If

    End Sub


    Private Function FunActualizar()

        'If ListSedes.SelectedValue = 0 Then
        '    DataGridView.ConnectionString = "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica"
        '    'DataListEntidades.ConnectionString = "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica"
        'Else
        '    DataGridView.ConnectionString = "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES03;User ID=dghnet;Password=netdinamica"
        '    'DataListEntidades.ConnectionString = "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES03;User ID=dghnet;Password=netdinamica"
        'End If


        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        LabelFechaFinTraslado.Text = CDate(TextFechaFin.Text).AddDays(1)


        GridView1.DataBind()
        'ListEntidades.DataBind()


        LabelInfo.Text = "" 'GridView1.Rows.Count.ToString + " registros encontrados."
        LabelInfo.ForeColor = Color.Black
        BtnExportar.Enabled = True


        'If GridView1.Rows.Count > 0 Then BtnExportar.Enabled = True

    End Function




    'Protected Sub GridView1_RowCreated(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated

    '    Dim vbLabel As Label

    '    vbLabel = e.Row.FindControl("LabelTipo")

    '    Try
    '        vbLabel.Text = FunTipo(e.Row.DataItem(1).ToString)
    '    Catch ex As Exception

    '    End Try

    'End Sub





    Protected Sub BtnExportar_Click(sender As Object, e As System.EventArgs) Handles BtnExportar.Click

        GridView1.AllowPaging = False
        GridView1.DataBind()

        Try
            'Response.Clear()
            'Response.AddHeader("Content-Disposition", "attachment;filename=data.xls")
            'Response.ContentType = "application/vnd.ms-excel"
            'Dim sw As StringWriter = New StringWriter()
            'Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            'GridView1.RenderControl(htw)
            'Response.Write(sw.ToString())
            'Response.End()



            'Try

            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridView1.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridView1)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=data.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

        End Try
        GridView1.AllowPaging = True

        'Response.Clear()
        'Response.Buffer = True
        'Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls")
        'Response.Charset = ""
        'Response.ContentType = "application/vnd.ms-excel"
        'Using sw As New StringWriter()
        '    Dim hw As New HtmlTextWriter(sw)

        '    'To Export all pages
        '    'GridView1.AllowPaging = False


        '    GridView1.HeaderRow.BackColor = Color.White
        '    For Each cell As TableCell In GridView1.HeaderRow.Cells
        '        cell.BackColor = GridView1.HeaderStyle.BackColor
        '    Next
        '    For Each row As GridViewRow In GridView1.Rows
        '        row.BackColor = Color.White
        '        For Each cell As TableCell In row.Cells
        '            If row.RowIndex Mod 2 = 0 Then
        '                cell.BackColor = GridView1.AlternatingRowStyle.BackColor
        '            Else
        '                cell.BackColor = GridView1.RowStyle.BackColor
        '            End If
        '            cell.CssClass = "textmode"
        '        Next
        '    Next

        '    GridView1.RenderControl(hw)
        '    'style to format numbers to string
        '    Dim style As String = "<style> .textmode { } </style>"
        '    Response.Write(style)
        '    Response.Output.Write(sw.ToString())
        '    Response.Flush()
        '    Response.[End]()
        'End Using


    End Sub

   

    'Protected Sub ListEntidades_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListEntidades.SelectedIndexChanged


    '    LabelInfo.Text = ""

    '    If IsDate(TextFechaIni.Text) And IsDate(TextFechaFin.Text) Then
    '        FunActualizar()
    '    Else
    '        LabelInfo.Text = "La Fecha Inicial y/o la Fecha Final no son válidas."
    '        LabelInfo.ForeColor = Color.Red
    '    End If

    'End Sub
End Class
