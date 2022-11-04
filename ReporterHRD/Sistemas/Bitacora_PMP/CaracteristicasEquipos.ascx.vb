Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web


Partial Class Sistemas_Bitacora_PMP_CarcteristicasEquipos
    Inherits System.Web.UI.UserControl

    'Dim Funciones As New FunBasicas

    Protected Sub BtnGuardar_Click(sender As Object, e As System.EventArgs) Handles BtnGuardarComponente.Click

        Dim vbEstado As String

        vbEstado = "0"
        If CheckEstado.Checked = True Then vbEstado = "1"

        LabelMsg.Visible = False

        If vbExisteProc(TextNomComponente.Text) = False Then
            DataConsultas.InsertCommand = "INSERT INTO Sis_HV_TiposComponentes (NomTipoComponente, Activo, UnidadMedida) VALUES (N'" & TextNomComponente.Text & "', " & vbEstado & " ," & ListUnidadesMedida.SelectedValue.ToString & ")"
            DataConsultas.Insert()
            GridViewComponentes.DataBind()

        Else
            LabelMsg.Text = "Ya existe el componente"
            LabelMsg.Visible = True
        End If

    End Sub

    Protected Sub BtnNueva_Click(sender As Object, e As System.EventArgs) Handles BtnNueva.Click

        BtnNueva.Visible = False
        FormComponente.Visible = True
        LabelMsg.Visible = False

        TextNomComponente.Text = ""
        ListUnidadesMedida.SelectedIndex = -1
        CheckEstado.Checked = False

    End Sub

    Private Function vbExisteProc(ByVal NomComponente As String) As Boolean

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String = ""
        Dim ObjAdapter As New SqlDataAdapter


        StrConsulta = "Select IdTipoComponente FROM Sis_HV_TiposComponentes WHERE NomTipoComponente = N'" & NomComponente & "'"

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

    Protected Sub GridViewComponentes_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewComponentes.RowCommand

        BtnNueva.Visible = True
        FormComponente.Visible = False

    End Sub
End Class
