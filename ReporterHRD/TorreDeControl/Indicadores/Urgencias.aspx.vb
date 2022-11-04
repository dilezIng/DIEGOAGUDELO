Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient


Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Dim NomMes As New FunBasicas

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        If IsPostBack = False Then
            Dim i As Integer = 2012
            Dim j, k, l, m As Integer

            l = 0
            m = 1

            ListTrimestres.Items.Add("Seleccione un Trimestre")
            ListTrimestres.Items(0).Value = -2
            ListTrimestres.Items(0).Text = "Seleccione un Trimestre"


            For i = Today.Year To 2012 Step -1

                k = 12
                If i = Today.Year Then k = Today.Month

                For j = k To 1 Step -1
                    Dim mes As String
                    mes = j.ToString
                    If j < 10 Then mes = "0" + j.ToString

                    ListMeses.Items.Add(i.ToString + "." + mes)
                    ListMeses.Items.Item(l).Value = i.ToString + "." + mes
                    ListMeses.Items.Item(l).Text = NomMes.NomMeses(j) + " de " + i.ToString
                    l = l + 1
                Next

                '////////////////////////////////////////////////////////////////

                k = 4
                If i = Today.Year Then k = Today.Month / k

                For j = k To 1 Step -1
                    ListTrimestres.Items.Add(i.ToString + "." + j.ToString)
                    ListTrimestres.Items(m).Value = i.ToString + "." + j.ToString
                    ListTrimestres.Items(m).Text = j.ToString + " Trimestre de " + i.ToString
                    m = m + 1
                Next

            Next
        End If

    End Sub

    Protected Sub ListMeses_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListMeses.SelectedIndexChanged

        LblPacTriage.Text = vbValores(ListMeses.SelectedValue.ToString, "CantPacsTriage")
        LblPacUrgencias.Text = vbValores(ListMeses.SelectedValue.ToString, "CantPacsUrgeMes")
        LblPacUrgencias22.text = vbValores(ListMeses.SelectedValue.ToString, "CantPacsUrgeMes")
        LblTotalAccesoFuncional.Text = (CInt(LblPacTriage.Text) / CInt(LblPacUrgencias.Text)) * 100
        LblTotalAccesoFuncional.Text = "=   " & FormatNumber(LblTotalAccesoFuncional.Text, 2, , , TriState.True)

        LblReingresos.Text = vbValores(ListMeses.SelectedValue.ToString, "CantPacsReingMes")
        LblPacUrgencias0.Text = LblPacUrgencias.Text

        LblTotalReingresos.Text = (CInt(LblReingresos.Text) / CInt(LblPacUrgencias0.Text)) * 100
        LblTotalReingresos.Text = "=   " & FormatNumber(LblTotalReingresos.Text, 2, , , TriState.True) & "%"


        LblPacSinPagador.Text = vbValores(ListMeses.SelectedValue.ToString, "CantPacsSinPagador")
        LblPacUrgencias1.Text = LblPacUrgencias.Text

        LblPorcSinPagador.Text = (CInt(LblPacSinPagador.Text) / CInt(LblPacUrgencias1.Text)) * 100
        LblPorcSinPagador.Text = "=   " & FormatNumber(LblPorcSinPagador.Text, 2, , , TriState.True) & "%"

        Dim IdMes As String = ListMeses.SelectedValue.ToString
        Dim sq As String
        Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa1983 As SqlDataReader
        Dim Coma123456 As New SqlCommand
        Coma123456.Connection = timd
        timd.Open()
        sq = "SELECT DISTINCT   count(GENPACIEN.PACPRINOM) AS Pacientes,sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) as Temp_Todos,sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM) AS Min_Prom,   (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/ 1440  as Temp_Dias,    (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/60 % 24  as Temp_Hora, (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))%60  as Temp_Min fROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN SLNCERLIQ ON adningreso.oid=[SLNCERLIQ].adningreso WHERE (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINTIPING = 1)  and ADFECANULA is null AND   (CONVERT(char(7), ADNINGRESO.AINFECING, 102) = '" & IdMes & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Lblsumpacientes5.Text = Rsa1983(0)
        Lblsumpacientes.text = Rsa1983(0)
        LbTiempo.Text = Rsa1983(1)
        LblMinprome.Text = Rsa1983(2)
        Lbldias.Text = Rsa1983(3)
        LblHora.Text = Rsa1983(4)
        LblMin.Text = Rsa1983(5)
        Rsa1983.Close()
        timd.Close()

        timd.Open()
        sq = "SELECT DISTINCT  count(GENPACIEN.PACPRINOM) AS Pacientes, sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) as Temp_Pasillo,   sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM) AS Min_Prom,  (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/ 1440  as Temp_Dias,     (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/60 % 24  as Temp_Hora,   (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))%60  as Temp_Min  FROM ADNINGRESO  INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN SLNCERLIQ ON adningreso.oid=[SLNCERLIQ].adningreso WHERE (ADNINGRESO.AINFECHOS IS NULL) and  (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINTIPING = 1)  and (ADFECANULA is null)  AND   (CONVERT(char(7), ADNINGRESO.AINFECING, 102) = '" & IdMes & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Lblsumpacientes0.text = Rsa1983(0)
        LbTiempo0.Text = Rsa1983(1)
        LblMinprome0.Text = Rsa1983(2)
        Lbldias0.Text = Rsa1983(3)
        LblHora0.Text = Rsa1983(4)
        LblMin0.Text = Rsa1983(5)
        Rsa1983.Close()
        timd.Close()

        timd.Open()
        sq = "SELECT DISTINCT count(GENPACIEN.PACPRINOM) AS Pacientes,sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) as Temp_Todos,sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM) AS Min_Prom,   (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/ 1440  as Temp_Dias,    (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/60 % 24  as Temp_Hora, (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))%60  as Temp_Min FROM ADNINGRESO  INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID  INNER JOIN SLNCERLIQ ON adningreso.oid=[SLNCERLIQ].adningreso INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM=HPNDEFCAM.OID INNER JOIN HPNSUBGRU  ON HPNDEFCAM.HPNSUBGRU = HPNSUBGRU.OID WHERE   (ADNINGRESO.AINFECHOS IS NOT NULL)  AND (HPNSUBGRU.OID=8 or HPNSUBGRU.OID=7) and  (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINTIPING = 1)  and (ADFECANULA is null) AND   (CONVERT(char(7), ADNINGRESO.AINFECING, 102) = '" & IdMes & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Lblsumpacientes1.text = Rsa1983(0)
        LbTiempo1.Text = Rsa1983(1)
        LblMinprome1.Text = Rsa1983(2)
        Lbldias1.Text = Rsa1983(3)
        LblHora1.Text = Rsa1983(4)
        LblMin1.Text = Rsa1983(5)
        Rsa1983.Close()
        timd.Close()

        timd.Open()
        sq = "SELECT DISTINCT count(GENPACIEN.PACPRINOM) AS Pacientes FROM ADNINGRESO   INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN SLNCERLIQ ON adningreso.oid=[SLNCERLIQ].adningreso  INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES  INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM=HPNDEFCAM.OID  INNER JOIN HPNSUBGRU  ON HPNDEFCAM.HPNSUBGRU = HPNSUBGRU.OID WHERE   (ADNINGRESO.AINFECHOS IS NOT NULL)  AND (HPNSUBGRU.OID NOT IN (7,8,9,10,11,18))  AND ADNINGRESO.ADNCENATE=1  and  (ADNINGRESO.AINURGCON = 0)   and (ADFECANULA is null)  AND  (CONVERT(char(7), ADNINGRESO.AINFECING, 102) = '" & IdMes & "') "
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Lblsumpacientes4.text = Rsa1983(0)

        Rsa1983.Close()
        timd.Close()
