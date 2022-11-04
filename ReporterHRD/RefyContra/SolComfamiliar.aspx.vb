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
    Private Function FunActualizar()



        GridView1.DataBind()

        LabelInfo.Text = "" 'GridView1.Rows.Count.ToString + " registros encontrados."
        LabelInfo.ForeColor = Color.Black


    End Function
    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click
        '' Label2.Text = "suma"
        LabelInfo.Text = ""




        Panel1.Visible = True
        Panel2.Visible = False

        LabelInfo.Text = "Solicitudes Realizadas " + GridView1.Rows.Count.ToString

        Dim Inicio As String = TextFechaIni.text


        Dim i As Integer = 0
        Dim f As Integer = 0
        Dim SQL As String
        Dim SQL22 As String
        Dim SQL3 As String
        Dim timedate As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand



        Dim sq As String
            Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
            Dim Rsa1983 As SqlDataReader
            Dim Coma123456 As New SqlCommand
            Coma123456.Connection = timd
            timd.Open()
            sq = "SELECT Top 1 HCNSOLEXA.OID FROM HCNSOLEXA   INNER JOIN ADNINGRESO ON HCNSOLEXA.ADNINGRESO=ADNINGRESO.OID  INNER JOIN GENSERIPS ON HCNSOLEXA.GENSERIPS=GENSERIPS.OID   INNER JOIN GENMANSER ON GENSERIPS.OID=GENMANSER.GENSERIPS1   INNER JOIN GENMANUAL ON GENMANSER.GENMANUAL1=GENMANUAL.OID   INNER JOIN GENMANTAR on GENMANSER.OID=GENMANTAR.GENMANSER1   INNER JOIN HCNFOLIO ON HCNSOLEXA.HCNFOLIO=HCNFOLIO.OID    INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID where GENMANSER.GENMANUAL1=37   AND (YEAR(GENMANTAR.SMTFECINI) = YEAR(GETDATE()))    and GENSERIPS.SIPESTADO=1   and (CONVERT (char(10), HCNSOLEXA.HCSFECSOL, 103) = '" & Inicio & "') AND (ADNINGRESO.AINURGCON != 1 ) and (HCNSOLEXA.HCSVREXTERN=0) AND (GENMANTAR.SMTVALSER>321000) And GENDETCON.GDENOMBRE like '%COMFAMILIAR%' order by HCNSOLEXA.OID asc"
            Coma123456 = New SqlCommand(sq, timd)
            Rsa1983 = Coma123456.ExecuteReader()
        If Rsa1983.Read() Then
            i = Rsa1983(0)
            Rsa1983.Close()



        End If
        timd.Close()


        Coma123456.Connection = timd
            timd.Open()
            sq = "SELECT Top 1 HCNSOLEXA.OID FROM HCNSOLEXA   INNER JOIN ADNINGRESO ON HCNSOLEXA.ADNINGRESO=ADNINGRESO.OID  INNER JOIN GENSERIPS ON HCNSOLEXA.GENSERIPS=GENSERIPS.OID   INNER JOIN GENMANSER ON GENSERIPS.OID=GENMANSER.GENSERIPS1   INNER JOIN GENMANUAL ON GENMANSER.GENMANUAL1=GENMANUAL.OID   INNER JOIN GENMANTAR on GENMANSER.OID=GENMANTAR.GENMANSER1   INNER JOIN HCNFOLIO ON HCNSOLEXA.HCNFOLIO=HCNFOLIO.OID    INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID where GENMANSER.GENMANUAL1=37   AND (YEAR(GENMANTAR.SMTFECINI) = YEAR(GETDATE()))    and GENSERIPS.SIPESTADO=1   and (CONVERT (char(10), HCNSOLEXA.HCSFECSOL, 103) = '" & Inicio & "') AND (ADNINGRESO.AINURGCON != 1 ) and (HCNSOLEXA.HCSVREXTERN=0) AND (GENMANTAR.SMTVALSER>321000) And GENDETCON.GDENOMBRE like '%COMFAMILIAR%' order by HCNSOLEXA.OID desc"
            Coma123456 = New SqlCommand(sq, timd)
            Rsa1983 = Coma123456.ExecuteReader()
        If Rsa1983.Read() Then
            f = Rsa1983(0)
            Rsa1983.Close()


        End If
        timd.Close()

        While (i <= f)

            Com.Connection = timedate
            timedate.Open()
            SQL = "Select case when (SELECT top 1 HCNSOLEXA.OID  FROM HCNSOLEXA   INNER JOIN ADNINGRESO ON HCNSOLEXA.ADNINGRESO=ADNINGRESO.OID  INNER JOIN GENSERIPS ON HCNSOLEXA.GENSERIPS=GENSERIPS.OID   INNER JOIN GENMANSER ON GENSERIPS.OID=GENMANSER.GENSERIPS1   INNER JOIN GENMANUAL ON GENMANSER.GENMANUAL1=GENMANUAL.OID   INNER JOIN GENMANTAR on GENMANSER.OID=GENMANTAR.GENMANSER1   INNER JOIN HCNFOLIO ON HCNSOLEXA.HCNFOLIO=HCNFOLIO.OID    INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID where  (HCNSOLEXA.OID = " & i & ") AND ( ADNINGRESO.AINURGCON <> 1) and (HCNSOLEXA.HCSVREXTERN=0) AND (GENMANTAR.SMTVALSER>321000) and GENMANSER.GENMANUAL1=37 AND (YEAR(GENMANTAR.SMTFECINI) = YEAR(GETDATE()))   And GENDETCON.GDENOMBRE like '%COMFAMILIAR%' ) is null then 1 else 2 end"
            Com = New SqlCommand(SQL, timedate)
            Rs = Com.ExecuteReader()
            Rs.Read()

            If (Rs(0) = 2) Then

                Label2.Text = Rs(0)
                Dim SQL2 As String
                Dim timedate23 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
                Dim Rs2 As SqlDataReader
                Dim Com23 As New SqlCommand
                Com23.Connection = timedate23
                timedate23.Open()
                SQL2 = "Select case when (Select top 1  Sol_QX  From Cryc_SolComfa where Sol_QX = " & i & ") is null then 1 else 2 end"
			
                Com23 = New SqlCommand(SQL2, timedate23)
                Rs2 = Com23.ExecuteReader()
                Rs2.Read()
