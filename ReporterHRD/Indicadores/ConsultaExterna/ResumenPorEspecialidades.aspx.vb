Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient


Partial Class Indicadores_Triage_GenerarReporte
    Inherits System.Web.UI.Page

    Dim MisFunciones As New FunBasicas
    Dim Ano As String = 2017

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            Dim i, j, k, l As Integer
            Dim m As String

            l = 0

            For i = Today.Year To 2012 Step -1
                k = 12
                If i = Today.Year Then k = Today.Month
                For j = k To 1 Step -1
                    m = j.ToString
                    If j < 10 Then m = "0" + j.ToString
                    BoxListMeses.Items.Add(i.ToString + "." + m)
                    BoxListMeses.Items.Item(l).Value = i.ToString + "." + m
                    BoxListMeses.Items.Item(l).Text = MisFunciones.NomMeses(j) + " de " + i.ToString
                    l = l + 1
                Next
            Next
        End If

    End Sub






    'Protected Sub ListMeses_Load(sender As Object, e As System.EventArgs) Handles ListMeses.Load

    '    If IsPostBack = False Then ListMeses.DataBind()

    '    LabelTextMes.Text = ListMeses.SelectedItem.Text.ToUpper
    'Protected Sub BoxListMeses_Load(sender As Object, e As System.EventArgs) Handles BoxListMeses.Load
    '    'If IsPostBack = False Then BoxListMeses.DataBind()
    'End Sub


    'End Sub

    'Protected Sub ListMeses_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListMeses.SelectedIndexChanged

    '    'ReportViewer1.LocalReport.Refresh()

    'End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        Dim vbFiltro As String
        Dim i, j As Integer
        Dim IdEspecialidad As Integer
        Dim SelEspecialidad, SelEstado, SelMeses As Boolean
        Dim Primero As Boolean = True

        SelEspecialidad = False
        SelEstado = False
        SelMeses = False
        GridView1.Visible = False
        Label1.Visible = False
        LinkButton1.Enabled = False

        vbFiltro = " and GENESPECI.OID IN ("
        j = 0
        For i = 0 To ListEspecialidades.Items.Count - 1
            If ListEspecialidades.Items(i).Selected = True Then
                vbFiltro = vbFiltro + "'" + ListEspecialidades.Items(i).Value.ToString + "', "
                IdEspecialidad = CInt(ListEspecialidades.Items(i).Value)
                SelEspecialidad = True
                j = +1
            End If
        Next

        'Button3.Enabled = True
        If j = 1 AndAlso IdEspecialidad = 60 Then Button3.Enabled = True

        'Button3.Text = i.ToString

        vbFiltro = vbFiltro.Substring(0, vbFiltro.Length - 2)
        vbFiltro = vbFiltro + ")"


        vbFiltro = vbFiltro + " and CMNCITMED_1.CCMESTADO IN ("

        For i = 0 To ListEstados.Items.Count - 1
            If ListEstados.Items(i).Selected = True Then
                vbFiltro = vbFiltro + "'" + ListEstados.Items(i).Value.ToString + "', "
                SelEstado = True
            End If
        Next

        vbFiltro = vbFiltro.Substring(0, vbFiltro.Length - 2)
        vbFiltro = vbFiltro + ")"

        vbFiltro = vbFiltro + " and ("

        For i = 0 To BoxListMeses.Items.Count - 1
            If BoxListMeses.Items(i).Selected = True Then
                'vbFiltro = vbFiltro + "(CONVERT(char(7), CMNCITMED_1.CCMFECASI, 102) = '" + BoxListMeses.Items(i).Value.ToString + "') or " ' Fecha Asignacion
                vbFiltro = vbFiltro + "(CONVERT(char(7), CMNCITMED_1.CCMFECCUM, 102) = '" + BoxListMeses.Items(i).Value.ToString + "') or "  'Fecha Cita
                'CCMFECCUM
                SelMeses = True
                If Primero = True Then
                    DataGrid.SelectCommand = "SELECT CMNCITMED_1.OID AS IdCita, CASE WHEN GENPACIEN_1.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocAf, GENPACIEN_1.PACNUMDOC AS NumDocAf, CONVERT (char(10), GENPACIEN_1.GPAFECNAC, 103) AS FechaNacAf, CASE WHEN GENPACIEN_1.GPASEXPAC = 1 THEN 'M' ELSE CASE WHEN GENPACIEN_1.GPASEXPAC = 2 THEN 'F' ELSE 'X' END END AS SexoAf, GENPACIEN_1.PACPRIAPE, GENPACIEN_1.PACSEGAPE, GENPACIEN_1.PACPRINOM, GENPACIEN_1.PACSEGNOM, GENDETCON.GDENOMBRE AS EpsAf, GENESPECI.GEEDESCRI, CASE WHEN CMNCITMED_1.CCMESTADO = 0 THEN 'Asignada' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 1 THEN 'Cancelada' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 2 THEN 'Cumplida' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 3 THEN 'Incumplida' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 4 THEN 'Facturada' ELSE 'Inatención' END END END END END AS EstadoCita, CMNCITMED_1.CCMFECASI AS FechaSolAf, CMNCITMED_1.CCMFECPAC AS FechaDeseadaAf, CMNCITMED_1.CCMFECCUM AS FechaCitamedica, GENDETCON.GDECODIGO, GENMUNICI.MUNNOMMUN, DATEDIFF(DAY, CMNCITMED_1.CCMFECASI, CMNCITMED_1.CCMFECCUM) AS Expr1, CMNCITMED_1.CCMESTCIT, CONVERT (char(3), GENDETCON.GDECODIGO) AS Expr2, CASE WHEN (SELECT COUNT(CMNCITMED.GENESPECI) AS Expr2 FROM CMNCITMED INNER JOIN GENPACIEN ON CMNCITMED.GENPACIEN = GENPACIEN.OID WHERE (CMNCITMED.CCMESTADO = 2) AND (CMNCITMED.OID < CMNCITMED_1.OID) AND (CONVERT (char(4) , CMNCITMED.CCMFECCUM , 102) = '" & Ano & "') AND (GENPACIEN.PACNUMDOC = GENPACIEN_1.PACNUMDOC) AND (CMNCITMED.GENESPECI = CMNCITMED_1.GENESPECI)) = 0 THEN 'Si' ELSE 'No' END AS PrimeraVez, CASE WHEN CCMESTCIT = 0 THEN 'Si' ELSE 'No' END AS PVezDigitador, GENUSUARIO.USUNOMBRE AS UsAsigno, DATEDIFF(DAY, CMNCITMED_1.CCMFECASI, CMNCITMED_1.CCMFECCUM) AS Prueba FROM GENCONTRA INNER JOIN GENDETCON ON GENCONTRA.OID = GENDETCON.GENCONTRA1 RIGHT OUTER JOIN CMNCITMED AS CMNCITMED_1 INNER JOIN GENPACIEN AS GENPACIEN_1 ON CMNCITMED_1.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON CMNCITMED_1.GENESPECI = GENESPECI.OID INNER JOIN GENMUNICI ON GENPACIEN_1.DGNMUNICIPIO = GENMUNICI.OID INNER JOIN GENUSUARIO ON CMNCITMED_1.GENUSUARIO1 = GENUSUARIO.OID ON GENDETCON.OID = GENPACIEN_1.GENDETCON WHERE (GENPACIEN_1.DGNMUNICIPIO = COALESCE (NULLIF (@IdMunicpio, 0), GENPACIEN_1.DGNMUNICIPIO)) AND (CONVERT (char(3), GENDETCON.GDECODIGO) = COALESCE (NULLIF (@Subsidiado, N'000'), CONVERT (char(3), GENDETCON.GDECODIGO))) AND (GENCONTRA.GENTERCER1 = COALESCE (NULLIF (@IdTercero, 0), GENCONTRA.GENTERCER1))"
                    LabelAño.Text = BoxListMeses.Items(i).Value.Substring(0, 4)
                    Primero = False
                End If

            End If
        Next

        vbFiltro = vbFiltro.Substring(0, vbFiltro.Length - 3)
        vbFiltro = vbFiltro + ")"

        'vbFiltro = vbFiltro + "  ORDER BY FechaSolAf" 'Fecha solicitud"
        vbFiltro = vbFiltro + "  ORDER BY CCMFECCUM" 'Fecha cita

        Label2.Visible = False

        'Label1.Text = DataGrid.SelectCommand + vbFiltro
        'Label1.Visible = True


        Dim OpTotal, OpPVez, OpControl As Integer
        Dim CitPVez, CitControl As Integer


        If SelEspecialidad = True AndAlso SelEstado = True AndAlso SelMeses = True Then
            GridView1.Visible = True
            DataGrid.SelectCommand = DataGrid.SelectCommand + vbFiltro
            LabelConsulta.Text = DataGrid.SelectCommand
            'LabelConsulta.Visible = True
            GridView1.DataBind()
            Label2.Visible = True

            Label2.Text = GridView1.Rows.Count.ToString + " Registros encontrados."

            OpTotal = 0
            OpPVez = 0
            OpControl = 0
            CitPVez = 0
            CitControl = 0

            For i = 0 To GridView1.Rows.Count - 1

                OpTotal = OpTotal + CInt(GridView1.DataKeys(i).Item(2).ToString())

                If GridView1.DataKeys(i).Item(1).ToString() = "Si" Then
                    CitPVez = CitPVez + 1
                    OpPVez = OpPVez + CInt(GridView1.DataKeys(i).Item(2).ToString())
                Else
                    CitControl = CitControl + 1
                    OpControl = OpControl + CInt(GridView1.DataKeys(i).Item(2).ToString())
                End If

            Next

            LabelInfo.Text = "CITAS PRIMERA VEZ <br/>" & OpPVez.ToString & " dias de Oportunidad <BR />" & CitPVez.ToString & " citas de primera vez <BR />"


            If CitPVez > 0 Then
                LabelInfo.Text = LabelInfo.Text & (Decimal.Round(CDec(OpPVez / CitPVez), 2)).ToString & " (promedio)"
            Else
                LabelInfo.Text = LabelInfo.Text & "0 (promedio)"
            End If


            LabelInfo0.Text = "CITAS DE CONTROL <br/>" & OpControl.ToString & " dias de Oportunidad <BR />" & CitControl.ToString & " citas de Control <BR />"

            If CitControl > 0 Then
                LabelInfo0.Text = LabelInfo0.Text & (Decimal.Round(CDec(OpControl / CitControl), 2)).ToString & " (promedio)"
            Else
                LabelInfo0.Text = LabelInfo0.Text & "0 (promedio)"
            End If


            Label2.Text = OpTotal.ToString + " dias de oportunidad total" + "<br/>" + Label2.Text

            Label2.Text = Label2.Text + "<BR />" & Decimal.Round(CDec(CInt(OpTotal) / GridView1.Rows.Count), 2).ToString & " Promedio"



        Else
            Label1.Text = "DEBE SELECCIONAR AL MENOS UN MES, UNA ESPECIALIDAD Y UN ESTADO"
            Label1.Visible = True
            Button3.Enabled = False

        End If




    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

        Dim i, j As Integer


        DataConsultas.UpdateCommand = "UPDATE CMNCITMED SET CCMESTCIT = " & j.ToString & " WHERE OID = " & GridView1.DataKeys(i).Item(0).ToString()
        DataConsultas.Update()

        For i = 0 To GridView1.Rows.Count - 1
            j = 1
            If GridView1.DataKeys(i).Item(1).ToString() = "Si" Then j = 0


            'UPDATE  CMNCITMED HRD_BkU_PrimeraVez = CCMESTCIT WHERE  (CONVERT(char(4), CCMFECCUM, 102) = '" & Ano & "') AND (CCMESTCIT = 0 OR CCMESTCIT = 1) AND (CCMESTADO = 2)

            DataConsultas.UpdateCommand = "UPDATE CMNCITMED SET HRD_BkU_PrimeraVez = CCMESTCIT WHERE OID = " & GridView1.DataKeys(i).Item(0).ToString()
            DataConsultas.Update()


            DataConsultas.UpdateCommand = "UPDATE CMNCITMED SET CCMESTCIT = " & j.ToString & " WHERE OID = " & GridView1.DataKeys(i).Item(0).ToString()
            DataConsultas.Update()
        Next

    End Sub

    'Protected Sub GridView1_DataBound(sender As Object, e As System.EventArgs) Handles GridView1.DataBound

    'End Sub


    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click

        GenerarArchivo()
        
    End Sub

    Function GenerarArchivo() '(ByVal FiltroConsulta As String, ByVal FiltroMes As String, ByVal FiltroContrato As String, ByVal NomContrato As String) 'ByVal Generar As Boolean, ByVal Tipo As String)

        Dim NomArchivo As String
        Dim mydocpath As String = Server.MapPath("~/Indicadores/Archivos/")
        Dim strConsulta As String


        NomArchivo = "Res256_" + Now.ToString.Replace(":", "")
        NomArchivo = NomArchivo.Replace("/", "")
        NomArchivo = NomArchivo.Replace(" ", "")
        NomArchivo = NomArchivo.Replace(".", "")

        NomArchivo = NomArchivo + ".txt"

        'If FiltroConsulta = "" Then
        '    NomArchivo = NomContrato + "_" + FiltroMes.Replace(".", "") + ".txt"
        '    ConsultaSql("")
        'Else
        '    NomArchivo = System.Guid.NewGuid.ToString + ".txt"
        '    LabelNomarchivo.Text = NomArchivo

        'End If
        'Res256_20012017_42451_p_m()

        If File.Exists(mydocpath & NomArchivo) = True Then System.IO.File.Delete(mydocpath & NomArchivo)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim ObjAdapter As New SqlDataAdapter
        'Try
        'strConsulta = DataGrid.SelectCommand 'LabelConsulta.Text
        strConsulta = LabelConsulta.Text


        strConsulta = strConsulta.Replace("@IdMunicpio", ListMunicipios.SelectedValue.ToString)
        strConsulta = strConsulta.Replace("@IdTercero", ListTerceros.SelectedValue.ToString)
        strConsulta = strConsulta.Replace("@Subsidiado", "'" & ListRegimen.SelectedValue.ToString & "'")
        strConsulta = strConsulta.Replace("@TipoCita", ListEstilosCitas.SelectedValue.ToString)
        'strConsulta = strConsulta.Replace("WHERE (GENPACIEN", " GENCONTRA AS GENCONTRA_1 ON GENDETCON.GENCONTRA1 = GENCONTRA.OID WHERE (GENPACIEN")
        strConsulta = strConsulta.Replace("UsAsigno FROM", "UsAsigno, GENCONTRA.GECCODIGO, GENESPECI.OID FROM")

        strConsulta = strConsulta.Replace("ORDER BY FechaSolAf", "ORDER BY GENESPECI.OID, FechaSolAf")

        'INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID
        'GENCONTRA.GECCODIGO
        'UsAsigno FROM
        Label1.Text = strConsulta

        'strConsulta = "SELECT CMNCITMED_1.OID AS IdCita, CASE WHEN GENPACIEN_1.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocAf, GENPACIEN_1.PACNUMDOC AS NumDocAf, CONVERT (char(10), GENPACIEN_1.GPAFECNAC, 103) AS FechaNacAf, CASE WHEN GENPACIEN_1.GPASEXPAC = 1 THEN 'M' ELSE CASE WHEN GENPACIEN_1.GPASEXPAC = 2 THEN 'F' ELSE 'X' END END AS SexoAf, GENPACIEN_1.PACPRIAPE, GENPACIEN_1.PACSEGAPE, GENPACIEN_1.PACPRINOM, GENPACIEN_1.PACSEGNOM, GENDETCON.GDENOMBRE AS EpsAf, GENESPECI.GEEDESCRI, CASE WHEN CMNCITMED_1.CCMESTADO = 0 THEN 'Asignada' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 1 THEN 'Cancelada' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 2 THEN 'Cumplida' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 3 THEN 'Incumplida' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 4 THEN 'Facturada' ELSE 'Inatención' END END END END END AS EstadoCita, CMNCITMED_1.CCMFECPAC AS FechaSolAf, CMNCITMED_1.CCMFECCIT AS FechaDeseadaAf, CMNCITMED_1.CCMFECCIT AS FechaCitamedica, GENDETCON.GDECODIGO, GENMUNICI.MUNNOMMUN, DATEDIFF(DAY, CMNCITMED_1.CCMFECPAC, CMNCITMED_1.CCMFECCIT) AS Expr1, CMNCITMED_1.CCMESTCIT, CONVERT (char(3), GENDETCON.GDECODIGO) AS Expr2, CASE WHEN (SELECT COUNT(CMNCITMED.GENESPECI) AS Expr2 FROM CMNCITMED INNER JOIN GENPACIEN ON CMNCITMED.GENPACIEN = GENPACIEN.OID WHERE (CMNCITMED.CCMESTADO = 2) AND (CMNCITMED.OID <> CMNCITMED_1.OID) AND (CONVERT (char(4) , CMNCITMED.CCMFECCIT , 102) = '" & LabelAño.Text & "') AND (GENPACIEN.PACNUMDOC = GENPACIEN_1.PACNUMDOC) AND (CMNCITMED.GENESPECI = CMNCITMED_1.GENESPECI)) = 0 THEN 'Si' ELSE 'No' END AS PrimeraVez, CASE WHEN CCMESTCIT = 0 THEN 'Si' ELSE 'No' END AS PVezDigitador, GENUSUARIO.USUNOMBRE AS UsAsigno FROM CMNCITMED AS CMNCITMED_1 INNER JOIN GENPACIEN AS GENPACIEN_1 ON CMNCITMED_1.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON CMNCITMED_1.GENESPECI = GENESPECI.OID INNER JOIN GENMUNICI ON GENPACIEN_1.DGNMUNICIPIO = GENMUNICI.OID INNER JOIN GENUSUARIO ON CMNCITMED_1.GENUSUARIO1 = GENUSUARIO.OID LEFT OUTER JOIN GENDETCON ON GENPACIEN_1.GENDETCON = GENDETCON.OID WHERE (GENPACIEN_1.DGNMUNICIPIO = COALESCE (NULLIF (" & ListMunicipios.SelectedValue.ToString & ", 0), GENPACIEN_1.DGNMUNICIPIO)) AND (CONVERT (char(3), GENDETCON.GDECODIGO) = COALESCE (NULLIF ('" & ListRegimen.SelectedValue.ToString & "', '000'), CONVERT (char(3), GENDETCON.GDECODIGO))) AND (CMNCITMED_1.CCMESTCIT = COALESCE (NULLIF (" & ListEstilosCitas.SelectedValue.ToString & ", 9), CMNCITMED_1.CCMESTCIT))"


        Dim Consulta As New SqlCommand(strConsulta, Conexion)

        Try


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
                    'For j = 0 To k

                    LineaTexto = LineaTexto + "2|Cons|"
                    LineaTexto = LineaTexto + Trim(objDS.Tables(0).Rows(i).Item(1).ToString()) + "|" + Trim(objDS.Tables(0).Rows(i).Item(2).ToString()) + "|"
                    LineaTexto = LineaTexto + CDate(objDS.Tables(0).Rows(i).Item(3).ToString()).ToString("yyyy-MM-dd") + "|"
                    LineaTexto = LineaTexto + Trim(objDS.Tables(0).Rows(i).Item(4).ToString()).Replace("M", "H").Replace("F", "M") + "|"
                    LineaTexto = LineaTexto + Trim(objDS.Tables(0).Rows(i).Item(5).ToString()) + "|" + Trim(objDS.Tables(0).Rows(i).Item(6).ToString()) + "|" + Trim(objDS.Tables(0).Rows(i).Item(7).ToString()) + "|" + Trim(objDS.Tables(0).Rows(i).Item(8).ToString()) + "|"
                    LineaTexto = LineaTexto + Trim(objDS.Tables(0).Rows(i).Item(23).ToString()) + "|"

                    If CInt(objDS.Tables(0).Rows(i).Item(24)) = 62 Then
                        LineaTexto = LineaTexto + "1|"
                    ElseIf CInt(objDS.Tables(0).Rows(i).Item(24)) = 60 Then
                        LineaTexto = LineaTexto + "3|"
                    ElseIf CInt(objDS.Tables(0).Rows(i).Item(24)) = 86 Then
                        LineaTexto = LineaTexto + "4|"
                    ElseIf CInt(objDS.Tables(0).Rows(i).Item(24)) = 44 Then
                        LineaTexto = LineaTexto + DividirGinecoObstetricia(Trim(objDS.Tables(0).Rows(i).Item(0).ToString())) + "|"
                    ElseIf CInt(objDS.Tables(0).Rows(i).Item(24)) = 11 Then
                        LineaTexto = LineaTexto + "7|"
                    Else
                        LineaTexto = LineaTexto + "XXX|"
                    End If

                    'SELECT GENDIAGNO.OID AS IdDiagnostico FROM ADNINGRESO INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN HCNDIAPAC ON HCNFOLIO.OID = HCNDIAPAC.HCNFOLIO INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (ADNINGRESO.AINURGCON = 1) AND (HCNDIAPAC.HCPDIAPRIN = 1) AND (SLNFACTUR.SFADOCANU = 0) AND (HCNFOLIO.HCNUMFOL = (SELECT TOP (1) HCNUMFOL FROM HCNFOLIO AS HCNFOLIO_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY ADNINGRESO)) AND (HCNFOLIO.CMNCITMED = 267173) AND (CONVERT (char(2), GENDIAGNO.DIACODIGO) = 'z3' OR CONVERT (char(1), GENDIAGNO.DIACODIGO) = 'O' OR CONVERT (char(1), GENDIAGNO.DIACODIGO) = 'P') GROUP BY GENDIAGNO.OID

                    LineaTexto = LineaTexto + CDate(objDS.Tables(0).Rows(i).Item(12).ToString()).ToString("yyyy-MM-dd") + "|"
                    LineaTexto = LineaTexto + "1|"
                    LineaTexto = LineaTexto + CDate(objDS.Tables(0).Rows(i).Item(14).ToString()).ToString("yyyy-MM-dd") + "|"
                    LineaTexto = LineaTexto + CDate(objDS.Tables(0).Rows(i).Item(13).ToString()).ToString("yyyy-MM-dd") + ""

                    '.Replace("/", "-")

                    'Next
                    'LineaTexto = LineaTexto.Substring(0, LineaTexto.Length - 1)
                    OutFile.WriteLine(LineaTexto)
                    sb.AppendLine(LineaTexto)
                    LineaTexto = ""
                Next

            End If

            OutFile.Close()

            LinkButton1.ToolTip = "Creación: " & File.GetLastWriteTime(mydocpath & NomArchivo) & " Tamaño: " & FileLen(mydocpath & NomArchivo) & " bytes"
            LinkButton1.Text = Server.MapPath("~/Indicadores/Archivos").ToString
            LinkButton1.Text = "Descargar archivo" 'NomArchivo
            LinkButton1.ToolTip = NomArchivo
            LinkButton1.Enabled = True

        Catch ex As Exception
            'Label1.Text = strConsulta
            Label1.Text = ex.ToString + " <BR/> " + strConsulta
            'Label1.Text = strConsulta
            Label1.Visible = True
        End Try

        'Label1.Text = NomArchivo

        'Label1.Visible = True

    End Function



    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click
        Try

            Dim filename As String = LinkButton1.ToolTip 'ListPlanes.SelectedItem.Text.Substring(0, ListPlanes.SelectedItem.Text.IndexOf(" ")) + "_" + ListMeses.SelectedValue.Replace(".", "") + ".txt"
            Dim dlDir As String = Server.MapPath("~/Indicadores/Archivos/")
            'LinkButton1.PostBackUrl = ""

            'If vbPeriodo = False Then filename = LabelNomarchivo.Text

            Dim path As String = (dlDir & filename).Replace("ConsultaExterna", "Archivos")
            Dim toDownload As New FileInfo(Server.MapPath("~/Indicadores/Archivos") & "\" & filename)

            'LinkButton1.Text = toDownload.Extension.ToString & "B"


            If (File.Exists(path)) Then
                Response.Clear()
                Response.AddHeader("Content-Disposition", "attachment; filename=" + filename)
                Response.AddHeader("Content-Length", toDownload.Length.ToString())
                Response.ContentType = "text/plain"
                Response.WriteFile(path)
                'Response.Flush()
                Response.End()
            Else
                'Label1.Text = path & filename
                'Label1.Visible = True
            End If

        Catch ex As Exception
            LabelInfo0.Text = ex.Message
            'Label1.Visible = True
        End Try

    End Sub


    Private Function DividirGinecoObstetricia(ByVal IdCita As String) As String


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT GENDIAGNO.OID AS IdDiagnostico FROM ADNINGRESO INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN HCNDIAPAC ON HCNFOLIO.OID = HCNDIAPAC.HCNFOLIO INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (ADNINGRESO.AINURGCON = 1) AND (HCNDIAPAC.HCPDIAPRIN = 1) AND (SLNFACTUR.SFADOCANU = 0) AND (HCNFOLIO.HCNUMFOL = (SELECT TOP (1) HCNUMFOL FROM HCNFOLIO AS HCNFOLIO_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY ADNINGRESO)) AND (HCNFOLIO.CMNCITMED = " & IdCita & ") AND (CONVERT (char(2), GENDIAGNO.DIACODIGO) = 'z3' OR CONVERT (char(1), GENDIAGNO.DIACODIGO) = 'O' OR CONVERT (char(1), GENDIAGNO.DIACODIGO) = 'P') GROUP BY GENDIAGNO.OID"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return "6"
        Else
            Return "5"
        End If


    End Function

    
End Class
