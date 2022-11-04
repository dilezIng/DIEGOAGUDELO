Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web

Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Dim NomMes As New FunBasicas

    Protected Sub ListMeses_Load(sender As Object, e As System.EventArgs) Handles ListMeses.Load

        If IsPostBack = False Then
            Dim i As Integer = 2012
            Dim j, k, l, m As Integer

            l = 1
            m = 1

            ListMeses.Items.Add("Seleccione un Mes")
            ListMeses.Items(0).Value = -2
            ListMeses.Items(0).Text = "Seleccione un Mes"


            For i = Today.Year To 2012 Step -1

                k = 12
                If i = Today.Year Then k = Today.Month

                For j = k To 1 Step -1
                    Dim mes As String
                    mes = j.ToString
                    If j < 10 Then mes = "0" + j.ToString

                    ListMeses.Items.Add(i.ToString + "." + mes)
                    ListMeses.Items.Item(l).Value = i.ToString + "." + mes
                    ListMeses.Items.Item(l).Text = NomMes.NomMeses(j) + " de " + i.ToString
                    l = l + 1
                Next

                '////////////////////////////////////////////////////////////////

                'k = 4
                'If i = Today.Year Then k = Today.Month / k

                'For j = k To 1 Step -1
                '    ListTrimestres.Items.Add(i.ToString + "." + j.ToString)
                '    ListTrimestres.Items(m).Value = i.ToString + "." + j.ToString
                '    ListTrimestres.Items(m).Text = j.ToString + " Trimestre de " + i.ToString
                '    m = m + 1
                'Next

            Next
        End If

    End Sub

    Protected Sub ListMeses_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListMeses.SelectedIndexChanged

        GridProductos.PageIndex = 0
        ActuGridProductos()

        'Label1.Text = ListMeses.SelectedValue.ToString

    End Sub

    Private Function ActuGridProductos()

        Dim vbConsulta As String

        vbConsulta = "SELECT INNPRODUC.OID AS IdProducto, INNPRODUC.IPRCODIGO AS CodProducto, RTRIM(LTRIM(INNPRODUC.IPRDESCOR)) AS NomProducto, INNSTOPRO.ISPSONSUPROM FROM INKD201706 INNER JOIN INNPRODUC ON INKD201706.INNPRODUC = INNPRODUC.OID INNER JOIN INNSTOPRO ON INNPRODUC.OID = INNSTOPRO.IPRPRODUC WHERE (INKD201706.INNALMACE = 4) OR (INKD201706.INNALMACE = 2) GROUP BY RTRIM(LTRIM(INNPRODUC.IPRDESCOR)), INNPRODUC.OID, INNPRODUC.IPRCODIGO, INNSTOPRO.ISPSONSUPROM ORDER BY NomProducto"

        vbConsulta = vbConsulta.Replace("INKD201706", "INKD" & ListMeses.SelectedValue.Replace(".", ""))

        DataGridProductos.SelectCommand = vbConsulta

        GridProductos.DataBind()

    End Function



    Private Function vbValores(ByVal IdMes As String, ByVal IdProducto As String, ByVal TipoMov As String, ByVal IdAlmacen As String) As String


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String = ""
        Dim ObjAdapter As New SqlDataAdapter


        'If TipoConsulta = "CantPacsTriage" Then
        '    StrConsulta = "SELECT COUNT(HCTCONFIR) AS Expr1 FROM  HCNTRIAGE WHERE (HCTCONFIR = 1) AND (CONVERT(char(7), HCTFECTRI, 102) = '" & IdMes & "')"
        'ElseIf TipoConsulta = "CantPacsUrgeMes" Then
        '    StrConsulta = "SELECT COUNT(HCNTRIAGE.HCTNUMERO) AS Expr1 FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE WHERE  (CONVERT(char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "')"
        'ElseIf TipoConsulta = "CantPacsReingMes" Then
        '    Dim vbDia As String = (IdMes + ".01").Replace(".", "-")
        '    If CDate(vbDia) > CDate("2017-03-31") Then 'Para diferenciar la forma de obtencion del dato de reingreso de urgencias
        '        StrConsulta = "SELECT COUNT(HCMHCURGE.HCCM09N109) AS Expr1 FROM HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.OID = HCNTRIAGE.ADNINGRESO INNER JOIN HCMHCURGE ON HCNFOLIO.OID = HCMHCURGE.HCNFOLIO WHERE (CONVERT (char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "') AND (HCNTRIAGE.HCTFECTRI > CONVERT(DATETIME, '2017-04-05 00:00:00', 102)) GROUP BY HCMHCURGE.HCCM09N109 HAVING (HCMHCURGE.HCCM09N109 = N'Si') "
        '    Else
        '        StrConsulta = "SELECT COUNT(HCNTRIAGE.HCTNUMERO) AS Expr1 FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE WHERE  (CONVERT(char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "') AND (HCNTRIAGE.HCTREINGRES = 1)"
        '    End If
        'ElseIf TipoConsulta = "CantPacsSinPagador" Then
        '    StrConsulta = "SELECT COUNT(ADNINGRESO.GENDETCON) AS Expr1 FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE WHERE (CONVERT(char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "') AND (ADNINGRESO.GENDETCON = 115)"
        'End If


        StrConsulta = "SELECT SUM(INKCANTID) AS Expr1 FROM INKD" & IdMes & "  WHERE  (INNPRODUC = " & IdProducto & ") AND (INNALMACE = " & IdAlmacen & ") AND (INKTIPMOV = " & TipoMov & ")"


        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return FormatNumber(objDS.Tables(0).Rows(0).Item(0).ToString, 0, , , TriState.True)
        Else
            Return "0"
        End If


    End Function

    Protected Sub GridProductos_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridProductos.RowDataBound

        Dim vbLabel As Label

        vbLabel = e.Row.FindControl("LabelEntrada02")

        Try
            vbLabel.Text = vbValores(ListMeses.SelectedValue.Replace(".", ""), e.Row.DataItem(0).ToString, 0, 2)
        Catch ex As Exception

        End Try

        vbLabel = e.Row.FindControl("LabelSalida02")

        Try
            vbLabel.Text = vbValores(ListMeses.SelectedValue.Replace(".", ""), e.Row.DataItem(0).ToString, 1, 2)
        Catch ex As Exception

        End Try


        vbLabel = e.Row.FindControl("LabelExist02")

        Try
            vbLabel.Text = vbExistencias(ListMeses.SelectedValue.Replace(".", ""), e.Row.DataItem(0).ToString, 2)
        Catch ex As Exception

        End Try


        '/////////////Almacen 50


        vbLabel = e.Row.FindControl("LabelEntrada50")

        Try
            vbLabel.Text = vbValores(ListMeses.SelectedValue.Replace(".", ""), e.Row.DataItem(0).ToString, 0, 4)
        Catch ex As Exception

        End Try


        vbLabel = e.Row.FindControl("LabelSalida50")

        Try
            vbLabel.Text = vbValores(ListMeses.SelectedValue.Replace(".", ""), e.Row.DataItem(0).ToString, 1, 4)
        Catch ex As Exception

        End Try


        vbLabel = e.Row.FindControl("LabelExist50")

        Try
            vbLabel.Text = vbExistencias(ListMeses.SelectedValue.Replace(".", ""), e.Row.DataItem(0).ToString, 4)
        Catch ex As Exception

        End Try
    End Sub


    Private Function vbExistencias(ByVal IdMes As String, ByVal IdProducto As String, ByVal IdAlmacen As String) As String


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String = ""
        Dim ObjAdapter As New SqlDataAdapter


        'If TipoConsulta = "CantPacsTriage" Then
        '    StrConsulta = "SELECT COUNT(HCTCONFIR) AS Expr1 FROM  HCNTRIAGE WHERE (HCTCONFIR = 1) AND (CONVERT(char(7), HCTFECTRI, 102) = '" & IdMes & "')"
        'ElseIf TipoConsulta = "CantPacsUrgeMes" Then
        '    StrConsulta = "SELECT COUNT(HCNTRIAGE.HCTNUMERO) AS Expr1 FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE WHERE  (CONVERT(char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "')"
        'ElseIf TipoConsulta = "CantPacsReingMes" Then
        '    Dim vbDia As String = (IdMes + ".01").Replace(".", "-")
        '    If CDate(vbDia) > CDate("2017-03-31") Then 'Para diferenciar la forma de obtencion del dato de reingreso de urgencias
        '        StrConsulta = "SELECT COUNT(HCMHCURGE.HCCM09N109) AS Expr1 FROM HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.OID = HCNTRIAGE.ADNINGRESO INNER JOIN HCMHCURGE ON HCNFOLIO.OID = HCMHCURGE.HCNFOLIO WHERE (CONVERT (char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "') AND (HCNTRIAGE.HCTFECTRI > CONVERT(DATETIME, '2017-04-05 00:00:00', 102)) GROUP BY HCMHCURGE.HCCM09N109 HAVING (HCMHCURGE.HCCM09N109 = N'Si') "
        '    Else
        '        StrConsulta = "SELECT COUNT(HCNTRIAGE.HCTNUMERO) AS Expr1 FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE WHERE  (CONVERT(char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "') AND (HCNTRIAGE.HCTREINGRES = 1)"
        '    End If
        'ElseIf TipoConsulta = "CantPacsSinPagador" Then
        '    StrConsulta = "SELECT COUNT(ADNINGRESO.GENDETCON) AS Expr1 FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE WHERE (CONVERT(char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "') AND (ADNINGRESO.GENDETCON = 115)"
        'End If



        StrConsulta = "SELECT TOP (1) CASE WHEN INKTIPMOV = 1 THEN INKCANANTA - INKCANTID ELSE INKCANANTA + INKCANTID END AS Saldo FROM INKD" & IdMes & " WHERE (INNPRODUC = " & IdProducto & ") AND (INNALMACE = " & IdAlmacen & ") ORDER BY OID DESC"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return FormatNumber(objDS.Tables(0).Rows(0).Item(0).ToString, 0, , , TriState.True)
        Else
            Return "0"
        End If


    End Function


    Protected Sub GridProductos_PageIndexChanged(sender As Object, e As System.EventArgs) Handles GridProductos.PageIndexChanged

        ActuGridProductos()

    End Sub

    Protected Sub GridProductos_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridProductos.RowCommand

        GridMovimientos.Visible = True
        GridDetalleCompra.Visible = False


        Dim vbConsulta As String
        'Dim abc As String
        'Dim vbIndex As Integer
        'Dim vbFila As GridViewRow = DirectCast(DirectCast(e.CommandSource, ImageButton).NamingContainer, GridViewRow)

        'Try
        'vbIndex = e.CommandSource
        'Catch ex As Exception

        'End Try


        'LabelMedicamento.Text = vbFila.RowIndex
        'LabelMedicamento.Text = vbFila.Cells(0).Te


        LabelMedicamento.Text = GridProductos.DataKeys(e.CommandArgument).Item(1).ToString

        'LabelMedicamento.Text = vbIndex.ToString
        'abc = GridProductos.DataKeys(e.CommandArgument).Item(0).ToString

        If e.CommandName = "Ver02" Then

            Label1.Text = "ver02"
            Panel1_ModalPopupExtender.Show()

            vbConsulta = "SELECT INKD201706.OID as IdKardex, INKD201706.INKFECHA AS FechaDocumento, INNLOTSER.ILSCODIGO AS CodLote, INNLOTSER.ILSFECVEN AS FechaVencimiento, INNDOCUME.IDTIPDOC, INNDOCUME.IDCONSEC, GENTERCER.TERNUMDOC, CASE WHEN INKTIPMOV = 0 THEN INKCANTID ELSE 0 END AS Entrada, CASE WHEN INKTIPMOV = 1 THEN INKCANTID ELSE 0 END AS Salida,  CASE WHEN INKTIPMOV = 1 THEN INKCANANTA - INKCANTID ELSE INKCANANTA + INKCANTID END AS Existencias, INKD201706.INKCOSPROM as CostoPromedio FROM INKD201706 INNER JOIN INNDOCUME ON INKD201706.INNDOCUME = INNDOCUME.OID INNER JOIN INNLOTSER ON INKD201706.INNLOTSER = INNLOTSER.OID LEFT OUTER JOIN GENTERCER ON INKD201706.GENTERCER = GENTERCER.OID WHERE (INKD201706.INNALMACE = 2) AND (INKD201706.INNPRODUC = " & GridProductos.DataKeys(e.CommandArgument).Item(0).ToString & ")  ORDER BY INKD201706.OID"
            vbConsulta = vbConsulta.Replace("INKD201706", "INKD" & ListMeses.SelectedValue.Replace(".", ""))

            DataGridMovimientos.SelectCommand = vbConsulta


        ElseIf e.CommandName = "Ver50" Then
            Label1.Text = "Ver50"
            Panel1_ModalPopupExtender.Show()

            vbConsulta = "SELECT INKD201706.OID as IdKardex, INKD201706.INKFECHA AS FechaDocumento, INNLOTSER.ILSCODIGO AS CodLote, INNLOTSER.ILSFECVEN AS FechaVencimiento, INNDOCUME.IDTIPDOC, INNDOCUME.IDCONSEC, GENTERCER.TERNUMDOC, CASE WHEN INKTIPMOV = 0 THEN INKCANTID ELSE 0 END AS Entrada, CASE WHEN INKTIPMOV = 1 THEN INKCANTID ELSE 0 END AS Salida,  CASE WHEN INKTIPMOV = 1 THEN INKCANANTA - INKCANTID ELSE INKCANANTA + INKCANTID END AS Existencias, INKD201706.INKCOSPROM as CostoPromedio FROM INKD201706 INNER JOIN INNDOCUME ON INKD201706.INNDOCUME = INNDOCUME.OID INNER JOIN INNLOTSER ON INKD201706.INNLOTSER = INNLOTSER.OID LEFT OUTER JOIN GENTERCER ON INKD201706.GENTERCER = GENTERCER.OID WHERE (INKD201706.INNALMACE = 4) AND (INKD201706.INNPRODUC = " & GridProductos.DataKeys(e.CommandArgument).Item(0).ToString & ")  ORDER BY INKD201706.OID"
            vbConsulta = vbConsulta.Replace("INKD201706", "INKD" & ListMeses.SelectedValue.Replace(".", ""))

            DataGridMovimientos.SelectCommand = vbConsulta

        End If



    End Sub

    Protected Sub GridMovimientos_DataBound(sender As Object, e As System.EventArgs) Handles GridMovimientos.DataBound
        LabelCantMovs.Text = GridMovimientos.Rows.Count.ToString + " Movimientos"
    End Sub

    Protected Sub GridMovimientos_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridMovimientos.RowDataBound
        Dim vbLabel As Label


        vbLabel = e.Row.FindControl("LabelEntrada02")


    End Sub

    Protected Sub GridMovimientos_RowCreated(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridMovimientos.RowCreated

        Dim vbLabel As Label

        vbLabel = e.Row.FindControl("LabelTipoMov")

        Try
            vbLabel.Text = FunTipoMov(e.Row.DataItem(4).ToString)
        Catch ex As Exception

        End Try

    End Sub

    Private Function FunTipoMov(ByVal IdTipoMov As String) As String

        'Return IdTipoMov

        If IdTipoMov = "-1" Then
            Return "Movimiento Kardex"
        ElseIf IdTipoMov = "0" Then
            Return "Orden Compra"
        ElseIf IdTipoMov = "1" Then
            Return "Remisión Entrada"
        ElseIf IdTipoMov = "2" Then
            Return "Comprobante Entrada"
        ElseIf IdTipoMov = "3" Then
            Return "Suministro Paciente"
        ElseIf IdTipoMov = "4" Then
            Return "Inventario Inicial"
        ElseIf IdTipoMov = "5" Then
            Return "Devolución Suministro"
        ElseIf IdTipoMov = "6" Then
            Return "Cierre Mensual"
        ElseIf IdTipoMov = "7" Then
            Return "Cotización"
        ElseIf IdTipoMov = "8" Then
            Return "Remisión Salida"
        ElseIf IdTipoMov = "9" Then
            Return "Pedido"
        ElseIf IdTipoMov = "10" Then
            Return "Prestamo Mercancia"
        ElseIf IdTipoMov = "11" Then
            Return "Ajuste Inventario"
        ElseIf IdTipoMov = "12" Then
            Return "Factura"
        ElseIf IdTipoMov = "13" Then
            Return "Compromisos"
        ElseIf IdTipoMov = "14" Then
            Return "Devolución Remisión"
        ElseIf IdTipoMov = "15" Then
            Return "Devolución Compra"
        ElseIf IdTipoMov = "16" Then
            Return "Devolución Venta"
        ElseIf IdTipoMov = "17" Then
            Return "Orden Despacho"
        ElseIf IdTipoMov = "18" Then
            Return "Contrato"
        ElseIf IdTipoMov = "19" Then
            Return "Orden Servicio"
        ElseIf IdTipoMov = "20" Then
            Return "Orden Producción"
        ElseIf IdTipoMov = "21" Then
            Return "Devolucion Orden Despacho"
        ElseIf IdTipoMov = "22" Then
            Return "Solicitud Pedido"
        ElseIf IdTipoMov = "23" Then
            Return "Demanda Insatisfecha"
        ElseIf IdTipoMov = "24" Then
            Return "Traslado Producto Consignación"
        End If
    End Function

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If GridInventario.Visible = False Then
            GridInventario.Visible = True
            GridProductos.Visible = False
            ButtonExcel.Enabled = True
            Button1.Text = "Ver Kardex"
            GridInventario.DataBind()
            ListMeses.Visible = False
            ListBodegas.Visible = True
            LabelSubTitulo.Text = "Bodega:"
        Else
            GridInventario.Visible = False
            GridProductos.Visible = True
            ButtonExcel.Enabled = False
            Button1.Text = "Ver Inventario"
            ListMeses.Visible = True
            ListBodegas.Visible = False
            LabelSubTitulo.Text = "Periodo:"
        End If


    End Sub

    Protected Sub ButtonExcel_Click(sender As Object, e As System.EventArgs) Handles ButtonExcel.Click

        GridInventario.DataBind()

        Try

            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridInventario.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridInventario)
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

    End Sub

    Protected Sub GridInventario_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridInventario.RowDataBound

        Try

            e.Row.Cells(9).ForeColor = Drawing.Color.Black

            If IsNumeric(CInt(e.Row.Cells(6).Text)) Then

                If IsNumeric(CInt(e.Row.Cells(9).Text)) Then
                    If CInt(e.Row.Cells(6).Text) > CInt(e.Row.Cells(9).Text) Then
                        e.Row.Cells(9).ForeColor = Drawing.Color.Red
                    End If
                End If

                If IsNumeric(CInt(e.Row.Cells(10).Text)) Then
                    If CInt(e.Row.Cells(6).Text) > CInt(e.Row.Cells(10).Text) Then
                        e.Row.Cells(10).ForeColor = Drawing.Color.Red
                    End If
                End If

                If IsNumeric(CInt(e.Row.Cells(11).Text)) Then
                    If CInt(e.Row.Cells(6).Text) > CInt(e.Row.Cells(11).Text) Then
                        e.Row.Cells(11).ForeColor = Drawing.Color.Red
                    End If
                End If


            End If
        Catch ex As Exception

        End Try




        Dim vbLabel As Label

        vbLabel = e.Row.FindControl("LabelCostProm")

        Try
            vbLabel.Text = FunCostoPromedio(e.Row.DataItem(0).ToString, e.Row.DataItem(6).ToString)
        Catch ex As Exception

        End Try

        'vbLabel = e.Row.FindControl("LabelValUltCompra")

        'Try
        '    vbLabel.Text = FunValUltCompra(e.Row.DataItem(0).ToString, e.Row.DataItem(6).ToString)
        'Catch ex As Exception

        'End Try

        'LabelValUltCompra
    End Sub


    Private Function FunCostoPromedio(ByVal CodProducto As String, ByVal IdAlmacen As String) As String

        'Return CodProducto

        Dim vbTabla As String

        If Now.Month = 1 Then
            vbTabla = "INKD" & (Now.Year - 1).ToString & "12"
        Else
            vbTabla = "INKD" & Now.Year.ToString
            If Now.Month < 10 Then
                vbTabla = vbTabla & "0" & Now.Month.ToString
            Else
                vbTabla = vbTabla & Now.Month.ToString
            End If
        End If


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String = ""
        Dim ObjAdapter As New SqlDataAdapter

        'StrConsulta = "SELECT TOP (1) CASE WHEN INKTIPMOV = 1 THEN INKCANANTA - INKCANTID ELSE INKCANANTA + INKCANTID END AS Saldo FROM INKD" & IdMes & " WHERE (INNPRODUC = " & IdProducto & ") AND (INNALMACE = " & IdAlmacen & ") ORDER BY OID DESC"

        'StrConsulta = "SELECT AVG(INKD201706.INKCOSPROM) AS Promedio FROM  INNPRODUC INNER JOIN INKD201706 ON INNPRODUC.OID = INKD201706.INNPRODUC  WHERE (INNPRODUC.IPRCODIGO = N'" & CodProducto & "') AND (INKD201706.INNALMACE = " & IdAlmacen & ")  "
        StrConsulta = "SELECT AVG(" & vbTabla & ".INKCOSPROM) AS Promedio FROM  INNPRODUC INNER JOIN " & vbTabla & " ON INNPRODUC.OID = " & vbTabla & ".INNPRODUC  WHERE (INNPRODUC.IPRCODIGO = N'" & CodProducto & "') AND (" & vbTabla & ".INNALMACE = " & IdAlmacen & ")  "


        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return FormatNumber(objDS.Tables(0).Rows(0).Item(0).ToString, 0, , , TriState.True)
        Else
            Return "0"
        End If

    End Function


    Private Function FunValUltCompra(ByVal CodProducto As String, ByVal IdAlmacen As String) As String

        'Return CodProducto

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String = ""
        Dim ObjAdapter As New SqlDataAdapter

        'StrConsulta = "SELECT TOP (1) CASE WHEN INKTIPMOV = 1 THEN INKCANANTA - INKCANTID ELSE INKCANANTA + INKCANTID END AS Saldo FROM INKD" & IdMes & " WHERE (INNPRODUC = " & IdProducto & ") AND (INNALMACE = " & IdAlmacen & ") ORDER BY OID DESC"

        'StrConsulta = "SELECT AVG(INKD201706.INKCOSPROM) AS Promedio FROM  INNPRODUC INNER JOIN INKD201706 ON INNPRODUC.OID = INKD201706.INNPRODUC  WHERE (INNPRODUC.IPRCODIGO = N'" & CodProducto & "') AND (INKD201706.INNALMACE = " & IdAlmacen & ")  "
        StrConsulta = "SELECT TOP (1) INNMCOMPR.IMCVALUNI FROM INNCCOMPR INNER JOIN INNMCOMPR ON INNCCOMPR.OID = INNMCOMPR.INNCCOMPR INNER JOIN INNPRODUC ON INNMCOMPR.INNPRODUC = INNPRODUC.OID INNER JOIN INNDOCUME ON INNCCOMPR.OID = INNDOCUME.OID WHERE (INNDOCUME.IDTIPDOC = 2) AND (INNDOCUME.IDESTADO = 1) AND (INNPRODUC.IPRCODIGO = N'" & CodProducto & "') ORDER BY INNMCOMPR.OID DESC"


        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return FormatNumber(objDS.Tables(0).Rows(0).Item(0).ToString, 0, , , TriState.True)
        Else
            Return "0"
        End If

    End Function

    Protected Sub GridInventario_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridInventario.RowCommand

        GridMovimientos.Visible = False
        GridDetalleCompra.Visible = True

        If e.CommandName = "VerDetalle" Then

            Label1.Text = "ver02"
            Panel1_ModalPopupExtender.Show()
            LabelCodProducto.Text = GridInventario.DataKeys(e.CommandArgument).Item(0).ToString
            LabelMedicamento.Text = GridInventario.DataKeys(e.CommandArgument).Item(1).ToString

            GridDetalleCompra.DataBind()

            LabelCantMovs.Text = GridDetalleCompra.Rows.Count.ToString + " Entradas."

        End If



    End Sub

    

End Class
