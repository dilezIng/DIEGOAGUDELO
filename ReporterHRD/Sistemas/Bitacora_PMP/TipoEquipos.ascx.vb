Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web



Partial Class Sistemas_Bitacora_PMP_TipoEquipos
    Inherits System.Web.UI.UserControl


    Protected Sub BtnNuevoPunto_Click(sender As Object, e As System.EventArgs) Handles BtnNuevoPunto.Click

    BtnNuevoPunto.Visible = False
    PanelNuevoPunto.Visible = True
    PanelNuevoPunto.Enabled = True
    TextNomPunto.Text = ""


    End Sub

Protected Sub BtnNuevoPunto0_Click(sender As Object, e As System.EventArgs) Handles BtnNuevoPunto0.Click

    'Dim vbEstado As String

    'vbEstado = "0"
    'If CheckEstado.Checked = True Then vbEstado = "1"  SELECT IdTipoEquipo, NomTipoEquipo FROM Sis_HV_TiposEquipo

    LabelMsg.Visible = False
        Dim NomPunto As String = TextNomPunto.Text

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString()) '' Dim sq As String
        Dim StrConsulta As String = ""
        Dim ObjAdapter As SqlDataReader

        StrConsulta = "Select case when (SELECT  IdTipoEquipo FROM Sis_HV_TiposEquipo WHERE ( NomTipoEquipo = N'" & NomPunto & "')) is null then 1 else 2 end" '' Dim timd

        Dim Consulta As New SqlCommand(StrConsulta, Conexion) '' Coma123456

        Conexion.Open()
        ObjAdapter = Consulta.ExecuteReader()

        ObjAdapter.Read()
        If ObjAdapter(0) = 2 Then
            LabelMsg.Text = "Ya existe el tipo de Equipos"
            LabelMsg.Visible = True
        Else
            DataConsultas.InsertCommand = "INSERT INTO Sis_HV_TiposEquipo( NomTipoEquipo) VALUES (N'" & NomPunto & "' )"
            DataConsultas.Insert()
            GridPuntosTrabajo.DataBind()
            BtnNuevoPunto.Visible = True
        End If

        ObjAdapter.Close()
        Conexion.Close()





        PanelNuevoPunto.Enabled = False

    'INSERT INTO Sis_HV_PuntosTrabajo(NombrePunto, IdDependencia) VALUES (N'abcd', 88)
End Sub



    Private Function vbExisteProc(ByVal NomPunto As String) As Boolean

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String = ""
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT  IdTipoEquipo FROM Sis_HV_TiposEquipo WHERE ( NomTipoEquipo = N'" & NomPunto & "')"

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
