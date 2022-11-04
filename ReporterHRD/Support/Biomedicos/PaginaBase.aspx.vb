Imports System.Data
Imports System.Data.SqlClient


Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load




    End Sub

    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()> _
    Public Shared Function BusqUsuario(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText

        StrConsulta = "SELECT USUDESCRI + N' (' + USUNOMBRE + N')' AS NomUsuario FROM  GENUSUARIO WHERE (USUESTADO = 1) AND (USUDESCRI + N' (' + USUNOMBRE + N')' LIKE N'%" & filtro & "%') ORDER BY NomUsuario"

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
End Class
