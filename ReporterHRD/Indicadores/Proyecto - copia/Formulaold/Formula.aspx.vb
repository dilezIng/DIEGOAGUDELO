Imports System.Data
Imports System.Data.SqlClient


Partial Class Indicadores_Proyecto_Admins_AsocIndiUsers
    Inherits System.Web.UI.Page

    'Protected Sub ListIndicadores_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListIndicadores.SelectedIndexChanged

    '    Dim i As Integer

    '    For i = 0 To ListUsuarios.Items.Count - 1
    '        ListUsuarios.Items(i).Selected = False
    '    Next

    '    For i = 0 To ListUsActivs.Items.Count - 1
    '        ListUsActivs.Items(i).Selected = False
    '    Next

    '    FunUsActivos(ListIndicadores.SelectedValue.ToString)
    '    FunDescIndicador(ListIndicadores.SelectedValue.ToString)

    'End Sub

    'Private Function FunUsActivos(ByVal IdIndicador As String)

    '    Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
    '    Dim StrConsulta As String
    '    Dim ObjAdapter As New SqlDataAdapter

    '    StrConsulta = "SELECT IdIndiUsers, IdUsuarioDG FROM Ind_IndiUsers WHERE IdIndicador = " & IdIndicador

    '    Dim Consulta As New SqlCommand(StrConsulta, Conexion)

    '    ObjAdapter.SelectCommand = Consulta

    '    Conexion.Open()

    '    Dim objDS As New DataSet
    '    ObjAdapter.Fill(objDS, "Registros")

    '    Conexion.Close()

    '    Dim i As Integer

    '    ListUsActivs.Items.Clear()

    '    If objDS.Tables(0).Rows.Count > 0 Then
    '        'Return objDS.Tables(0).Rows(0).Item(0).ToString

    '        For i = 0 To objDS.Tables(0).Rows.Count - 1

    '            ListUsActivs.Items.Add(objDS.Tables(0).Rows(i).Item(0).ToString)
    '            ListUsActivs.Items.Item(i).Value = objDS.Tables(0).Rows(i).Item(0).ToString
    '            ListUsActivs.Items.Item(i).Text = FunNomUsuario(objDS.Tables(0).Rows(i).Item(1).ToString)

    '        Next
    '    End If

    'End Function

    'Private Function FunNomUsuario(ByVal IdUsDG As String) As String

    '    Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
    '    Dim StrConsulta As String
    '    Dim ObjAdapter As New SqlDataAdapter

    '    StrConsulta = "SELECT USUDESCRI + N' (' + USUNOMBRE + N')' AS NomUsuario FROM GENUSUARIO WHERE OID = " & IdUsDG


    '    Dim Consulta As New SqlCommand(StrConsulta, Conexion)

    '    ObjAdapter.SelectCommand = Consulta

    '    Conexion.Open()

    '    Dim objDS As New DataSet
    '    ObjAdapter.Fill(objDS, "Registros")

    '    Conexion.Close()

    '    Dim i As Integer

    '    If objDS.Tables(0).Rows.Count > 0 Then
    '        Return objDS.Tables(0).Rows(0).Item(0).ToString
    '    Else
    '        Return "-"

    '    End If

    'End Function


    'Protected Sub BtnAsignar_Click(sender As Object, e As System.EventArgs) Handles BtnAsignar.Click

    '    Dim i As Integer

    '    For i = 0 To ListUsuarios.Items.Count - 1
    '        If ListUsuarios.Items(i).Selected Then
    '            DataConsultas.InsertCommand = "INSERT INTO Ind_IndiUsers(IdIndicador, IdUsuarioDG) VALUES (" & ListIndicadores.SelectedItem.Value.ToString & ", " & ListUsuarios.Items(i).Value & ")"
    '            DataConsultas.Insert()
    '        End If

    '    Next

    '    FunUsActivos(ListIndicadores.SelectedValue.ToString)

    '    For i = 0 To ListUsuarios.Items.Count - 1
    '        ListUsuarios.Items(i).Selected = False
    '    Next

    '    For i = 0 To ListUsActivs.Items.Count - 1
    '        ListUsActivs.Items(i).Selected = False
    '    Next

    'End Sub

    'Protected Sub BtnEliminar_Click(sender As Object, e As System.EventArgs) Handles BtnEliminar.Click

    '    Dim i As Integer

    '    For i = 0 To ListUsActivs.Items.Count - 1
    '        If ListUsActivs.Items(i).Selected Then
    '            'DataConsultas.InsertCommand = "INSERT INTO Ind_IndiUsers(IdIndicador, IdUsuarioDG) VALUES (" & ListIndicadores.SelectedItem.Value.ToString & ", " & ListUsuarios.Items(i).Value & ")"
    '            DataConsultas.InsertCommand = "DELETE FROM Ind_IndiUsers WHERE IdIndicador = " & ListIndicadores.SelectedItem.Value.ToString & " And IdIndiUsers = " & ListUsActivs.SelectedItem.Value.ToString
    '            DataConsultas.Insert()
    '        End If

    '    Next

    '    FunUsActivos(ListIndicadores.SelectedValue.ToString)

    '    For i = 0 To ListUsuarios.Items.Count - 1
    '        ListUsuarios.Items(i).Selected = False
    '    Next

    '    For i = 0 To ListUsActivs.Items.Count - 1
    '        ListUsActivs.Items(i).Selected = False
    '    Next

    'End Sub

    'Private Function FunDescIndicador(ByVal IdIndicador As String)

    '    Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
    '    Dim StrConsulta As String
    '    Dim ObjAdapter As New SqlDataAdapter

    '    StrConsulta = "SELECT CodIndicador, NomIndicador, DefOperacional FROM Ind_Principal WHERE IdIndicador = " & IdIndicador

    '    Dim Consulta As New SqlCommand(StrConsulta, Conexion)

    '    ObjAdapter.SelectCommand = Consulta

    '    Conexion.Open()

    '    Dim objDS As New DataSet
    '    ObjAdapter.Fill(objDS, "Registros")

    '    Conexion.Close()

    '    Dim i As Integer


    '    If objDS.Tables(0).Rows.Count > 0 Then
    '        For i = 0 To objDS.Tables(0).Rows.Count - 1
    '            LabelIndSeleccionado.Text = objDS.Tables(0).Rows(i).Item(0).ToString + " - " + objDS.Tables(0).Rows(i).Item(1).ToString
    '            LabelDescIndSeleccionado.Text = objDS.Tables(0).Rows(i).Item(2).ToString
    '        Next
    '    End If

    'End Function


    'Public Function CrearUsuario(ByVal NomUser As String, ByVal Contrasena As String, ByVal Correo As String)

    '    Dim NuevoUsuario As MembershipUser
    '    NuevoUsuario = Membership.CreateUser(NomUser.ToLower, Contrasena, Correo.ToLower) '.ChangePasswordQuestion("Hectorr++", "camilo++", "camilo--")

    '    'Return NomUser

    'End Function


    Protected Sub GridIndicadores_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridIndicadores.SelectedIndexChanged

        GridIndicadores.Visible = False
        TextBox1.Text = GridIndicadores.SelectedValue.ToString
        PanelFormula.Visible = True

        Dim id_indi As String = GridIndicadores.SelectedValue.ToString

        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Com2 As New SqlCommand
        Com2.Connection = timedate2
        timedate2.Open()
        SQL2 = "SELECT  TOP 1 case when Ind_Principal.Tipo_Formula is not null then Ind_Principal.Tipo_Formula else 1 end, case when Ind_Principal.Meta is not null then Ind_Principal.Meta else 0 end, CASE WHEN Ind_Principal.F1 IS NOT NULL THEN Ind_Principal.F1 ELSE 0 END, CASE WHEN Ind_Principal.F2 IS NOT NULL THEN Ind_Principal.F2 ELSE 0 END, CASE WHEN Ind_Principal.Fanual IS NOT NULL THEN Ind_Principal.Fanual ELSE 0 END FROM Ind_Principal  WHERE (Ind_Principal.IdIndicador  =N'" & id_indi & "')"
        Com2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Com2.ExecuteReader()
        Rs2.Read()

        Tipo_Formula.Text = Rs2(0)
        META1.text = Rs2(1)
        for1.Text = Rs2(2)
        for2.Text = Rs2(3)
        Fora.Text = Rs2(4)

        Rs2.Close()
        timedate2.Close()

    End Sub




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim Tipo As String = Tipo_Formula.Text
        Dim Id As String = TextBox1.Text
        Dim m1 As String = META1.Text
        Dim f1 As String = for1.Text
        Dim f2 As String = for2.Text
        Dim fa As String = Fora.Text

        DataGridindicadores0.UpdateCommand = "UPDATE Ind_Principal SET Tipo_Formula=N'" & Tipo & "', Meta=N'" & m1 & "', F1=N'" & f1 & "', F2=N'" & f2 & "', Fanual=N'" & fa & "' WHERE (IdIndicador=N'" & Id & "')"
        DataGridindicadores0.Update()
        PanelFormula.Visible = False
        GridIndicadores.Visible = True

    End Sub
End Class
