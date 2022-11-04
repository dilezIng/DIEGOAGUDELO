Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
'Imports System.Windows.Forms

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim i As Integer

        For i = 1 To 1000
            SqlDataSource1.UpdateCommand = "INSERT INTO Prueba(txtPrueba) VALUES (N'" & Date.Now.Millisecond.ToString & "')"
            SqlDataSource1.Update()
        Next

        'Dim Conexion As New SqlConnection("Data Source=PC-DESARROLLO-2;Initial Catalog=Hospital;Persist Security Info=True;User ID=sa;Password=1234")

        'Dim StrConsulta As String
        'Dim ObjAdapter As New SqlDataAdapter

        'StrConsulta = "SELECT IdPrueba, txtPrueba FROM Prueba"

        'Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        'ObjAdapter.SelectCommand = Consulta

        'Conexion.Open()

        'Dim objDS As New DataSet
        'ObjAdapter.Fill(objDS, "Registros")

        'Conexion.Close()

        'If objDS.Tables(0).Rows.Count > 0 Then
        '    Label1.Text = objDS.Tables(0).Rows.Count.ToString

        '    For i = 0 To objDS.Tables(0).Rows.Count - 1
        '        Label1.Text = Label1.Text + "<br />" + objDS.Tables(0).Rows(i).Item(0).ToString + "," + objDS.Tables(0).Rows(i).Item(1).ToString
        '    Next
        'Else
        '    'Return ".:Identificador de Paciente Invalido:."
        'End If


    End Sub
End Class