''Lblsumpacientes4.text=IdMes
        timd.Open()
        sq = "SELECT DISTINCT count(GENPACIEN.PACPRINOM) AS Pacientes,sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) as Temp_Todos,sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM) AS Min_Prom,   (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/ 1440  as Temp_Dias,    (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/60 % 24  as Temp_Hora, (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))%60  as Temp_Min FROM ADNINGRESO  INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID  INNER JOIN SLNCERLIQ ON adningreso.oid=[SLNCERLIQ].adningreso INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM=HPNDEFCAM.OID INNER JOIN HPNSUBGRU  ON HPNDEFCAM.HPNSUBGRU = HPNSUBGRU.OID WHERE   (ADNINGRESO.AINFECHOS IS NOT NULL)  AND (HPNSUBGRU.OID=7) and  (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINTIPING = 1)  and (ADFECANULA is null) AND   (CONVERT(char(7), ADNINGRESO.AINFECING, 102) = '" & IdMes & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Lblsumpacientes2.text = Rsa1983(0)
        LbTiempo2.Text = Rsa1983(1)
        LblMinprome2.Text = Rsa1983(2)
        Lbldias2.Text = Rsa1983(3)
        LblHora2.Text = Rsa1983(4)
        LblMin2.Text = Rsa1983(5)
        Rsa1983.Close()
        timd.Close()

        timd.Open()
        sq = "SELECT DISTINCT count(GENPACIEN.PACPRINOM) AS Pacientes,sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) as Temp_Todos,sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM) AS Min_Prom,   (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/ 1440  as Temp_Dias,    (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))/60 % 24  as Temp_Hora, (sum(DATEDIFF(MINUTE,ADNINGRESO.AINFECING,SCLFModelos_CitasMedicas_eCMED_8047729A) ) / count(GENPACIEN.PACPRINOM))%60  as Temp_Min FROM ADNINGRESO  INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID  INNER JOIN SLNCERLIQ ON adningreso.oid=[SLNCERLIQ].adningreso INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM=HPNDEFCAM.OID INNER JOIN HPNSUBGRU  ON HPNDEFCAM.HPNSUBGRU = HPNSUBGRU.OID WHERE   (ADNINGRESO.AINFECHOS IS NOT NULL)  AND (HPNSUBGRU.OID=8) and  (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINTIPING = 1)  and (ADFECANULA is null) AND   (CONVERT(char(7), ADNINGRESO.AINFECING, 102) = '" & IdMes & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Lblsumpacientes3.text = Rsa1983(0)
        LbTiempo3.Text = Rsa1983(1)
        LblMinprome3.Text = Rsa1983(2)
        Lbldias3.Text = Rsa1983(3)
        LblHora3.Text = Rsa1983(4)
        LblMin3.Text = Rsa1983(5)
        Rsa1983.Close()
        timd.Close()


 timd.Open()
        sq = " select SUM(t1) AS total FROM( SELECT ABS(DATEDIFF(MI,(Select HC.HCFECFOL from HCNFOLIO as HC where (hc.HCNUMFOL=Min(HCNFOLIO.HCNUMFOL)) and (hc.ADNINGRESO= ADNINGRESO.OID)),  (Select TOP 1 HPN.HESFECING from HPNESTANC as HPN   where  (HPN.HPNDEFCAM=Min(HPNESTANC.HPNDEFCAM)) AND (HPN.ADNINGRES= ADNINGRESO.OID) ORDER BY HPN.OID)))/60 as t1  FROM ADNINGRESO   INNER JOIN HCNFOLIO  ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO  INNER JOIN HCNINDMED ON HCNFOLIO.HCNINDMED = HCNINDMED.OID  INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES INNER JOIN HPNDEFCAM  On HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID where (HCNINDMED.HCITIPIND = 0 ) and   ((CONVERT(char(7), ADNINGRESO.AINFECING, 102)  =  '" & IdMes & "' ))  and ADNINGRESO.ADNCENATE=1 AND (HPNSUBGRU IN (7,8,9,10,18))  group by ADNINGRESO.AINCONSEC,ADNINGRESO.AINFECING,ADNINGRESO.OID  ,HPNDEFCAM.HCACODIGO )t1"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Lblsumpacientes33.text = Rsa1983(0)
        
        Rsa1983.Close()
        timd.Close()


  

 timd.Open()
        sq = " select count(t1) AS total FROM( SELECT ABS(DATEDIFF(MI,(Select HC.HCFECFOL from HCNFOLIO as HC where (hc.HCNUMFOL=Min(HCNFOLIO.HCNUMFOL)) and (hc.ADNINGRESO= ADNINGRESO.OID)),  (Select TOP 1 HPN.HESFECING from HPNESTANC as HPN   where  (HPN.HPNDEFCAM=Min(HPNESTANC.HPNDEFCAM)) AND (HPN.ADNINGRES= ADNINGRESO.OID) ORDER BY HPN.OID)))/60 as t1  FROM ADNINGRESO   INNER JOIN HCNFOLIO  ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO  INNER JOIN HCNINDMED ON HCNFOLIO.HCNINDMED = HCNINDMED.OID  INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES INNER JOIN HPNDEFCAM  On HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID where (HCNINDMED.HCITIPIND = 0 ) and   ((CONVERT(char(7), ADNINGRESO.AINFECING, 102)  =  '" & IdMes & "' ))  and ADNINGRESO.ADNCENATE=1 AND (HPNSUBGRU IN (7,8,9,10,18))  group by ADNINGRESO.AINCONSEC,ADNINGRESO.AINFECING,ADNINGRESO.OID  ,HPNDEFCAM.HCACODIGO )t1"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Lblsumpacientes333.text = Rsa1983(0)
        
        Rsa1983.Close()
        timd.Close()
		
		 timd.Open()
        sq = " select SUM(t1),count(t1) FROM( SELECT ABS(DATEDIFF(MI,(Select HC.HCFECFOL from HCNFOLIO as HC where (hc.HCNUMFOL=Min(HCNFOLIO.HCNUMFOL)) and (hc.ADNINGRESO= ADNINGRESO.OID)),  (Select TOP 1 HPN.HESFECING from HPNESTANC as HPN   where  (HPN.HPNDEFCAM=Min(HPNESTANC.HPNDEFCAM)) AND (HPN.ADNINGRES= ADNINGRESO.OID) ORDER BY HPN.OID)))/60 as t1  FROM ADNINGRESO   INNER JOIN HCNFOLIO  ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO  INNER JOIN HCNINDMED ON HCNFOLIO.HCNINDMED = HCNINDMED.OID  INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES INNER JOIN HPNDEFCAM  On HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID where (HCNINDMED.HCITIPIND = 0 ) and   ((CONVERT(char(7), ADNINGRESO.AINFECING, 102)  =  '" & IdMes & "' ))  and ADNINGRESO.ADNCENATE=1 AND (HPNSUBGRU IN (7,8,9,10,18))  group by ADNINGRESO.AINCONSEC,ADNINGRESO.AINFECING,ADNINGRESO.OID  ,HPNDEFCAM.HCACODIGO )t1"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Lblsumpacientes338.text = (CInt(Rsa1983(0)) / CInt(Rsa1983(1)))
		    Lblsumpacientes338.Text = "=   " & FormatNumber(Lblsumpacientes338.Text, 2, , , TriState.True) 
        Rsa1983.Close()
        timd.Close()


    End Sub



    Private Function vbValores(ByVal IdMes As String, ByVal TipoConsulta As String) As String


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String = ""
        Dim ObjAdapter As New SqlDataAdapter


        If TipoConsulta = "CantPacsTriage" Then
            StrConsulta = "SELECT COUNT(HCTCONFIR) AS Expr1 FROM  HCNTRIAGE WHERE (HCTCONFIR = 1) AND (CONVERT(char(7), HCTFECTRI, 102) = '" & IdMes & "')"
        ElseIf TipoConsulta = "CantPacsUrgeMes" Then
            StrConsulta = "SELECT COUNT(HCNTRIAGE.HCTNUMERO) AS Expr1 FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE WHERE  (CONVERT(char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "')"
        ElseIf TipoConsulta = "CantPacsReingMes" Then
            Dim vbDia As String = (IdMes + ".01").Replace(".", "-")
            If CDate(vbDia) > CDate("2017-03-31") Then 'Para diferenciar la forma de obtencion del dato de reingreso de urgencias
                StrConsulta = "SELECT COUNT(ADNINGRESO.OID) AS Expr1 FROM HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.OID = HCNTRIAGE.ADNINGRESO LEFT JOIN HCMHCURGE ON HCNFOLIO.OID = HCMHCURGE.HCNFOLIO  LEFT JOIN HCMWHCURG ON HCNFOLIO.OID = HCMWHCURG.HCNFOLIO  WHERE (CONVERT (char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "')  AND ((HCMHCURGE.HCCM09N109 = N'Si') OR (HCMWHCURG.HCCM09N109 = N'Si'))"
            Else
                StrConsulta = "SELECT COUNT(HCNTRIAGE.HCTNUMERO) AS Expr1 FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE WHERE  (CONVERT(char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "') AND (HCNTRIAGE.HCTREINGRES = 1)"
            End If
        ElseIf TipoConsulta = "CantPacsSinPagador" Then
            StrConsulta = "SELECT COUNT(ADNINGRESO.GENDETCON) AS Expr1 FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE WHERE (CONVERT(char(7), HCNTRIAGE.HCTFECTRI, 102) = '" & IdMes & "') AND (ADNINGRESO.GENDETCON = 115)"
        End If



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



    Protected Sub ListTrimestres_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListTrimestres.SelectedIndexChanged


        'DataPlanBenefTrim.SelectCommand = "SELECT GEENENTADM.OID AS IdEntidad, RTRIM(GEENENTADM.ENTNOMBRE) + N' (' + GEENENTADM.ENTCODIGO + N')' AS NomEntidad FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.ADNINGRESO = ADNINGRESO.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID WHERE (HCNTRIAGE.HCAUSENT = 0) AND (HCNTRIAGE.HCTRETVOLPAC = 0) AND (DATEPART(q, HCNTRIAGE.HCTFECTRI) = @Trimestre) AND (DATEPART(yyyy, HCNTRIAGE.HCTFECTRI) = @Año) GROUP BY RTRIM(GEENENTADM.ENTNOMBRE) + N' (' + GEENENTADM.ENTCODIGO + N')', GEENENTADM.OID ORDER BY NomEntidad"

        LabelAñoTrimestre.Text = ListTrimestres.SelectedItem.Value.Substring(0, 4)
        LabelTrimestre.Text = ListTrimestres.SelectedItem.Value.Substring(5, 1)

        DataPlanBenefTrim.SelectCommand = "SELECT GEENENTADM.OID AS IdEntidad, RTRIM(GEENENTADM.ENTNOMBRE) + N' (' + GEENENTADM.ENTCODIGO + N')' AS NomEntidad FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.ADNINGRESO = ADNINGRESO.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID WHERE (HCNTRIAGE.HCAUSENT = 0) AND (HCNTRIAGE.HCTRETVOLPAC = 0) AND (DATEPART(q, HCNTRIAGE.HCTFECTRI) = " & LabelTrimestre.Text & ") AND (DATEPART(yyyy, HCNTRIAGE.HCTFECTRI) = " & LabelAñoTrimestre.Text & ") GROUP BY RTRIM(GEENENTADM.ENTNOMBRE) + N' (' + GEENENTADM.ENTCODIGO + N')', GEENENTADM.OID ORDER BY NomEntidad"

        If ListTrimestres.Items(0).Value = -2 Then ListTrimestres.Items.RemoveAt(0)

        ListPlanesBenefTrimestres.Enabled = True

    End Sub

    Protected Sub ListPlanesBenefTrimestres_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListPlanesBenefTrimestres.SelectedIndexChanged


        Label1.Text = ListPlanesBenefTrimestres.SelectedItem.Value.ToString
        GridTriage.DataBind()
        GridTriagePacs.DataBind()



    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LblTotalReingresos.Click

        Dim vbDia As String = (ListMeses.SelectedValue.ToString + ".01").Replace(".", "-")
        If CDate(vbDia) > CDate("2017-03-31") Then 'Para diferenciar la forma de obtencion del dato de reingreso de urgencias
            DataGridReingresos.SelectCommand = "SELECT ADNINGRESO.AINCONSEC AS Identificador, HCNFOLIO.HCFECFOL AS Fecha, GENPACIEN.PACNUMDOC AS DocPaciente, HCNTRIAGE.GPANOMBRE + ' ' + CASE WHEN GPASEGNOM IS NULL THEN '' ELSE GPASEGNOM + ' ' END + HCNTRIAGE.GPAAPELLI + CASE WHEN GPASEGAPE IS NULL THEN '' ELSE + ' ' + GPASEGAPE END AS NomPaciente, DATEDIFF(year, GENPACIEN.GPAFECNAC, GETDATE()) AS Edad, GENMEDICO.GMENOMCOM AS Medico, (SELECT        DIANOMBRE FROM GENDIAGNO WHERE (OID = (SELECT TOP (1) GENDIAGNO FROM HCNDIAPAC WHERE (HCNFOLIO = (SELECT TOP (1) OID FROM HCNFOLIO AS HCNFOLIO_2 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID ))))) AS Dx FROM HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.OID = HCNTRIAGE.ADNINGRESO LEFT JOIN HCMHCURGE ON HCNFOLIO.OID = HCMHCURGE.HCNFOLIO  LEFT JOIN HCMWHCURG ON HCNFOLIO.OID = HCMWHCURG.HCNFOLIO   INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENMEDICO ON HCNFOLIO.GENMEDICO = GENMEDICO.OID WHERE (CONVERT (char(7), HCNTRIAGE.HCTFECTRI, 102) = @IdMes)  AND  ((HCMHCURGE.HCCM09N109 = N'Si') OR (HCMWHCURG.HCCM09N109 = N'Si')) ORDER BY Fecha"
        Else
            DataGridReingresos.SelectCommand = "SELECT HCNTRIAGE.HCTNUMERO AS Identificador, HCNTRIAGE.HCTFECTRI AS Fecha, HCNTRIAGE.GPADOCUME AS DocPaciente, HCNTRIAGE.GPANOMBRE + ' ' + CASE WHEN GPASEGNOM IS NULL THEN '' ELSE GPASEGNOM + ' ' END + HCNTRIAGE.GPAAPELLI + CASE WHEN GPASEGAPE IS NULL THEN '' ELSE + ' ' + GPASEGAPE END AS NomPaciente,HCNTRIAGE.HCTEDAD AS Edad,, GENMEDICO.GMENOMCOM AS Medico, '' as Dx FROM HCNTRIAGE INNER JOIN GENMEDICO ON HCNTRIAGE.GENMEDICO = GENMEDICO.OID WHERE (CONVERT (char(7), HCNTRIAGE.HCTFECTRI, 102) = @IdMes) AND (HCNTRIAGE.HCTREINGRES = 1) ORDER BY Fecha "
        End If

        Panel1_ModalPopupExtender.Show()
    End Sub

    Protected Sub BtnClose_Click(sender As Object, e As System.EventArgs) Handles BtnClose.Click

    End Sub

    Protected Sub GridDetalleReingresos_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridDetalleReingresos.RowCommand

        Dim vbDia As String = (ListMeses.SelectedValue.ToString + ".01").Replace(".", "-")
        If CDate(vbDia) > CDate("2017-03-31") Then 'Para diferenciar la forma de obtencion del dato de reingreso de urgencias
            DataGridReingresos.SelectCommand = "SELECT ADNINGRESO.AINCONSEC AS Identificador, HCNFOLIO.HCFECFOL AS Fecha, GENPACIEN.PACNUMDOC AS DocPaciente, HCNTRIAGE.GPANOMBRE + ' ' + CASE WHEN GPASEGNOM IS NULL THEN '' ELSE GPASEGNOM + ' ' END + HCNTRIAGE.GPAAPELLI + CASE WHEN GPASEGAPE IS NULL THEN '' ELSE + ' ' + GPASEGAPE END AS NomPaciente, DATEDIFF(year, GENPACIEN.GPAFECNAC, GETDATE()) AS Edad,GENMEDICO.GMENOMCOM AS Medico, (SELECT        DIANOMBRE FROM GENDIAGNO WHERE (OID = (SELECT TOP (1) GENDIAGNO FROM HCNDIAPAC WHERE (HCNFOLIO = (SELECT TOP (1) OID FROM HCNFOLIO AS HCNFOLIO_2 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID ))))) AS Dx FROM HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.OID = HCNTRIAGE.ADNINGRESO LEFT JOIN HCMHCURGE ON HCNFOLIO.OID = HCMHCURGE.HCNFOLIO  LEFT JOIN HCMWHCURG ON HCNFOLIO.OID = HCMWHCURG.HCNFOLIO  INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENMEDICO ON HCNFOLIO.GENMEDICO = GENMEDICO.OID  WHERE (CONVERT (char(7), HCNTRIAGE.HCTFECTRI, 102) = @IdMes)  AND ((HCMHCURGE.HCCM09N109 = N'Si') OR (HCMWHCURG.HCCM09N109 = N'Si')) ORDER BY Fecha"
        Else
            DataGridReingresos.SelectCommand = "SELECT HCNTRIAGE.HCTNUMERO AS Identificador, HCNTRIAGE.HCTFECTRI AS Fecha, HCNTRIAGE.GPADOCUME AS DocPaciente, HCNTRIAGE.GPANOMBRE + ' ' + CASE WHEN GPASEGNOM IS NULL THEN '' ELSE GPASEGNOM + ' ' END + HCNTRIAGE.GPAAPELLI + CASE WHEN GPASEGAPE IS NULL THEN '' ELSE + ' ' + GPASEGAPE END AS NomPaciente,HCNTRIAGE.HCTEDAD AS Edad,, GENMEDICO.GMENOMCOM AS Medico, '' As Dx FROM HCNTRIAGE INNER JOIN GENMEDICO ON HCNTRIAGE.GENMEDICO = GENMEDICO.OID WHERE (CONVERT (char(7), HCNTRIAGE.HCTFECTRI, 102) = @IdMes) AND (HCNTRIAGE.HCTREINGRES = 1) ORDER BY Fecha "
        End If

        Panel1_ModalPopupExtender.Show()
    End Sub
End Class
