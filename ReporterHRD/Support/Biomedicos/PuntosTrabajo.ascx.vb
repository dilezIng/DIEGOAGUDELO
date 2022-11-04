Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web



Partial Class Sistemas_Bitacora_PMP_PuntosTrabajo
    Inherits System.Web.UI.UserControl

    Protected Sub BtnNuevoPunto_Click(sender As Object, e As System.EventArgs) Handles BtnNuevoPunto.Click

        BtnNuevoPunto.Visible = False
        PanelNuevoPunto.Visible = True
        PanelNuevoPunto.Enabled = True
        TextNomPunto.Text = ""
        ListBloques.SelectedIndex = -1

    End Sub

    Protected Sub BtnNuevoPunto0_Click(sender As Object, e As System.EventArgs) Handles BtnNuevoPunto0.Click

        'Dim vbEstado As String

        'vbEstado = "0"
        'If CheckEstado.Checked = True Then vbEstado = "1"

        LabelMsg.Visible = False

        If vbExisteProc(TextNomPunto.Text, ListBloques.SelectedValue.ToString) = False Then
            DataConsultas.InsertCommand = "INSERT INTO Sis_HV_PuntosTrabajo(NombrePunto, IdDependencia) VALUES (N'" & TextNomPunto.Text & "' ," & ListBloques.SelectedValue.ToString & ")"
            DataConsultas.Insert()
            GridPuntosTrabajo.DataBind()
            BtnNuevoPunto.Visible = True
        Else
            LabelMsg.Text = "Ya existe el punto"
            LabelMsg.Visible = True
        End If

        PanelNuevoPunto.Enabled = False

        'INSERT INTO Sis_HV_PuntosTrabajo(NombrePunto, IdDependencia) VALUES (N'abcd', 88)
    End Sub



    Private Function vbExisteProc(ByVal NomPunto As String, ByVal vbIdDependencia As String) As Boolean

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DBSUPPORTConnectionString").ToString())
        Dim StrConsulta As String = ""
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT IdPuntoTrabajo FROM Sis_HV_PuntosTrabajo WHERE (NombrePunto = N'" & NomPunto & "') AND (IdDependencia = " & vbIdDependencia & ")"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If


    End Function
End Class
