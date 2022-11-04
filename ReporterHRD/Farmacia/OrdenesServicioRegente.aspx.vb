Imports System.Drawing
Imports System.Configuration
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Mvc
Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click

        LabelSubTitulo.Text = ""
        GridPrincipal.Visible = False

        LabelDocPaciente.Text = "0"

        If TextDocPaciente.Text.Length > 0 Then
            LabelDocPaciente.Text = TextDocPaciente.Text
            TextDocPaciente.Text = ""
            'DataPrincipal.SelectCommand = "SELECT INNMSUMPA.OID AS Expr1, INNMSUMPA.ISMCANHISCLI AS C_HC, INNMSUMPA.ISMCANTPEDI AS C_pedida, INNMSUMPA.ISMCANAPL AS C_Aplicada, INNMDESUM.IDDCANTID AS C_Devuelta, INNMSUMPA.ISMCANPEN AS C_pendiente, GENPACIEN.PACNUMDOC, ADNINGRESO.AINFECING, ADNINGRESO.AINCONSEC, INNPRODUC.IPRCODIGO, INNPRODUC.IPRDESCOR, SLNORDSER.SOSFECORD, SLNORDSER.OID, HCNMEDPAC.HCSFECSOL, HCNFOLIO.HCNUMFOL, CASE WHEN HCACODIGO IS NULL THEN 'Urgencias' ELSE HCACODIGO END AS Cama FROM HCNFOLIO INNER JOIN GENPACIEN INNER JOIN ADNINGRESO ON GENPACIEN.OID = ADNINGRESO.GENPACIEN ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN INNPRODUC INNER JOIN INNMSUMPA INNER JOIN INNCSUMPA ON INNMSUMPA.INNCSUMPA = INNCSUMPA.OID ON INNPRODUC.OID = INNMSUMPA.INNPRODUC INNER JOIN SLNORDSER ON INNCSUMPA.SLNORDSER = SLNORDSER.OID INNER JOIN INNMDESUM ON INNMSUMPA.OID = INNMDESUM.INNMSUMPA AND INNPRODUC.OID = INNMDESUM.INNPRODUC INNER JOIN HCNMEDPAC ON INNMSUMPA.HCNMEDPAC = HCNMEDPAC.OID AND INNPRODUC.OID = HCNMEDPAC.INNPRODUC ON HCNFOLIO.OID = HCNMEDPAC.HCNFOLIO LEFT OUTER JOIN HPNDEFCAM ON HCNFOLIO.HPNDEFCAM = HPNDEFCAM.OID WHERE (HCNMEDPAC.HCSINTRAH = 1) AND (ADNINGRESO.AINCONSEC = COALESCE (NULLIF (@Ingreso, 0), ADNINGRESO.AINCONSEC)) ORDER BY ADNINGRESO.AINCONSEC"
            LabelFechaIni.Text = CDate("01/01/2010") 'CDate(TextFechaIni.Text).AddHours(CInt(CDate(HoraInicial.SelectedValue.ToString).ToString("%H").ToString))
            LabelFechaFin.Text = CDate("01/01/2100") 'CDate(TextFechaFin.Text).AddHours(CInt(CDate(HoraFinal.SelectedValue.ToString).ToString("%H").ToString))
            GridPrincipal.Visible = True
        Else
            If IsDate(TextFechaIni.Text) AndAlso IsDate(TextFechaFin.Text) Then
                Try
                    LabelFechaIni.Text = CDate(TextFechaIni.Text).AddHours(CInt(CDate(HoraInicial.SelectedValue.ToString).ToString("%H").ToString))
                    LabelFechaFin.Text = CDate(TextFechaFin.Text).AddHours(CInt(CDate(HoraFinal.SelectedValue.ToString).ToString("%H").ToString))
                Catch ex As Exception
                    Label1.Text = ex.Message
                End Try

                GridPrincipal.Visible = True

            End If
        End If
        'LabelDocPaciente.Text = "@"
        'If TextDocPaciente.Text.Length > 0 Then LabelDocPaciente.Text = TextDocPaciente.Text

    End Sub

    Protected Sub GridFacturas_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridPrincipal.SelectedIndexChanged

        Panel1_ModalPopupExtender.Show()
        Panel1.GroupingText = GridPrincipal.SelectedDataKey.Item(1).ToString

    End Sub

    Protected Sub BtnCerrarTraza_Click(sender As Object, e As System.EventArgs) Handles BtnCerrarTraza.Click

        BtnClose.Enabled = True
        BtnCerrarTraza.Visible = False

        Panel1_ModalPopupExtender.Show()

    End Sub
    Protected Sub BtnExportar_Click(sender As Object, e As System.EventArgs) Handles BtnExportar.Click

        GridPrincipal.AllowPaging = False
        GridPrincipal.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridPrincipal.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridPrincipal)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=Traza orden de Servicio.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

        End Try
        GridPrincipal.AllowPaging = True



    End Sub
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

End Class
