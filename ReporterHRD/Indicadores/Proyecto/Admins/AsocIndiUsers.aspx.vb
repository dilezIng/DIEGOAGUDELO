Imports System.Data
Imports System.Data.SqlClient


Partial Class Indicadores_Proyecto_Admins_AsocIndiUsers
    Inherits System.Web.UI.Page

    Protected Sub ListIndicadores_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListIndicadores.SelectedIndexChanged

        Dim i As Integer

        For i = 0 To ListUsuarios.Items.Count - 1
            ListUsuarios.Items(i).Selected = False
        Next

        For i = 0 To ListUsActivs.Items.Count - 1
            ListUsActivs.Items(i).Selected = False
        Next

        FunUsActivos(ListIndicadores.SelectedValue.ToString)
        FunDescIndicador(ListIndicadores.SelectedValue.ToString)

    End Sub

    Private Function FunUsActivos(ByVal IdIndicador As String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT IdIndiUsers, IdUsuarioDG FROM Ind_IndiUsers WHERE IdIndicador = " & IdIndicador

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        Dim i As Integer

        ListUsActivs.Items.Clear()

        If objDS.Tables(0).Rows.Count > 0 Then
            'Return objDS.Tables(0).Rows(0).Item(0).ToString

            For i = 0 To objDS.Tables(0).Rows.Count - 1

                ListUsActivs.Items.Add(objDS.Tables(0).Rows(i).Item(0).ToString)
                ListUsActivs.Items.Item(i).Value = objDS.Tables(0).Rows(i).Item(0).ToString
                ListUsActivs.Items.Item(i).Text = FunNomUsuario(objDS.Tables(0).Rows(i).Item(1).ToString)

            Next
        End If

    End Function

    Private Function FunNomUsuario(ByVal IdUsDG As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT USUDESCRI + N' (' + USUNOMBRE + N')' AS NomUsuario FROM GENUSUARIO WHERE OID = " & IdUsDG
        

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        Dim i As Integer

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            Return "-"

        End If

    End Function


    Protected Sub BtnAsignar_Click(sender As Object, e As System.EventArgs) Handles BtnAsignar.Click

        Dim i As Integer

        For i = 0 To ListUsuarios.Items.Count - 1
            If ListUsuarios.Items(i).Selected Then
                DataConsultas.InsertCommand = "INSERT INTO Ind_IndiUsers(IdIndicador, IdUsuarioDG) VALUES (" & ListIndicadores.SelectedItem.Value.ToString & ", " & ListUsuarios.Items(i).Value & ")"
                DataConsultas.Insert()
            End If

        Next

        FunUsActivos(ListIndicadores.SelectedValue.ToString)

        For i = 0 To ListUsuarios.Items.Count - 1
            ListUsuarios.Items(i).Selected = False
        Next

        For i = 0 To ListUsActivs.Items.Count - 1
            ListUsActivs.Items(i).Selected = False
        Next

    End Sub

    Protected Sub BtnEliminar_Click(sender As Object, e As System.EventArgs) Handles BtnEliminar.Click

        Dim i As Integer

        For i = 0 To ListUsActivs.Items.Count - 1
            If ListUsActivs.Items(i).Selected Then
                'DataConsultas.InsertCommand = "INSERT INTO Ind_IndiUsers(IdIndicador, IdUsuarioDG) VALUES (" & ListIndicadores.SelectedItem.Value.ToString & ", " & ListUsuarios.Items(i).Value & ")"
                DataConsultas.InsertCommand = "DELETE FROM Ind_IndiUsers WHERE IdIndicador = " & ListIndicadores.SelectedItem.Value.ToString & " And IdIndiUsers = " & ListUsActivs.SelectedItem.Value.ToString
                DataConsultas.Insert()
            End If

        Next

        FunUsActivos(ListIndicadores.SelectedValue.ToString)

        For i = 0 To ListUsuarios.Items.Count - 1
            ListUsuarios.Items(i).Selected = False
        Next

        For i = 0 To ListUsActivs.Items.Count - 1
            ListUsActivs.Items(i).Selected = False
        Next

    End Sub

    Private Function FunDescIndicador(ByVal IdIndicador As String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT CodIndicador, NomIndicador, DefOperacional FROM Ind_Principal WHERE IdIndicador = " & IdIndicador

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        Dim i As Integer

        
        If objDS.Tables(0).Rows.Count > 0 Then
        
            For i = 0 To objDS.Tables(0).Rows.Count - 1

                LabelIndSeleccionado.Text = objDS.Tables(0).Rows(i).Item(0).ToString + " - " + objDS.Tables(0).Rows(i).Item(1).ToString
                LabelDescIndSeleccionado.Text = objDS.Tables(0).Rows(i).Item(2).ToString
        
            Next
        End If

    End Function


End Class
