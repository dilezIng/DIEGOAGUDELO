Imports System.Data
Imports System.Data.SqlClient


Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles BtnConsultar.Click

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT OID, USUDESCRI FROM GENUSUARIO  WHERE USUNOMBRE = N'" & TextNomUsuario.Text & "' AND (USUESTADO = 99)"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        TextNomUsuario.Text = TextNomUsuario.Text.ToUpper

        If objDS.Tables(0).Rows.Count > 0 Then
            LabelNomUsuario.Text = objDS.Tables(0).Rows(0).Item(1).ToString & " esta bloqueado, es posible desbloquearlo."
            LabelIdUsuario.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            BtnDesbloq.Enabled = True
            LabelNomUsuario.ForeColor = Drawing.Color.Blue
        Else
            LabelNomUsuario.Text = "El usuario " & TextNomUsuario.Text.ToUpper & " no esta bloqueado."
            BtnDesbloq.Enabled = False
            LabelNomUsuario.ForeColor = Drawing.Color.Red
        End If

    End Sub

    Protected Sub BtnDesbloq_Click(sender As Object, e As System.EventArgs) Handles BtnDesbloq.Click

        DataConsultas.UpdateCommand = "UPDATE GENUSUARIO SET USUESTADO = 1 WHERE OID = " + LabelIdUsuario.Text
        DataConsultas.Update()

        LabelNomUsuario.Text = TextNomUsuario.Text + " desbloqueado con éxito."
        LabelNomUsuario.ForeColor = Drawing.Color.Green
        BtnDesbloq.Enabled = False

    End Sub
End Class
