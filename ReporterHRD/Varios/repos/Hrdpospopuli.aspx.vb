Imports System
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.UI.WebControls
Partial Class Varios_Default
    Inherits System.Web.UI.Page


    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()>
    Public Shared Function BusqUsuario(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText


        StrConsulta = "SELECT  CODIGO1+'_'+DESCRIPCION1 AS CODIGO FROM [Aud_HMLGCASV4] WHERE CODIGO1+'_'+DESCRIPCION1 LIKE N'%" & filtro & "%'  ORDER BY CODIGO1"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Dim i As Integer
            For i = 0 To objDS.Tables(0).Rows.Count - 1
                Lista.Add(objDS.Tables(0).Rows(i).Item(0).ToString)
            Next
        End If

        Return Lista
    End Function



    Protected Sub BtnBuscar_Click(sender As Object, e As System.EventArgs) Handles BtnBuscar.Click
        Panel_RESULTADO.Visible = True
        LblIdUser.Text = TextBox1.Text
        Dim Cadena As String

        Cadena = LblIdUser.Text
        Dim ArrCadena As String() = Cadena.Split("_")


        Dim Cadena2 As String = ArrCadena(0)



        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT CODIGO1 FROM Aud_HMLGCASV4 WHERE CODIGO1+'_'+DESCRIPCION1  = N'" & Cadena2 & "'"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            LblIdUser.Text = objDS.Tables(0).Rows(0).Item(0).ToString

            LblIdUser.Visible = False

        Else
            LblIdUser.Text = Cadena
            LblIdUser2.Text = Cadena2
        End If

    End Sub




    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Panel_RESULTADO.Visible = False

    End Sub
End Class
