Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Partial Class Facturacion_ResumenFacturacion
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        'LabelTotRango0.Text = CDec("#")

    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        'Dim vbPanel As Panel
        'Dim vbBoton As LinkButton
        'Dim vbLabel As Label
        Dim vbDataList As DataList
        'LabelTotRango0.Text = ""

        'ListaTipPlanesBeneficio.Dispose()

        'ListaTipPlanesBeneficio.DataBind()

        'LabelFechaFin.Visible = True

        If IsDate(TextFechaFin.Text) And IsDate(TextFechaFin.Text) Then 'And ListaTipPlanesBeneficio.Items.Count > 0 Then

            LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)


            ValTotalRango()

            'ListObjeciones.DataBind() ******** NO HACER DATABINDS. GENEREN ERROR (LA LISTA PRINCIPAL SE ACTUALIZA SOLA)


            'Dim i As Integer
            ''If ListaTipPlanesBeneficio.Items.Count > 1 Then
            For i = 0 To ListObjeciones.Items.Count - 1
                vbDataList = ListObjeciones.Items(i).FindControl("ListPlanBeneficio")
                vbDataList.Visible = True

                'vbPanel = ListaTipPlanesBeneficio.Items(i).FindControl("Panel2")
                'vbBoton = ListaTipPlanesBeneficio.Items(i).FindControl("BtnVerFacturas")
                'vbPanel.Visible = False
                'vbBoton.Text = "Ver Facturas"

            Next
            'End If
        Else

            LabelTotRango0.Text = "DEBE SELECCIONAR UNA FECHA DE INICIO Y UNA FECHA FINAL"

        End If

        'For i = 0 To ListaTipPlanesBeneficio.Items.Count - 1
        'vbLabel = ListaTipPlanesBeneficio.Items(i).FindControl("LabelNomTipoPlan")


        'LabelTotRango0.Visible = True

        'Next


    End Sub


    Protected Sub ListObjeciones_ItemCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles ListObjeciones.ItemCommand

        Dim vbDataSource As SqlDataSource
        Dim vbDataList As DataList

        vbDataSource = e.Item.FindControl("DataListPlanBeneficio")
        vbDataList = e.Item.FindControl("ListPlanBeneficio")

        'vbDataSource.SelectCommand = "SELECT SUM(SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS ValorServicio, SUM(CRNRECOBJD.CROVALOBJ) AS ValorObjetado, SUM(CRNTRAOBJD.CTDVALOBJ) AS ValorAceptado, CONVERT (char(3), GENDETCON.GDECODIGO) AS CodContrato FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN CRNCXC ON SLNFACTUR.OID = CRNCXC.SLNFACTUR INNER JOIN CRNRECOBJC ON CRNCXC.OID = CRNRECOBJC.CRNCXC INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC INNER JOIN SLNSERPRO ON CRNRECOBJD.SLNSERPRO = SLNSERPRO.OID INNER JOIN CRNCONOBJ ON CRNRECOBJD.CRNCONOBJ = CRNCONOBJ.OID INNER JOIN CRNTRAOBJD ON CRNRECOBJD.OID = CRNTRAOBJD.CRNRECOBJD INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFATIPDOC = 1) AND (CONVERT (char(2), CRNCXC.CXCDOCUME) <> 'LT') AND (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicial AND @FechaFinal) AND (CRNCXC.CXCESTCAR = @Estado) AND (SLNFACTUR.OID = 1) GROUP BY CONVERT (char(3), GENDETCON.GDECODIGO)"

        If e.CommandName = "TiposContrato" Then

            vbDataSource.SelectCommand = "SELECT SUM(SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS ValorServicio, SUM(CRNRECOBJD.CROVALOBJ) AS ValorObjetado, SUM(CRNTRAOBJD.CTDVALOBJ) AS ValorAceptado, CONVERT (char(3), GENDETCON.GDECODIGO) AS CodContrato FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN CRNCXC ON SLNFACTUR.OID = CRNCXC.SLNFACTUR INNER JOIN CRNRECOBJC ON CRNCXC.OID = CRNRECOBJC.CRNCXC INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC INNER JOIN SLNSERPRO ON CRNRECOBJD.SLNSERPRO = SLNSERPRO.OID INNER JOIN CRNCONOBJ ON CRNRECOBJD.CRNCONOBJ = CRNCONOBJ.OID INNER JOIN CRNTRAOBJD ON CRNRECOBJD.OID = CRNTRAOBJD.CRNRECOBJD INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFATIPDOC = 1) AND (CONVERT (char(2), CRNCXC.CXCDOCUME) <> 'LT') AND (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicial AND @FechaFinal) AND (CRNCXC.CXCESTCAR = @Estado) GROUP BY CONVERT (char(3), GENDETCON.GDECODIGO)"
            vbDataList.DataBind()
            vbDataList.Visible = True
            LabelTotRango0.Text = "Entro"
        End If

    End Sub


    'SELECT SUM(SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS ValorServicio, SUM(CRNRECOBJD.CROVALOBJ) AS ValorObjetado, SUM(CRNTRAOBJD.CTDVALOBJ) AS ValorAceptado, GENDETCON.GDENOMBRE FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN CRNCXC ON SLNFACTUR.OID = CRNCXC.SLNFACTUR INNER JOIN CRNRECOBJC ON CRNCXC.OID = CRNRECOBJC.CRNCXC INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC INNER JOIN SLNSERPRO ON CRNRECOBJD.SLNSERPRO = SLNSERPRO.OID INNER JOIN CRNCONOBJ ON CRNRECOBJD.CRNCONOBJ = CRNCONOBJ.OID INNER JOIN CRNTRAOBJD ON CRNRECOBJD.OID = CRNTRAOBJD.CRNRECOBJD INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFATIPDOC = 1) AND (CONVERT (char(2), CRNCXC.CXCDOCUME) <> 'LT') AND (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicial AND @FechaFinal) AND (CRNCXC.CXCESTCAR = @Estado) AND (CONVERT (char(3), GENDETCON.GDECODIGO) = @Contrato) GROUP BY GENDETCON.GDENOMBRE

    Function ValTotalRango()

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String
        Dim FechaInicio As DateTime = CDate(TextFechaIni.Text)
        Dim FechaFin As DateTime = CDate(LabelFechaFin.Text)
        Dim Anuladas As String

        Anuladas = 1

        If CheckAnuladas.Checked = False Then Anuladas = 0

        strConsulta = "SELECT SUM(SFATOTFAC) AS TotalFacts, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SFAFECFAC BETWEEN CONVERT(DATETIME, '" & FechaInicio.Year & "-" & FechaInicio.Day & "-" & FechaInicio.Month & " 00:00:00') AND CONVERT(DATETIME, '" & FechaFin.Year & "-" & FechaFin.Day & "-" & FechaFin.Month & " 00:00:00')) AND (SFATIPDOC = " & ListTipoFacts.SelectedItem.Value.ToString & ") AND (SFADOCANU = " & Anuladas.ToString & ") AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (" & ListTipIngreso.SelectedItem.Value.ToString & ", 99), ADNINGRESO.AINURGCON))" 'AND CONVERT(char(3), GENDETCON.GDECODIGO) = '" & ListTipPlanesBeneficio.SelectedValue.ToString & "'"

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        'LabelTotRango0.Text = strConsulta

        If objDS.Tables(0).Rows.Count > 0 Then
            'LabelTotRango.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            LabelTotRango0.Text = "TOTAL PACIENTE $" & FormatNumber(objDS.Tables(0).Rows(0).Item(1).ToString, 0, , , TriState.True) & " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TOTAL ENTIDADES $" & FormatNumber(objDS.Tables(0).Rows(0).Item(0).ToString, 0, , , TriState.True)
            'LabelTotRango.Text = LabelTotRango0.Text '"TOTAL $" + LabelTotRango.Text.Substring(0, (LabelTotRango.Text.LastIndexOf(",")))
            'LblTotRangoNum.Text = objDS.Tables(0).Rows(0).Item(0).ToString
        End If

    End Function


    Protected Sub ListPlanBeneficio_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs)

        Dim vbLabel, vbLabel1, vbLabel2 As Label
        Dim vbIndex As Integer
        Dim cod As String

        vbIndex = e.Item.ItemIndex 'vbLabel.Text

        vbLabel = e.Item.FindControl("CodContratoLabel")

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

        vbLabel = e.Item.FindControl("NomContratoLabel")

        If objDS.Tables(0).Rows.Count > 0 Then
            vbLabel.Text = objDS.Tables(0).Rows(0).Item(0).ToString + " - "
        End If

        'vbLabel1 = e.Item.FindControl("LabelPorc")
        'vbLabel2 = e.Item.FindControl("TotalFactsLabel")

        'vbLabel1.Text = (CLng(vbLabel2.Text) * 100) / CLng(LblTotRangoNum.Text)

        'vbLabel1.Text = Decimal.Round(CDec(vbLabel1.Text), 2) & "%"

        'Dim vbDataList As DataList
        'vbDataList = ListaTipPlanesBeneficio.FindControl("DataList1")

        'Try
        '    vbLabel2 = vbDataList.FindControl("LabelPorcPB")
        '    vbLabel2.Text = "pryuea"
        'Catch ex As Exception

        'End Try


    End Sub

    Protected Sub ListPlanBeneficio_ItemCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs)


        Dim vbDataSource As SqlDataSource
        Dim vbDataList As DataList

        vbDataSource = e.Item.FindControl("DataListEntidades")
        vbDataList = e.Item.FindControl("ListEntidades")

        'vbDataSource.SelectCommand = "SELECT SUM(SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS ValorServicio, SUM(CRNRECOBJD.CROVALOBJ) AS ValorObjetado, SUM(CRNTRAOBJD.CTDVALOBJ) AS ValorAceptado, CONVERT (char(3), GENDETCON.GDECODIGO) AS CodContrato FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN CRNCXC ON SLNFACTUR.OID = CRNCXC.SLNFACTUR INNER JOIN CRNRECOBJC ON CRNCXC.OID = CRNRECOBJC.CRNCXC INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC INNER JOIN SLNSERPRO ON CRNRECOBJD.SLNSERPRO = SLNSERPRO.OID INNER JOIN CRNCONOBJ ON CRNRECOBJD.CRNCONOBJ = CRNCONOBJ.OID INNER JOIN CRNTRAOBJD ON CRNRECOBJD.OID = CRNTRAOBJD.CRNRECOBJD INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFATIPDOC = 1) AND (CONVERT (char(2), CRNCXC.CXCDOCUME) <> 'LT') AND (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicial AND @FechaFinal) AND (CRNCXC.CXCESTCAR = @Estado) AND (SLNFACTUR.OID = 1) GROUP BY CONVERT (char(3), GENDETCON.GDECODIGO)"

        If e.CommandName = "Entidades" Then

            vbDataSource.SelectCommand = "SELECT SUM(SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS ValorServicio, SUM(CRNRECOBJD.CROVALOBJ) AS ValorObjetado, SUM(CRNTRAOBJD.CTDVALOBJ) AS ValorAceptado, GENDETCON.GDENOMBRE FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN CRNCXC ON SLNFACTUR.OID = CRNCXC.SLNFACTUR INNER JOIN CRNRECOBJC ON CRNCXC.OID = CRNRECOBJC.CRNCXC INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC INNER JOIN SLNSERPRO ON CRNRECOBJD.SLNSERPRO = SLNSERPRO.OID INNER JOIN CRNCONOBJ ON CRNRECOBJD.CRNCONOBJ = CRNCONOBJ.OID INNER JOIN CRNTRAOBJD ON CRNRECOBJD.OID = CRNTRAOBJD.CRNRECOBJD INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFATIPDOC = 1) AND (CONVERT (char(2), CRNCXC.CXCDOCUME) <> 'LT') AND (CRNRECOBJC.CROFECOBJ BETWEEN @FechaInicial AND @FechaFinal) AND (CRNCXC.CXCESTCAR = @Estado) AND (CONVERT (char(3), GENDETCON.GDECODIGO) = @Contrato) GROUP BY GENDETCON.GDENOMBRE"
            vbDataList.DataBind()
            vbDataList.Visible = True

        End If

    End Sub

    Protected Sub ListObjeciones_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles ListObjeciones.ItemDataBound

        Dim vbLabel1 As Label
        Dim vblabel2 As Label
        Dim FechaInicio As DateTime = CDate(TextFechaIni.Text)
        Dim FechaFin As DateTime = CDate(LabelFechaFin.Text)


        vbLabel1 = e.Item.FindControl("TotalFacturadoLabel")
        vblabel2 = e.Item.FindControl("CXCESTCARLabel")

        vbLabel1.Text = vblabel2.Text



        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String

        strConsulta = "SELECT  SUM(SLNFACTUR.SFATOTFAC) AS Expr1 FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN CRNCXC ON SLNFACTUR.OID = CRNCXC.SLNFACTUR WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFATIPDOC = 1) AND (CONVERT (char(2), CRNCXC.CXCDOCUME) <> 'LT') AND (SLNFACTUR.SFAFECFAC BETWEEN CONVERT(DATETIME, '" & FechaInicio.Year & "-" & FechaInicio.Day & "-" & FechaInicio.Month & " 00:00:00') AND CONVERT(DATETIME, '" & FechaFin.Year & "-" & FechaFin.Day & "-" & FechaFin.Month & " 00:00:00')) AND (CRNCXC.CXCESTCAR = " & vblabel2.Text & ") GROUP BY CRNCXC.CXCESTCAR"

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        'vbLabel = e.Item.FindControl("NomContratoLabel")

        If objDS.Tables(0).Rows.Count > 0 Then
            vbLabel1.Text = FormatNumber(objDS.Tables(0).Rows(0).Item(0).ToString, 0, , , TriState.True)
        End If



        'SELECT CRNCXC.CXCESTCAR AS IdEstado, SUM(SLNFACTUR.SFATOTFAC) AS Expr1 FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN CRNCXC ON SLNFACTUR.OID = CRNCXC.SLNFACTUR WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFATIPDOC = 1) AND (CONVERT (char(2), CRNCXC.CXCDOCUME) <> 'LT') AND (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicial AND @FechaFinal) AND (CRNCXC.CXCESTCAR = 4) GROUP BY CRNCXC.CXCESTCAR

    End Sub






