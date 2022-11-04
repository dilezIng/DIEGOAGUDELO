Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Partial Class HistoriasClinicas_Auditoria_IntercosultaEsp
    Inherits System.Web.UI.Page




    Protected Sub BtnConsulta_Click(sender As Object, e As EventArgs) Handles BtnConsulta.Click
        Dim med As String = MEDICO.Text

        Dim SQLa As String
        Dim timedatea As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT GMENOMCOM from GENMEDICO WHERE (oid =N'" & med & "')"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        LabelProfesional.Text = Rsa(0)
        Rsa.Close()

        LabelProfesional.Text = LabelProfesional.Text & "  " + GridFoliosMedico.Rows.Count.ToString + " Pacientes encontrados"




        Panel1.Visible = False
        Panel_Intercon.Visible = True

    End Sub
    Protected Sub BtnFinalizar_Click(sender As Object, e As System.EventArgs) Handles BtnFinalizar.Click


        BtnFinalizar.Visible = False
        Panel_Intercon.Visible = False
        Panel1.Visible = True

        ''MEDICO.Text = " "
        ''TextFechaIni = 
        ''TextFechaFin.SelectedIndex = -1

        Response.Redirect("IntercosultaEsp.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, Panel1.Load
        Panel_Intercon.Visible = False

    End Sub

End Class
