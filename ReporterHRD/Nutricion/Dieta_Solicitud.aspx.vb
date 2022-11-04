Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Public Class Dieta_Solicitud
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ''  LabelPacientes.Text = "" + GridView1.Rows.Count.ToString
        Panel1.Visible = True
        Panel2.Visible = False

        Dim control22 As Integer

        Dim i As Integer
        Dim f As Integer
        Dim SQL As String
        Dim SQL22 As String
        Dim SQL3 As String
        Dim timedate As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL22 = "Select case when(SELECT TOP 1 C.OID FROM HPNESTANC AS A INNER JOIN ADNINGRESO AS C ON A.ADNINGRES = C.OID  WHERE  (A.HESFECSAL IS NULL)  ORDER BY C.OID ASC) is null then 1 else 2 end"
        Com = New SqlCommand(SQL22, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()

        If (Rs(0) = 2) Then
            Dim sq As String
            Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
            Dim Rsa1983 As SqlDataReader
            Dim Coma123456 As New SqlCommand
            Coma123456.Connection = timd
            timd.Open()
            sq = "SELECT TOP 1 C.OID FROM HPNESTANC AS A INNER JOIN ADNINGRESO AS C ON A.ADNINGRES = C.OID  WHERE  (A.HESFECSAL IS NULL)  ORDER BY C.OID ASC"
            Coma123456 = New SqlCommand(sq, timd)
            Rsa1983 = Coma123456.ExecuteReader()
            Rsa1983.Read()
            i = Rsa1983(0)
            Rsa1983.Close()
            timd.Close()


        End If

        Rs.Close()
        timedate.Close()

        Com.Connection = timedate
        timedate.Open()
        SQL3 = "Select case when(SELECT TOP 1 C.OID FROM HPNESTANC AS A INNER JOIN ADNINGRESO AS C ON A.ADNINGRES = C.OID  WHERE  (A.HESFECSAL IS NULL)  ORDER BY C.OID desc) is null then 1 else 2 end"
        Com = New SqlCommand(SQL3, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()


        If (Rs(0) = 2) Then

            Dim sq As String
            Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
            Dim Rsa1983 As SqlDataReader
            Dim Coma123456 As New SqlCommand
            Coma123456.Connection = timd
            timd.Open()
            sq = "SELECT TOP 1 C.OID FROM HPNESTANC AS A INNER JOIN ADNINGRESO AS C ON A.ADNINGRES = C.OID  WHERE  (A.HESFECSAL IS NULL)  ORDER BY C.OID desc"
            Coma123456 = New SqlCommand(sq, timd)
            Rsa1983 = Coma123456.ExecuteReader()
            Rsa1983.Read()
            f = Rsa1983(0)
            Rsa1983.Close()
            timd.Close()

        End If

        Rs.Close()
        timedate.Close()

        While (i <= f)

            Com.Connection = timedate
            timedate.Open()
            SQL = "Select case when (SELECT TOP 1 C.OID FROM HPNESTANC AS A INNER JOIN ADNINGRESO AS C ON A.ADNINGRES = C.OID  where  (C.OID = " & i & ") and  (A.HESFECSAL IS NULL) and C.AINFECHOS is not null ORDER BY C.OID ASC  ) is null then 1 else 2 end"
            Com = New SqlCommand(SQL, timedate)
            Rs = Com.ExecuteReader()
            Rs.Read()

            If (Rs(0) = 2) Then
                Dim SQL2 As String
                Dim timedate23 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
                Dim Rs2 As SqlDataReader
                Dim Com23 As New SqlCommand
                Com23.Connection = timedate23
                timedate23.Open()
                SQL2 = "Select case when (Select top 1  Oidingreso From nutricion where Oidingreso= " & i & " AND Dia = CONVERT(varchar,GETDATE(),23)) is null then 1 else 2 end"
                Com23 = New SqlCommand(SQL2, timedate23)
                Rs2 = Com23.ExecuteReader()
                Rs2.Read()
                If (Rs2(0) = 1) Then
                    Dim SQL222 As String
                    Dim timedate2 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
                    Dim Rsq As SqlDataReader
                    Dim Comq As New SqlCommand
                    Comq.Connection = timedate2
                    timedate2.Open()
                    SQL222 = "SELECT DISTINCT CONVERT(varchar,GETDATE(),23) ,C.OID,C.AINCONSEC AS Ingreso, B.HCACODIGO AS Cama, RIGHT (B.HCACODIGO, 2) AS Grupo, D.PACNUMDOC AS Documento, RTRIM(D.PACPRIAPE) + ' ' + RTRIM(D.PACSEGAPE) + ' ' + RTRIM(D.PACPRINOM) + ' ' + RTRIM(D.PACSEGNOM) AS Nombre, DATEDIFF(year, D.GPAFECNAC, GETDATE()) AS Edad,  GENDETCON.GDECODIGO + '_' + GENDETCON.GDENOMBRE AS Entidad, (SELECT TOP (1) G.DIANOMBRE FROM HCNFOLIO AS H INNER JOIN HCNDIAPAC AS HC ON H.OID = HC.HCNFOLIO INNER JOIN GENDIAGNO AS G ON HC.GENDIAGNO = G.OID INNER JOIN HCNTIPHIS ON H.HCNTIPHIS = HCNTIPHIS.OID WHERE (H.ADNINGRESO = C.OID) AND (H.HCNTIPHIS = 3) AND (HC.HCPDIAPRIN = 1) ORDER BY H.OID DESC) AS Diagnostico, (SELECT TOP (1) GENESPECI.GEEDESCRI FROM GENESPECI INNER JOIN GENESPMED ON GENESPECI.OID = GENESPMED.ESPECIALIDADES INNER JOIN HCNFOLIO AS H ON GENESPMED.MEDICOS = H.GENMEDICOA INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID WHERE (H.ADNINGRESO = C.OID) AND (H.HCNTIPHIS = 3) ORDER BY GENESPECI.GEEDESCRI DESC) AS Especialidad, (SELECT CASE WHEN HCNINDMED.HCIDETIND IS NULL THEN 'Sin indicación' ELSE HCNINDMED.HCIDETIND END AS Indicación FROM HCNINDMED WHERE (OID = (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO INNER JOIN HCNTIPHIS AS HCNTIPHIS_2 ON HCNFOLIO_2.HCNTIPHIS = HCNTIPHIS_2.OID WHERE (HCNFOLIO_2.ADNINGRESO = C.OID) AND (HCNFOLIO_2.HCNTIPHIS = 3) ORDER BY HCNFOLIO_2.OID DESC))) AS Indicacion FROM HPNESTANC AS A INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID INNER JOIN HPNGRUPOS ON B.HPNGRUPOS = HPNGRUPOS.OID INNER JOIN ADNINGRESO AS C ON A.ADNINGRES = C.OID INNER JOIN GENPACIEN AS D ON C.GENPACIEN = D.OID INNER JOIN HCNFOLIO ON D.OID = HCNFOLIO.GENPACIEN INNER JOIN GENMEDICO ON GENMEDICO.OID = HCNFOLIO.GENMEDICOA INNER JOIN HCNTIPHIS AS HCNTIPHIS_1 ON HCNFOLIO.HCNTIPHIS = HCNTIPHIS_1.OID INNER JOIN GENESPECI AS GENESPECI_1 ON HCNFOLIO.GENESPECI = GENESPECI_1.OID INNER JOIN HPNSUBGRU AS E ON B.HPNSUBGRU = E.OID INNER JOIN GENDETCON ON GENDETCON.OID = C.GENDETCON INNER JOIN HCNINDMED AS HCNINDMED_1 ON D.OID = HCNINDMED_1.HCNFOLIO WHERE    (C.OID =  " & i & ")  "
                    Comq = New SqlCommand(SQL222, timedate2)
                    Rsq = Comq.ExecuteReader()
                    Rsq.Read()
                    If (Rsq(1)) Then

                    Else
                        LabelPacientes.Text = Rsq(0)
                        DataHis.InsertCommand = "INSERT INTO nutricion(Ingreso,Cama,Grupo,Documento ,Nombre,Edad ,Entidad,Diagnostico,Especialidad,Indicacion,Dia,Oidingreso ) VALUES ('" & Rsq(2) & "',N'" & Rsq(3) & "',N'" & Rsq(4) & "',N'" & Rsq(5) & "',N'" & Rsq(6) & "',N'" & Rsq(7) & "',N'" & Rsq(8) & "',N'" & Rsq(9) & "',N'" & Rsq(10) & "',N'" & Rsq(11) & "',N'" & Rsq(0) & "','" & Rsq(1) & "') "
                        DataHis.Insert()
                    End If

                    Rsq.Close()
                    timedate2.Close()

                End If

                Rs2.Close()
                timedate23.Close()

            End If
            Rs.Close()
            timedate.Close()
            i = i + 1
        End While




    End Sub

    Protected Sub BtnConsulta_Click(sender As Object, e As EventArgs) Handles BtnConsulta.Click
        LabelPacientes.Text = "" + GridView1.Rows.Count.ToString
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged

        Dim Folio As Integer = GridView2.SelectedValue.ToString
        Panel1.Visible = False
        Panel2.Visible = True
        Folio1.Text = Folio





    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

        Dim ingreso As Integer = GridView1.SelectedValue.ToString


        Panel1.Visible = False
        Panel2.Visible = True
        Ingreso1.Text = ingreso

        Dim SQL As String
        Dim timedate As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT  HPNDEFCAM.HCACODIGO AS Cama,RIGHT (HPNDEFCAM.HCACODIGO, 2) AS Grupo,GENPACIEN.PACNUMDOC AS Documento, RTRIM(GENPACIEN.PACPRIAPE) + ' ' + RTRIM(GENPACIEN.PACSEGAPE) + ' ' + RTRIM(GENPACIEN.PACPRINOM) + ' ' + RTRIM(GENPACIEN.PACSEGNOM) AS Nombre,DATEDIFF(year, GENPACIEN.GPAFECNAC, GETDATE()) AS Edad,ADNINGRESO.AINCONSEC AS Ingreso,GENDETCON.GDECODIGO + '_' + GENDETCON.GDENOMBRE AS Entidad FROM HPNESTANC INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID INNER JOIN ADNINGRESO ON HPNESTANC.ADNINGRES = ADNINGRESO.OID INNER JOIN GENPACIEN on ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON GENDETCON.OID = ADNINGRESO.GENDETCON WHERE  (ADNINGRESO.AINCONSEC=" & ingreso & ")"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        'TextBox1.Text = Rs(0)
        Rs.Close()
        timedate.Close()



    End Sub




    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel1.Visible = True
        Panel2.Visible = False
        Response.AddHeader("REFRESH", "0;Dieta_Solicitud.aspx")
    End Sub




End Class