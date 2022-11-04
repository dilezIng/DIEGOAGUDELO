Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web


Partial Class Urgencias_Estancia
    Inherits System.Web.UI.Page

    Protected Sub BtnConsulta_Click(sender As Object, e As EventArgs) Handles BtnConsulta.Click
        Dim GRUPO As String = GrupoCama.Text
        Dim INI As String = TextFechaIni.Text
        Dim SI As String = TextFechaFin.Text
        Dim SIN = SI + " 23:59:59"
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()

        SQLa = "select count(ADNINGRESO.AINCONSEC)  FROM HPNESTANC INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID INNER JOIN ADNINGRESO ON HPNESTANC.ADNINGRES=ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HPNGRUPOS ON  HPNDEFCAM.HPNGRUPOS = HPNGRUPOS.OID where (HPNESTANC.HESFECING  BETWEEN N'" & INI & " ' AND N'" & SIN & "')  AND HPNDEFCAM.HPNGRUPOS= N'" & GRUPO & " '"

        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        LabelFolio.Text = Rsa(0)
        Rsa.Close()
        LabelFolio.Text = LabelFolio.Text + " Pacientes encontrados" ' + Rsa(ClientID) 'DataGridEstancia.Rows.count.ToString + " Pacientes encontrados"

    End Sub

End Class
