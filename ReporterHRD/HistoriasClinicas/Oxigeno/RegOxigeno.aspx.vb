Imports System.IO
Imports System.Text
Imports System.Collections.Generic
Imports System.Web
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration


Public Class RegOxigeno
    Inherits System.Web.UI.Page
    Dim vbFunciones As New FunBasicas
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Panel1.Visible = False
        Panel2.Visible = False
        Paneldisponible.Visible = False
        Paneltabla.Visible = False
        Button2.Visible = False


        Dim user As String
        Dim caracteres As String
        caracteres = Page.User.Identity.Name.ToString

        If String.IsNullOrEmpty(caracteres) Then
            lBuSER.TEXT = "<<< Ingresar Usuario por favor >>>>"
        Else
            user = caracteres.Substring(0, 3)
            lBuSER.TEXT = caracteres
        End If

        If user = "FIS" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False

            lBuSER.TEXT = caracteres


        End If
        If user = "fis" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False
            lBuSER.TEXT = caracteres

        End If

        If user = "JEN" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False

            lBuSER.TEXT = caracteres


        End If
        If user = "jen" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False
            lBuSER.TEXT = caracteres

        End If

        If user = "AEN" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False
            lBuSER.TEXT = caracteres

        End If
        If user = "aen" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False
            lBuSER.TEXT = caracteres


        End If

        ' LabelPacientes.Text = "" + GridView1.Rows.Count.ToString


        Dim i2 As Integer
        Dim f2 As Integer
        Dim SQL As String
        Dim SQL22 As String

        Dim timedate As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand

        ''prueba 1


        ' Dim sq As String
        ' Dim timd As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        ' Dim Rsa1983 As SqlDataReader
        '  Dim Coma123456 As New SqlCommand
        '  Coma123456.Connection = timd
        '  timd.Open()
        '  sq = "SELECT top 1 Solicitud from O2_Sum_Paciente order by Solicitud desc"
        '  Coma123456 = New SqlCommand(sq, timd)
        '  Rsa1983 = Coma123456.ExecuteReader()
        '  Rsa1983.Read()
        '  i2 = Rsa1983(0)
        '  Rsa1983.Close()
        '  timd.Close()



        Dim sq As String
        Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa1983 As SqlDataReader
        Dim Coma123456 As New SqlCommand
        Coma123456.Connection = timd
        timd.Open()
        sq = "SELECT top 1 HCNMEDPAC.OID FROM HCNFOLIO  INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID  INNER JOIN HCNMEDPAC ON HCNFOLIO.OID=HCNMEDPAC.HCNFOLIO INNER JOIN GENSERIPS  ON HCNMEDPAC.GENSERIPS = GENSERIPS.OID    where    (ADNINGRESO.AINESTADO=0 )   and (GENSERIPS.SIPNOMBRE LIKE '%oxigeno%' or GENSERIPS.SIPNOMBRE  LIKE '%VEN%' ) AND (HCNFOLIO.HCNFECCONF >(GETDATE()-3)) order by HCNMEDPAC.OID"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        i2 = Rsa1983(0)
        Rsa1983.Close()
        timd.Close()





        ' segundo cuadro




        Com.Connection = timedate
        timedate.Open()
        SQL22 = "Select case when(SELECT top 1 HCNMEDPAC.OID FROM HCNFOLIO  INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID  INNER JOIN HCNMEDPAC ON HCNFOLIO.OID=HCNMEDPAC.HCNFOLIO INNER JOIN GENSERIPS  ON HCNMEDPAC.GENSERIPS = GENSERIPS.OID    where    (ADNINGRESO.AINESTADO=0 )   and (GENSERIPS.SIPNOMBRE LIKE '%oxigeno%' or GENSERIPS.SIPNOMBRE  LIKE '%VEN%' ) AND (HCNFOLIO.HCNFECCONF >(GETDATE()-3)) order by HCNMEDPAC.OID desc) is null then 1 else 2 end"
        Com = New SqlCommand(SQL22, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()

        If (Rs(0) = 2) Then
            Dim sqm As String
            Dim timdm As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
            Dim Rsa1983m As SqlDataReader
            Dim Coma123456m As New SqlCommand
            Coma123456m.Connection = timdm
            timdm.Open()
            sqm = "SELECT top 1 HCNMEDPAC.OID FROM HCNFOLIO  INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID  INNER JOIN HCNMEDPAC ON HCNFOLIO.OID=HCNMEDPAC.HCNFOLIO INNER JOIN GENSERIPS  ON HCNMEDPAC.GENSERIPS = GENSERIPS.OID    where    (ADNINGRESO.AINESTADO=0 )   and (GENSERIPS.SIPNOMBRE LIKE '%oxigeno%' or GENSERIPS.SIPNOMBRE  LIKE '%VEN%' ) AND (HCNFOLIO.HCNFECCONF >(GETDATE()-3)) order by HCNMEDPAC.OID desc"
            Coma123456m = New SqlCommand(sqm, timdm)
            Rsa1983m = Coma123456m.ExecuteReader()
            Rsa1983m.Read()
            f2 = Rsa1983m(0)
            Rsa1983m.Close()
            timdm.Close()
        End If
        Rs.Close()
        timedate.Close()

        While (i2 <= f2)

            Com.Connection = timedate
            timedate.Open()
            SQL = "Select case when (SELECT top 1 HCNMEDPAC.OID FROM HCNFOLIO  INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID  INNER JOIN HCNMEDPAC ON HCNFOLIO.OID=HCNMEDPAC.HCNFOLIO INNER JOIN GENSERIPS  ON HCNMEDPAC.GENSERIPS = GENSERIPS.OID    where    (ADNINGRESO.AINESTADO=0 )   and (GENSERIPS.SIPNOMBRE LIKE '%oxigeno%' or GENSERIPS.SIPNOMBRE  LIKE '%VEN%' ) AND (HCNFOLIO.HCNFECCONF >(GETDATE()-3)) and  (HCNMEDPAC.OID= " & i2 & " ) order by HCNMEDPAC.OID ) is null then 1 else 2 end"
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
                SQL2 = "Select case when (SELECT top 1 Solicitud from O2_Sum_Paciente Where Solicitud= " & i2 & ") is null then 1 else 2 end"
                Com23 = New SqlCommand(SQL2, timedate23)
                Rs2 = Com23.ExecuteReader()
                Rs2.Read()

                If (Rs2(0) = 1) Then
                    Dim ingreso As Integer
                    Dim SQL222 As String
                    Dim timedate2 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
                    Dim Rsq As SqlDataReader
                    Dim Comq As New SqlCommand
                    Comq.Connection = timedate2
                    timedate2.Open()
                    SQL222 = "SELECT  ADNINGRESO.AINCONSEC as 'Ingreso' ,CONVERT(varchar,HCNFOLIO.HCNFECCONF,21) as 'Fecha folio' ,HCNFOLIO.HCNUMFOL  ,case when ADNINGRESO.HPNDEFCAM is null then (case when ADNINGRESO.AINURGCON = 0 then 'Urgencias' else '' end) else (Select top 1 HPNDEFCAM.HCACODIGO from HPNDEFCAM  where HPNDEFCAM.OID =ADNINGRESO.HPNDEFCAM) end AS Sitio ,GENPACIEN.PACNUMDOC AS 'Documento' ,GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS 'Paciente' ,(cast(datediff(dd,GENPACIEN.GPAFECNAC,GETDATE()) / 365.25 as int)) AS 'Edad', HCNMEDPAC.OID AS Solicitud,HCNMEDPAC.HCSOBSERV AS Observacion, GENSERIPS.SIPCODIGO As Codigo, GENSERIPS.SIPNOMBRE As Suministro, GENDETCON.GDECODIGO AS 'Regimen'  ,GENDETCON.GDENOMBRE AS 'Entidad' FROM HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN =GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID inner join  HCNMEDPAC ON HCNFOLIO.OID=HCNMEDPAC.HCNFOLIO INNER JOIN GENSERIPS ON HCNMEDPAC.GENSERIPS = GENSERIPS.OID    where  (ADNINGRESO.AINESTADO=0 )  AND (HCNMEDPAC.OID= " & i2 & ") "
                    Comq = New SqlCommand(SQL222, timedate2)
                    Rsq = Comq.ExecuteReader()
                    Rsq.Read()
                    ingreso = Rsq(0)


                    Dim sqm As String
                    Dim timdm As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
                    Dim Rsa1983m As SqlDataReader
                    Dim Coma123456m As New SqlCommand
                    Coma123456m.Connection = timdm
                    timdm.Open()
                    sqm = "Select case when (SELECT top 1 Solicitud from O2_Sum_Paciente Where Solicitud= " & i2 & ") is null then 1 else 2 end"
                    Coma123456m = New SqlCommand(sqm, timdm)
                    Rsa1983m = Coma123456m.ExecuteReader()
                    Rsa1983m.Read()

                    If (Rsa1983m(0) = 1) Then

                        SQLOXIGENO.InsertCommand = "INSERT O2_Sum_Paciente (Ingreso,Fecha_Folio,Folio,Sitio,Paciente,Nombre_Paciente,Edad,Solicitud,Observacion,Codigo,Suministro,Regimen,Entidad,Sum_Id,Hora_Fin,Hora_Ini,Litros) VALUES ('" & Rsq(0) & "',N'" & Rsq(1) & "' ," & Rsq(2) & ",N'" & Rsq(3) & "','" & Rsq(4) & "','" & Rsq(5) & "','" & Rsq(6) & "','" & Rsq(7) & "','" & Rsq(8) & "','" & Rsq(9) & "','" & Rsq(10) & "','" & Rsq(11) & "','" & Rsq(12) & "',0,0,0,0) "
                        SQLOXIGENO.Insert()
                        Rsa1983m.Close()
                        timdm.Close()
                    End If
                    Rsq.Close()
                    timedate2.Close()
                End If
                Rs2.Close()
                timedate23.Close()
            End If
            Rs.Close()
            timedate.Close()
            i2 = i2 + 1

        End While

    End Sub


    '' Selecciona una solicitud a gestionar
    Protected Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged


        Dim solicitud As Integer = GridView2.SelectedValue.ToString
        Button2.Visible = True
        Panel1.Visible = False
        Paneltabla.visible = True
        Panel2.Visible = True
        Paneldisponible.Visible = True

        'Folio1.Text = Folio  CStr(Limite)
        Dim hir As String
        Dim SQLa22 As String
        Dim timedatea22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa22 As SqlDataReader
        Dim Coma22 As New SqlCommand
        Coma22.Connection = timedatea22
        timedatea22.Open()
        SQLa22 = "select top 1 Solicitud,Paciente,Nombre_Paciente,Fecha_Ini, Hora_Ini,Hora_Fin,Sum_id,Litros,Folio from O2_Sum_Paciente Where (Solicitud=" & solicitud & ") "
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()

        LbDocumento.text = " Cedula: " + Rsa22(1)
        LbPaciente.Text = " Paciente: " + Rsa22(2)
        LBFolio.Text = Rsa22(8)
        LbSoliclitud.Text = Rsa22(0)
        If Rsa22(7) = "0" Then

            guardar.Visible = True
            guardar3.Visible = True
            guardar2.Visible = False
            hi.Visible = True
            mi.Visible = True
            TextFechaIni.Visible = True
            TextFechaFin.Text = ""
            Label1.Visible = True
            Label11.Visible = True
            Label3.Visible = True
            Label2.Visible = True
            Ltssumin.Visible = True
            Listsum.Visible = True
        Else

            If Rsa22(4).Substring(3, 2) = "00" Then
                hir = Rsa22(4).Substring(0, 2) + ":01"
            End If
            If Rsa22(4).Substring(3, 2) = "30" Then
                hir = Rsa22(4).Substring(0, 2) + ":31"
            End If

            TextFechaIni.Text = Rsa22(3) + " " + hir
            ' Label5.Text  = Rsa22(3) + " " + hir
            Label8.Text = Rsa22(3) + " " + hir
            hi.Visible = False
            mi.Visible = False
            guardar.Visible = False
            guardar2.Visible = True
            guardar3.Visible = False
            Ltssumin.Visible = False
            Listsum.Visible = False
            TextFechaIni.Visible = False
            Label1.Visible = False
            Label11.Visible = False
            Label3.Visible = False
            Label2.Visible = False
            '   Label6.Text = hir

        End If
        Rsa22.Close()
        timedatea22.Close()


    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

        Dim ingreso As Integer = GridView1.SelectedValue.ToString

        Panel1.Visible = False
        Panel2.Visible = True
        LbIngreso.Text = ingreso
        Button2.Visible = True
        Paneltabla.visible = False
        Paneldisponible.visible = True


        Dim hir As String
        Dim SQLa22 As String
        Dim timedatea22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa22 As SqlDataReader
        Dim Coma22 As New SqlCommand
        Coma22.Connection = timedatea22
        timedatea22.Open()
        SQLa22 = "select top 1 Solicitud,Paciente,Nombre_Paciente,Fecha_Ini, Hora_Ini,Hora_Fin,Sum_id,Litros from O2_Sum_Paciente Where (Ingreso =" & ingreso & ") "
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()

        LbDocumento.text = "Cedula :" + Rsa22(1)
        LbPaciente.Text = " Nombre :" + Rsa22(2)




        Rsa22.Close()
        timedatea22.Close()

    End Sub



    '' Boton Regresar
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel1.Visible = True
        Panel2.Visible = False
        Paneltabla.visible = False
        Response.AddHeader("REFRESH", "1;RegOxigeno.aspx")
    End Sub
    '' Boton guarda el Inicio del Oxigeno
    Protected Sub guardar_Click(sender As Object, e As EventArgs) Handles guardar.Click

        Dim Salario As Integer
        Dim Hora As String '' Fecha y hora Ingreso de suministro
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT GETDATE() AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()


        Dim timedatea23 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica")
        Dim Rsa23 As SqlDataReader
        Dim Coma23 As New SqlCommand
        Coma23.Connection = timedatea23
        timedatea23.Open()
        SQLa = "SELECT TOP 1 GSAVALSAL FROM GENSALMIN order by oid DESC"
        Coma23 = New SqlCommand(SQLa, timedatea23)
        Rsa23 = Coma23.ExecuteReader()
        Rsa23.Read()

        Salario = Math.Round(Rsa23(0), 0)
        Rsa23.Close()
        timedatea23.Close()

        Dim Usuario As String

        Dim solcit As String = Page.User.Identity.Name.ToString '' Usuario Logueado
        Dim sq As String
        Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa1983 As SqlDataReader
        Dim Coma123456 As New SqlCommand
        Coma123456.Connection = timd
        timd.Open()
        sq = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & solcit & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Usuario = Rsa1983(0)
        Rsa1983.Close()
        timd.Close()

        Dim Inicio As String = TextFechaIni.text '' Fecha Inicio
        Dim Final As String = TextFechaFin.Text '' Fecha fin
        Dim ingreso As Integer = LbIngreso.Text '' Ingreso
        Dim Solicitud As Integer = LbSoliclitud.Text '' Numero de solicitud medicamento/suministro
        Dim Paciente As String = LbDocumento.Text '' Documento Paciente
        Dim Suministro As Integer = Listsum.text '' List de suministros Tabala O2_Forma_Sum
        Dim Litros As Decimal = Ltssumin.Text ''
        Dim his As String = hi.Text '' Hora Inicia
        Dim mis As String = mi.Text '' Minutos inicia
        Dim hfs As String = hf.Text '' Hora Fin
        Dim mfs As String = mf.Text '' Minutos fin
        Dim TInicio As String = LbFecha.Text
        Dim h1 As String = his + ":" + mis '+ ":00"
        Dim h2 As String = hfs + ":" + mfs '+ ":00"
        Dim t1 As String '' concatena Fechas y horas
        Dim t2 As String
        t1 = Inicio + " " + his + ":" + mis ' + ":00"
        t2 = Final + " " + hfs + ":" + mfs ' + ":00"

        Dim SQLa22 As String
        Dim timedatea22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa22 As SqlDataReader
        Dim Coma22 As New SqlCommand
        Coma22.Connection = timedatea22
        timedatea22.Open()
        SQLa22 = "select case when (SELECT top 1 id from O2_Sum_Paciente Where ('" & t1 & "'  between (Fecha_Ini + ' ' + Hora_Ini) and (Fecha_Fin + ' ' + Hora_Fin) )and Ingreso=" & ingreso & ") is null then 1 else 2 end" ''is null then 1 else 2 end"  ((Fecha_Ini + ' ' + Hora_Ini=N'" & t1 & "') or (Fecha_Fin + ' ' + Hora_Fin=N'" & t1 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" '' Identifica valor y limite del suministro seleccionado
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()
        If Rsa22(0) = 2 Then
            Label5.Text = "Ya tiene Registros en el rango de fecha de Inicio "
            Suministro = 8
        End If
        Rsa22.Close()
        timedatea22.Close()

        timedatea22.Open()
        '  SQLa22 = "select case when (SELECT top 1 id from O2_Sum_Paciente Where (((Fecha_Ini + ' ' + Hora_Ini) between '" & t1 & "' and '" & t2 & "' ) or ((Fecha_Fin + ' ' + Hora_Fin) between N'" & t1 & "' and N'" & t2 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" ''is null then 1 else 2 end"  ((Fecha_Ini + ' ' + Hora_Ini=N'" & t1 & "') or (Fecha_Fin + ' ' + Hora_Fin=N'" & t1 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" '' Identifica valor y limite del suministro seleccionado
        '  Coma22 = New SqlCommand(SQLa22, timedatea22)
        '   Rsa22 = Coma22.ExecuteReader()
        '  Rsa22.Read()
        '  If Rsa22(0) = 2 Then
        '  Label5.Text = "Ya tiene Registros dentro de los Rangos de Fecha"
        ''  Suministro = 8
        '  End If

        Rsa22.Close()
        timedatea22.Close()


        If Suministro <> 8 Then

            If (t1) < (Hora) Then
                '   If t2 > t1 Then ''IsDate(t2) > IsDate(t1) Then 'And IsDate(TextFechaIniTras.Text) And IsDate(TextFechaFinTras.Text) Then
                Dim Minutos As Integer '' Minutos Total
                ''     Minutos = (DateDiff("s", t1, t2) / 60) + 1

                Dim ValorH As Decimal
                Dim ValorL As Decimal '' Valor segun El sumnisitro
                Dim Limite As Integer '' Limite Calcula los litros
                Dim Tarifa As Decimal '' 0.* SMDV segun acuerdos
                Dim SQLa2 As String
                Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
                Dim Rsa2 As SqlDataReader
                Dim Coma2 As New SqlCommand
                Coma2.Connection = timedatea2
                timedatea2.Open()
                SQLa2 = "SELECT Val_Hora_min, Limite from O2_Forma_Sum Where (Id=" & Suministro & " )" '' Identifica valor y limite del suministro seleccionado
                Coma2 = New SqlCommand(SQLa2, timedatea2)
                Rsa2 = Coma2.ExecuteReader()
                Rsa2.Read()
                Tarifa = Rsa2(0)
                Limite = Rsa2(1)
                Rsa2.Close()
                timedatea2.Close()


                If Limite >= Litros Then

                    SQLOXIGENO.UpdateCommand = "update O2_Sum_Paciente set Fecha_Ini= '" & Inicio & "' ,Hora_Ini ='" & h1 & "',Sum_Id='" & Suministro & "' , Litros='" & Litros & "',Usuario='" & Usuario & "' ,Fech_Aud='" & Hora & " ' where (solicitud ='" & Solicitud & " ' ) "
                    SQLOXIGENO.Update()
                    Lb_fechas.Text = "Registro guardado"
                    Label5.Text = "Registro guardado"
                    Panel1.Visible = True
                    Panel2.Visible = False
                    Response.AddHeader("REFRESH", "1;RegOxigeno.aspx")
                Else
                    Label5.Text = "Limite Maximo de Litros " + CStr(Limite) + "  Revisar el valor de Litros " + CStr(Litros)
                    Paneltabla.visible = True
                    Panel1.Visible = False
                    Panel2.Visible = True
                End If
            Else
                Label5.Text = "Hora " + t1 + " Inicio mayor a Hora Actual " + Hora
                Paneltabla.visible = True
                Panel1.Visible = False
                Panel2.Visible = True

            End If

        Else
            Label5.Text = Label5.Text + " Por favor seleccione un suministro "
            Paneltabla.visible = True
            Panel1.Visible = False
            Panel2.Visible = True
        End If



    End Sub

    '' Boton guarda el Inicio y fin del Oxigeno

    Protected Sub guardar2_Click(sender As Object, e As EventArgs) Handles guardar2.Click
        Dim horaini1 As String
        Dim horaini As String = " "
        Dim Inicio As String '' Fecha Inicio
        Dim t1 As String '' concatena Fechas y horas
        Dim Solicitud As Integer = LbSoliclitud.Text '' Numero de solicitud medicamento/suministro
        Dim Litros As Decimal
        Dim Suministro2 As String
        Dim Suministro As Integer
        Dim SQLa221 As String
        Dim timedatea221 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa221 As SqlDataReader
        Dim Coma221 As New SqlCommand
        Coma221.Connection = timedatea221
        timedatea221.Open()
        SQLa221 = "select top 1 Fecha_Ini,Hora_ini,Sum_id,Litros,Sum_Id from O2_Sum_Paciente Where (Solicitud=" & Solicitud & ") "
        Coma221 = New SqlCommand(SQLa221, timedatea221)
        Rsa221 = Coma221.ExecuteReader()
        Rsa221.Read()


        If Rsa221(1).Substring(3, 2) = "00" Then
            horaini = Rsa221(1).Substring(0, 2) + ":01"

        End If
        If Rsa221(1).Substring(3, 2) = "30" Then
            horaini = Rsa221(1).Substring(0, 2) + ":31"

        End If
        t1 = Rsa221(0) + " " + horaini
        horaini1 = Rsa221(0) + " " + Rsa221(1)
        Litros = CDec(Rsa221(3))
        Suministro2 = Rsa221(4)
        Ltssumin.Text = Rsa221(3)
        Inicio = t1
        Rsa221.Close()
        timedatea221.Close()
        Suministro = CInt(Suministro2)
        ' Label6.Text = t1
        '  Label7.Text = t1
        Dim Salario As Integer
        Dim Hora As String '' Fecha y hora Ingreso de suministro
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT GETDATE() AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()


        Dim timedatea23 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica")
        Dim Rsa23 As SqlDataReader
        Dim Coma23 As New SqlCommand
        Coma23.Connection = timedatea23
        timedatea23.Open()
        SQLa = "SELECT TOP 1 GSAVALSAL FROM GENSALMIN order by oid DESC"
        Coma23 = New SqlCommand(SQLa, timedatea23)
        Rsa23 = Coma23.ExecuteReader()
        Rsa23.Read()

        Salario = Math.Round(Rsa23(0), 0)
        Rsa23.Close()
        timedatea23.Close()


        Dim Usuario As String

        Dim solcit As String = Page.User.Identity.Name.ToString '' Usuario Logueado
        Dim sq As String
        Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa1983 As SqlDataReader
        Dim Coma123456 As New SqlCommand
        Coma123456.Connection = timd
        timd.Open()
        sq = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & solcit & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Usuario = Rsa1983(0)
        Rsa1983.Close()
        timd.Close()

        Dim Final As String = TextFechaFin.Text '' Fecha fin
        Dim ingreso As Integer = LbIngreso.Text '' Ingreso

        Dim Paciente As String = LbDocumento.Text '' Documento Paciente

        Dim hfs As String = hf.Text '' Hora Fin
        Dim mfs As String = mf.Text '' Minutos fin
        Dim TInicio As String = LbFecha.Text

        Dim h2 As String = hfs + ":" + mfs '+ ":00"

        Dim t2 As String

        If TextFechaFin.Text = "" Then '' If String.IsNullOrEmpty(TextFechaFin.Text) Then
            Label5.Text = "Falta Hora Fin "

            Suministro = 8
        Else

            t2 = Final + " " + hfs + ":" + mfs ' + ":00"


        End If


        Dim SQLa22 As String
        Dim timedatea22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa22 As SqlDataReader
        Dim Coma22 As New SqlCommand
        Coma22.Connection = timedatea22
        timedatea22.Open()
        SQLa22 = "select case when (SELECT top 1 id from O2_Sum_Paciente Where (N'" & t1 & "'  between (Fecha_Ini + ' ' + Hora_Ini) and (Fecha_Fin + ' ' + Hora_Fin) )and Ingreso=" & ingreso & ") is null then 1 else 2 end" ''is null then 1 else 2 end"  ((Fecha_Ini + ' ' + Hora_Ini=N'" & t1 & "') or (Fecha_Fin + ' ' + Hora_Fin=N'" & t1 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" '' Identifica valor y limite del suministro seleccionado
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()
        '  If Rsa22(0) = 2 Then
        '  Label5.Text = "Ya tiene Registros en el rango de fecha de Inicio " + Inicio
        '  Suministro = 8
        '  Paneltabla.visible = True
        '  End If

        Rsa22.Close()
        timedatea22.Close()

        timedatea22.Open()
        SQLa22 = "select case when (SELECT top 1 id from O2_Sum_Paciente Where (N'" & t2 & "'  between (Fecha_Ini + ' ' + Hora_Ini) and (Fecha_Fin + ' ' + Hora_Fin) )and Ingreso=" & ingreso & ") is null then 1 else 2 end" ''is null then 1 else 2 end"  ((Fecha_Ini + ' ' + Hora_Ini=N'" & t1 & "') or (Fecha_Fin + ' ' + Hora_Fin=N'" & t1 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" '' Identifica valor y limite del suministro seleccionado
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()
        If Rsa22(0) = 2 Then
            Label5.Text = "Ya tiene Registros en el rango de Fecha Fin "
            Suministro = 8
            Paneltabla.visible = True
        End If

        Rsa22.Close()
        timedatea22.Close()

        timedatea22.Open()
        ''SQLa22 = "select case when (SELECT top 1 id from O2_Sum_Paciente Where (((Fecha_Ini + ' ' + Hora_Ini) between N'" & t1 & "' and N'" & t2 & "' ) or ((Fecha_Fin + ' ' + Hora_Fin) between N'" & t1 & "' and N'" & t2 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end, case when (SELECT top 1 id from O2_Sum_Paciente Where (((Fecha_Ini + ' ' + Hora_Ini) between N'" & t1 & "' and N'" & t2 & "' ) or ((Fecha_Fin + ' ' + Hora_Fin) between N'" & t1 & "' and N'" & t2 & "' )) and Ingreso=" & ingreso & ") is null then '1' else Ingreso end" '' Identifica valor y limite del suministro seleccionado
        SQLa22 = "SELECT top 1 id from O2_Sum_Paciente Where (((Fecha_Ini + ' ' + Hora_Ini) between N'" & t1 & "' and N'" & t2 & "' ) or ((Fecha_Fin + ' ' + Hora_Fin) between N'" & t1 & "' and N'" & t2 & "' )) and (Ingreso=" & ingreso & ") "
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        If Rsa22.Read() Then
            '  Rsa22.Read()  If String.IsNullOrEmpty(Rsa1983(0)) Then
            If Rsa22(0) = 2 Then


                Label5.Text = "Ya tiene Registros dentro de los Rangos de Fecha " & t1 & " a " & t2 & "  " & Rsa22(1) & " "
                Suministro = 8
                Paneltabla.visible = True
            End If

            Rsa22.Close()
        End If

        timedatea22.Close()


        If Suministro <> 8 Then

            

                If t2 = t2 Then 

                    Dim Minutos As Integer '' Minutos Total
                    Minutos = (DateDiff("s", horaini1, t2) / 60) + 1

                    Dim ValorH As Decimal
                    Dim ValorL As Decimal '' Valor segun El sumnisitro
                    Dim Limite As Integer '' Limite Calcula los litros
                    Dim Tarifa As Decimal '' 0.* SMDV segun acuerdos
                    Dim SQLa2 As String
                    Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
                    Dim Rsa2 As SqlDataReader
                    Dim Coma2 As New SqlCommand
                    Coma2.Connection = timedatea2
                    timedatea2.Open()
                    SQLa2 = "SELECT Val_Hora_min, Limite from O2_Forma_Sum Where (Id=" & Suministro & " )" '' Identifica valor y limite del suministro seleccionado
                    Coma2 = New SqlCommand(SQLa2, timedatea2)
                    Rsa2 = Coma2.ExecuteReader()
                    Rsa2.Read()
                    Tarifa = Rsa2(0)
                    Limite = Rsa2(1)
                    Rsa2.Close()
                    timedatea2.Close()


                    If Limite >= Litros Then


                        Tarifa = (Tarifa * ((Salario / 30) / 60))
                        ValorH = Tarifa * Minutos '' Valor en tiempo a Facturar
                        ValorL = (Litros * Minutos) * 15 '' Valor en Litros a Facturar
                        ValorH = Math.Round(ValorH, 2)
                        ValorL = Math.Round(ValorL, 2)

                        ' SQLOXIGENO.InsertCommand = "INSERT O2_Sum_Paciente (Solicitud, Ingreso ,Paciente ,Fecha_Ini ,Hora_Ini ,Fecha_Fin ,Hora_Fin ,Sum_Id ,Minutos , ValorH, Litros,ValorL ,Usuario ,Fech_Aud) VALUES ('" & Solicitud & "','" & ingreso & "'," & Paciente & ",'" & Inicio & "','" & h1 & "','" & Final & "','" & h2 & "','" & Suministro & "','" & Minutos & "','" & ValorH & "','" & Litros & "','" & ValorL & "','" & Usuario & "','" & Hora & " ' ) "
                        SQLOXIGENO.UpdateCommand = "update O2_Sum_Paciente set Fecha_Fin ='" & Final & "',Hora_Fin='" & h2 & "' ,Minutos ='" & Minutos & "',Val_Hora='" & Math.Round((Tarifa * 60), 2) & "',ValorH='" & ValorH & "', Litros_total='" & Math.Round(Minutos * Litros) & "',ValorL ='" & ValorL & "',Usuario='" & Usuario & "' ,Fech_Aud='" & Hora & " ' where (solicitud ='" & Solicitud & " ' ) "
                        SQLOXIGENO.Update()

                        Lb_fechas.Text = "Registro guardado " + t1 + "   " + t2 + " "
                        Label5.Text = "Registro guardado"

                        Panel1.Visible = True
                        Panel2.Visible = False
                        Response.AddHeader("REFRESH", "1;RegOxigeno.aspx")
                    Else
                        Label5.Text = "Limite Maximo de Litros " + CStr(Limite) + "  Revisar el valor de Litros " + CStr(Litros)
                        Paneltabla.visible = True
                        Panel1.Visible = False
                        Panel2.Visible = True
                    End If




                Else
                    Label5.Text = "Fecha Inicial " + t1 + " mayor a Fecha Final. t2 > t1 BOTO " + Hora
                    Paneltabla.visible = True
                    Panel1.Visible = False
                    Panel2.Visible = True
                End If

           
                Label5.Text = "Fecha Final " + t2 + " mayor a Fecha Actual  " + Hora
                Paneltabla.visible = True
                Panel1.Visible = False
                Panel2.Visible = True

            

        Else
            Label5.Text = Label5.Text + " Por favor seleccione un suministro "
            Paneltabla.visible = True
            Panel1.Visible = False
            Panel2.Visible = True
        End If


    End Sub

    Protected Sub guardar3_Click(sender As Object, e As EventArgs) Handles guardar3.Click


        Dim Salario As Integer
        Dim Hora As String
        '' Fecha y hora Ingreso de suministro
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT GETDATE() AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()


        Dim timedatea23 As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica")
        Dim Rsa23 As SqlDataReader
        Dim Coma23 As New SqlCommand
        Coma23.Connection = timedatea23
        timedatea23.Open()
        SQLa = "SELECT TOP 1 GSAVALSAL FROM GENSALMIN order by oid DESC"
        Coma23 = New SqlCommand(SQLa, timedatea23)
        Rsa23 = Coma23.ExecuteReader()
        Rsa23.Read()

        Salario = Math.Round(Rsa23(0), 0)
        Rsa23.Close()
        timedatea23.Close()

        Dim Usuario As String

        Dim solcit As String = Page.User.Identity.Name.ToString '' Usuario Logueado
        Dim sq As String
        Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        Dim Rsa1983 As SqlDataReader
        Dim Coma123456 As New SqlCommand
        Coma123456.Connection = timd
        timd.Open()
        sq = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & solcit & "')"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        Rsa1983.Read()
        Usuario = Rsa1983(0)
        Rsa1983.Close()
        timd.Close()

        Dim Inicio As String = TextFechaIni.text '' Fecha Inicio
        Dim Final As String = TextFechaFin.Text '' Fecha fin
        Dim ingreso As Integer = LbIngreso.Text '' Ingreso
        Dim Solicitud As Integer = LbSoliclitud.Text '' Numero de solicitud medicamento/suministro
        Dim Paciente As String = LbDocumento.Text '' Documento Paciente
        Dim Suministro As Integer = Listsum.text '' List de suministros Tabala O2_Forma_Sum
        Dim Litros As Decimal = Ltssumin.Text ''
        Dim his As String = hi.Text '' Hora Inicia
        Dim mis As String = mi.Text '' Minutos inicia
        Dim hfs As String = hf.Text '' Hora Fin
        Dim mfs As String = mf.Text '' Minutos fin
        Dim TInicio As String = LbFecha.Text
        Dim h1 As String = his + ":" + mis '+ ":00"
        Dim h2 As String = hfs + ":" + mfs '+ ":00"
        Dim t1 As String '' concatena Fechas y horas
        Dim t2 As String
        t1 = Inicio + " " + his + ":" + mis ' + ":00"
        t2 = Final + " " + hfs + ":" + mfs ' + ":00"

        Dim SQLa22 As String
        Dim timedatea22 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa22 As SqlDataReader
        Dim Coma22 As New SqlCommand
        Coma22.Connection = timedatea22
        timedatea22.Open()
        SQLa22 = "select case when (SELECT top 1 id from O2_Sum_Paciente Where (N'" & t1 & "'  between (Fecha_Ini + ' ' + Hora_Ini) and (Fecha_Fin + ' ' + Hora_Fin) )and Ingreso=" & ingreso & ") is null then 1 else 2 end" ''is null then 1 else 2 end"  ((Fecha_Ini + ' ' + Hora_Ini=N'" & t1 & "') or (Fecha_Fin + ' ' + Hora_Fin=N'" & t1 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" '' Identifica valor y limite del suministro seleccionado
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()
        If Rsa22(0) = 2 Then
            Label5.Text = "Ya tiene Registros en el rango de fecha de Inicio "
            '   Suministro = 8
            Paneltabla.visible = True
        End If

        Rsa22.Close()
        timedatea22.Close()

        timedatea22.Open()
        SQLa22 = "select case when (SELECT top 1 id from O2_Sum_Paciente Where (N'" & t2 & "'  between (Fecha_Ini + ' ' + Hora_Ini) and (Fecha_Fin + ' ' + Hora_Fin) )and Ingreso=" & ingreso & ") is null then 1 else 2 end" ''is null then 1 else 2 end"  ((Fecha_Ini + ' ' + Hora_Ini=N'" & t1 & "') or (Fecha_Fin + ' ' + Hora_Fin=N'" & t1 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" '' Identifica valor y limite del suministro seleccionado
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()
        If Rsa22(0) = 2 Then
            Label5.Text = "Ya tiene Registros en el rango de Fecha Fin "
            ' Suministro = 8
            Paneltabla.visible = True
        End If

        Rsa22.Close()
        timedatea22.Close()

        timedatea22.Open()
        SQLa22 = "select case when (SELECT top 1 id from O2_Sum_Paciente Where (((Fecha_Ini + ' ' + Hora_Ini) between N'" & t1 & "' and N'" & t2 & "' ) or ((Fecha_Fin + ' ' + Hora_Fin) between N'" & t1 & "' and N'" & t2 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" ''is null then 1 else 2 end"  ((Fecha_Ini + ' ' + Hora_Ini=N'" & t1 & "') or (Fecha_Fin + ' ' + Hora_Fin=N'" & t1 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" '' Identifica valor y limite del suministro seleccionado
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()
        If Rsa22(0) = 2 Then
            Label5.Text = "Ya tiene Registros dentro de los Rangos de Fecha"
            ' Suministro = 8
            Paneltabla.visible = True
        End If

        Rsa22.Close()
        timedatea22.Close()


        If Suministro <> 8 Then

            

                If t2 = t2 Then

                    Dim Minutos As Integer
                    Minutos = (DateDiff("s", t1, t2) / 60) + 1

                    Dim ValorH As Decimal
                    Dim ValorL As Decimal '' Valor segun El sumnisitro
                    Dim Limite As Integer '' Limite Calcula los litros
                    Dim Tarifa As Decimal '' 0.* SMDV segun acuerdos
                    Dim SQLa2 As String
                    Dim timedatea2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
                    Dim Rsa2 As SqlDataReader
                    Dim Coma2 As New SqlCommand
                    Coma2.Connection = timedatea2
                    timedatea2.Open()
                    SQLa2 = "SELECT Val_Hora_min, Limite from O2_Forma_Sum Where (Id=" & Suministro & " )" '' Identifica valor y limite del suministro seleccionado
                    Coma2 = New SqlCommand(SQLa2, timedatea2)
                    Rsa2 = Coma2.ExecuteReader()
                    Rsa2.Read()
                    Tarifa = Rsa2(0)
                    Limite = Rsa2(1)
                    Rsa2.Close()
                    timedatea2.Close()


                    If Limite >= Litros Then


                        Tarifa = (Tarifa * ((Salario / 30) / 60))
                        ValorH = Tarifa * Minutos '' Valor en tiempo a Facturar
                        ValorL = (Litros * Minutos) * 15 '' Valor en Litros a Facturar
                        ValorH = Math.Round(ValorH, 2)
                        ValorL = Math.Round(ValorL, 2)

                        ' SQLOXIGENO.InsertCommand = "INSERT O2_Sum_Paciente (Solicitud, Ingreso ,Paciente ,Fecha_Ini ,Hora_Ini ,Fecha_Fin ,Hora_Fin ,Sum_Id ,Minutos , ValorH, Litros,ValorL ,Usuario ,Fech_Aud) VALUES ('" & Solicitud & "','" & ingreso & "'," & Paciente & ",'" & Inicio & "','" & h1 & "','" & Final & "','" & h2 & "','" & Suministro & "','" & Minutos & "','" & ValorH & "','" & Litros & "','" & ValorL & "','" & Usuario & "','" & Hora & " ' ) "
                        SQLOXIGENO.UpdateCommand = "update O2_Sum_Paciente set Fecha_Ini= '" & Inicio & "' ,Hora_Ini ='" & h1 & "',Fecha_Fin ='" & Final & "',Hora_Fin='" & h2 & "' ,Sum_Id='" & Suministro & "' ,Minutos ='" & Minutos & "',Val_Hora='" & Math.Round((Tarifa * 60), 2) & "',ValorH='" & ValorH & "', Litros='" & Litros & "',Litros_total='" & Math.Round(Minutos * Litros) & "',ValorL ='" & ValorL & "',Usuario='" & Usuario & "' ,Fech_Aud='" & Hora & " ' where (solicitud ='" & Solicitud & " ' ) "
                        SQLOXIGENO.Update()

                        Lb_fechas.Text = "Registro guardado"
                        Label5.Text = "Registro guardado"

                        Panel1.Visible = True
                        Panel2.Visible = False
                        Response.AddHeader("REFRESH", "1;RegOxigeno.aspx")
                    Else
                        Label5.Text = "Limite Maximo de Litros " + CStr(Limite) + "  Revisar el valor de Litros " + CStr(Litros)
                        Paneltabla.visible = True
                        Panel1.Visible = False
                        Panel2.Visible = True
                    End If




                Else
                    Label5.Text = "Fecha Inicial " + t1 + "mayor a Fecha Final.  t2 < t1" + Hora
                    Paneltabla.visible = True
                    Panel1.Visible = False
                    Panel2.Visible = True
                End If

           
                Label5.Text = "Fecha Final " + t2 + " mayor a Fecha Actual  " + Hora
                Paneltabla.visible = True
                Panel1.Visible = False
                Panel2.Visible = True

            

        Else
            ' Label5.Text = "Por favor seleccione un suministro "
            Paneltabla.visible = True
            Panel1.Visible = False
            Panel2.Visible = True
        End If



    End Sub
End Class