End Class

    'Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs)

    '    Dim vbGrid As GridView

    '    vbGrid = sender

    '    LblIdFactSelec.Text = vbGrid.SelectedDataKey.Value.ToString
    '    Panel1.Height = 600

    '    PanelInfoAnuladas.Visible = False
    '    If CheckAnuladas.Checked = True Then PanelInfoAnuladas.Visible = True

    '    DetalleAnulacion(LblIdFactSelec.Text)

    '    Panel1_ModalPopupExtender.Show()
    '    GridDetalle.PageIndex = 0


    'End Sub

    'Protected Sub GridDetalle_PageIndexChanged(sender As Object, e As System.EventArgs) Handles GridDetalle.PageIndexChanged
    '    Panel1_ModalPopupExtender.Show()
    'End Sub

    'Function DetalleAnulacion(ByVal IdFactura As String)

    '    Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
    '    Dim ObjAdapter As New SqlDataAdapter
    '    Dim strConsulta As String

    '    strConsulta = "SELECT SLNFACTUR.SFAJUSANU AS JustifAnulacion, GENUSUARIO.USUNOMBRE AS UserAnulo, GENUSUARIO.USUDESCRI AS NomUserAnulo FROM SLNFACTUR INNER JOIN GENUSUARIO ON SLNFACTUR.GENUSUARIO2 = GENUSUARIO.OID WHERE SLNFACTUR.OID = " & IdFactura

    '    Dim Consulta As New SqlCommand(strConsulta, Conexion)

    '    ObjAdapter.SelectCommand = Consulta

    '    Conexion.Open()

    '    Dim objDS As New DataSet
    '    ObjAdapter.Fill(objDS, "Registros")

    '    Conexion.Close()

    '    If objDS.Tables(0).Rows.Count > 0 Then
    '        LabelDetAnulacion.Text = objDS.Tables(0).Rows(0).Item(0).ToString
    '        LabelUsAnulo.Text = "Anulado por: " + objDS.Tables(0).Rows(0).Item(2).ToString + " (" + objDS.Tables(0).Rows(0).Item(1).ToString + ")"
    '    End If

    'End Function

    'Function DetalleFactura(ByVal IdFactura As String)

    '    Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
    '    Dim ObjAdapter As New SqlDataAdapter
    '    Dim strConsulta As String

    '    strConsulta = "SELECT SLNFACTUR.SFAJUSANU AS JustifAnulacion, GENUSUARIO.USUNOMBRE AS UserAnulo, GENUSUARIO.USUDESCRI AS NomUserAnulo FROM SLNFACTUR INNER JOIN GENUSUARIO ON SLNFACTUR.GENUSUARIO2 = GENUSUARIO.OID WHERE SLNFACTUR.OID = " & IdFactura

    '    Dim Consulta As New SqlCommand(strConsulta, Conexion)

    '    ObjAdapter.SelectCommand = Consulta

    '    Conexion.Open()

    '    Dim objDS As New DataSet
    '    ObjAdapter.Fill(objDS, "Registros")

    '    Conexion.Close()

    '    If objDS.Tables(0).Rows.Count > 0 Then
    '        LabelDetAnulacion.Text = objDS.Tables(0).Rows(0).Item(0).ToString
    '        LabelUsAnulo.Text = "Anulado por: " + objDS.Tables(0).Rows(0).Item(2).ToString + " (" + objDS.Tables(0).Rows(0).Item(1).ToString + ")"
    '    End If

    'End Function



    'Protected Sub DataList1_ItemCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs)

    '    'datagridview    
    '    'datagridcencos    



    '    Dim vbPanel As Panel
    '    Dim vbDatasource, vbDatasource2 As SqlDataSource


    '    vbPanel = e.Item.FindControl("Panel2")
    '    vbPanel.Visible = False



    '    vbPanel = e.Item.FindControl("Panel3")
    '    vbPanel.Visible = False

    '    If e.CommandName = "VerFacturas" Then
    '        'Dim vbPanel As Panel
    '        Dim vbBoton As LinkButton

    '        vbPanel = e.Item.FindControl("Panel2")
    '        vbBoton = e.Item.FindControl("BtnVerFacturas")
    '        vbDatasource = e.Item.FindControl("DataGridView")

    '        vbDatasource.SelectCommand = "SELECT SLNFACTUR.OID AS IdFactura, SLNFACTUR.SFANUMFAC, SLNFACTUR.SFATOTFAC, SLNFACTUR.SFAFECFAC, SLNFACTUR.SFADOCANU, SLNFACTUR.SFAFECANU AS FechaAnulacion, GENPACIEN.PACNUMDOC, SLNFACTUR.SFAVALPAC AS ValPac FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.GENDETCON = @PlanBeneficios) AND (SLNFACTUR.SFADOCANU = @Anuladas) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON))"

    '        'If vbPanel.Visible = False Then
    '        vbPanel.Visible = True
    '        'vbBoton.Text = "Ocultar Facturas"
    '        'Else
    '        'vbPanel.Visible = True
    '        'vbBoton.Text = "Ver Facturas"
    '        'End If
    '    ElseIf e.CommandName = "VerCenCos" Then
    '    'Dim vbPanel As Panel
    '        Dim vbBoton As LinkButton
    '        Dim vbGrid As GridView

    '        vbPanel = e.Item.FindControl("Panel3")
    '        vbBoton = e.Item.FindControl("BtnVerCenCos")
    '        vbGrid = e.Item.FindControl("GridCenCos")
    '        vbGrid.EmptyDataText = "Prueba"

    '        vbDatasource2 = e.Item.FindControl("DataGridCenCos")

    '        vbDatasource2.SelectCommand = "SELECT CTNCENCOS.CCCODIGO, CTNCENCOS.CCNOMBRE, SUM(SLNFACTUR.SFATOTFAC) AS Total FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN SLNANSEPR ON ADNINGRESO.OID = SLNANSEPR.ADNINGRES1 INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN CTNCENCOS ON SLNSERPRO.CTCENCOS1 = CTNCENCOS.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) GROUP BY CTNCENCOS.CCCODIGO, CTNCENCOS.CCNOMBRE"

    '        vbGrid.DataBind()
    '        'If vbPanel.Visible = False Then
    '        vbPanel.Visible = True

    '        'vbBoton.Text = "Ocultar Facturas"
    '        'Else
    '        'vbPanel.Visible = True
    '        'vbBoton.Text = "Ver Facturas"
    '        'End If


    '    End If
    'End Sub

    

    'Protected Sub DataList2_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles ListaTipPlanesBeneficio.ItemDataBound

    '    Dim vbLabel, vbLabel1, vbLabel2 As Label
    '    Dim vbIndex As Integer
    '    Dim cod As String

    '    vbIndex = e.Item.ItemIndex 'vbLabel.Text

    '    vbLabel = e.Item.FindControl("TipoPlanLabel")

    '    cod = vbLabel.Text

    '    Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
    '    Dim ObjAdapter As New SqlDataAdapter
    '    Dim strConsulta As String

    '    strConsulta = "SELECT NomPlan FROM dgTiposPlanesBeneficio WHERE CodigoPlan = N'" & vbLabel.Text & "'"

    '    Dim Consulta As New SqlCommand(strConsulta, Conexion)

    '    ObjAdapter.SelectCommand = Consulta

    '    Conexion.Open()

    '    Dim objDS As New DataSet
    '    ObjAdapter.Fill(objDS, "Registros")

    '    Conexion.Close()

    '    vbLabel = e.Item.FindControl("LabelNomTipoPlan")

    '    If objDS.Tables(0).Rows.Count > 0 Then
    '        vbLabel.Text = objDS.Tables(0).Rows(0).Item(0).ToString
    '    End If

    '    vbLabel1 = e.Item.FindControl("LabelPorc")
    '    vbLabel2 = e.Item.FindControl("TotalFactsLabel")

    '    vbLabel1.Text = (CLng(vbLabel2.Text) * 100) / CLng(LblTotRangoNum.Text)

    '    vbLabel1.Text = Decimal.Round(CDec(vbLabel1.Text), 2) & "%"

    '    'Dim vbDataList As DataList
    '    'vbDataList = ListaTipPlanesBeneficio.FindControl("DataList1")

    '    'Try
    '    '    vbLabel2 = vbDataList.FindControl("LabelPorcPB")
    '    '    vbLabel2.Text = "pryuea"
    '    'Catch ex As Exception

    '    'End Try


    'End Sub

    'Protected Sub ListaTipPlanesBeneficio_ItemCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles ListaTipPlanesBeneficio.ItemCommand

    '    If e.CommandName = "VerPlanes" Then
    '        'Dim vbPanel As Panel
    '        Dim vbLista As DataList
    '        Dim vbBoton As LinkButton
    '        Dim vbDataSource As SqlDataSource
    '        '

    '        'vbPanel = e.Item.FindControl("Panel2")
    '        vbBoton = e.Item.FindControl("LinkVerPlanBeneficio")
    '        vbLista = e.Item.FindControl("DataList1")
    '        vbDataSource = e.Item.FindControl("DataListPlanesBeneficio")

    '        vbDataSource.SelectCommand = "SELECT LTRIM(GENDETCON.GDENOMBRE) AS NomPlan, SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, SLNFACTUR.GENDETCON, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, GENDETCON.GDECODIGO, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, @ValGrupo AS ValorGrupo, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (CONVERT (char(3), GENDETCON.GDECODIGO) = @TipoPlan) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) GROUP BY LTRIM(GENDETCON.GDENOMBRE), SLNFACTUR.GENDETCON, SLNFACTUR.SFADOCANU, GENDETCON.GDECODIGO, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY NomPlan"

    '        If vbLista.Visible = False Then
    '            vbLista.Visible = True
    '            'vbBoton.Text = "Ocultar Planes de Beneficio"
    '        Else
    '            vbLista.Visible = True
    '            vbBoton.Text = "Ver Planes de Beneficio"
    '        End If

    '    End If

    'End Sub

    'Protected Sub DataList1_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs)


    '    'Dim vbDataList As DataList
    '    Dim vbLabel, vbLabel1, vbLabel2 As Label

    '    'vbDataList = ListaTipPlanesBeneficio.FindControl("DataList1")

    '    vbLabel = e.Item.FindControl("LabelPorcPB")
    '    vbLabel1 = e.Item.FindControl("LabelValGrupo")
    '    vbLabel2 = e.Item.FindControl("TotalFactsLabel0")



    '    vbLabel.Text = (CLng(vbLabel2.Text) * 100) / CLng(vbLabel1.Text.Substring(0))

    '    vbLabel.Text = Decimal.Round(CDec(vbLabel.Text), 2) & "%"


    '    'e.Item.
    '    'vbLabel2 = lista



    'End Sub



    'Protected Sub BtnVerCenCos_Click(sender As Object, e As System.EventArgs)

    '    Dim vbLista As DataList
    '    'Dim vbBoton As LinkButton



    '    'vbPanel = e.Item.FindControl("Panel2")
    '    'vbBoton = e.Item.FindControl("LinkVerPlanBeneficio")
    '    'vbLista = e.Item.FindControl("DataList1")



    '    ''SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN CONVERT (DATETIME, '2017-01-01 00:00:00', 102) AND CONVERT (DATETIME, '2017-01-10 00:00:00', 102)) AND (SLNFACTUR.SFATIPDOC = 2) AND (GENDETCON.OID = 123) GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = 0) ORDER BY TipoPlan

    '    'Function ValTotalPB(ByVal PlanBeneficios As String) 'Valor Plan de Beneficios

    '    '    Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
    '    '    Dim ObjAdapter As New SqlDataAdapter
    '    '    Dim strConsulta As String
    '    '    Dim FechaInicio As DateTime = CDate(TextFechaIni.Text)
    '    '    Dim FechaFin As DateTime = CDate(LabelFechaFin.Text)
    '    '    Dim Anuladas As String

    '    '    Anuladas = 1
    '    '    If CheckAnuladas.Checked = False Then Anuladas = 0

    '    '    strConsulta = "SELECT SUM(SFATOTFAC) AS TotalFacts FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SFAFECFAC BETWEEN CONVERT(DATETIME, '" & FechaInicio.Year & "-" & FechaInicio.Day & "-" & FechaInicio.Month & " 00:00:00') AND CONVERT(DATETIME, '" & FechaFin.Year & "-" & FechaFin.Day & "-" & FechaFin.Month & " 00:00:00')) AND (SFATIPDOC = " & ListTipoFacts.SelectedItem.Value.ToString & ") AND (SFADOCANU = " & Anuladas.ToString & ") AND (CONVERT(char(3), GENDETCON.GDECODIGO) = ' " & PlanBeneficios & "')" 'AND CONVERT(char(3), GENDETCON.GDECODIGO) = '" & ListTipPlanesBeneficio.SelectedValue.ToString & "'"
    '    '    'SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN CONVERT (DATETIME, '2017-01-01 00:00:00', 102) AND CONVERT (DATETIME, '2017-01-10 00:00:00', 102)) AND (SLNFACTUR.SFATIPDOC = 2)  GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = 0) ORDER BY TipoPlan

    '    '    Dim Consulta As New SqlCommand(strConsulta, Conexion)

    '    '    ObjAdapter.SelectCommand = Consulta

    '    '    Conexion.Open()

    '    '    Dim objDS As New DataSet
    '    '    ObjAdapter.Fill(objDS, "Registros")

    '    '    Conexion.Close()

    '    '    If objDS.Tables(0).Rows.Count > 0 Then
    '    '        'LabelTotRango.Text = objDS.Tables(0).Rows(0).Item(0).ToString
    '    '        'LabelTotRango0.Text = "TOTAL $" & FormatNumber(LabelTotRango.Text, 0, , , TriState.True)
    '    '        'LabelTotRango.Text = LabelTotRango0.Text '"TOTAL $" + LabelTotRango.Text.Substring(0, (LabelTotRango.Text.LastIndexOf(",")))
    '    '    End If

    '    'End Function


    'End Sub

    
