Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient


Partial Class Facturacion_PypEvento
    Inherits System.Web.UI.Page

    Dim NomMes As New FunBasicas

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then
            Dim i As Integer = 2012
            Dim j, k, l As Integer

            l = 0

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
            Next
        End If

    End Sub

    Private Function ConsultaSql(ByVal Filtro As String) As String

        Dim Consulta As String

        Consulta = "SELECT SUBSTRING(SLNFACTUR.SFANUMFAC, 1, 4) AS Prefijo, SUBSTRING(SLNFACTUR.SFANUMFAC, 5, 20) AS NumFactura, CASE WHEN TERTIPDOC = 1 THEN 'CC' ELSE (CASE WHEN TERTIPDOC = 2 THEN 'CE' ELSE CASE WHEN TERTIPDOC = 5 THEN 'PA' ELSE 'NI' END END) END AS TipoDocIps, '891855438' AS NitHRD, '1523800664' AS CodHabilitacionIPS, GEENENTADM.ENTCODIGO AS CodigoEPS, 2 AS CodigoCuenta, '' AS CodigoContrato, CONVERT (nvarchar(10), SLNFACTUR.SFAFECFAC, 103) AS FechaFactura, CONVERT (decimal(11 , 0), SLNFACTUR.SFATOTFAC + SLNFACTUR.SFAVALPAC) AS ValorBruto, CONVERT (decimal(11 , 0), SLNCONHOJ.SCONETPAC) AS ValCopago, CONVERT (decimal(11 , 0), 0) AS ValCopCompartido, CONVERT (decimal(11 , 0), 0) AS ValorIva, CONVERT (decimal(11 , 0), 0) AS ValorIco, CONVERT (decimal(11 , 0), 0) AS ValorModeradora, CONVERT (decimal(11 , 0), 0) AS ValorDesc, '' AS ConcepDesc, CONVERT (decimal(11 , 0), SLNFACTUR.SFATOTFAC) AS ValorNeto, '' AS Periodo, 2 AS CodRegional, 1 AS ClasOrigen, '' AS TipoServPgp, '' AS TipoServPaf, '' AS Finconsulta, '' AS DiasTratamiento, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CN' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 12 THEN 'CD' ELSE 'AS' END END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC AS NumDocPac, GENPACIEN.PACPRINOM AS PacPriNom, GENPACIEN.PACSEGNOM AS PacSegNom, GENPACIEN.PACPRIAPE AS PacPriApel, GENPACIEN.PACSEGAPE AS PacSegApel, "
        Consulta = Consulta + "STR(DATEDIFF(year, GENPACIEN.GPAFECNAC, GETDATE()), 4, 0) AS EdadPac, CASE WHEN GENPACIEN.GPASEXPAC = 1 THEN 'M' ELSE CASE WHEN GENPACIEN.GPASEXPAC = 2 THEN 'F' ELSE 'X' END END AS Sexo, CASE WHEN GPAESTADO = 2 THEN '0' ELSE '1' END AS Estado, CASE WHEN GPADISSEV = 1 THEN 'S' ELSE 'N' END AS Discapacidad, CASE WHEN IPRTIPPRO = 1 THEN 'I' ELSE CASE WHEN IPRTIPPRO = 2 THEN 'M' ELSE 'P' END END AS TipoPrestacion, CASE WHEN SIPCODCUP IS NULL THEN IPRCODALT ELSE SIPCODCUP END AS CodPresPrincipal, '' AS CodPresDetalle, RTRIM(SLNSERPRO.SERDESSER) AS DescrpProced, CONVERT (nvarchar(10), SLNSERPRO.SERFECSER, 103) AS FechaProced, CONVERT (nvarchar(5), SLNSERPRO.SERFECSER, 114) AS HoraProced, CONVERT (decimal(11 , 0), SLNSERPRO.SERCANTID) AS Cantidad, CONVERT (decimal(11 , 0), SLNSERPRO.SERVALPRO) AS ValorUnitario, '0' AS ValorCompartido, CASE WHEN SLNSERPRO.SERCOPCTA = 2 THEN CONVERT (decimal(11 , 0) , SLNSERPRO.SERVALPAC) ELSE 0 END AS ValModeradora, CASE WHEN SLNSERPRO.SERCOPCTA = 1 THEN ROUND ((CONVERT (decimal(11 , 0) , SLNSERPRO.SERVALPAC * SLNSERPRO.SERCANTID)), 0, 1) ELSE 0 END AS ValCopago, CONVERT (decimal(11 , 0), (SLNSERPRO.SERVALENT * SLNSERPRO.SERCANTID)) AS ValorTotServicio, ADNINGRESO.AINNUMAUT AS CodAutorizacion, (SELECT TOP (1) GENDIAGNO_3.DIACODIGO FROM ADNDIAEGR INNER JOIN ADNEGRESO ON ADNDIAEGR.ADNEGRESO = ADNEGRESO.OID INNER JOIN GENDIAGNO AS GENDIAGNO_3 ON ADNDIAEGR.DIACODIGO = GENDIAGNO_3.OID WHERE (ADNDIAEGR.Tipo = 5) AND (ADNEGRESO.ADNINGRESO = ADNINGRESO.OID)) AS DxP, ADNEGRESO_1.ADETIPDIA AS TipoDiagnostico, '' as DxS1, '' as DxS2, CONVERT (nvarchar(10), ADNINGRESO.AINFECING, 103) AS FechaEntrada, CONVERT (nvarchar(5), ADNINGRESO.AINFECING, 114) AS HoraEntrada, CONVERT (nvarchar(10), ADNEGRESO_1.ADEFECSAL, 103) AS FechaSalida, CONVERT (nvarchar(5), ADNEGRESO_1.ADEFECSAL, 114) AS HoraSalida "
        'Consulta = Consulta + "FROM SLNSERHOJ RIGHT OUTER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID RIGHT OUTER JOIN SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENTERCER ON GENCONTRA.GENTERCER1 = GENTERCER.OID INNER JOIN GEENENTADM ON GENCONTRA.DGNENTADM1 = GEENENTADM.OID INNER JOIN SLNCONHOJ ON ADNINGRESO.OID = SLNCONHOJ.ADNINGRES1 INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNORDSER ON SLNSERPRO.SLNORDSER1 = SLNORDSER.OID LEFT OUTER JOIN ADNEGRESO AS ADNEGRESO_1 ON ADNINGRESO.OID = ADNEGRESO_1.ADNINGRESO ON SLNSERHOJ.OID = SLNSERPRO.OID LEFT OUTER JOIN INNPRODUC INNER JOIN SLNPROHOJ ON INNPRODUC.OID = SLNPROHOJ.INNPRODUC1 ON SLNSERPRO.OID = SLNPROHOJ.OID "
        Consulta = Consulta + "FROM SLNANSEPR INNER JOIN SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENTERCER ON GENCONTRA.GENTERCER1 = GENTERCER.OID INNER JOIN GEENENTADM ON GENCONTRA.DGNENTADM1 = GEENENTADM.OID INNER JOIN SLNCONHOJ ON ADNINGRESO.OID = SLNCONHOJ.ADNINGRES1 INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNORDSER ON SLNSERPRO.SLNORDSER1 = SLNORDSER.OID ON SLNANSEPR.SLNORDSER1 = SLNORDSER.OID AND SLNANSEPR.GENDETCON1 = SLNFACTUR.GENDETCON LEFT OUTER JOIN ADNEGRESO AS ADNEGRESO_1 ON ADNINGRESO.OID = ADNEGRESO_1.ADNINGRESO LEFT OUTER JOIN SLNSERHOJ RIGHT OUTER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID ON SLNSERPRO.OID = SLNSERHOJ.OID LEFT OUTER JOIN INNPRODUC INNER JOIN SLNPROHOJ ON INNPRODUC.OID = SLNPROHOJ.INNPRODUC1 ON SLNSERPRO.OID = SLNPROHOJ.OID  "

        'Consulta = "SELECT 'BOYACA' AS AreaSanidad, 'HOSPITAL REGIONAL DUITAMA' AS IPS, 'xxx' AS NumRadicacion, 'Fecha Radicacion Factura' AS FechaRadicacion, GENSERIPS.GENCONFAC1, GENSERIPS.GENGRUPOS1, GENSERIPS.GENSUBGRU1, SLNFACTUR.SFANUMFAC AS NumFactura, CONVERT (nvarchar(10), SLNFACTUR.SFAFECFAC, 103) AS FechaFactura, CONVERT (nvarchar(10), SLNSERPRO.SERFECSER, 103) AS FechaAtencion, GENPACIEN.PACPRINOM + ' ' + CASE WHEN GENPACIEN.PACSEGNOM IS NULL THEN '' ELSE GENPACIEN.PACSEGNOM + ' ' END + GENPACIEN.PACPRIAPE + CASE WHEN GENPACIEN.PACSEGAPE IS NULL THEN '' ELSE ' ' + GENPACIEN.PACSEGAPE END AS NomUsuario, GENPACIEN.PACNUMDOC AS NumDocUsuario, RTRIM(GENSERIPS.SIPNOMBRE) AS CUPS, (SELECT TOP (1) GENDIAGNO_3.DIANOMBRE FROM ADNDIAEGR INNER JOIN ADNEGRESO ON ADNDIAEGR.ADNEGRESO = ADNEGRESO.OID INNER JOIN GENDIAGNO AS GENDIAGNO_3 ON ADNDIAEGR.DIACODIGO = GENDIAGNO_3.OID WHERE (ADNDIAEGR.Tipo = 5) AND (ADNEGRESO.ADNINGRESO = ADNINGRESO.OID)) AS DxCie10, CONVERT (decimal(11 , 0), SLNCONHOJ.SCONETPAC + SLNCONHOJ.SCONETENT) AS ValorFactura, '' AS ValorGlosa, '' AS ValorAcepIps, '' AS ValorAcepPonal, CONVERT (decimal(11 , 0), SLNCONHOJ.SCONETPAC + SLNCONHOJ.SCONETENT) - CONVERT (decimal(11 , 0), SLNCONHOJ.SCONETPAC) - CONVERT (decimal(11 , 0), 0) + CONVERT (decimal(11 , 0), 0) + CONVERT (decimal(11 , 0), 0) - CONVERT (decimal(11 , 0), 0) - CONVERT (decimal(11 , 0), 0) AS ValorAPagar, '' AS Conicliada, '' AS Observacion, STR(DATEDIFF(year, GENPACIEN.GPAFECNAC, GETDATE()), 4, 0) AS EdadPac  "
        'Consulta = Consulta + " FROM GENSERIPS INNER JOIN SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENTERCER ON GENCONTRA.GENTERCER1 = GENTERCER.OID INNER JOIN GEENENTADM ON GENCONTRA.DGNENTADM1 = GEENENTADM.OID INNER JOIN SLNCONHOJ ON ADNINGRESO.OID = SLNCONHOJ.ADNINGRES1 INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNSERHOJ ON SLNSERPRO.OID = SLNSERHOJ.OID ON GENSERIPS.OID = SLNSERHOJ.GENSERIPS1 LEFT OUTER JOIN ADNEGRESO AS ADNEGRESO_1 ON ADNINGRESO.OID = ADNEGRESO_1.ADNINGRESO  "
        'SELECT 'BOYACA' AS AreaSanidad, 'HOSPITAL REGIONAL DUITAMA' AS IPS, 'xxx' AS NumRadicacion, 'Fecha Radicacion Factura' AS FechaRadicacion, GENSERIPS.GENCONFAC1, GENSERIPS.GENGRUPOS1, GENSERIPS.GENSUBGRU1, SLNFACTUR.SFANUMFAC AS NumFactura, CONVERT (nvarchar(10), SLNFACTUR.SFAFECFAC, 103) AS FechaFactura, CONVERT (nvarchar(10), SLNSERPRO.SERFECSER, 103) AS FechaAtencion, GENPACIEN.PACPRINOM + ' ' + CASE WHEN GENPACIEN.PACSEGNOM IS NULL THEN '' ELSE GENPACIEN.PACSEGNOM + ' ' END + GENPACIEN.PACPRIAPE + CASE WHEN GENPACIEN.PACSEGAPE IS NULL THEN '' ELSE ' ' + GENPACIEN.PACSEGAPE END AS NomUsuario, GENPACIEN.PACNUMDOC AS NumDocUsuario, RTRIM(GENSERIPS.SIPNOMBRE) AS CUPS, (SELECT TOP (1) GENDIAGNO_3.DIANOMBRE FROM ADNDIAEGR INNER JOIN ADNEGRESO ON ADNDIAEGR.ADNEGRESO = ADNEGRESO.OID INNER JOIN GENDIAGNO AS GENDIAGNO_3 ON ADNDIAEGR.DIACODIGO = GENDIAGNO_3.OID WHERE (ADNDIAEGR.Tipo = 5) AND (ADNEGRESO.ADNINGRESO = ADNINGRESO.OID)) AS DxCie10, CONVERT (decimal(11 , 0), SLNCONHOJ.SCONETPAC + SLNCONHOJ.SCONETENT) AS ValorFactura, '' AS ValorGlosa, '' AS ValorAcepIps, '' AS ValorAcepPonal, CONVERT (decimal(11 , 0), SLNCONHOJ.SCONETPAC + SLNCONHOJ.SCONETENT) - CONVERT (decimal(11 , 0), SLNCONHOJ.SCONETPAC) - CONVERT (decimal(11 , 0), 0) + CONVERT (decimal(11 , 0), 0) + CONVERT (decimal(11 , 0), 0) - CONVERT (decimal(11 , 0), 0) - CONVERT (decimal(11 , 0), 0) AS ValorAPagar, '' AS Conicliada, '' AS Observacion, STR(DATEDIFF(year, GENPACIEN.GPAFECNAC, GETDATE()), 4, 0) AS EdadPac  "


        If Filtro = "" Then
            Consulta = Consulta + "WHERE (GENDETCON.OID = " & ListPlanes.SelectedItem.Value & ") AND (CONVERT (char(7), SLNFACTUR.SFAFECFAC, 102) = '" & ListMeses.SelectedItem.Value & "') "

        Else
            'Consulta = Consulta + "AND (GENSERIPS.GENCONFAC1 = 1 OR GENSERIPS.GENCONFAC1 = 4) AND (SLNSERHOJ.OID IS NOT NULL) " 'PARA POLICIA, ANULAR PARA CAFESALUD

            Consulta = Consulta + Filtro
        End If

        'Consulta = Consulta + " AND (SLNSERHOJ.OID IS NOT NULL) " 'PARA POLICIA, ANULAR PARA CAFESALUD
        'Consulta = Consulta + "AND (GENSERIPS.GENSUBGRU1 = 12 OR GENSERIPS.GENSUBGRU1 = 8) AND (SLNSERHOJ.OID IS NOT NULL) " 'PARA POLICIA, ANULAR PARA CAFESALUD
        'Consulta = Consulta + "AND (GENSERIPS.GENSUBGRU1 = 12 OR GENSERIPS.GENSUBGRU1 = 8) " ' PARA CAFESALUD
        Consulta = Consulta + "AND (SLNFACTUR.SFADOCANU <> 1) AND (SLNSERPRO.SERVALENT > 0) AND (SLNORDSER.SOSESTADO = 1) "
        'Consulta = Consulta + "AND (SLNSERPRO.SERVALENT > 0) "

        Consulta = Consulta + "ORDER BY NumFactura, SLNSERPRO.SERFECSER "

        Label1.Visible = True
        'Label1.Text = Consulta

        Return Consulta

    End Function



    Protected Sub ListMeses_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListMeses.SelectedIndexChanged

        ListPlanes.DataBind()

    End Sub


    Function GenerarArchivo(ByVal FiltroConsulta As String, ByVal FiltroMes As String, ByVal FiltroContrato As String, ByVal NomContrato As String) 'ByVal Generar As Boolean, ByVal Tipo As String)

        Dim NomArchivo As String
        Dim mydocpath As String = Server.MapPath("~/Facturacion/Archivos/")
        Dim strConsulta As String

        If FiltroConsulta = "" Then
            NomArchivo = NomContrato + "_" + FiltroMes.Replace(".", "") + ".txt"
            strConsulta = ConsultaSql("")
        Else
            NomArchivo = System.Guid.NewGuid.ToString + ".txt"
            LabelNomarchivo.Text = NomArchivo
            strConsulta = ConsultaSql(FiltroConsulta)
        End If


        If File.Exists(mydocpath & NomArchivo) = True Then System.IO.File.Delete(mydocpath & NomArchivo)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()


        Dim i, j, k As Integer
        Dim LineaTexto As String = ""
        Dim sb As New StringBuilder()

        k = objDS.Tables(0).Columns.Count - 1

        Dim OutFile As System.IO.StreamWriter
        OutFile = My.Computer.FileSystem.OpenTextFileWriter(mydocpath & NomArchivo + "", True)

        If objDS.Tables(0).Rows.Count > 0 Then
            For i = 0 To objDS.Tables(0).Rows.Count - 1
                For j = 0 To k
                    LineaTexto = LineaTexto + Trim(objDS.Tables(0).Rows(i).Item(j).ToString()) + "|"
                Next
                LineaTexto = LineaTexto.Substring(0, LineaTexto.Length - 1)
                OutFile.WriteLine(LineaTexto)
                sb.AppendLine(LineaTexto)
                LineaTexto = ""
                'If i > objDS.Tables(0).Rows.Count / 2 Then Exit For
            Next

        End If
        OutFile.Close()

        LinkButton1.Text = "Creación: " & File.GetLastWriteTime(mydocpath & NomArchivo) & "<BR/>Tamaño: " & FileLen(mydocpath & NomArchivo) & " bytes"


    End Function


    Function CantFacturas(ByVal Filtro As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String

        strConsulta = "SELECT COUNT(SLNFACTUR.OID) AS Expr2 FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENTERCER ON GENCONTRA.GENTERCER1 = GENTERCER.OID INNER JOIN GEENENTADM ON GENCONTRA.DGNENTADM1 = GEENENTADM.OID INNER JOIN SLNCONHOJ ON ADNINGRESO.OID = SLNCONHOJ.ADNINGRES1 "

        If Filtro = "" Then
            strConsulta = strConsulta + "WHERE (GENDETCON.OID = " & ListPlanes.SelectedItem.Value & ") AND (CONVERT (char(7), SLNFACTUR.SFAFECFAC, 102) = '" & ListMeses.SelectedItem.Value & "') "
        Else
            strConsulta = strConsulta + Filtro
        End If

        strConsulta = strConsulta + "AND (SLNFACTUR.SFADOCANU <> 1)  "

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString + " Facturas encontradas"
        End If

    End Function

    Protected Sub BtnGenerar_Click(sender As Object, e As System.EventArgs) Handles BtnGenerar.Click

        GenerarArchivo("", ListMeses.SelectedItem.Value, ListPlanes.SelectedItem.Value, ListPlanes.SelectedItem.Text.Substring(0, ListPlanes.SelectedItem.Text.IndexOf(" ")))
        Panel1.Visible = False
        LinkButton1.Visible = True

    End Sub

    Protected Sub BtnPreliminar_Click(sender As Object, e As System.EventArgs) Handles BtnPreliminar.Click

        DataGridMuestra.SelectCommand = ConsultaSql("")
        GridMuestra.DataBind()
        Panel1.Visible = True
        LinkButton1.Visible = False
        LabelCantFacts.Text = CantFacturas("")

    End Sub

    Private Function DescargarArchivo(ByVal vbPeriodo As Boolean)

        Dim filename As String = ListPlanes.SelectedItem.Text.Substring(0, ListPlanes.SelectedItem.Text.IndexOf(" ")) + "_" + ListMeses.SelectedValue.Replace(".", "") + ".txt"
        Dim dlDir As String = Server.MapPath("~/Facturacion/Archivos/")


        If vbPeriodo = False Then filename = LabelNomarchivo.Text

        Dim path As String = dlDir & filename
        Dim toDownload As New FileInfo(Server.MapPath("~/Facturacion/Archivos") & "\" & filename)

        If (File.Exists(path)) Then
            Response.Clear()
            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename)
            Response.AddHeader("Content-Length", toDownload.Length.ToString())
            Response.ContentType = "text/plain"
            Response.WriteFile(path)
            Response.End()
        End If

    End Function

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click

        If RadioButtonList1.SelectedValue = 0 Then
            DescargarArchivo(True)
        Else
            DescargarArchivo(False)
        End If

    End Sub


    Protected Sub BtnNumfacts_Click(sender As Object, e As System.EventArgs) Handles BtnNumfacts.Click

        Dim i As Integer
        Dim Elementos As String()
        Dim vbFiltro As String = "WHERE ("

        TextBox1.Text = TextBox1.Text.Replace(Environment.NewLine, ",")

        Elementos = TextBox1.Text.Split(",")

        'For i = 0 To Elementos.Length - 1
        '    vbFiltro = vbFiltro + "SUBSTRING(SLNFACTUR.SFANUMFAC, 5, 20) = '000" + Elementos(i).ToString + "' or "
        'Next

        For i = 0 To Elementos.Length - 1
            vbFiltro = vbFiltro + "SLNFACTUR.OID = " & FunIdFactura("000" + Elementos(i).ToString) + " or "
        Next

        vbFiltro = vbFiltro.Substring(0, vbFiltro.Length - 3)
        vbFiltro = vbFiltro + ") "


        DataGridMuestra.SelectCommand = ConsultaSql(vbFiltro)

        'Label1.Text = DataGridMuestra.SelectCommand
        GridMuestra.DataBind()
        Panel1.Visible = True
        LabelCantFacts.Text = CantFacturas(vbFiltro).ToString + " - " + GridMuestra.Rows.Count.ToString + " Filas en la grilla"
        LinkButton1.Visible = False

    End Sub


    Private Function FunIdFactura(ByVal Numfactura As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        Dim strConsulta As String

        strConsulta = "SELECT OID FROM  SLNFACTUR WHERE  (SUBSTRING(SFANUMFAC, 5, 20) = '" & Numfactura & "') "

        'If Filtro = "" Then
        'strConsulta = strConsulta + "WHERE (GENDETCON.OID = " & ListPlanes.SelectedItem.Value & ") AND (CONVERT (char(7), SLNFACTUR.SFAFECFAC, 102) = '" & ListMeses.SelectedItem.Value & "') "
        'Else
        'strConsulta = strConsulta + Filtro
        'End If

        'strConsulta = strConsulta + "AND (SLNFACTUR.SFADOCANU <> 1)  "

        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            Return 0
        End If



    End Function

    Protected Sub RadioButtonList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

        If RadioButtonList1.SelectedValue = 0 Then
            PanelPeriodo.Visible = True
            PanelNumfact.Visible = False
        Else
            PanelPeriodo.Visible = False
            PanelNumfact.Visible = True
        End If

    End Sub

    Protected Sub BtnGenerar0_Click(sender As Object, e As System.EventArgs) Handles BtnGenerar0.Click

        Dim i As Integer
        Dim Elementos As String()
        Dim vbFiltro As String = "WHERE ("

        TextBox1.Text = TextBox1.Text.Replace(Environment.NewLine, ",")

        Elementos = TextBox1.Text.Split(",")

        For i = 0 To Elementos.Length - 1
            vbFiltro = vbFiltro + "SLNFACTUR.OID = " & FunIdFactura("000" + Elementos(i).ToString) + " or "
        Next

        vbFiltro = vbFiltro.Substring(0, vbFiltro.Length - 3)

        vbFiltro = vbFiltro + ") "

        GenerarArchivo(vbFiltro, ListMeses.SelectedItem.Value, ListPlanes.SelectedItem.Value, ListPlanes.SelectedItem.Text.Substring(0, ListPlanes.SelectedItem.Text.IndexOf(" ") - 1))
        Panel1.Visible = False
        LinkButton1.Visible = True

    End Sub


End Class
