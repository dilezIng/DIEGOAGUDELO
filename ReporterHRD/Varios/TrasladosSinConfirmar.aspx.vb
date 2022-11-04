Imports System.Data
Imports System.Data.SqlClient

Partial Class PaginaBase
    Inherits System.Web.UI.Page


    Protected Sub BotonConsTercero_Click(sender As Object, e As System.EventArgs) Handles BotonConsTercero.Click

        If BotonConsTercero.Text = "Nueva Consulta" Then
            TextBoxConsecutivo.Text = ""
            BotonConsConsec.Enabled = False
            TextBoxConsecutivo.Enabled = False
            TextBoxTercero.Enabled = True
            BotonConsTercero.Text = "Consultar Tercero"
            LblMsgConsecutivo.Text = ""
            LblMsgRelacion.Visible = False
            BotonRelacionar.Enabled = False

        Else
            BotonConsConsec.Enabled = True
            TextBoxConsecutivo.Enabled = True
            TextBoxConsecutivo.Text = ""
            'FunConsultarTercero()
            BotonRelacionar.Enabled = False
            LblMsgConsecutivo.Text = ""
        End If

        'FunConsultarTercero()
        'BotonConsConsec.Enabled = True

    End Sub


    Private Function FunConsultarTercero(ByVal IdTercero As String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        'SELECT PSNDOCUME.DOCCONSEC, PSNDOCUME.DOCFECHA, PSNDOCUME.PSNVIGENCIA, PSNVIGENCIA.VIGANO, GENTERCER.TERNUMDOC, PSNDOCUME.DOCOBSERV, PSNDOCUME.OID, GENTERCER.OID AS Expr1 FROM PSNDOCUME INNER JOIN PSNVIGENCIA ON PSNDOCUME.PSNVIGENCIA = PSNVIGENCIA.OID INNER JOIN PSNRECONOC ON PSNDOCUME.OID = PSNRECONOC.OID INNER JOIN GENTERCER ON PSNRECONOC.GENTERCER = GENTERCER.OID INNER JOIN PSNRECONOD ON PSNRECONOC.OID = PSNRECONOD.PSNRECONOC WHERE (PSNDOCUME.DOCTIPDOC = 219) AND (PSNDOCUME.DOCCONSEC = 2339) AND (PSNVIGENCIA.VIGANO = 2017)
        StrConsulta = "SELECT TOP (1) PSNDOCUME.DOCCONSEC, PSNDOCUME.DOCFECHA, PSNDOCUME.OID, PSNRECONOC.RECDOCUME, PSNRECONOC.RECSOLICI, PSNRECONOC.GENTERCER, RTRIM(GENTERCER.TERPRINOM + N' ' + GENTERCER.TERSEGNOM + N' '+ GENTERCER.TERPRIAPE + N' '+ GENTERCER.TERSEGAPE) AS NomTercero FROM PSNDOCUME INNER JOIN PSNRECONOC ON PSNDOCUME.OID = PSNRECONOC.OID INNER JOIN GENTERCER ON PSNRECONOC.GENTERCER = GENTERCER.OID INNER JOIN PSNRECONOD ON PSNRECONOC.OID = PSNRECONOD.PSNRECONOC   "
        'StrConsulta = StrConsulta + "WHERE  (PSNDOCUME.DOCTIPDOC = 219) AND (PSNDOCUME.PSNVIGENCIA = " & ListVigencias.SelectedValue & ") AND (GENTERCER.TERNUMDOC = N'" & TextBoxTercero.Text & "')" '& NumDocumento & "')" '+ TxtNumEpicri.Text 'Por Ingreso
        StrConsulta = StrConsulta + "WHERE  (PSNDOCUME.DOCTIPDOC = 219) AND (PSNDOCUME.PSNVIGENCIA = " & ListVigencias.SelectedValue & ") AND GENTERCER.OID = " & IdTercero '& NumDocumento & "')" '+ TxtNumEpicri.Text 'Por Ingreso


        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        'PanelCambioDatos.Visible = True

        If objDS.Tables(0).Rows.Count > 0 Then

            'LblMsgTercero.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            'LabelIdTercero.Text = objDS.Tables(0).Rows(0).Item(7).ToString

            LblIdDocumento.Text = objDS.Tables(0).Rows(0).Item(2).ToString
            LblIdTercero.Text = objDS.Tables(0).Rows(0).Item(5).ToString

            LblMsgTercero.Text = "Consecutivo: " + objDS.Tables(0).Rows(0).Item(0).ToString + "<br/>"
            LblMsgTercero.Text = LblMsgTercero.Text + "Tipo: Cuenta por Cobrar <br/>"
            LblMsgTercero.Text = LblMsgTercero.Text + "Fecha: " + objDS.Tables(0).Rows(0).Item(1).ToString + "<br/>"
            LblMsgTercero.Text = LblMsgTercero.Text + "Documento: " + objDS.Tables(0).Rows(0).Item(3).ToString + "<br/>"
            LblMsgTercero.Text = LblMsgTercero.Text + "Solicita: " + objDS.Tables(0).Rows(0).Item(4).ToString + "<br/>"
            LblMsgTercero.Text = LblMsgTercero.Text + "Tercero: " + objDS.Tables(0).Rows(0).Item(6).ToString + "<br/>"

        Else

            LblMsgTercero.Text = "Documento de Tercero Inválido<br/>"
            BotonConsConsec.Enabled = False
            TextBoxConsecutivo.Enabled = False

        End If

    End Function

    Protected Sub BotonConsConsec_Click(sender As Object, e As System.EventArgs) Handles BotonConsConsec.Click

        FunConsultarCons()


    End Sub

    Private Function FunConsultarCons()

        LblMsgConsecutivo.Text = "entro"

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT CRNCTRASL.OID, CRNCTRASL.CCTFECTRA, CRNCTRASL.GENTERCER  FROM CRNCTRASL INNER JOIN  CRNMTRASL ON CRNCTRASL.OID = CRNMTRASL.CRNCTRASL   "
        StrConsulta = StrConsulta + "WHERE (CRNCTRASL.CCTNUMTRA = " & TextBoxConsecutivo.Text & ") AND (CRNCTRASL.CRNCXC IS NULL) AND (CRNCTRASL.CCTESTADO = 0) " 'AND (CRNCTRASL.GENTERCER = " & LblIdTercero.Text & ") "

        'SELECT CRNCTRASL.OID FROM CRNCTRASL INNER JOIN  CRNMTRASL ON CRNCTRASL.OID = CRNMTRASL.CRNCTRASL WHERE (CRNCTRASL.CCTNUMTRA = 9086) AND (CRNCTRASL.CRNCXC IS NULL) AND (CRNMTRASL.GENTERCER = 16)


        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()



        If objDS.Tables(0).Rows.Count > 0 Then


            LblIdTraslado.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            LblMsgConsecutivo.Text = objDS.Tables(0).Rows.Count.ToString + " Traslados de este consecutivo pendientes de relacionar. <br/>"
            LblMsgConsecutivo.Text = LblMsgConsecutivo.Text + "Fecha: " + objDS.Tables(0).Rows(0).Item(1).ToString + "<br/>"

            'LblMsgConsecutivo.Text = objDS.Tables(0).Rows(0).Item(2).ToString

            TextBoxTercero.Enabled = False
            BotonRelacionar.Enabled = True
            'BotonConsTercero.Text = "Nueva Consulta"

            FunConsultarTercero(objDS.Tables(0).Rows(0).Item(2).ToString)

        Else
            LblMsgConsecutivo.Text = "Consecutivo sin traslados pendientes de relacionar."
            LblMsgTercero.Text = ""

            'LblMsgConsecutivo.Text = StrConsulta
            'TextBoxTercero.Enabled = True
            BotonRelacionar.Enabled = False
            BotonConsTercero.Enabled = False

        End If

    End Function


    Protected Sub BotonRelacionar_Click(sender As Object, e As System.EventArgs) Handles BotonRelacionar.Click

        BotonRelacionar.Enabled = False
        TextBoxConsecutivo.Text = ""

        BotonConsConsec.Enabled = False
        TextBoxConsecutivo.Enabled = False

        DataVigencias.UpdateCommand = "UPDATE CRNCXC  SET PSNRECONOCNUE = " & LblIdDocumento.Text & " FROM CRNMTRASL INNER JOIN CRNCXC ON CRNMTRASL.CRNCXC = CRNCXC.OID  WHERE        (CRNMTRASL.CRNCTRASL = " & LblIdTraslado.Text & ") AND (CRNCXC.CXCDOCFECHA < CONVERT(DATETIME, '" & ListVigencias.SelectedItem.Text & "-01-01 00:00:00', 102))"
        DataVigencias.Update()

        LblMsgRelacion.Visible = True

        'LblMsgConsecutivo.Text = DataVigencias.UpdateCommand

    End Sub
End Class