Dim EE As Integer = Rs2(0)
                If (Rs2(0) = 1) Then

                    Dim SQL222 As String
                    Dim timedate2 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
                    Dim Rsq As SqlDataReader
                    Dim Comq As New SqlCommand
                    Comq.Connection = timedate2
                    timedate2.Open()
                    SQL222 = "SELECT Distinct HCNSOLEXA.OID, case when HCNSOLEXA.HCSESTADO = 0 then 'Urg' when HCNSOLEXA.HCSESTADO = 1 then 'Rutina' when HCNSOLEXA.HCSESTADO = 2 then 'Electiva' when HCNSOLEXA.HCSESTADO = 3 then 'Prioritaria' when HCNSOLEXA.HCSESTADO = 4 then 'Muy Urgente' when HCNSOLEXA.HCSESTADO = 5 then 'Control' when HCNSOLEXA.HCSESTADO = 5 then 'Electivo-Programado' end as Prioridad ,ADNINGRESO.AINCONSEC,GENPACIEN.PACNUMDOC AS Documento ,GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente ,(cast(datediff(dd,GENPACIEN.GPAFECNAC,GETDATE()) / 365.25 as int))AS Edad,case when ADNINGRESO.HPNDEFCAM is null then (case when ADNINGRESO.AINURGCON = 0 then 'Urg' else ''end) else (Select top 1 HPNDEFCAM.HCACODIGO from HPNDEFCAM  where HPNDEFCAM.OID =ADNINGRESO.HPNDEFCAM) end AS Sitio,convert(varchar(30), HCNSOLEXA.HCSFECSOL , 120) AS Fecha_Solicitud,GENSERIPS.SIPCODIGO + N'-' + RTRIM(GENSERIPS.SIPNOMBRE) As Procedimiento_Solicitado ,GENDETCON.GDENOMBRE + N' (' + GENDETCON.GDECODIGO + N')' AS Entidad,GENUSUARIO.USUDESCRI AS Medico_Ordena, isnull(cast(floor(replace(rtrim(ltrim(GENMANTAR.SMTVALSER)),',','')) as int),0) as Valor FROM HCNSOLEXA   INNER JOIN ADNINGRESO ON HCNSOLEXA.ADNINGRESO=ADNINGRESO.OID  INNER JOIN GENSERIPS ON HCNSOLEXA.GENSERIPS=GENSERIPS.OID   INNER JOIN GENMANSER ON GENSERIPS.OID=GENMANSER.GENSERIPS1   INNER JOIN GENMANUAL ON GENMANSER.GENMANUAL1=GENMANUAL.OID   INNER JOIN GENMANTAR on GENMANSER.OID=GENMANTAR.GENMANSER1   INNER JOIN HCNFOLIO ON HCNSOLEXA.HCNFOLIO=HCNFOLIO.OID    INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN GENMEDICO ON HCNFOLIO.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO =  GENUSUARIO.OID  INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID where  (HCNSOLEXA.OID =  " & i & ") AND (GENMANTAR.SMTVALSER>321000) and (HCNSOLEXA.HCSVREXTERN=0) AND (YEAR(GENMANTAR.SMTFECINI) = YEAR(GETDATE()))  AND (GENMANSER.GENMANUAL1=37) And GENDETCON.GDENOMBRE like '%COMFAMILIAR%' ORDER BY HCNSOLEXA.OID "
				                        
				   Comq = New SqlCommand(SQL222, timedate2)
                    Rsq = Comq.ExecuteReader()
                    Rsq.Read()
                    DataHis.InsertCommand = "INSERT INTO Cryc_SolComfa(Sol_QX, Prioridad,Ingreso, Documento, Paciente,  Edad,  Sitio,   Fech_Sol,  Solicitud,    Entidad,    Medico_ordena,   Estado, Usuario,Valor ) VALUES ('" & Rsq(0) & "','" & Rsq(1) & "'," & Rsq(2) & ",'" & Rsq(3) & "','" & Rsq(4) & "','" & Rsq(5) & "','" & Rsq(6) & "','" & Rsq(7) & "','" & Rsq(8) & "','" & Rsq(9) & "','" & Rsq(10) & "',0,' ','" & Rsq(11) & "') "
                    DataHis.Insert()
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



    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Panel1.Visible = False
        Panel2.Visible = True
        Dim Inicio As String = TextFechaIni.text

        Dim ingreso As Integer = GridView1.SelectedValue.ToString
        '' Dim ingreso2 As Integer = GridView1.
        Dim SQL As String
        Dim timedate As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT HCNSOLEXA.OID , GENDETCON.GDENOMBRE + N' (' + GENDETCON.GDECODIGO + N')' ,GENSERIPS.SIPCODIGO + N'-' + RTRIM(GENSERIPS.SIPNOMBRE) , GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM FROM GENPACIEN  INNER JOIN HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN   INNER JOIN HCNSOLEXA ON HCNFOLIO.OID = HCNSOLEXA.HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENSERIPS ON HCNSOLEXA.GENSERIPS = GENSERIPS.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID  WHERE  (HCNSOLEXA.OID =" & ingreso & ") And GENDETCON.GDENOMBRE like '%COMFAMILIAR%'"
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
        Dim useer As String = Page.User.Identity.Name.ToString
        Dim ingreso As Integer = Labeli.Text
        Dim Estado As Integer = ListEstado.text
        Dim Inicio As String = TextFechaIni.text

        Dim obs As String = TextBox1.Text

        DataHis.UpdateCommand = "UPDATE Cryc_SolComfa  SET  Estado ='" & Estado & "', Usuario ='" & useer & "', Observaciones ='" & obs & "' where Sol_QX ='" & ingreso & "' "
        DataHis.Update()

        DataHis.InsertCommand = "INSERT INTO Cryc_SolQX_AUD (Id_Sol_QX,Realiza, Nota,Date,Estado) VALUES (N'" & ingreso & "','" & useer & "','" & obs & "',GETDATE(),'" & Estado & "')"
        DataHis.Insert()

        Panel1.Visible = True
        Panel2.Visible = False
        'Response.AddHeader("REFRESH", "2;SolPqx.aspx")

        LabelInfo.Text = ""

        label2.Text = "Solicitudes Realizadas " + GridView1.Rows.Count.ToString

        SqlDataSource1.SelectCommand = "SELECT Prioridad, Ingreso AS Ingreso, Documento, Paciente, Sitio, Fech_Sol, Solicitud, Entidad, Usuario, CASE WHEN Estado = 3 THEN '~/Images/Verdecry.png' WHEN Estado = 1 THEN '~/Images/Amarillocry.png' WHEN Estado = 2 THEN '~/Images/Rojocry.png' WHEN Estado = 0 THEN '~/Images/Azulcry.png' WHEN Estado = 4 THEN '~/Images/Negrocry.png' WHEN Estado = 5 THEN '~/Images/Griscry.png' END AS Semaforo, Observaciones, Sol_QX,CONVERT(VARCHAR, CONVERT(VARCHAR, CAST(Valor  AS MONEY), 1)) as Valor FROM Cryc_SolComfa WHERE (CONVERT (char(10), Fech_Sol, 103) = '" & Inicio & "')  AND (Sitio <> 'Cons_Ext') AND (Entidad LIKE N'%COMFAMILIAR%') ORDER BY Prioridad DESC"
        GridView1.DataBind()


    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel1.Visible = True
        Panel2.Visible = False

    End Sub
End Class