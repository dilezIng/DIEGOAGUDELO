Imports System.IO
Imports System.Text
Imports System.Collections.Generic
Imports System.Web
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class PaginaBase
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Panel1.Visible = True
        Panel2.Visible = False

    End Sub

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click
        '' Label2.Text = "suma"
        LabelInfo.Text = ""

        If IsDate(TextFechaIni.Text) And IsDate(TextFechaFin.Text) Then 'And IsDate(TextFechaIniTras.Text) And IsDate(TextFechaFinTras.Text) Then
            FunActualizar()
        Else
            LabelInfo.Text = "La Fecha Inicial y/o la Fecha Final no son válidas."
            LabelInfo.ForeColor = Color.Red
        End If


        Panel1.Visible = True
        Panel2.Visible = False

        LabelInfo.Text = "Solicitudes Realizadas " + GridView1.Rows.Count.ToString


    End Sub

    Private Function FunActualizar()

        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        'LabelFechaFinTraslado.Text = CDate(TextFechaFin.Text).AddDays(1)

        GridView1.DataBind()

        LabelInfo.Text = "" 'GridView1.Rows.Count.ToString + " registros encontrados."
        LabelInfo.ForeColor = Color.Black


    End Function


    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Panel1.Visible = False
        Panel2.Visible = True
        Dim Inicio As String = TextFechaIni.text
        Dim Final As String = LabelFechaFin.Text
        Dim ingreso As Integer = GridView1.SelectedValue.ToString
        '' Dim ingreso2 As Integer = GridView1.
        Dim SQL As String
        Dim timedate As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT HCNSOLPQX.OID , GENDETCON.GDENOMBRE + N' (' + GENDETCON.GDECODIGO + N')' ,GENSERIPS.SIPCODIGO + N'-' + RTRIM(GENSERIPS.SIPNOMBRE) , GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM FROM GENPACIEN  INNER JOIN HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN   INNER JOIN HCNSOLPQX ON HCNFOLIO.OID = HCNSOLPQX.HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENSERIPS ON HCNSOLPQX.GENSERIPS = GENSERIPS.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID  WHERE  (HCNSOLPQX.OID =N'" & ingreso & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Labeli.Text = Rs(0)
        Labele.Text = Rs(1)
        Labelp.Text = Rs(2)
        Labelpac.Text = Rs(3)
        Rs.Close()
        timedate.Close()






    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Panel1.Visible = True
        Panel2.Visible = False
    End Sub
End Class