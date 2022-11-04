Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports AjaxControlToolkit.AutoCompleteDesigner
Imports System.Collections.Generic

Partial Class RepCirugias
    Inherits System.Web.UI.Page

    Protected Sub ListMeses_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListMeses.SelectedIndexChanged
        GridResultados.Visible = True
        GridResultMeses.Visible = False
        Chart1.Visible = False
        GridResultados.DataBind()
        LblTipoRes.Text = "RESUMEN POR MESES <br/>" & TotalMes(ListMeses.SelectedValue.ToString) & " Cirugias realizadas en el mes de " & ListMeses.SelectedItem.Text.ToString
        TextQx.Text = ""

    End Sub

    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()> _
    Public Shared Function BusqCirugia(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText


        StrConsulta = "SELECT DISTINCT RTRIM(GENSERIPS.SIPCODIGO + N' - ' + GENSERIPS.SIPNOMBRE) AS Expr1 FROM HCNQXEPAC INNER JOIN GENSERIPS ON HCNQXEPAC.GENSERIPS = GENSERIPS.OID WHERE  (RTRIM(GENSERIPS.SIPCODIGO + N' - ' + GENSERIPS.SIPNOMBRE) LIKE N'%" & filtro & "%')"

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


    Private Function IdQx()

        Dim Cadena As String

        LblIdQx.Visible = True

        If TextQx.Text.Length > 2 Then
            Cadena = TextQx.Text.Substring(TextQx.Text.LastIndexOf("(") + 1)
            Cadena = Cadena.Substring(0, Cadena.LastIndexOf("-"))

            Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
            Dim StrConsulta As String
            Dim ObjAdapter As New SqlDataAdapter

            StrConsulta = "SELECT OID AS IdQx FROM GENSERIPS WHERE (SIPCODIGO = N'" & Cadena & "')"

            Dim Consulta As New SqlCommand(StrConsulta, Conexion)

            ObjAdapter.SelectCommand = Consulta

            Conexion.Open()

            Dim objDS As New DataSet
            ObjAdapter.Fill(objDS, "Registros")

            Dim Lista As List(Of String) = New List(Of String)

            Conexion.Close()

            If objDS.Tables(0).Rows.Count > 0 Then
                LblIdQx.Text = objDS.Tables(0).Rows(0).Item(0).ToString
                LblIdQx.Visible = False
            Else
                LblIdQx.Text = "SELECCION INVALIDA"
            End If
        Else
            LblIdQx.Text = "SELECCION INVALIDA"
        End If

    End Function

    Protected Sub TextQx_TextChanged(sender As Object, e As System.EventArgs) Handles TextQx.TextChanged

        GridResultados.Visible = False
        GridResultMeses.Visible = True
        Chart1.Visible = True

        IdQx()

        GridResultMeses.DataBind()
        Chart1.DataBind()

        LblTipoRes.Text = TextQx.Text & " <br/>" & TotalCirugia(LblIdQx.Text) & " Cirugias realizadas" ' en el mes de " & ListMeses.SelectedItem.Text.ToString

    End Sub


    Private Function TotalMes(ByVal Cadena As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT CONVERT(char(7), HCNFOLIO.HCFECFOL, 102) AS IdMes, COUNT(CONVERT(char(7), HCNFOLIO.HCFECFOL, 102)) AS Cant FROM  HCNQXEPAC INNER JOIN "
        StrConsulta = StrConsulta & "HCNFOLIO ON HCNQXEPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN  GENSERIPS ON HCNQXEPAC.GENSERIPS = GENSERIPS.OID inner join GENMANSER on GENSERIPS.oid=GENMANSER.GENSERIPS1 inner join GENGRUQUI on GENMANSER.GENGRUQUI1=GENGRUQUI.oid GROUP BY CONVERT(char(7), HCNFOLIO.HCFECFOL, 102) HAVING (CONVERT(char(7), HCNFOLIO.HCFECFOL, 102) = '" & Cadena & "')"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(1).ToString
        Else
            Return "0"
        End If

    End Function

    Private Function TotalCirugia(ByVal Cadena As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        'StrConsulta = "SELECT CONVERT(char(7), HCNFOLIO.HCFECFOL, 102) AS IdMes, COUNT(CONVERT(char(7), HCNFOLIO.HCFECFOL, 102)) AS Cant FROM  HCNQXEPAC INNER JOIN "
        'StrConsulta = StrConsulta & "HCNFOLIO ON HCNQXEPAC.HCNFOLIO = HCNFOLIO.OID GROUP BY CONVERT(char(7), HCNFOLIO.HCFECFOL, 102) HAVING (CONVERT(char(7), HCNFOLIO.HCFECFOL, 102) = '" & Cadena & "')"

        StrConsulta = "SELECT COUNT(HCNQXEPAC.GENSERIPS) AS Cant FROM HCNQXEPAC INNER JOIN HCNFOLIO ON HCNQXEPAC.HCNFOLIO = HCNFOLIO.OID WHERE (HCNQXEPAC.GENSERIPS = " & Cadena & ")"


        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            Return "0"
        End If

    End Function

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        LabelFechaInicio.Text = TextFechaIni.Text
        ' LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        LabelFechaFin.Text = TextFechaFin.Text


    End Sub
End Class
