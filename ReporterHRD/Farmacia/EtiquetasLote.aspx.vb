Imports System.IO
Imports System.Text
Imports System.Collections.Generic
Imports System.Web
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration

Public Class EtiquetasLote
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


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
        SQL22 = "Select case when(SELECT top 1 INNLOTSER.oid  FROM  INNLOTSER INNER JOIN INNPRODUC ON INNLOTSER.INNPRODUC=INNPRODUC.OID where INNLOTSER.ILSFECVEN>=CONVERT(DATETIME, getdate(), 102) and iprtippro=2 and  IPRBLOQUEO=0 ORDER BY INNLOTSER.oid asc) is null then 1 else 2 end"
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
            sq = "SELECT top 1 INNLOTSER.oid FROM  INNLOTSER INNER JOIN INNPRODUC ON INNLOTSER.INNPRODUC=INNPRODUC.OID where INNLOTSER.ILSFECVEN>=CONVERT(DATETIME, getdate(), 102) and iprtippro=2 and  IPRBLOQUEO=0 ORDER BY INNLOTSER.oid asc"
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
        SQL3 = "Select case when(SELECT top 1 INNLOTSER.oid FROM  INNLOTSER INNER JOIN INNPRODUC ON INNLOTSER.INNPRODUC=INNPRODUC.OID where INNLOTSER.ILSFECVEN>=CONVERT(DATETIME, getdate(), 102) and iprtippro=2 and  IPRBLOQUEO=0 ORDER BY INNLOTSER.oid desc) is null then 1 else 2 end"
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
            sq = "SELECT top 1 INNLOTSER.oid FROM  INNLOTSER INNER JOIN INNPRODUC ON INNLOTSER.INNPRODUC=INNPRODUC.OID where INNLOTSER.ILSFECVEN>=CONVERT(DATETIME, getdate(), 102) and iprtippro=2 and  IPRBLOQUEO=0 ORDER BY INNLOTSER.oid   desc"
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
            SQL = "Select case when (SELECT top 1 INNLOTSER.oid FROM INNMCOMPR inner join  INNLOTSER on INNMCOMPR.INNLOTSER=INNLOTSER.OID INNER JOIN INNPRODUC ON INNLOTSER.INNPRODUC=INNPRODUC.OID where INNLOTSER.oid= " & i & " and INNLOTSER.ILSFECVEN>=CONVERT(DATETIME, getdate(), 102) and iprtippro=2 and  IPRBLOQUEO=0 ORDER BY INNLOTSER.oid  ) is null then 1 else 2 end"
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
                SQL2 = "Select case when (Select top 1  Oid_Lote From Imprime_Lote where Oid_Lote= " & i & ") is null then 1 else 2 end"
                Com23 = New SqlCommand(SQL2, timedate23)
                Rs2 = Com23.ExecuteReader()
                Rs2.Read()

                If (Rs2(0) = 1) Then
                    Dim SUM As Integer = 0
                    Dim SQL222 As String
                    Dim timedate2 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
                    Dim Rsq As SqlDataReader
                    Dim Comq As New SqlCommand
                    Comq.Connection = timedate2
                    timedate2.Open()
                    SQL222 = "SELECT INNPRODUC.OID,  INNPRODUC.IPRDESCOR, (SELECT INNUNIDAD.IUNUNICOM FROM INNUNIDAD WHERE INNUNIDAD.OID=INNPRODUC.IUNCODIGO), 'LOTE: '+INNLOTSER.ILSCODIGO, CONVERT(varchar,INNLOTSER.ILSFECVEN,2), 'R.I.'+INNPRODUC.IPRREGSAN,SUM(INNMCOMPR.IDDCANTID), INNLOTSER.oid FROM INNMCOMPR inner join  INNLOTSER on INNMCOMPR.INNLOTSER=INNLOTSER.OID INNER JOIN INNPRODUC ON INNLOTSER.INNPRODUC=INNPRODUC.OID where INNLOTSER.ILSFECVEN>=CONVERT(DATETIME, getdate(), 102) and iprtippro=2 and  IPRBLOQUEO=0 and INNLOTSER.OID=" & i & "  GROUP BY INNPRODUC.OID ,INNLOTSER.ILSCODIGO,INNLOTSER.OID  ,INNPRODUC.IPRDESCOR,INNLOTSER.ILSFECVEN,INNPRODUC.IUNCODIGO,INNPRODUC.IPRREGSAN,INNPRODUC.IPRCODIGO,INNPRODUC.IPRDESCOR"
                    Comq = New SqlCommand(SQL222, timedate2)
                    Rsq = Comq.ExecuteReader()
                    Rsq.Read()
                    SqlHH.InsertCommand = "INSERT INTO Imprime_Lote(OId_Medicamento,Describe,Dosis,Lote, Fech_Vence, RInvima,Cantidad,Impreso, Oid_Lote ) VALUES(" & Rsq(0) & ",N'" & Rsq(1) & "',N'" & Rsq(2) & "',N'" & Rsq(3) & "',N'" & Rsq(4) & "','" & Rsq(5) & "','" & Rsq(6) & "','0'," & Rsq(7) & ") "
                    SqlHH.Insert()
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

End Class