Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Partial Class Quirurgico
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then
            Dim i As Integer = 2012
            For i = Today.Year To 2012 Step -1
                ListAños.Items.Add(i)
            Next
        End If

    End Sub

    Protected Sub ListBox1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListProceds.SelectedIndexChanged
        Actualizar()
    End Sub

    Protected Sub ListAños_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListAños.SelectedIndexChanged
        Actualizar()
    End Sub

    Private Function Actualizar()

        Chart1.DataBind()

        If ListProceds.SelectedValue = -1 Then
            LabelEspecialidad.Text = ListProceds.SelectedItem.Text & " > " & ListAños.SelectedValue.ToString & " Total " & TotalProcedimiento()
        Else
            LabelEspecialidad.Text = ListProceds.SelectedItem.Text.Substring(0, ListProceds.SelectedItem.Text.IndexOf("(")) & " > " & ListAños.SelectedValue.ToString & " Total " & TotalProcedimiento()
        End If

        Label1.Text = ListProceds.SelectedValue.ToString

    End Function

    Private Function TotalProcedimiento() As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        'StrConsulta = "SELECT SUM(SLNPAQHOJ.SPHVALSER) AS Expr11, COUNT(SLNSERPRO.DGNESPECI1) AS Cant FROM ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN GENESPECI ON SLNSERPRO.DGNESPECI1 = GENESPECI.OID INNER JOIN SLNPAQHOJ ON SLNSERPRO.OID = SLNPAQHOJ.SLNSERPRO1 INNER JOIN GENPLACUB ON SLNPAQHOJ.GENPLACUB = GENPLACUB.OID INNER JOIN GENMANSER ON GENPLACUB.GENMANSER1 = GENMANSER.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (SLNSERPRO.SERTIPCAP <> 1) AND (SLNSERPRO.DGNESPECI1 = " & ListProceds.SelectedValue.ToString & ") AND (SLNFACTUR.SFADOCANU = 0) AND (CONVERT (char(4), SLNSERPRO.SERFECSER, 102) = '" & ListAños.SelectedValue.ToString & "')"
        StrConsulta = "SELECT SUM(SLNPAQHOJ.SPHVALSER) AS Expr1, COUNT(GENSERIPS.OID) AS Cant FROM ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN GENESPECI ON SLNSERPRO.DGNESPECI1 = GENESPECI.OID INNER JOIN SLNPAQHOJ ON SLNSERPRO.OID = SLNPAQHOJ.SLNSERPRO1 INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENPAQUET ON SLNPAQHOJ.GENPAQUET1 = GENPAQUET.OID INNER JOIN GENSERIPS ON GENPAQUET.GENSERIPS1 = GENSERIPS.OID WHERE (SLNSERPRO.SERTIPCAP <> 1) AND (SLNSERPRO.DGNESPECI1 = COALESCE (NULLIF (" & ListProceds.SelectedValue.ToString & ", - 1), SLNSERPRO.DGNESPECI1)) AND (CONVERT (char(4), SLNSERPRO.SERFECSER, 102) = '" & ListAños.SelectedValue.ToString & "') AND (SLNFACTUR.SFADOCANU = 0)"


        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            If IsNumeric(objDS.Tables(0).Rows(0).Item(0)) Then
                Return " Procs: " & objDS.Tables(0).Rows(0).Item(1).ToString & "   Valor $" & FormatNumber(objDS.Tables(0).Rows(0).Item(0).ToString, 0, , , TriState.True).ToString
            Else
                Return "$ 0.00"
            End If
        Else
            Return "$ 0.00"
        End If

    End Function


    Protected Sub ListResProceds_ItemCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles ListResProceds.ItemCommand
        Dim vbDataList As DataList
        Dim vbDataList2, vbDataList3 As DataList
        Dim vbSqlDataSource As SqlDataSource

        vbDataList = e.Item.FindControl("ListQx")
        vbDataList.Visible = False

        vbDataList2 = e.Item.FindControl("ListSerIps")
        vbDataList2.Visible = False

        vbDataList3 = e.Item.FindControl("ListProfesionales")
        vbDataList3.Visible = False


        If e.CommandName = "GruposQx" Then
            vbSqlDataSource = e.Item.FindControl("DataListQx")
            vbSqlDataSource.SelectCommand = "SELECT SUM(SLNPAQHOJ.SPHVALSER) AS Expr1, CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)) AS IdMes, RTRIM(GENMANSER.SMSNOMSEE) AS Expr2 FROM ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN GENESPECI ON SLNSERPRO.DGNESPECI1 = GENESPECI.OID INNER JOIN SLNPAQHOJ ON SLNSERPRO.OID = SLNPAQHOJ.SLNSERPRO1 INNER JOIN GENPLACUB ON SLNPAQHOJ.GENPLACUB = GENPLACUB.OID INNER JOIN GENMANSER ON GENPLACUB.GENMANSER1 = GENMANSER.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (SLNSERPRO.SERTIPCAP <> 1) AND (SLNSERPRO.DGNESPECI1 = COALESCE (NULLIF (@IdEspecialidad, -1), SLNSERPRO.DGNESPECI1)) AND (CONVERT (char(4), SLNSERPRO.SERFECSER, 102) = @Año) AND (SLNFACTUR.SFADOCANU = 0) GROUP BY CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)), RTRIM(GENMANSER.SMSNOMSEE) HAVING (CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)) = @IdMes)"

            vbDataList = e.Item.FindControl("ListQx")
            vbDataList.DataBind()
            vbDataList.Visible = True

        ElseIf e.CommandName = "ServiciosQx" Then
            vbSqlDataSource = e.Item.FindControl("DataListSerIps")
            vbSqlDataSource.SelectCommand = "SELECT SUM(SLNPAQHOJ.SPHVALSER) AS Valor, CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)) AS IdMes, GENSERIPS.SIPNOMBRE, COUNT(GENSERIPS.OID) AS Cant FROM ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN GENESPECI ON SLNSERPRO.DGNESPECI1 = GENESPECI.OID INNER JOIN SLNPAQHOJ ON SLNSERPRO.OID = SLNPAQHOJ.SLNSERPRO1 INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENPAQUET ON SLNPAQHOJ.GENPAQUET1 = GENPAQUET.OID INNER JOIN GENSERIPS ON GENPAQUET.GENSERIPS1 = GENSERIPS.OID WHERE (SLNSERPRO.SERTIPCAP <> 1) AND (SLNSERPRO.DGNESPECI1 = COALESCE (NULLIF (@IdEspecialidad, -1), SLNSERPRO.DGNESPECI1)) AND (CONVERT (char(4), SLNSERPRO.SERFECSER, 102) = @Año) AND (SLNFACTUR.SFADOCANU = 0) GROUP BY CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)), GENSERIPS.SIPNOMBRE HAVING (CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)) = @IdMes)"

            vbDataList2 = e.Item.FindControl("ListSerIps")
            vbDataList2.DataBind()
            vbDataList2.Visible = True

        ElseIf e.CommandName = "Medicos" Then
            vbSqlDataSource = e.Item.FindControl("DataListProfs")
            vbSqlDataSource.SelectCommand = "SELECT SUM(SLNPAQHOJ.SPHVALSER) AS Valor, CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)) AS IdMes, GENMEDICO.GMENOMCOM AS NomProfesional, COUNT(SLNPAQHOJ.OID) AS Cant FROM ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNPAQHOJ ON SLNSERPRO.OID = SLNPAQHOJ.SLNSERPRO1 INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENMEDICO ON SLNPAQHOJ.GENMEDICO1 = GENMEDICO.OID WHERE (SLNSERPRO.SERTIPCAP <> 1) AND (SLNSERPRO.DGNESPECI1 = COALESCE (NULLIF (@IdEspecialidad, -1), SLNSERPRO.DGNESPECI1)) AND (CONVERT (char(4), SLNSERPRO.SERFECSER, 102) = @Año) AND (SLNFACTUR.SFADOCANU = 0) GROUP BY CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)), GENMEDICO.GMENOMCOM HAVING (CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)) = @IdMes)"

            vbDataList3 = e.Item.FindControl("ListProfesionales")
            vbDataList3.DataBind()
            vbDataList3.Visible = True
        End If

    End Sub

    Protected Sub BtnContraer_Click(sender As Object, e As System.EventArgs) Handles BtnContraer.Click
        Dim vbDataList As DataList
        Dim vbDataList2, vbDataList3 As DataList
        Dim i As Integer

        For i = 0 To ListResProceds.Items.Count - 1
            vbDataList = ListResProceds.Items(i).FindControl("ListQx")
            vbDataList.Visible = False

            vbDataList2 = ListResProceds.Items(i).FindControl("ListSerIps")
            vbDataList2.Visible = False

            vbDataList3 = ListResProceds.Items(i).FindControl("ListProfesionales")
            vbDataList3.Visible = False
        Next

    End Sub


End Class
