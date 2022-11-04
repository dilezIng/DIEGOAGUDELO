Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Partial Class Facturacion_ResumenFacturacion
    Inherits System.Web.UI.Page

    Dim Funciones As New FunBasicas

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        'Dim vbPanel As Panel
        'Dim vbBoton As LinkButton
        'Dim vbLabel As Label
        Dim vbDataList As DataList

        LabelTotRango0.Text = ""
        LabelTxtBuscar.Text = ""
        TextBuscar.Text = ""

        ListaTipPlanesBeneficio.Dispose()
        ListaTipPlanesBeneficio.DataBind()
        LabelFechaFin.Visible = True

        If IsDate(TextFechaIni.Text) And IsDate(TextFechaFin.Text) Then 'And ListaTipPlanesBeneficio.Items.Count > 0 Then


            'If CheckFechaFiltroAnul.Checked = True Then
            '    DataListTipPlanesBeneficio.SelectCommand = "SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) AND (SLNFACTUR.SFAFECANU BETWEEN @FechaInicio AND @FechaFin) GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY TipoPlan"
            'Else
            '    DataListTipPlanesBeneficio.SelectCommand = "SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY TipoPlan"
            'End If




            LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)

            'LabelTotRango.Text = "aaa"
            ValTotalRango()

            'Dim i As Integer
            ''If ListaTipPlanesBeneficio.Items.Count > 1 Then
            'For i = 0 To ListaTipPlanesBeneficio.Items.Count - 1
            '    vbDataList = ListaTipPlanesBeneficio.Items(i).FindControl("DataList1")
            '    vbDataList.Visible = False

            '    'vbPanel = ListaTipPlanesBeneficio.Items(i).FindControl("Panel2")
            '    'vbBoton = ListaTipPlanesBeneficio.Items(i).FindControl("BtnVerFacturas")
            '    'vbPanel.Visible = False
            '    'vbBoton.Text = "Ver Facturas"
            'Next
            ''End If
        Else

            LabelTotRango0.Text = "DEBE SELECCIONAR UNA FECHA DE INICIO Y UNA FECHA FINAL"

        End If




    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs)

        Dim vbGrid As GridView

        vbGrid = sender

        PanelInfoAnuladas.Visible = True
        PanelInfoFact.Visible = True
        GridDetalle.Visible = True
        ListBuscFactura.Visible = True

        LblIdFactSelec.Text = vbGrid.SelectedDataKey.Value.ToString
        LabelTxtBuscar.Text = LblIdFactSelec.Text

        'If CheckFechaFiltroAnul.Checked = True Then
        '    'DataListTipPlanesBeneficio.SelectCommand = "SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) AND (SLNFACTUR.SFAFECANU BETWEEN @FechaInicio AND @FechaFin) GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY TipoPlan"
        '    DataListBuscFactura.SelectCommand = "SELECT SLNFACTUR.OID AS IdFactura, SLNFACTUR.SFANUMFAC, SLNFACTUR.SFATOTFAC AS ValorEntidad, SLNFACTUR.SFAVALPAC AS ValorPaciente, GENCONTRA.GECNOMENT AS PlanBenefPaciente, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS NomPaciente, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC AS NumDocPac, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINURGCON FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE SLNFACTUR.OID = N'" + LabelTxtBuscar.Text + "'"
        'Else
        '    '.SFAFECANU
        '    'DataListTipPlanesBeneficio.SelectCommand = "SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY TipoPlan"
        '    DataListBuscFactura.SelectCommand = "SELECT SLNFACTUR.OID AS IdFactura, SLNFACTUR.SFANUMFAC, SLNFACTUR.SFATOTFAC AS ValorEntidad, SLNFACTUR.SFAVALPAC AS ValorPaciente, GENCONTRA.GECNOMENT AS PlanBenefPaciente, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS NomPaciente, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC AS NumDocPac, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINURGCON FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE SLNFACTUR.OID = N'" + LabelTxtBuscar.Text + "'"
        'End If


        DataListBuscFactura.DataBind()

        Panel1.Height = 600

        PanelInfoAnuladas.Visible = False
        If CheckAnuladas.Checked = True Then PanelInfoAnuladas.Visible = True

        DetalleAnulacion(LblIdFactSelec.Text)

        Panel1_ModalPopupExtender.Show()
        GridDetalle.PageIndex = 0


    End Sub

    Protected Sub GridDetalle_PageIndexChanged(sender As Object, e As System.EventArgs) Handles GridDetalle.PageIndexChanged
        Panel1_ModalPopupExtender.Show()
    End Sub

    Function DetalleAnulacion(ByVal IdFactura As String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String

        strConsulta = "SELECT SLNFACTUR.SFAJUSANU AS JustifAnulacion, GENUSUARIO.USUNOMBRE AS UserAnulo, GENUSUARIO.USUDESCRI AS NomUserAnulo FROM SLNFACTUR INNER JOIN GENUSUARIO ON SLNFACTUR.GENUSUARIO2 = GENUSUARIO.OID WHERE SLNFACTUR.OID = " & IdFactura

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            LabelDetAnulacion.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            LabelUsAnulo.Text = "Anulado por: " + objDS.Tables(0).Rows(0).Item(2).ToString + " (" + objDS.Tables(0).Rows(0).Item(1).ToString + ")"
        End If

    End Function

    Function DetalleFactura(ByVal IdFactura As String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String

        strConsulta = "SELECT SLNFACTUR.SFAJUSANU AS JustifAnulacion, GENUSUARIO.USUNOMBRE AS UserAnulo, GENUSUARIO.USUDESCRI AS NomUserAnulo FROM SLNFACTUR INNER JOIN GENUSUARIO ON SLNFACTUR.GENUSUARIO2 = GENUSUARIO.OID WHERE SLNFACTUR.OID = " & IdFactura

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            LabelDetAnulacion.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            LabelUsAnulo.Text = "Anulado por: " + objDS.Tables(0).Rows(0).Item(2).ToString + " (" + objDS.Tables(0).Rows(0).Item(1).ToString + ")"
        End If

    End Function



    Protected Sub DataList1_ItemCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs)

        'datagridview    
        'datagridcencos    



        Dim vbPanel As Panel
        Dim vbDatasource, vbDatasource2 As SqlDataSource


        vbPanel = e.Item.FindControl("Panel2")
        vbPanel.Visible = False



        vbPanel = e.Item.FindControl("Panel3")
        vbPanel.Visible = False

        If e.CommandName = "VerFacturas" Then
            'Dim vbPanel As Panel
            Dim vbBoton As LinkButton

            vbPanel = e.Item.FindControl("Panel2")
            vbBoton = e.Item.FindControl("BtnVerFacturas")
            vbDatasource = e.Item.FindControl("DataGridView")


            If CheckFechaFiltroAnul.Checked = True Then
                '    'DataListTipPlanesBeneficio.SelectCommand = "SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) AND (SLNFACTUR.SFAFECANU BETWEEN @FechaInicio AND @FechaFin) GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY TipoPlan"
                vbDatasource.SelectCommand = "SELECT SLNFACTUR.OID AS IdFactura, SLNFACTUR.SFANUMFAC, SLNFACTUR.SFATOTFAC, SLNFACTUR.SFAFECFAC, SLNFACTUR.SFADOCANU, SLNFACTUR.SFAFECANU AS FechaAnulacion, GENPACIEN.PACNUMDOC, SLNFACTUR.SFAVALPAC AS ValPac FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (SLNFACTUR.SFAFECANU BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.GENDETCON = @PlanBeneficios) AND (SLNFACTUR.SFADOCANU = @Anuladas) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON))"
            Else
                '    '.SFAFECANU
                '    'DataListTipPlanesBeneficio.SelectCommand = "SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY TipoPlan"
                vbDatasource.SelectCommand = "SELECT SLNFACTUR.OID AS IdFactura, SLNFACTUR.SFANUMFAC, SLNFACTUR.SFATOTFAC, SLNFACTUR.SFAFECFAC, SLNFACTUR.SFADOCANU, SLNFACTUR.SFAFECANU AS FechaAnulacion, GENPACIEN.PACNUMDOC, SLNFACTUR.SFAVALPAC AS ValPac FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.GENDETCON = @PlanBeneficios) AND (SLNFACTUR.SFADOCANU = @Anuladas) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON))"
            End If




            'If vbPanel.Visible = False Then
            vbPanel.Visible = True
            'vbBoton.Text = "Ocultar Facturas"
            'Else
            'vbPanel.Visible = True
            'vbBoton.Text = "Ver Facturas"
            'End If
        ElseIf e.CommandName = "VerCenCos" Then
            'Dim vbPanel As Panel
            Dim vbBoton As LinkButton
            Dim vbGrid As GridView
            Dim vbLabel As Label

            vbLabel = e.Item.FindControl("LabelIdContrato")
            vbPanel = e.Item.FindControl("Panel3")
            vbBoton = e.Item.FindControl("BtnVerCenCos")
            vbGrid = e.Item.FindControl("GridCenCos")
            vbGrid.EmptyDataText = "Prueba"

            vbDatasource2 = e.Item.FindControl("DataGridCenCos")


            If CheckFechaFiltroAnul.Checked = True Then
                vbDatasource2.SelectCommand = "SELECT CTNCENCOS.CCCODIGO, CTNCENCOS.CCNOMBRE, SUM(SLNSERPRO.SERVALPRO)  AS Total, CTNCENCOS.OID AS IdCenCos  FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN CTNCENCOS ON SLNSERPRO.CTCENCOS1 = CTNCENCOS.OID WHERE (SLNFACTUR.SFAFECANU BETWEEN @FechaInicio AND @FechaFin) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON))  AND (ADNINGRESO.GENDETCON = " & vbLabel.Text & ") AND (SLNFACTUR.SFADOCANU = @Anuladas) GROUP BY CTNCENCOS.CCCODIGO, CTNCENCOS.CCNOMBRE, CTNCENCOS.OID"
            Else
                vbDatasource2.SelectCommand = "SELECT CTNCENCOS.CCCODIGO, CTNCENCOS.CCNOMBRE, SUM(SLNSERPRO.SERVALPRO)  AS Total, CTNCENCOS.OID AS IdCenCos  FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN CTNCENCOS ON SLNSERPRO.CTCENCOS1 = CTNCENCOS.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON))  AND (ADNINGRESO.GENDETCON = " & vbLabel.Text & ") AND (SLNFACTUR.SFADOCANU = @Anuladas) GROUP BY CTNCENCOS.CCCODIGO, CTNCENCOS.CCNOMBRE, CTNCENCOS.OID"
            End If




            vbGrid.DataBind()
            'If vbPanel.Visible = False Then
            vbPanel.Visible = True
            vbLabel.Visible = True
            'vbLabel.Text = vbDatasource2.SelectCommand
            'vbBoton.Text = "Ocultar Facturas"
            'Else
            'vbPanel.Visible = True
            'vbBoton.Text = "Ver Facturas"
            'End If


        End If
    End Sub

    Function ValTotalRango()

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String
        Dim FechaInicio As DateTime = CDate(TextFechaIni.Text)
        Dim FechaFin As DateTime = CDate(LabelFechaFin.Text)
        Dim Anuladas As String

        Anuladas = 1
        If CheckAnuladas.Checked = False Then Anuladas = 0

        'strConsulta = "SELECT SUM(SFATOTFAC) AS TotalFacts, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SFAFECFAC BETWEEN CONVERT(DATETIME, '" & FechaInicio.Year & "-" & FechaInicio.Day & "-" & FechaInicio.Month & " 00:00:00') AND CONVERT(DATETIME, '" & FechaFin.Year & "-" & FechaFin.Day & "-" & FechaFin.Month & " 00:00:00')) AND (SFATIPDOC = " & ListTipoFacts.SelectedItem.Value.ToString & ") AND (SFADOCANU = " & Anuladas.ToString & ") AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (" & ListTipIngreso.SelectedItem.Value.ToString & ", 99), ADNINGRESO.AINURGCON))" 'AND CONVERT(char(3), GENDETCON.GDECODIGO) = '" & ListTipPlanesBeneficio.SelectedValue.ToString & "'"
        strConsulta = "SELECT SUM(SLNSERPRO.SERVALPRO) AS Total FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNSERPRO.SERFECSER BETWEEN CONVERT(DATETIME, '" & FechaInicio.Year & "-" & FechaInicio.Day & "-" & FechaInicio.Month & " 00:00:00') AND CONVERT(DATETIME, '" & FechaFin.Year & "-" & FechaFin.Day & "-" & FechaFin.Month & " 00:00:00'))"

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        LabelTotRango.Text = strConsulta

        If objDS.Tables(0).Rows.Count > 0 Then
            'LabelTotRango.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            LabelTotRango0.Text = "TOTAL $" & FormatNumber(objDS.Tables(0).Rows(0).Item(0).ToString, 0, , , TriState.True)
            'LabelTotRango.Text = LabelTotRango0.Text '"TOTAL $" + LabelTotRango.Text.Substring(0, (LabelTotRango.Text.LastIndexOf(",")))
            'LblTotRangoNum.Text = objDS.Tables(0).Rows(0).Item(0).ToString
        End If

    End Function

    Protected Sub DataList2_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles ListaTipPlanesBeneficio.ItemDataBound

        Dim vbLabel, vbLabel1, vbLabel2 As Label
        Dim vbIndex As Integer
        Dim cod As String

        vbIndex = e.Item.ItemIndex 'vbLabel.Text

        vbLabel = e.Item.FindControl("TipoPlanLabel")

        cod = vbLabel.Text

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String

        strConsulta = "SELECT NomPlan FROM dgTiposPlanesBeneficio WHERE CodigoPlan = N'" & vbLabel.Text & "'"

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        vbLabel = e.Item.FindControl("LabelNomTipoPlan")

        If objDS.Tables(0).Rows.Count > 0 Then
            vbLabel.Text = objDS.Tables(0).Rows(0).Item(0).ToString
        End If

        vbLabel1 = e.Item.FindControl("LabelPorc")
        vbLabel2 = e.Item.FindControl("TotalFactsLabel")

        vbLabel1.Text = (CLng(vbLabel2.Text) * 100) / CLng(LblTotRangoNum.Text)

        vbLabel1.Text = Decimal.Round(CDec(vbLabel1.Text), 2) & "%"

        'Dim vbDataList As DataList
        'vbDataList = ListaTipPlanesBeneficio.FindControl("DataList1")

        'Try
        '    vbLabel2 = vbDataList.FindControl("LabelPorcPB")
        '    vbLabel2.Text = "pryuea"
        'Catch ex As Exception

        'End Try


    End Sub

    Protected Sub ListaTipPlanesBeneficio_ItemCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles ListaTipPlanesBeneficio.ItemCommand

        'If e.CommandName = "VerPlanes" Then
        '    'Dim vbPanel As Panel
        '    Dim vbLista As DataList
        '    Dim vbBoton As LinkButton
        '    Dim vbDataSource As SqlDataSource
        '    '

        '    'vbPanel = e.Item.FindControl("Panel2")
        '    vbBoton = e.Item.FindControl("LinkVerPlanBeneficio")
        '    vbLista = e.Item.FindControl("DataList1")
        '    vbDataSource = e.Item.FindControl("DataListPlanesBeneficio")

        '    If CheckFechaFiltroAnul.Checked = True Then
        '        vbDataSource.SelectCommand = "SELECT LTRIM(GENDETCON.GDENOMBRE) AS NomPlan, SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, SLNFACTUR.GENDETCON, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, GENDETCON.GDECODIGO, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, @ValGrupo AS ValorGrupo, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECANU BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (CONVERT (char(3), GENDETCON.GDECODIGO) = @TipoPlan) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) GROUP BY LTRIM(GENDETCON.GDENOMBRE), SLNFACTUR.GENDETCON, SLNFACTUR.SFADOCANU, GENDETCON.GDECODIGO, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY NomPlan"
        '    Else
        '        '    '.SFAFECANU
        '        vbDataSource.SelectCommand = "SELECT LTRIM(GENDETCON.GDENOMBRE) AS NomPlan, SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, SLNFACTUR.GENDETCON, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, GENDETCON.GDECODIGO, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, @ValGrupo AS ValorGrupo, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (CONVERT (char(3), GENDETCON.GDECODIGO) = @TipoPlan) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) GROUP BY LTRIM(GENDETCON.GDENOMBRE), SLNFACTUR.GENDETCON, SLNFACTUR.SFADOCANU, GENDETCON.GDECODIGO, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY NomPlan"
        '    End If

        '    If vbLista.Visible = False Then
        '        vbLista.Visible = True
        '        'vbBoton.Text = "Ocultar Planes de Beneficio"
        '    Else
        '        vbLista.Visible = True
        '        vbBoton.Text = "Ver Planes de Beneficio"
        '    End If

        'End If

    End Sub

    Protected Sub DataList1_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs)


        'Dim vbDataList As DataList
        Dim vbLabel, vbLabel1, vbLabel2 As Label

        'vbDataList = ListaTipPlanesBeneficio.FindControl("DataList1")

        vbLabel = e.Item.FindControl("LabelPorcPB")
        vbLabel1 = e.Item.FindControl("LabelValGrupo")
        vbLabel2 = e.Item.FindControl("TotalFactsLabel0")



        vbLabel.Text = (CLng(vbLabel2.Text) * 100) / CLng(vbLabel1.Text.Substring(0))

        vbLabel.Text = Decimal.Round(CDec(vbLabel.Text), 2) & "%"


        'e.Item.
        'vbLabel2 = lista



    End Sub

    'SELECT CRNDOCUME.CDFECDOC AS FechaDoc, CRNRADFACD.CRFFECRAD AS FechaRadFact, CRNRADFACD.CRDVALRAD AS ValorRadicado, CRNCXC.CRNSALDO AS Saldo FROM CRNRADFACC INNER JOIN CRNRADFACD ON CRNRADFACC.OID = CRNRADFACD.CRNRADFACC INNER JOIN CRNDOCUME ON CRNRADFACC.OID = CRNDOCUME.OID INNER JOIN CRNCXC ON CRNRADFACD.OID = CRNCXC.CRNRADFACD WHERE (CRNCXC.SLNFACTUR = 554015)

    Protected Sub BtnVerCenCos_Click(sender As Object, e As System.EventArgs)

        Dim vbLista As DataList
        'Dim vbBoton As LinkButton



        'vbPanel = e.Item.FindControl("Panel2")
        'vbBoton = e.Item.FindControl("LinkVerPlanBeneficio")
        'vbLista = e.Item.FindControl("DataList1")



        ''SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN CONVERT (DATETIME, '2017-01-01 00:00:00', 102) AND CONVERT (DATETIME, '2017-01-10 00:00:00', 102)) AND (SLNFACTUR.SFATIPDOC = 2) AND (GENDETCON.OID = 123) GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = 0) ORDER BY TipoPlan

        'Function ValTotalPB(ByVal PlanBeneficios As String) 'Valor Plan de Beneficios

        '    Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        '    Dim ObjAdapter As New SqlDataAdapter
        '    Dim strConsulta As String
        '    Dim FechaInicio As DateTime = CDate(TextFechaIni.Text)
        '    Dim FechaFin As DateTime = CDate(LabelFechaFin.Text)
        '    Dim Anuladas As String

        '    Anuladas = 1
        '    If CheckAnuladas.Checked = False Then Anuladas = 0

        '    strConsulta = "SELECT SUM(SFATOTFAC) AS TotalFacts FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SFAFECFAC BETWEEN CONVERT(DATETIME, '" & FechaInicio.Year & "-" & FechaInicio.Day & "-" & FechaInicio.Month & " 00:00:00') AND CONVERT(DATETIME, '" & FechaFin.Year & "-" & FechaFin.Day & "-" & FechaFin.Month & " 00:00:00')) AND (SFATIPDOC = " & ListTipoFacts.SelectedItem.Value.ToString & ") AND (SFADOCANU = " & Anuladas.ToString & ") AND (CONVERT(char(3), GENDETCON.GDECODIGO) = ' " & PlanBeneficios & "')" 'AND CONVERT(char(3), GENDETCON.GDECODIGO) = '" & ListTipPlanesBeneficio.SelectedValue.ToString & "'"
        '    'SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN CONVERT (DATETIME, '2017-01-01 00:00:00', 102) AND CONVERT (DATETIME, '2017-01-10 00:00:00', 102)) AND (SLNFACTUR.SFATIPDOC = 2)  GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = 0) ORDER BY TipoPlan

        '    Dim Consulta As New SqlCommand(strConsulta, Conexion)

        '    ObjAdapter.SelectCommand = Consulta

        '    Conexion.Open()

        '    Dim objDS As New DataSet
        '    ObjAdapter.Fill(objDS, "Registros")

        '    Conexion.Close()

        '    If objDS.Tables(0).Rows.Count > 0 Then
        '        'LabelTotRango.Text = objDS.Tables(0).Rows(0).Item(0).ToString
        '        'LabelTotRango0.Text = "TOTAL $" & FormatNumber(LabelTotRango.Text, 0, , , TriState.True)
        '        'LabelTotRango.Text = LabelTotRango0.Text '"TOTAL $" + LabelTotRango.Text.Substring(0, (LabelTotRango.Text.LastIndexOf(",")))
        '    End If

        'End Function


    End Sub

    Protected Sub ButtonBuscar_Click(sender As Object, e As System.EventArgs) Handles ButtonBuscar.Click

        PanelInfoAnuladas.Visible = False
        GridDetalle.Visible = False
        ListBuscFactura.Visible = True

        PanelInfoFact.Visible = True

        Panel1_ModalPopupExtender.Show()



        If ListTipoBusqueda.SelectedValue = 0 Then
            LabelTxtBuscar.Text = IdFactura(TextBuscar.Text)
            LblIdFactSelec.Text = LabelTxtBuscar.Text

   
                DataListBuscFactura.SelectCommand = "SELECT SLNFACTUR.OID AS IdFactura, SLNFACTUR.SFANUMFAC, SLNFACTUR.SFATOTFAC AS ValorEntidad, SLNFACTUR.SFAVALPAC AS ValorPaciente, GENCONTRA.GECNOMENT AS PlanBenefPaciente, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS NomPaciente, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC AS NumDocPac, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINURGCON FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE SLNFACTUR.OID = N'" + LabelTxtBuscar.Text + "'"


            GridDetalle.Visible = True
            GridDetalle.PageIndex = 0
        ElseIf ListTipoBusqueda.SelectedValue = 1 Then
            LabelTxtBuscar.Text = TextBuscar.Text
            DataListBuscFactura.SelectCommand = "SELECT SLNFACTUR.OID AS IdFactura, SLNFACTUR.SFANUMFAC, SLNFACTUR.SFATOTFAC AS ValorEntidad, SLNFACTUR.SFAVALPAC AS ValorPaciente, GENCONTRA.GECNOMENT AS PlanBenefPaciente, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS NomPaciente, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC AS NumDocPac, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINURGCON FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE GENPACIEN.PACNUMDOC = N'" + LabelTxtBuscar.Text + "'"
        End If

        DataListBuscFactura.DataBind()
        'DataGridDetalle.DataBind()
        'GridDetalle.DataBind()

        'SELECT SLNFACTUR.OID AS IdFactura, SLNFACTUR.SFANUMFAC, SLNFACTUR.SFATOTFAC AS ValorEntidad, SLNFACTUR.SFAVALPAC AS ValorPaciente, GENCONTRA.GECNOMENT AS PlanBenefPaciente, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS NomPaciente, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC AS NumDocPac, SLNFACTUR.SFAFECFAC FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (SLNFACTUR.SFANUMFAC = @NumFactura)


    End Sub

    Protected Sub ListBuscFactura_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles ListBuscFactura.ItemDataBound

        Dim vbLabel, vbLabel2 As Label

        vbLabel = e.Item.FindControl("IdFacturaLabel")

        vbLabel.Visible = True

        InfoRadicacion(e, vbLabel.Text)
        InfoGlosas(e, vbLabel.Text)

        vbLabel = e.Item.FindControl("LabelIngresoPor")
        vbLabel2 = e.Item.FindControl("LabelIdIngresoPor")

        vbLabel.Text = Funciones.IngresoPor(CInt(vbLabel2.Text))

    End Sub

    Private Function InfoRadicacion(ByVal f As System.Web.UI.WebControls.DataListItemEventArgs, IdFactura As String)

        Dim vbLabel As Label

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String

        strConsulta = "SELECT CRNDOCUME.CDFECDOC AS FechaDoc, CRNRADFACD.CRFFECRAD AS FechaRadFact, CRNRADFACD.CRDVALRAD AS ValorRadicado, CRNCXC.CRNSALDO AS Saldo, CRNRADFACC.CRFESTADO AS Estado  FROM CRNRADFACC INNER JOIN CRNRADFACD ON CRNRADFACC.OID = CRNRADFACD.CRNRADFACC INNER JOIN CRNDOCUME ON CRNRADFACC.OID = CRNDOCUME.OID INNER JOIN CRNCXC ON CRNRADFACD.OID = CRNCXC.CRNRADFACD WHERE CRNCXC.SLNFACTUR = " & IdFactura & ""

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            vbLabel = f.Item.FindControl("FechaRadicacionLabel")
            vbLabel.Text = FormatDateTime(objDS.Tables(0).Rows(0).Item(0).ToString, DateFormat.ShortDate)

            vbLabel = f.Item.FindControl("ValorRadicadoLabel")
            vbLabel.Text = FormatNumber(objDS.Tables(0).Rows(0).Item(2).ToString, 0, , , TriState.True)

            vbLabel = f.Item.FindControl("SaldoLabel")
            vbLabel.Text = FormatNumber(objDS.Tables(0).Rows(0).Item(3).ToString, 0, , , TriState.True)

            vbLabel = f.Item.FindControl("EstadoLabel")
            vbLabel.Text = Funciones.EstadosRadicacion(CInt(objDS.Tables(0).Rows(0).Item(4).ToString))


        End If

        Return ""

    End Function

    Private Function InfoGlosas(ByVal f As System.Web.UI.WebControls.DataListItemEventArgs, IdFactura As String)

        Dim vbLabel As Label

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String

        strConsulta = "SELECT SUM(SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS ValorServicio, SUM(CRNRECOBJD.CROVALOBJ) AS ValorObjetado, SUM(CRNTRAOBJD.CTDVALOBJ) AS ValorAceptado FROM SLNFACTUR INNER JOIN CRNCXC ON SLNFACTUR.OID = CRNCXC.SLNFACTUR INNER JOIN CRNRECOBJC ON CRNCXC.OID = CRNRECOBJC.CRNCXC INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC INNER JOIN SLNSERPRO ON CRNRECOBJD.SLNSERPRO = SLNSERPRO.OID INNER JOIN CRNTRAOBJD ON CRNRECOBJD.OID = CRNTRAOBJD.CRNRECOBJD INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFATIPDOC = 1) AND (CONVERT (char(2), CRNCXC.CXCDOCUME) <> 'LT') AND (CRNCXC.SLNFACTUR = " & IdFactura & ") GROUP BY GENDETCON.GDENOMBRE "

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            vbLabel = f.Item.FindControl("ValServLabel")
            vbLabel.Text = FormatNumber(objDS.Tables(0).Rows(0).Item(0).ToString, 0, , , TriState.True)

            vbLabel = f.Item.FindControl("ValObjetadoLabel")
            vbLabel.Text = FormatNumber(objDS.Tables(0).Rows(0).Item(1).ToString, 0, , , TriState.True)

            vbLabel = f.Item.FindControl("ValAceptadoLabel")
            vbLabel.Text = FormatNumber(objDS.Tables(0).Rows(0).Item(2).ToString, 0, , , TriState.True)


        End If

        Return ""

    End Function


    Private Function IdFactura(ByVal NumFactura As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String

        strConsulta = "SELECT OID FROM SLNFACTUR WHERE SFANUMFAC = N'" & NumFactura & "'"

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString()
        End If

        Return "0"

    End Function



    Protected Sub GridDetalle_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridDetalle.RowDataBound
        Try

            e.Row.Cells(5).ForeColor = Drawing.Color.Black

            If IsNumeric(CInt(e.Row.Cells(5).Text)) Then
                If CInt(e.Row.Cells(5).Text) > CInt(e.Row.Cells(6).Text) Then
                    e.Row.Cells(5).ForeColor = Drawing.Color.Red
                End If
            End If

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub GridCenCos_SelectedIndexChanged(sender As Object, e As System.EventArgs)

        Dim vbGrid As GridView
        vbGrid = sender

        Dim message As String = "Selected Item: " & vbGrid.SelectedIndex.ToString
        ScriptManager.RegisterClientScriptBlock(TryCast(sender, Control), Me.GetType(), "alert", "alert('" & message & "');", True)

    End Sub
End Class
