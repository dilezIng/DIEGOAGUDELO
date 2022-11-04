Imports System.IO
Imports System.Text
Imports System.Collections.Generic
Imports System.Web
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration


Public Class EditOxigeno
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




        If caracteres = "JEN009" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False

            lBuSER.TEXT = caracteres


        End If
        If caracteres = "jen132" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False
            lBuSER.TEXT = caracteres

        End If

 If caracteres = "AEN165" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False

            lBuSER.TEXT = caracteres


        End If
        If caracteres = "aen165" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False
            lBuSER.TEXT = caracteres

        End If

  If caracteres = "JEN132" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False

            lBuSER.TEXT = caracteres


        End If
        If caracteres = "jen009" Then
            Panel1.Visible = True
            Panel2.Visible = False
            Paneldisponible.Visible = False
            Paneltabla.Visible = False
            Button2.Visible = False
            lBuSER.TEXT = caracteres

        End If

        ' LabelPacientes.Text = "" + GridView1.Rows.Count.ToString





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
        SQLa22 = "select top 1 Solicitud,Paciente,Nombre_Paciente,Fecha_Ini, Hora_Ini,Hora_Fin,Sum_id,Litros,Folio,Fecha_Fin from O2_Sum_Paciente Where (Solicitud=" & solicitud & ") "
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()

        LbDocumento.text = " Cedula: " + Rsa22(1)
        LbPaciente.Text = " Paciente: " + Rsa22(2)
        LBFolio.Text = Rsa22(8)
        LbSoliclitud.Text = Rsa22(0)
        Ltssumin.Text = Rsa22(7)

        If Rsa22(4) <> "0" Then

            Dim ee As String = Rsa22(4)
            Dim ArrCadena As String() = ee.Split(":")
            Dim Cadena2 As String = ArrCadena(0)
            Dim Cadena3 As String = ArrCadena(1)

            TextFechaIni.Text = Rsa22(3)
            'Label8.Text = Rsa22(3) + " " + hir


            If (Cadena2 < 10) Then
                hi.Text = "0" + Rsa22(4).Substring(0, 1)

            Else
                hi.Text = Rsa22(4).Substring(0, 2)
            End If

            '   hi.Text = Rsa22(4).Substring(0, 2)
            mi.Text = Cadena3
            ' mi.Text = Rsa22(4).Substring(3, 2)

        End If

        If Rsa22(5) <> "0" Then

            Dim ee2 As String = Rsa22(5)
            Dim ArrCadena2 As String() = ee2.Split(":")
            Dim Cadena22 As String = ArrCadena2(0)
            Dim Cadena32 As String = ArrCadena2(1)

            TextFechaFin.Text = Rsa22(9)
            'Label8.Text = Rsa22(3) + " " + hir


            If (Cadena22 < 10) Then
                hf.Text = "0" + Rsa22(5).Substring(0, 1)

            Else
                hf.Text = Rsa22(5).Substring(0, 2)
            End If

            '   hi.Text = Rsa22(4).Substring(0, 2)
            mf.Text = Cadena32
            ' mi.Text = Rsa22(4).Substring(3, 2)

        End If



        '    guardar3.Visible = False
        ' Ltssumin.Visible = False
        ' Listsum.Visible = False
        ' TextFechaIni.Visible = False
        ' Label1.Visible = False
        ' Label11.Visible = False
        ' Label3.Visible = False
        ' Label2.Visible = False



        If Rsa22(7) = "0" Then


            guardar3.Visible = True

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



            ' TextFechaIni.Text = Rsa22(3) + " " + hir
            ' Label8.Text = Rsa22(3) + " " + hir
            ' hi.Visible = False
            ' mi.Visible = False


            '    guardar3.Visible = False
            ' Ltssumin.Visible = False
            ' Listsum.Visible = False
            ' TextFechaIni.Visible = False
            ' Label1.Visible = False
            ' Label11.Visible = False
            ' Label3.Visible = False
            ' Label2.Visible = False


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
        Response.AddHeader("REFRESH", "1;EditarOxigeno.aspx")
    End Sub
    '' Boton guarda el Inicio del Oxigeno

    '' Boton guarda el Inicio y fin del Oxigeno



    Protected Sub guardar3_Click(sender As Object, e As EventArgs) Handles guardar3.Click

        Label5.Visible = True
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
            
            Paneltabla.visible = True
        End If

        Rsa22.Close()
        timedatea22.Close()

        timedatea22.Open()
