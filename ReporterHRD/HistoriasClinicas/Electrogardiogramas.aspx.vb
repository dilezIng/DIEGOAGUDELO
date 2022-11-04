
Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click

        LabelSubTitulo.Text = ""
        'GridFacturas.Visible = False
        GridRegEnfermeria.Visible = True

        'If IsDate(TextFechaFin.Text) Then
        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        '    If ListIngsFacts.SelectedValue = 0 Then
        '        'GridFacturas.Visible = True
        LabelSubTitulo.Text = "Pacientes a los que se les registro actividades"

        Dim vbFechaIni, vbFechaFin As Date


        If IsDate(TextFechaIni.Text) AndAlso IsDate(TextFechaIni.Text) Then
            vbFechaIni = CDate(TextFechaIni.Text)
            vbFechaFin = CDate(LabelFechaFin.Text)

            DataGridRegEnf.SelectCommand = "SELECT DISTINCT ADNINGRESO.OID AS IdIngreso, ADNINGRESO.AINCONSEC AS NumIngreso, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, ADNINGRESO.AINFECING AS FechaIngreso, GENPACIEN.PACNUMDOC AS NumDocPaciente FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNREGENF ON ADNINGRESO.OID = HCNREGENF.ADNINGRESO INNER JOIN HCNACTENF ON HCNREGENF.OID = HCNACTENF.HCNREGENF INNER JOIN HCNACTENFD ON HCNACTENF.OID = HCNACTENFD.HCNACTENF WHERE (ADNINGRESO.AINFECING BETWEEN CONVERT (DATETIME, '" & vbFechaIni.Year.ToString & "-" & vbFechaIni.Month.ToString & "-" & vbFechaIni.Day.ToString & " 00:00:00', 102) AND CONVERT (DATETIME, '" & vbFechaFin.Year.ToString & "-" & vbFechaFin.Month.ToString & "-" & vbFechaFin.Day.ToString & " 00:00:00', 102)) AND ( HCNACTENF.HCTIPACT = 64 OR   HCNACTENF.HCTIPACT = 53    or HCNACTENF.HCTIPACT = 51    or HCNACTENF.HCTIPACT = 49    or HCNACTENF.HCTIPACT = 48    or HCNACTENF.HCTIPACT = 47    or HCNACTENF.HCTIPACT = 45    or HCNACTENF.HCTIPACT = 44    or HCNACTENF.HCTIPACT = 38    or HCNACTENF.HCTIPACT = 27)  ORDER BY FechaIngreso DESC"
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
        'Panel1_ModalPopupExtender.Show()

        Panel1.Visible = True
        GridRegEnfermeria.Visible = False

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

        'Panel1_ModalPopupExtender.Show()
        'Panel1.Visible = True
        'GridRegEnfermeria.Visible = False


    End Sub

    Protected Sub ListIngsFacts_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListIngsFacts.SelectedIndexChanged

        If ListIngsFacts.SelectedValue = "0" Then
            ListAnuBloq.Visible = False
        Else
            ListAnuBloq.Visible = True
        End If

    End Sub

    Protected Sub GridRegEnfermeria_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridRegEnfermeria.SelectedIndexChanged

        'Panel1_ModalPopupExtender.Show()
        Panel1.Visible = True
        GridRegEnfermeria.Visible = False

        'Dim vbGrid = sender


        LabelSubTitulo.Text = GridRegEnfermeria.Rows(GridRegEnfermeria.SelectedIndex).Cells(2).Text + " D.I. " + GridRegEnfermeria.Rows(GridRegEnfermeria.SelectedIndex).Cells(1).Text +
                                " Ingreso " + GridRegEnfermeria.Rows(GridRegEnfermeria.SelectedIndex).Cells(0).Text



    End Sub

    Protected Sub BtnActualizar0_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar0.Click

        LabelSubTitulo.Text = "Pacientes a los que se les registro actividades"
        DataGridRegEnf.SelectCommand = "SELECT  ADNINGRESO.OID AS IdIngreso, ADNINGRESO.AINCONSEC AS NumIngreso, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, ADNINGRESO.AINFECING AS FechaIngreso, GENPACIEN.PACNUMDOC AS NumDocPaciente FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNREGENF ON ADNINGRESO.OID = HCNREGENF.ADNINGRESO INNER JOIN HCNACTENF ON HCNREGENF.OID = HCNACTENF.HCNREGENF  INNER JOIN HCNACTENFD ON HCNACTENF.OID = HCNACTENFD.HCNACTENF WHERE ( HCNACTENF.HCTIPACT = 64     or HCNACTENF.HCTIPACT = 53    or HCNACTENF.HCTIPACT = 51    or HCNACTENF.HCTIPACT = 49    or HCNACTENF.HCTIPACT = 48    or HCNACTENF.HCTIPACT = 47    or HCNACTENF.HCTIPACT = 45    or HCNACTENF.HCTIPACT = 44    or HCNACTENF.HCTIPACT = 38    or HCNACTENF.HCTIPACT = 27)  and (HCNACTENFD.HCAOBSERV LIKE '%Electrocardiograma%' OR HCNACTENFD.HCAOBSERV LIKE '%Monitoreo Fetal%')  AND (ADNINGRESO.AINCONSEC = " & TextNumIngreso.Text & ") ORDER BY FechaIngreso DESC"
        DataGridRegEnf.DataBind()
        'GridRegEnfermeria.DataBind()
        Panel1.Visible = False
        GridRegEnfermeria.Visible = True

    End Sub

    Protected Sub BtnClose_Click(sender As Object, e As System.EventArgs) Handles BtnClose.Click

        Panel1.Visible = False
        GridRegEnfermeria.Visible = True
        LabelSubTitulo.Text = "Pacientes a los que se les registro actividades"

    End Sub
End Class
