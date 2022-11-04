
Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click

        LabelSubTitulo.Text = ""
        'GridFacturas.Visible = False
        GridPrincipal.Visible = True

        'If IsDate(TextFechaFin.Text) Then
        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        '    If ListIngsFacts.SelectedValue = 0 Then
        '        'GridFacturas.Visible = True
        LabelSubTitulo.Text = "Cantidad de Citas Médicas por Especialidad y Estado"

        Dim vbFechaIni, vbFechaFin As Date


        If IsDate(TextFechaIni.Text) AndAlso IsDate(TextFechaIni.Text) Then
            vbFechaIni = CDate(TextFechaIni.Text)
            vbFechaFin = CDate(LabelFechaFin.Text)

            'DataGridPrincipal.SelectCommand = "SELECT DISTINCT ADNINGRESO.OID AS IdIngreso, ADNINGRESO.AINCONSEC AS NumIngreso, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, ADNINGRESO.AINFECING AS FechaIngreso, GENPACIEN.PACNUMDOC AS NumDocPaciente FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNREGENF ON ADNINGRESO.OID = HCNREGENF.ADNINGRESO INNER JOIN HCNACTENF ON HCNREGENF.OID = HCNACTENF.HCNREGENF WHERE (ADNINGRESO.AINFECING BETWEEN CONVERT (DATETIME, '" & vbFechaIni.Year.ToString & "-" & vbFechaIni.Month.ToString & "-" & vbFechaIni.Day.ToString & " 00:00:00', 102) AND CONVERT (DATETIME, '" & vbFechaFin.Year.ToString & "-" & vbFechaFin.Month.ToString & "-" & vbFechaFin.Day.ToString & " 00:00:00', 102)) AND (HCNACTENF.HCTIPACT = 67 OR HCNACTENF.HCTIPACT = 38 OR HCNACTENF.HCTIPACT = 39 OR HCNACTENF.HCTIPACT = 40 OR HCNACTENF.HCTIPACT = 41 OR HCNACTENF.HCTIPACT = 42 OR HCNACTENF.HCTIPACT = 43 OR HCNACTENF.HCTIPACT = 44 OR HCNACTENF.HCTIPACT = 45) ORDER BY FechaIngreso DESC"
        End If




        'GridRegEnfermeria.DataBind()



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

    End Sub

    'Protected Sub GridFacturas_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridFacturas.SelectedIndexChanged

    '    Panel1_ModalPopupExtender.Show()
    '    'Panel1.GroupingText = GridFacturas.SelectedDataKey.Item(1).ToString

    'End Sub

    'Protected Sub GridResFactAnu_DataBound(sender As Object, e As System.EventArgs) Handles GridResFactAnu.DataBound

    '    Panel1.Height = -1

    '    If GridResFactAnu.Rows.Count > 10 Then
    '        Panel1.Height = 600
    '    End If

    'End Sub

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

    'Protected Sub GridRegEnfermeria_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridPrincipal.SelectedIndexChanged

    '    Panel1_ModalPopupExtender.Show()

    'End Sub

    Protected Sub BtnActualizar0_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar0.Click

        LabelSubTitulo.Text = "Pacientes a los que se les registro actividades"
        'DataGridPrincipal.SelectCommand = "SELECT DISTINCT ADNINGRESO.OID AS IdIngreso, ADNINGRESO.AINCONSEC AS NumIngreso, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, ADNINGRESO.AINFECING AS FechaIngreso, GENPACIEN.PACNUMDOC AS NumDocPaciente FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNREGENF ON ADNINGRESO.OID = HCNREGENF.ADNINGRESO INNER JOIN HCNACTENF ON HCNREGENF.OID = HCNACTENF.HCNREGENF WHERE (HCNACTENF.HCTIPACT = 67 OR HCNACTENF.HCTIPACT = 38 OR HCNACTENF.HCTIPACT = 39 OR HCNACTENF.HCTIPACT = 40 OR HCNACTENF.HCTIPACT = 41 OR HCNACTENF.HCTIPACT = 42 OR HCNACTENF.HCTIPACT = 43 OR HCNACTENF.HCTIPACT = 44 OR HCNACTENF.HCTIPACT = 45) AND (ADNINGRESO.AINCONSEC = " & TextNumIngreso.Text & ") ORDER BY FechaIngreso DESC"

        'GridRegEnfermeria.DataBind()


    End Sub

    Protected Sub GridPrincipal_RowCreated(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridPrincipal.RowCreated

      


    End Sub

    Protected Sub GridPrincipal_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridPrincipal.RowDataBound

        Try
            e.Row.Cells(6).Text = CInt(e.Row.Cells(2).Text) + CInt(e.Row.Cells(3).Text) + CInt(e.Row.Cells(4).Text) + CInt(e.Row.Cells(5).Text)

            e.Row.Cells(7).Text = Decimal.Round(CDec((CInt(e.Row.Cells(4).Text) * 100) / (CInt(e.Row.Cells(2).Text) + CInt(e.Row.Cells(3).Text) + CInt(e.Row.Cells(4).Text) + CInt(e.Row.Cells(5).Text))), 1) & "%"

            ' Decimal.Round(CDec(vbLabel.Text), 2) & "%"

        Catch ex As Exception

        End Try

    End Sub
End Class