SQLa22 = "select case when (SELECT top 1 id from O2_Sum_Paciente Where (((Fecha_Ini + ' ' + Hora_Ini) between N'" & t1 & "' and N'" & t2 & "' ) or ((Fecha_Fin + ' ' + Hora_Fin) between N'" & t1 & "' and N'" & t2 & "' )) and Ingreso=" & ingreso & ") is null then 1 else 2 end" '' Identifica valor y limite del suministro seleccionado
        Coma22 = New SqlCommand(SQLa22, timedatea22)
        Rsa22 = Coma22.ExecuteReader()
        Rsa22.Read()
        If Rsa22(0) = 2 Then
            Label5.Text = "Ya tiene Registros dentro de los Rangos de Fecha 22"
          
            Paneltabla.visible = True
        End If

        Rsa22.Close()
        timedatea22.Close()
        If his < 24 Then
        Else
            Label5.Text = " Hora inicial debe ser menor a 24 Hrs "
            Suministro = 8
        End If

        If mis = "00" Or mis = "30" Then
        Else
            Label5.Text = " Minutos Inicio 00 o 30 "
            Suministro = 8
        End If

        If hfs < 24 Then
        Else
            Label5.Text = " Hora Final debe ser menor a 24 Hrs "
            Suministro = 8
        End If
        If mfs = "59" Or mfs = "29" Then
        Else
            Label5.Text = " Minutos Final 29 o 59 "
            Suministro = 8
        End If

        If Suministro <> 8 Then

            If 1 = 1 Then

                If 1 = 1 Then

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
                        SQLOXIGENO.UpdateCommand = "update O2_Sum_Paciente set Fecha_Ini= '" & Inicio & "' ,Hora_Ini ='" & h1 & "',Fecha_Fin ='" & Final & "',Hora_Fin='" & h2 & "' ,Sum_Id='" & Suministro & "' ,Minutos ='" & Minutos & "',Val_Hora='" & Math.Round((Tarifa * 60), 2) & "',ValorH='" & ValorH & "', Litros='" & Litros & "',Litros_total='" & Math.Round(Minutos * Litros) & "',ValorL ='" & ValorL & "',Fech_Aud='" & Hora & " ' where (solicitud ='" & Solicitud & " ' ) "
                        SQLOXIGENO.Update()

                        Lb_fechas.Text = "Registro guardado"
                        Label5.Text = "Registro guardado"

                        Panel1.Visible = True
                        Panel2.Visible = False
                        Response.AddHeader("REFRESH", "1;EditarOxigeno.aspx")
                    Else
                        Label5.Text = "Limite Maximo de Litros " + CStr(Limite) + "  Revisar el valor de Litros " + CStr(Litros)
                        Paneltabla.visible = True
                        Panel1.Visible = False
                        Panel2.Visible = True
                    End If




                Else
                    Label5.Text = Label5.Text+" Fecha Inicial " + t1 + "mayor a Fecha Final.00" + Hora
                    Paneltabla.visible = True
                    Panel1.Visible = False
                    Panel2.Visible = True
                End If

            Else
                Label5.Text = Label5.Text+" Fecha Final " + t2 + " mayor a Fecha Actual  " + Hora
                Paneltabla.visible = True
                Panel1.Visible = False
                Panel2.Visible = True

            End If

        Else
            Label5.Text = Label5.Text + "Por favor seleccione un suministro "
            Paneltabla.visible = True
            Panel1.Visible = False
            Panel2.Visible = True
            Paneldisponible.Visible = True
        End If



    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

        Dim ingreso As Integer = Tb_Ingreso.text

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
End Class
