Imports System.Data
Imports System.Data.SqlClient

Partial Class Update_DescoEpicri
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        BtnDesconformar.Visible = False
        LabelOkEnt.Visible = False

        If TxtNumEpicri.Enabled = True Then
            LabelDatEpicri.Text = ""
            DatEpicrisis(ListTipoConsulta.SelectedValue.ToString)
            TxtNumEpicri.Enabled = False
            BtnDesconformar.Enabled = True
            Button1.Text = "Nueva Consulta"
            ListTipoConsulta.Enabled = False
        Else
            Button1.Text = "Consultar Epicrisis"
            TxtNumEpicri.Enabled = True
            LabelDatEpicri.Text = ""
            TxtNumEpicri.Text = ""
            BtnDesconformar.Visible = False
            ListTipoConsulta.Enabled = True
        End If

    End Sub

    Private Function DatEpicrisis(ByVal TipoConsulta As String)

        LabelDatEpicri.ForeColor = Drawing.Color.DarkBlue

        If TxtNumEpicri.Text.Length > 4 Then

            BtnDesconformar.Visible = False

            Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
            Dim StrConsulta As String
            Dim ObjAdapter As New SqlDataAdapter

            StrConsulta = "SELECT ADNINGRESO.AINCONSEC, GENPACIEN.PACPRINOM + N' ' + CASE WHEN GENPACIEN.PACSEGNOM IS NULL THEN '' ELSE GENPACIEN.PACSEGNOM + ' ' END + GENPACIEN.PACPRIAPE + CASE WHEN GENPACIEN.PACSEGAPE IS NULL THEN '' ELSE ' ' + GENPACIEN.PACSEGAPE END AS NomPac, HCNEPICRI.HCEESTDOC, HCNEPICRI.HCEFECEGR, HCNEPICRI.HCECONSEC FROM HCNEPICRI INNER JOIN ADNINGRESO ON HCNEPICRI.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON HCNEPICRI.GENPACIEN = GENPACIEN.OID  " 'WHERE ADNINGRESO.AINCONSEC = " + TxtNumEpicri.Text

            If TipoConsulta = "1" Then
                StrConsulta = StrConsulta + "WHERE ADNINGRESO.AINCONSEC = " + TxtNumEpicri.Text 'Por Ingreso
            Else
                StrConsulta = StrConsulta + "WHERE HCNEPICRI.HCECONSEC = " + TxtNumEpicri.Text 'Por epicrisis
            End If


            Dim Consulta As New SqlCommand(StrConsulta, Conexion)

            ObjAdapter.SelectCommand = Consulta

            Conexion.Open()

            Dim objDS As New DataSet
            ObjAdapter.Fill(objDS, "Registros")

            Dim Lista As List(Of String) = New List(Of String)

            Conexion.Close()

            If objDS.Tables(0).Rows.Count > 0 Then
                Dim Estado As String

                LabelDatEpicri.Text = LabelDatEpicri.Text + "Paciente: " + objDS.Tables(0).Rows(0).Item(1).ToString + "<br/>"
                LabelDatEpicri.Text = LabelDatEpicri.Text + "Ingreso: " + objDS.Tables(0).Rows(0).Item(0).ToString + "<br/>"
                LabelDatEpicri.Text = LabelDatEpicri.Text + "Epicrisis: " + objDS.Tables(0).Rows(0).Item(4).ToString + "<br/>"
                'LabelDatEpicri.Text = LabelDatEpicri.Text + ListTipoConsulta.SelectedValue.ToString + "<br/>"
                LabelNumEpicrisis.Text = objDS.Tables(0).Rows(0).Item(4).ToString

                If objDS.Tables(0).Rows(0).Item(2).ToString = "0" Then
                    Estado = "Registrado"
                ElseIf objDS.Tables(0).Rows(0).Item(2).ToString = "1" Then
                    Estado = "Confirmado"
                    BtnDesconformar.Visible = True
                Else
                    Estado = "Anulado"
                End If

                LabelDatEpicri.Text = LabelDatEpicri.Text + "Estado: " + Estado + "<br/>"
                LabelDatEpicri.Text = LabelDatEpicri.Text + "Fecha: " + objDS.Tables(0).Rows(0).Item(3).ToString + "<br/>"
            Else
                LabelDatEpicri.ForeColor = Drawing.Color.Red
                LabelDatEpicri.Text = "Número de Epicrisis Inválido"
                If TipoConsulta = "1" Then LabelDatEpicri.Text = "El Ingreso no tiene Epicrisis Asociada. Puede ser de Consulta Externa."
            End If
        Else
            LabelDatEpicri.ForeColor = Drawing.Color.Red
            LabelDatEpicri.Text = "Número de Epicrisis Inválido"
        End If

    End Function

    Protected Sub BtnDesconformar_Click(sender As Object, e As System.EventArgs) Handles BtnDesconformar.Click

        SqlDataSource1.UpdateCommand = "UPDATE HCNEPICRI SET HCEESTDOC = 0, HCEFECEGR = NULL WHERE HCECONSEC = " + LabelNumEpicrisis.Text
        SqlDataSource1.Update()
        BtnDesconformar.Enabled = False

        LabelDatEpicri.Text = "Se desconfirmo con exito.<br/>"
        DatEpicrisis(ListTipoConsulta.SelectedValue.ToString)

        LabelOkEnt.Visible = False

    End Sub

    Protected Sub BtnIngreso_Click(sender As Object, e As System.EventArgs) Handles BtnIngreso.Click

        If IsNumeric(TxtNumIngreso.Text) = False Then TxtNumIngreso.Text = ""

        LblIdEnt.Text = ""
        LabelOkEnt.Visible = False

        GridPaciente.Visible = True
        Try
            GridPaciente.DataBind()
            GridIngreso.DataBind()

            LblIdEnt.Text = GridPaciente.DataKeys(0).Item(0).ToString
            BtnHomologarEntidad.Visible = True

        Catch ex As Exception
            BtnHomologarEntidad.Visible = False
        End Try

    End Sub

    Protected Sub BtnHomologarEntidad_Click(sender As Object, e As System.EventArgs) Handles BtnHomologarEntidad.Click

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionUpdate").ToString())

        Dim StrConsulta As String

        'StrConsulta = "UPDATE   Q_OrdenesTrabajo SET   LtOrden = N'" & Latitud & "', LnOrden = N'" & Longitud & "'  WHERE IdOrdenTrabajo = " & IdOrden
        StrConsulta = "UPDATE ADNINGRESO SET GENDETCON = " & LblIdEnt.Text & "    WHERE AINCONSEC = " & TxtNumIngreso.Text

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)
        Dim ejecuta As Integer

        Conexion.Open()

        ejecuta = Consulta.ExecuteNonQuery()

        Conexion.Close()

        ActFoliosEnt()

        LabelOkEnt.Visible = True
        BtnHomologarEntidad.Visible = False

        GridPaciente.DataBind()
        GridIngreso.DataBind()

    End Sub

    Private Function ActFoliosEnt()

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionUpdate").ToString())

        Dim StrConsulta As String

        StrConsulta = "UPDATE HCNFOLIO SET GENDETCON = " & LblIdEnt.Text & " FROM ADNINGRESO INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO WHERE ADNINGRESO.AINCONSEC = " & TxtNumIngreso.Text
        Dim Consulta As New SqlCommand(StrConsulta, Conexion)
        Dim ejecuta As Integer

        Conexion.Open()

        ejecuta = Consulta.ExecuteNonQuery()

        Conexion.Close()

    End Function

End Class
