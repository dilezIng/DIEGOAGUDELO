Imports System.IO
Imports System.Text
'Imports System.Data
'Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web


Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub RadioButtonList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListSedes.SelectedIndexChanged

        'ListEntidades.Items.Clear()

        'ListEntidades.Items.Add(1, 1)


        FunActualizar()

        'Label1.Text = "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica"


        'Label1.Text = DataGridView.ConnectionString
    End Sub

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click


        LabelInfo.Text = ""

        If IsDate(TextFechaIni.Text) And IsDate(TextFechaFin.Text) Then
            FunActualizar()
        Else
            LabelInfo.Text = "La Fecha Inicial y/o la Fecha Final no son válidas."
            LabelInfo.ForeColor = Color.Red
        End If

    End Sub


    Private Function FunActualizar()





        If ListSedes.SelectedValue = 0 Then
            DataGridView.ConnectionString = "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica"
            DataGridOportuPolicia.ConnectionString = DataGridView.ConnectionString

            'DataListEntidades.ConnectionString = "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica"
        Else
            DataGridView.ConnectionString = "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES03;User ID=dghnet;Password=netdinamica"
            'DataListEntidades.ConnectionString = "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES03;User ID=dghnet;Password=netdinamica"
        End If

        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)

        DataGridOportuPolicia.ConnectionString = DataGridView.ConnectionString
        DataGridPolicia.ConnectionString = DataGridView.ConnectionString

        GridView1.Visible = False
        GridOportuPolicia.Visible = False
        GridPolicia.Visible = False

        If ListInforme.SelectedValue = "0" Then
            GridView1.Visible = True
            GridView1.DataBind()
            LabelInfo.Text = GridView1.Rows.Count.ToString + " registros encontrados."
        ElseIf ListInforme.SelectedValue = "1" Then
            GridOportuPolicia.Visible = True
            GridOportuPolicia.DataBind()
            LabelInfo.Text = GridOportuPolicia.Rows.Count.ToString + " registros encontrados."
        ElseIf ListInforme.SelectedValue = "2" Then
            GridPolicia.Visible = True
            GridPolicia.DataBind()
            LabelInfo.Text = GridOportuPolicia.Rows.Count.ToString + " registros encontrados."
        End If


        'ListEntidades.DataBind()



        LabelInfo.ForeColor = Color.Black
        BtnExportar.Enabled = False


        'ListEntidades.Items.Clear()
        'ListEntidades.Items.Add(0)
        'ListEntidades.Items(0).Value = "0"
        'ListEntidades.Items(0).Text = "Todos"
        'ListEntidades.DataBind()

        'If GridView1.Rows.Count > 0 Then BtnExportar.Enabled = True

    End Function




    Protected Sub GridView1_RowCreated(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated

        Dim vbLabel As Label

        vbLabel = e.Row.FindControl("LabelTipo")

        Try
            vbLabel.Text = FunTipo(e.Row.DataItem(1).ToString)
        Catch ex As Exception

        End Try

    End Sub


    Private Function FunTipo(ByVal IdTipo As String) As String

        Dim i As Integer

        i = CInt(IdTipo)

        If i = 1 Then
            Return "Atención Parto (Puerperio)"
        ElseIf i = 2 Then
            Return "Atencion Recien Nacido"
        ElseIf i = 3 Then
            Return "Atención Planificacion Familiar"
        ElseIf i = 4 Then
            Return "Control Crecimiento y Desarrollo"
        ElseIf i = 5 Then
            Return "Control del Joven"
        ElseIf i = 6 Then
            Return "Control Materna"
        ElseIf i = 7 Then
            Return "Control Adulto Mayor"
        ElseIf i = 8 Then
            Return "Agudeza Visual"
        ElseIf i = 9 Then
            Return "Enfermedad Profesional"
        ElseIf i = 10 Then
            Return "No Aplica"
        Else
            Return "Ninguna"
        End If


        'Return IdTipo


    End Function



    Protected Sub BtnExportar_Click(sender As Object, e As System.EventArgs) Handles BtnExportar.Click

        GridView1.DataBind()

        If ListInforme.SelectedValue = "0" Then


        ElseIf ListInforme.SelectedValue = "1" Then


        End If


        Try

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


        Catch ex As Exception

        End Try


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

    Protected Sub ListEntidades_DataBinding(sender As Object, e As System.EventArgs) Handles ListEntidades.DataBinding



    End Sub

    Protected Sub ListEntidades_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListEntidades.SelectedIndexChanged


        LabelInfo.Text = ""

        If IsDate(TextFechaIni.Text) And IsDate(TextFechaFin.Text) Then
            FunActualizar()
        Else
            LabelInfo.Text = "La Fecha Inicial y/o la Fecha Final no son válidas."
            LabelInfo.ForeColor = Color.Red
        End If

    End Sub
End Class
