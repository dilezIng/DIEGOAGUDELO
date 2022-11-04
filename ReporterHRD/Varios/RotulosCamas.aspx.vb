Imports System.Web.UI.WebControls
Imports Microsoft.Reporting.WebForms
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO


Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Dim vbFunciones As New FunBasicas


    Protected Sub GridIngresos_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridIngresos.RowDataBound


        Dim vbLabelA As Label
        Dim vbLabelB As Label

        Try
            vbLabelA = e.Row.FindControl("LabelIngPor")
            vbLabelB = e.Row.FindControl("Label1")


            vbLabelA.Text = vbFunciones.IngresoPor(CInt(vbLabelB.Text))



            'e.Row.Cells(9).ForeColor = Drawing.Color.Black


            'LabelIngPor

            'If IsNumeric(CInt(e.Row.Cells(6).Text)) Then

            '    If IsNumeric(CInt(e.Row.Cells(9).Text)) Then
            '        If CInt(e.Row.Cells(6).Text) > CInt(e.Row.Cells(9).Text) Then
            '            e.Row.Cells(9).ForeColor = Drawing.Color.Red
            '        End If
            '    End If

            '    If IsNumeric(CInt(e.Row.Cells(10).Text)) Then
            '        If CInt(e.Row.Cells(6).Text) > CInt(e.Row.Cells(10).Text) Then
            '            e.Row.Cells(10).ForeColor = Drawing.Color.Red
            '        End If
            '    End If

            '    If IsNumeric(CInt(e.Row.Cells(11).Text)) Then
            '        If CInt(e.Row.Cells(6).Text) > CInt(e.Row.Cells(11).Text) Then
            '            e.Row.Cells(11).ForeColor = Drawing.Color.Red
            '        End If
            '    End If


            'End If
        Catch ex As Exception

        End Try


    End Sub

    Protected Sub GridIngresos_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridIngresos.SelectedIndexChanged

        'Timer1.Enabled = False

        ReportViewer1.ServerReport.Refresh()
        ReportViewer1.LocalReport.Refresh()

        Panel1_ModalPopupExtender.Show()





        'CreatePDF("TestFile", GridIngresos.SelectedValue.ToString)

    End Sub



    'Private Function CreatePDF(ByVal FileName As String, ByVal vbIdIngreso As String) As String
    '    ' Setup DataSet
    '    Dim ds As New InfUrgenciasTableAdapters.RotuloCamaIngresoTableAdapter


    '    ' Create Report DataSource
    '    Dim rds As New ReportDataSource("RotuloCamaIngreso", ds.GetData(vbIdIngreso))


    '    ' Variables
    '    Dim warnings As Warning() = Nothing
    '    Dim streamids As String() = Nothing
    '    Dim mimeType As String = Nothing
    '    Dim encoding As String = Nothing
    '    Dim extension As String = Nothing




    '    ' Setup the report viewer object and get the array of bytes
    '    Dim viewer As New ReportViewer()
    '    viewer.ProcessingMode = ProcessingMode.Local
    '    viewer.LocalReport.ReportPath = "reports\report1.rdlc"
    '    viewer.LocalReport.DataSources.Add(rds)
    '    Dim bytes As Byte() = viewer.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamids, _
    '    warnings)






    '    ' Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
    '    Response.Buffer = True
    '    Response.Clear()
    '    Response.ContentType = mimeType
    '    Response.AddHeader("content-disposition", ("attachment; filename=" & FileName & ".") + extension)
    '    Response.BinaryWrite(bytes)
    '    ' create the file
    '    ' send it to the client to download
    '    Response.Flush()


    '    Return FileName
    'End Function

    Protected Sub ListTipoIngreso_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListTipoIngreso.SelectedIndexChanged

        GridIngresos.DataBind()
        GridIngresos.PageIndex = 0

    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As System.EventArgs) Handles Timer1.Tick

        Label2.Text = "Ultima Actualización: " & Now.TimeOfDay.ToString.Substring(0, 8)
        GridIngresos.DataBind()
        GridIngresos.PageIndex = 0

    End Sub

    Protected Sub BtnClose_Click(sender As Object, e As System.EventArgs) Handles BtnClose.Click

        Timer1.Enabled = True
        GridIngresos.DataBind()


    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click


        Label2.Text = "Ultima Actualización: " & Now.TimeOfDay.ToString.Substring(0, 8)
        GridIngresos.DataBind()
        GridIngresos.PageIndex = 0


    End Sub
End Class
