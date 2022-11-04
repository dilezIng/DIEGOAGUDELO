Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnConsultar_Click(sender As Object, e As System.EventArgs) Handles BtnConsultar.Click

        GridFolios.DataBind()

        LabelExito.Visible = False
        LabelMsg1.Visible = False

        If FunIdPaciente(TextPacDestino.Text) = "0" Or FunIdPaciente(TextPacOrigen.Text) = "0" Then
            BtnHomologar.Enabled = False
            lblInfo.Text = "No existe el Paciente Origen o Destino"
            lblInfo.ForeColor = Drawing.Color.Red
        Else
            BtnHomologar.Enabled = True
            lblInfo.Text = GridFolios.Rows.Count.ToString + " Folios de Historia Clinica"
            lblInfo.ForeColor = Drawing.Color.Blue
        End If

    End Sub

    Protected Sub BtnHomologar_Click(sender As Object, e As System.EventArgs) Handles BtnHomologar.Click

        DataUpdate.UpdateCommand = "UPDATE HCNEPICRI SET GENPACIEN = " & FunIdPaciente(TextPacDestino.Text) & " WHERE GENPACIEN = " + FunIdPaciente(TextPacOrigen.Text)
        DataUpdate.Update()

        DataUpdate.UpdateCommand = "UPDATE HCNREGENF SET GENPACIEN = " & FunIdPaciente(TextPacDestino.Text) & " WHERE GENPACIEN = " + FunIdPaciente(TextPacOrigen.Text)
        DataUpdate.Update()

        DataUpdate.UpdateCommand = "UPDATE HCNORDHOSP SET GENPACIEN = " & FunIdPaciente(TextPacDestino.Text) & " WHERE GENPACIEN = " + FunIdPaciente(TextPacOrigen.Text)
        DataUpdate.Update()

        DataUpdate.UpdateCommand = "UPDATE HCNVACPAC SET GENPACIEN = " & FunIdPaciente(TextPacDestino.Text) & " WHERE GENPACIEN = " + FunIdPaciente(TextPacOrigen.Text)
        DataUpdate.Update()

        Dim i As Integer

        For i = 0 To GridFolios.Rows.Count - 1
            DataUpdate.UpdateCommand = "UPDATE HCNFOLIO SET HCNUMFOL = 9999" & i.ToString & " WHERE OID = " + GridFolios.DataKeys(i).Item(0).ToString
            DataUpdate.Update()
        Next

        For i = 0 To GridFolios.Rows.Count - 1
            DataUpdate.UpdateCommand = "UPDATE HCNFOLIO SET GENPACIEN = " & FunIdPaciente(TextPacDestino.Text) & ", HCNUMFOL = " & (i + 1).ToString & " WHERE OID = " + GridFolios.DataKeys(i).Item(0).ToString
            DataUpdate.Update()
        Next

        DataUpdate.UpdateCommand = "UPDATE ADNINGRESO SET GENPACIEN = " & FunIdPaciente(TextPacDestino.Text) & " WHERE GENPACIEN = " + FunIdPaciente(TextPacOrigen.Text)
        DataUpdate.Update()

        GridFolios.DataBind()

        BtnHomologar.Enabled = False
        LabelExito.Visible = True
        LabelMsg1.Visible = True

    End Sub

    Private Function FunIdPaciente(ByVal NumDocumento As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT OID FROM GENPACIEN  WHERE PACNUMDOC = N'" & NumDocumento & "'"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0)
        Else
            Return "0"
        End If


    End Function
End Class
