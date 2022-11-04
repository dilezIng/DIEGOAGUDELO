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

        LabelFechaFin.Text = CDate(TextFechaFin.Text).AddDays(1)
        'LabelFechaFinTraslado.Text = CDate(TextFechaFin.Text).AddDays(1)

        GridView1.DataBind()

        LabelInfo.Text = "" 'GridView1.Rows.Count.ToString + " registros encontrados."
        LabelInfo.ForeColor = Color.Black


    End Function
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

        Dim Inicio As String = TextFechaIni.text
        Dim Final As String = LabelFechaFin.Text
        Dim ingreso As Integer
        Dim i As Integer = 0
        Dim f As Integer = 0
        Dim SQL As String
        Dim SQL22 As String
        Dim SQL3 As String
        Dim timedate As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL22 = "SELECT Top 1 HCNSOLPQX.OID FROM GENPACIEN  INNER JOIN HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN   INNER JOIN HCNSOLPQX ON HCNFOLIO.OID = HCNSOLPQX.HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENSERIPS ON HCNSOLPQX.GENSERIPS = GENSERIPS.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID where (HCNSOLPQX.HCSFECSOL BETWEEN '" & Inicio & "' AND '" & Final & "') AND (ADNINGRESO.AINURGCON = 1)  order by HCNSOLPQX.OID "
        Com = New SqlCommand(SQL22, timedate)
        Rs = Com.ExecuteReader()
        If Rs.Read() Then
            '      Rs.Read()
            i = Rs(0)
            Rs.Close()
        End If
        timedate.Close()

        Com.Connection = timedate
        timedate.Open()
        SQL3 = "SELECT Top 1 HCNSOLPQX.OID FROM GENPACIEN  INNER JOIN HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN   INNER JOIN HCNSOLPQX ON HCNFOLIO.OID = HCNSOLPQX.HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENSERIPS ON HCNSOLPQX.GENSERIPS = GENSERIPS.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID where (HCNSOLPQX.HCSFECSOL BETWEEN '" & Inicio & "' AND '" & Final & "') AND (ADNINGRESO.AINURGCON = 1)  order by HCNSOLPQX.OID desc "
        Com = New SqlCommand(SQL3, timedate)
        Rs = Com.ExecuteReader()
        If Rs.Read() Then
            ''Rs.Read()
            f = Rs(0)
            Rs.Close()
        End If
        timedate.Close()

        While (i <= f)

            Com.Connection = timedate
            timedate.Open()
            SQL = "Select case when (SELECT top 1 HCNSOLPQX.OID  FROM GENPACIEN  INNER JOIN HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN INNER JOIN HCNSOLPQX ON HCNFOLIO.OID = HCNSOLPQX.HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENSERIPS ON HCNSOLPQX.GENSERIPS = GENSERIPS.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID where (HCNSOLPQX.HCSFECSOL BETWEEN '" & Inicio & "' AND '" & Final & "') AND (HCNSOLPQX.OID = " & i & ") AND (ADNINGRESO.AINURGCON = 1)  ) is null then 1 else 2 end"
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
                SQL2 = "Select case when (Select top 1  Sol_QX  From Cryc_SolQX where Sol_QX = " & i & ") is null then 1 else 2 end"
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
                    SQL222 = "SELECT DISTINCT HCNSOLPQX.OID, case when HCNSOLPQX.HCSESTADO = 0 then 'Urg' when HCNSOLPQX.HCSESTADO = 1 then 'Rutina' when HCNSOLPQX.HCSESTADO = 2 then 'Electiva' when HCNSOLPQX.HCSESTADO = 3 then 'Prioritaria' when HCNSOLPQX.HCSESTADO = 4 then 'Muy Urgente' when HCNSOLPQX.HCSESTADO = 5 then 'Control' when HCNSOLPQX.HCSESTADO = 5 then 'Electivo-Programado' end as Prioridad ,ADNINGRESO.AINCONSEC,GENPACIEN.PACNUMDOC AS Documento ,GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente ,(cast(datediff(dd,GENPACIEN.GPAFECNAC,GETDATE()) / 365.25 as int))AS Edad,case when ADNINGRESO.HPNDEFCAM is null then (case when ADNINGRESO.AINURGCON = 1 then 'Cons_Ext' else '' end) else (Select top 1 HPNDEFCAM.HCACODIGO from HPNDEFCAM  where HPNDEFCAM.OID =ADNINGRESO.HPNDEFCAM) end AS Sitio,convert(varchar(30), HCNSOLPQX.HCSFECSOL , 120) AS Fecha_Solicitud,GENSERIPS.SIPCODIGO + N'-' + RTRIM(GENSERIPS.SIPNOMBRE) As Procedimiento_Solicitado ,GENDETCON.GDENOMBRE + N' (' + GENDETCON.GDECODIGO + N')' AS Entidad,GENUSUARIO.USUDESCRI AS Medico_Ordena FROM GENPACIEN  INNER JOIN HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN INNER JOIN HCNSOLPQX ON HCNFOLIO.OID = HCNSOLPQX.HCNFOLIO  INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID  INNER JOIN GENSERIPS ON HCNSOLPQX.GENSERIPS = GENSERIPS.OID  INNER JOIN GENESPECI ON HCNFOLIO.GENESPECI = GENESPECI.OID  INNER JOIN GENMEDICO ON HCNFOLIO.GENMEDICO = GENMEDICO.OID  INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO =  GENUSUARIO.OID  INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID where (HCNSOLPQX.HCSFECSOL BETWEEN '" & Inicio & "' AND '" & Final & "') AND (HCNSOLPQX.OID =  " & i & ") ORDER BY HCNSOLPQX.OID"
                    Comq = New SqlCommand(SQL222, timedate2)
                    Rsq = Comq.ExecuteReader()
                    Rsq.Read()
                    DataHis.InsertCommand = "INSERT INTO Cryc_SolQX(Sol_QX, Prioridad,Ingreso, Documento, Paciente,  Edad,  Sitio,   Fech_Sol,  Solicitud,    Entidad,    Medico_ordena,   Estado, Usuario ) VALUES ('" & Rsq(0) & "','" & Rsq(1) & "'," & Rsq(2) & ",'" & Rsq(3) & "','" & Rsq(4) & "','" & Rsq(5) & "','" & Rsq(6) & "','" & Rsq(7) & "','" & Rsq(8) & "','" & Rsq(9) & "','" & Rsq(10) & "',0,' ') "
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
        Label452.text=GridView1.SelectedValue.ToString
		Panel1.Visible = False
        Panel2.Visible = True
        Dim Inicio As String = TextFechaIni.text
        Dim Final As String = LabelFechaFin.Text
        Dim SOLPQX As Integer = GridView1.SelectedValue.ToString
		
		
        '' Dim ingreso2 As Integer = GridView1.
        Dim SQL As String
        Dim timedate As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT DISTINCT HCNSOLPQX.OID , GENDETCON.GDENOMBRE + N' (' + GENDETCON.GDECODIGO + N')' ,GENSERIPS.SIPCODIGO + N'-' + RTRIM(GENSERIPS.SIPNOMBRE) , GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM FROM GENPACIEN  INNER JOIN HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN   INNER JOIN HCNSOLPQX ON HCNFOLIO.OID = HCNSOLPQX.HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENSERIPS ON HCNSOLPQX.GENSERIPS = GENSERIPS.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID  WHERE  (HCNSOLPQX.OID =" & SOLPQX & ")"
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
        Dim Final As String = TextFechaFin.Text
        Dim obs As String = TextBox1.Text

        DataHis.UpdateCommand = "UPDATE Cryc_SolQX  SET  Estado ='" & Estado & "', Usuario ='" & useer & "', Observaciones ='" & obs & "' where Sol_QX ='" & ingreso & "' "
        DataHis.Update()

        DataHis.InsertCommand = "INSERT INTO Cryc_SolQX_AUD (Id_Sol_QX,Realiza, Nota,Date,Estado) VALUES (N'" & ingreso & "','" & useer & "','" & obs & "',GETDATE(),'" & Estado & "')"
        DataHis.Insert()

        Panel1.Visible = True
        Panel2.Visible = False
        'Response.AddHeader("REFRESH", "2;SolPqx.aspx")

        LabelInfo.Text = ""

        label2.Text = "Solicitudes Realizadas " + GridView1.Rows.Count.ToString

       SqlDataSource1.SelectCommand = "SELECT DISTINCT Prioridad, Ingreso, Sol_QX, Documento, Paciente, Sitio, Fech_Sol, Solicitud, Entidad, Usuario, CASE WHEN Estado = 3 THEN '~/Images/Verdecry.png' WHEN Estado = 1 THEN '~/Images/Amarillocry.png' WHEN Estado = 2 THEN '~/Images/Rojocry.png' WHEN Estado = 0 THEN '~/Images/Azulcry.png' WHEN Estado = 4 THEN '~/Images/Negrocry.png' WHEN Estado = 5 THEN '~/Images/Griscry.png'  WHEN Estado = 6 THEN '~/Images/6cry.png' WHEN Estado = 7 THEN '~/Images/7cry.png' END AS Semaforo, Observaciones, Sol_QX FROM Cryc_SolQX WHERE (Fech_Sol BETWEEN CONVERT(DATETIME, '" & Inicio & "', 103) AND CONVERT(DATETIME, '" & Final & " 23:59:59', 103))  AND (Sitio = 'Cons_Ext') ORDER BY Prioridad DESC"  
        GridView1.DataBind()


    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel1.Visible = True
        Panel2.Visible = False

    End Sub
End Class