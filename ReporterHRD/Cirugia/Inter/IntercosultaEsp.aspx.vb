Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web




Imports System.Drawing
Imports System.Configuration

Imports System.Web.Mvc
Partial Class HistoriasClinicas_Auditoria_IntercosultaEsp
    Inherits System.Web.UI.Page




    Protected Sub BtnConsulta_Click(sender As Object, e As EventArgs) Handles BtnConsulta.Click

        GridFoliosMedico.Visible = True
        GridView3.Visible = False
        Dim med As Integer = MEDICO.Text
        Dim Inicio As String = TextFechaIni.text
        Dim Final As String = TextFechaFin.Text
        Dim Especi As Integer = ListEspeci.text
        Dim Prom As Integer
        Dim mint As Integer
        Dim Mediconom As String
        Dim Totalfolio As Integer
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT GMENOMCOM from GENMEDICO WHERE (oid =N'" & med & "')"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        Mediconom = Rsa(0)
        Rsa.Close()
        timedatea.Close()
        ' LabelProfesional.Text = LabelProfesional.Text & "  " + GridFoliosMedico.Rows.Count.ToString + " Pacientes encontrados "



        Dim SQL2 As String
        Dim timedate As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL2 = "SELECT  CASE WHEN sum(ABS(DATEDIFF(MI,HC.HCNFECCONF, HCNFOLIO_1.HCNFECCONF))) IS NULL THEN 0 ELSE sum(ABS(DATEDIFF(MI,HC.HCNFECCONF, HCNFOLIO_1.HCNFECCONF))) END FROM HCNINTERR INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON HCNINTERR.HCNFOLIO = HCNFOLIO_1.OID INNER JOIN GENMEDICO ON HCNFOLIO_1.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID INNER JOIN GENPACIEN AS GENPACIEN_1 ON HCNFOLIO_1.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON HCNINTERR.GENESPECI = GENESPECI.OID INNER JOIN GENDIAGNO ON HCNINTERR.GENDIAGNO = GENDIAGNO.OID INNER JOIN HCNINTERC AS HCNINTERC_1 ON HCNINTERR.OID = HCNINTERC_1.HCNINTERR INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO= HC.OID  WHERE  (HCNFOLIO_1.GENMEDICO = '" & med & "') AND (HCNFOLIO_1.HCFECFOL BETWEEN '" & Inicio & "' AND '" & Final & "')"
        Com = New SqlCommand(SQL2, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        mint = Rs(0)
        Rs.Close()

        timedate.Close()

        If String.IsNullOrEmpty(Final) Then
            LabelProfesional.Text = " Falta Fecha Final "
        Else
            If String.IsNullOrEmpty(Inicio) Then
                LabelProfesional.Text = " Falta Fecha Inicial "
            Else

                Totalfolio = GridFoliosMedico.Rows.Count.ToString

                If Totalfolio > 0 Then

                    Prom = mint / Totalfolio
                    Prom = Math.Round(Prom, 2)
                    LabelProfesional.Text = " Medico " & Mediconom & " Folios Realizados : " & Totalfolio & " Suma Total Minutos : " & mint & " Promedio en Días " & Math.Round((Prom / 60) / 24, 2) & "  Horas " & Math.Round(Prom / 60, 2) & "  Minutos " & Math.Round(Prom, 2) & "   "
                    LabelProfesional0.Text = " Fecha Inicial : " & Inicio & " Fecha Final :" & Final
                End If

            End If
        End If








        Panel_Intercon.Visible = True

    End Sub
    Protected Sub BtnFinalizar_Click(sender As Object, e As System.EventArgs) Handles BtnFinalizar.Click


        BtnFinalizar.Visible = False
        Panel_Intercon.Visible = False


        ''MEDICO.Text = " "
        ''TextFechaIni = 
        ''TextFechaFin.SelectedIndex = -1

        Response.Redirect("IntercosultaEsp.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Panel_Intercon.Visible = False

    End Sub



    Protected Sub BtnEspeci_Click(sender As Object, e As EventArgs) Handles BtnEspeci.Click
        GridFoliosMedico.Visible = False
        GridView3.Visible = True
        Dim Inicio As String = TextFechaIni.text
        Dim Final As String = TextFechaFin.Text
        Dim Especi As Integer = ListEspeci.text
        Dim Prom As Integer
        Dim mint As Integer
        Dim Totalfolio As Integer
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT  CASE WHEN sum(ABS(DATEDIFF(MI,HC.HCNFECCONF, HCNFOLIO_1.HCNFECCONF))) IS NULL THEN 0 ELSE sum(ABS(DATEDIFF(MI,HC.HCNFECCONF, HCNFOLIO_1.HCNFECCONF))) END FROM HCNINTERR INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON HCNINTERR.HCNFOLIO = HCNFOLIO_1.OID INNER JOIN GENMEDICO ON HCNFOLIO_1.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID INNER JOIN GENPACIEN AS GENPACIEN_1 ON HCNFOLIO_1.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON HCNINTERR.GENESPECI = GENESPECI.OID INNER JOIN GENDIAGNO ON HCNINTERR.GENDIAGNO = GENDIAGNO.OID INNER JOIN HCNINTERC AS HCNINTERC_1 ON HCNINTERR.OID = HCNINTERC_1.HCNINTERR INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO= HC.OID  WHERE (GENESPECI.OID= '" & Especi & "') AND (HCNFOLIO_1.HCFECFOL BETWEEN '" & Inicio & "' AND '" & Final & "')"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        mint = Rsa(0)
        Rsa.Close()





        ' LabelProfesional.Text = " Folios Realizados " + GridFoliosMedico.Rows.Count.ToString + " Suma Minutos Total " & mint & " Promedio Horas " & Prom / 60 & " Promedio minutos " & Prom & "   "



        Panel_Intercon.Visible = True


    End Sub
    Protected Sub GridFoliosMedico_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridFoliosMedico.SelectedIndexChanged

        Panel_Intercon.Visible = True


    End Sub
    Protected Sub BtnTODO_Click(sender As Object, e As EventArgs) Handles BtnTODO.Click




        Dim Inicio As String = TextFechaIni2.text
        Dim Final As String = TextFechaFin2.Text

        Dim Prom As Integer
        Dim mint As Integer
        Dim Totalfolio As Integer
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT  CASE WHEN sum(ABS(DATEDIFF(m,HC.HCNFECCONF, HCNFOLIO_1.HCNFECCONF))) IS NULL THEN 0 ELSE sum(ABS(DATEDIFF(m,HC.HCNFECCONF, HCNFOLIO_1.HCNFECCONF))) END FROM HCNINTERR INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON HCNINTERR.HCNFOLIO = HCNFOLIO_1.OID INNER JOIN ADNINGRESO ON HCNFOLIO_1.ADNINGRESO = ADNINGRESO.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN HPNESTANC AS A ON ADNINGRESO.OID = A.ADNINGRES INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID INNER JOIN GENMEDICO ON HCNFOLIO_1.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID INNER JOIN GENPACIEN AS GENPACIEN_1 ON HCNFOLIO_1.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON HCNINTERR.GENESPECI = GENESPECI.OID INNER JOIN GENDIAGNO ON HCNINTERR.GENDIAGNO = GENDIAGNO.OID INNER JOIN HCNINTERC AS HCNINTERC_1 ON HCNINTERR.OID = HCNINTERC_1.HCNINTERR INNER JOIN HCNFOLIO  AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID INNER JOIN GENMEDICO AS GM ON HC.GENMEDICO = GM.OID INNER JOIN GENUSUARIO AS GU ON GM.GENUSUARIO = GU.OID   WHERE (HCNFOLIO_1.HCFECFOL BETWEEN '" & Inicio & "' AND '" & Final & "' + ' 23:59:00')"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        mint = Rsa(0)
        Rsa.Close()



        If String.IsNullOrEmpty(Final) Then
            LabelProfesional2.Text = " Falta Fecha Final "
        Else
            If String.IsNullOrEmpty(Inicio) Then
                LabelProfesional1.Text = " Falta Fecha Inicial "
            Else

                Totalfolio = GridView2.Rows.Count.ToString

                If Totalfolio > 0 Then

                    Prom = mint / Totalfolio
                    Prom = Math.Round(Prom, 2)
                    LabelProfesional1.Text = " Folios Realizados : " & Totalfolio & "  "
                    LabelProfesional2.Text = " Fecha Inicial : " & Inicio & " Fecha Final :" & Final
                End If

            End If
        End If

        ' LabelProfesional.Text = " Folios Realizados " + GridFoliosMedico.Rows.Count.ToString + " Suma Minutos Total " & mint & " Promedio Horas " & Prom / 60 & " Promedio minutos " & Prom & "   "



        Panel_Intercon.Visible = True





    End Sub

    Protected Sub BtnExportar_Click(sender As Object, e As System.EventArgs) Handles BtnExportar.Click

        GridView2.AllowPaging = False
        GridView2.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridView2.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridView2)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=Interconsultas_Todas.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

    End Try
        GridView2.AllowPaging = True



    End Sub

    Protected Sub BtnExportar0_Click(sender As Object, e As System.EventArgs) Handles BtnExportar0.Click

        GridView1null.AllowPaging = False
        GridView1null.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridView1null.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridView1null)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=Inteconsultas_Sin_Contestar.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

        End Try
        GridView1null.AllowPaging = True



    End Sub

    Protected Sub BtnExportar1_Click(sender As Object, e As System.EventArgs) Handles BtnExportar1.Click

        GridView3.AllowPaging = False
        GridView3.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridView3.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridView3)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=Interconsultas_Especialidad.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

        End Try
        GridView3.AllowPaging = True



    End Sub


    Protected Sub BtnExportar2_Click(sender As Object, e As System.EventArgs) Handles BtnExportar2.Click

        GridFoliosMedico.AllowPaging = False
        GridFoliosMedico.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridFoliosMedico.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridFoliosMedico)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=Interconsultas_Medicos.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

        End Try
        GridFoliosMedico.AllowPaging = True



    End Sub

End Class
