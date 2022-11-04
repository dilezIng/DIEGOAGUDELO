Imports System.Data
Imports System.Data.SqlClient

Partial Class Registro
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

    End Sub


    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()> _
    Public Shared Function BusqPaciente(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText


        StrConsulta = "SELECT top 100 RTRIM(PACPRIAPE) + N' ' + RTRIM(PACSEGAPE) + N' ' + RTRIM(PACPRINOM) + N' ' + RTRIM(PACSEGNOM) + N' - ' + RTRIM(PACNUMDOC) AS NomPaciente, OID FROM GENPACIEN WHERE (RTRIM(PACPRIAPE) + N' ' + RTRIM(PACSEGAPE) + N' ' + RTRIM(PACPRINOM) + N' ' + RTRIM(PACSEGNOM) + N' - ' + RTRIM(PACNUMDOC) LIKE N'%" & filtro & "%') ORDER BY NomPaciente"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Dim i As Integer
            For i = 0 To objDS.Tables(0).Rows.Count - 1
                Lista.Add(objDS.Tables(0).Rows(i).Item(0).ToString)
            Next
        End If

        Return Lista
    End Function


    'SELECT OID, PACNUMDOC, PACPRINOM, PACSEGNOM, PACPRIAPE, PACSEGAPE FROM GENPACIEN WHERE (PACNUMDOC = N'123456')


    Protected Sub ButtonSelecPac_Click(sender As Object, e As System.EventArgs) Handles ButtonSelecPac.Click

        Dim vbCadena As String
        Dim i As Integer

        'LabelId.Text = ""


        If TextBoxBusqPac.Text.Length > 10 Then
            vbCadena = TextBoxBusqPac.Text.Substring(TextBoxBusqPac.Text.LastIndexOf("-") + 2, TextBoxBusqPac.Text.Length - (TextBoxBusqPac.Text.LastIndexOf("-") + 2))

            'LabelIdDG.Text = vbCadena 'TextBoxBusqPac.Text.Length 'TextBoxBusqPac.Text.LastIndexOf("-")

        End If


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter


        StrConsulta = "SELECT GENPACIEN.OID, PACNUMDOC, PACPRIAPE, PACSEGAPE, PACPRINOM, PACSEGNOM, GPAFECNAC, GENDETCON, DGNMUNICIPIO, GENPACIENT.PACTELEFONO  FROM GENPACIEN INNER JOIN GENPACIENT ON GENPACIEN.GENPACIENT = GENPACIENT.OID WHERE (PACNUMDOC = N'" & vbCadena & "')"
        'StrConsulta = "SELECT OID FROM GENUSUARIO WHERE USUNOMBRE = N'" & Cadena & "'"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            LabelIdDG.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            LabelId.Text = ExistePersona(LabelIdDG.Text)
            TextBoxNumDoc.Text = objDS.Tables(0).Rows(0).Item(1).ToString
            TextBoxPrimApel.Text = objDS.Tables(0).Rows(0).Item(2).ToString
            TextBoxSegApel.Text = objDS.Tables(0).Rows(0).Item(3).ToString
            TextBoxPrimNom.Text = objDS.Tables(0).Rows(0).Item(4).ToString
            TextBoxSegNombre.Text = objDS.Tables(0).Rows(0).Item(5).ToString
            TextBoxFechaNac.Text = objDS.Tables(0).Rows(0).Item(6).ToString.Substring(0, 10)
            LabelEdad.Text = DateDiff(DateInterval.Year, CDate(TextBoxFechaNac.Text), Now.Date).ToString + " años"
            TextBoxEntidad.Text = NomEntidadPaciente(objDS.Tables(0).Rows(0).Item(7).ToString)
            LabelIdEntPersona.Text = objDS.Tables(0).Rows(0).Item(7).ToString
            TextBoxMunicpioReside.Text = NomMpioPaciente(objDS.Tables(0).Rows(0).Item(8).ToString)
            LabelIdMunResPersona.Text = objDS.Tables(0).Rows(0).Item(8).ToString
            TextBoxTelPrinicpal.Text = objDS.Tables(0).Rows(0).Item(9).ToString

            'For i = 0 To ListEntidadPersona.Items.Count - 1
            '    If ListEntidadPersona.Items(i).Value = CInt(objDS.Tables(0).Rows(0).Item(7)) Then
            '        ListEntidadPersona.SelectedIndex = i
            '        Exit For
            '    End If
            'Next


        Else
            'LblIdUser.Text = "No existe un usuario con ese identificador"
        End If
    End Sub


    Private Function NomEntidadPaciente(ByVal IdEntidad As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter


        StrConsulta = "SELECT  GDECODIGO + N' ' + GDENOMBRE AS NomEntidad  FROM GENDETCON   WHERE OID = " + IdEntidad

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
            Return "No Definido"
        End If


    End Function


    Private Function NomMpioPaciente(ByVal IdMunicipio As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter


        StrConsulta = "SELECT MUNNOMMUN FROM GENMUNICI WHERE OID =  " + IdMunicipio

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
            Return "No Definido"
        End If


    End Function

    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()> _
    Public Shared Function BusqCirugia(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText


        StrConsulta = "SELECT DISTINCT RTRIM(GENSERIPS.SIPCODIGO + N' - ' + GENSERIPS.SIPNOMBRE) AS Expr1 FROM GENSERIPS WHERE  (RTRIM(GENSERIPS.SIPCODIGO + N' - ' + GENSERIPS.SIPNOMBRE) LIKE N'%" & filtro & "%')"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Dim i As Integer
            For i = 0 To objDS.Tables(0).Rows.Count - 1
                Lista.Add(objDS.Tables(0).Rows(i).Item(0).ToString)
            Next
        End If

        Return Lista
    End Function

    Protected Sub ButtonCrearControlQx_Click(sender As Object, e As System.EventArgs) Handles ButtonCrearControlQx.Click

        If LabelId.Text = "0" Then
            DataBridge.InsertCommand = "INSERT INTO Qx_ControlAmbulatoria(IdPersona) VALUES (123) "
            DataBridge.InsertCommand = DataBridge.InsertCommand + "VALUES (" & LabelIdDG.Text & ", 1, N'" & TextBoxNumDoc.Text & "', N'" & TextBoxPrimApel.Text & "', N'" & TextBoxSegApel.Text & "', N'" & TextBoxPrimNom.Text & "', N'" & TextBoxSegNombre.Text & "', CONVERT (DATETIME, '" & CDate(TextBoxFechaNac.Text).Year.ToString & "-" & CDate(TextBoxFechaNac.Text).Month.ToString & "-" & CDate(TextBoxFechaNac.Text).Day.ToString & " 00:00:00', 102), " & LabelIdEntPersona.Text & ", " & LabelIdMunResPersona.Text & ", N'" & TextBoxTelPrinicpal.Text & "', N'')"
            DataBridge.Insert()

            LabelId.Text = IdRegInsertado("Dat_Personas")
        Else

        End If


        DataBridge.InsertCommand = "INSERT INTO Qx_ControlAmbulatoria(IdPersona) VALUES (" & LabelId.Text & ") "
        DataBridge.Insert()
        LabelIdQxControl.Text = IdRegInsertado("Qx_ControlAmbulatoria")

        TextBoxBusqPac.Text = ""

    End Sub

    Private Function ExistePersona(ByVal IdDGPersona As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT IdPersona FROM Dat_Personas  WHERE IdDG =  " + IdDGPersona

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

    Private Function IdRegInsertado(ByVal NomTabla As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT IDENT_CURRENT('" & NomTabla & "') AS Current_Identity"
        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        End If

    End Function


    Private Function IdQx()

        Dim Cadena As String

        'LblIdQx.Visible = True

        If TextBoxBusqProceds.Text.Length > 2 Then
            Cadena = TextBoxBusqProceds.Text.Substring(TextBoxBusqProceds.Text.LastIndexOf("(") + 1)
            Cadena = Cadena.Substring(0, Cadena.LastIndexOf("-"))

            LabelIdQxProced.Text = TextBoxBusqProceds.Text

            Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
            Dim StrConsulta As String
            Dim ObjAdapter As New SqlDataAdapter

            StrConsulta = "SELECT OID AS IdQx FROM GENSERIPS WHERE (SIPCODIGO = N'" & Cadena & "')"

            Dim Consulta As New SqlCommand(StrConsulta, Conexion)

            ObjAdapter.SelectCommand = Consulta

            Conexion.Open()

            Dim objDS As New DataSet
            ObjAdapter.Fill(objDS, "Registros")

            Dim Lista As List(Of String) = New List(Of String)

            Conexion.Close()

            If objDS.Tables(0).Rows.Count > 0 Then
                LabelIdQxProced.Text = objDS.Tables(0).Rows(0).Item(0).ToString
                LabelIdQxProced.Visible = True
            Else
                LabelIdQxProced.Text = "SELECCION INVALIDA"
            End If
        Else
            LabelIdQxProced.Text = "SELECCION INVALIDA"
        End If

    End Function

    Protected Sub ButtonAgregarProced_Click(sender As Object, e As System.EventArgs) Handles ButtonAgregarProced.Click

        IdQx()

        DataBridge.InsertCommand = "INSERT INTO Qx_ProcedsPacs(IdQxControlAmbulatoria, IdDGProced, Principal) VALUES (" & LabelIdQxControl.Text & ", " & LabelIdQxProced.Text & ", " & ProcedPrincipal(LabelIdQxControl.Text) & ") "
        DataBridge.Insert()

        ListProceds(LabelIdQxControl.Text)

        TextBoxBusqProceds.Text = ""

        'LabelProcedsPersona.Text = LabelProcedsPersona.Text + " - " + NomProced(LabelIdQxProced.Text)


    End Sub


    Private Function ListProceds(ByVal IdControl As String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter
        Dim i As Integer


        StrConsulta = "SELECT IdDGProced FROM Qx_ProcedsPacs WHERE IdQxControlAmbulatoria = " & IdControl

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        LabelProcedsPersona.Text = ""

        If objDS.Tables(0).Rows.Count > 0 Then
            For i = 0 To objDS.Tables(0).Rows.Count - 1
                If i = 0 Then
                    LabelProcedsPersona.Text = NomProced(objDS.Tables(0).Rows(i).Item(0).ToString).Trim
                Else
                    LabelProcedsPersona.Text = LabelProcedsPersona.Text + " + " + NomProced(objDS.Tables(0).Rows(i).Item(0).ToString).Trim
                End If
            Next
            LabelProcedsPersona.Text = LabelProcedsPersona.Text.Substring(0, LabelProcedsPersona.Text.Length)

            LabelCantProceds.Text = objDS.Tables(0).Rows.Count.ToString + " Procedimientos"

        End If

    End Function


    Private Function ProcedPrincipal(ByVal IdControl As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter
        
        StrConsulta = "SELECT IdQxProcedsPacs FROM Qx_ProcedsPacs WHERE IdQxControlAmbulatoria = " & IdControl

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return 0
        Else
            Return 1
        End If

    End Function


    Private Function ProcedExiste(ByVal IdControl As String, ByVal IdProced As String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter
        Dim i As Integer


        StrConsulta = "SELECT IdDGProced FROM Qx_ProcedsPacs WHERE IdQxControlAmbulatoria = " & IdControl

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        LabelProcedsPersona.Text = ""

        If objDS.Tables(0).Rows.Count > 0 Then
            'For i = 0 To objDS.Tables(0).Rows.Count - 1
            '    If i = 0 Then
            '        LabelProcedsPersona.Text = NomProced(objDS.Tables(0).Rows(i).Item(0).ToString).Trim
            '    Else
            '        LabelProcedsPersona.Text = LabelProcedsPersona.Text + "; " + NomProced(objDS.Tables(0).Rows(i).Item(0).ToString).Trim
            '    End If
            'Next
            LabelProcedsPersona.Text = LabelProcedsPersona.Text.Substring(0, LabelProcedsPersona.Text.Length)

            LabelCantProceds.Text = objDS.Tables(0).Rows.Count.ToString + " Procedimientos"

        End If

    End Function


    Private Function NomProced(ByVal IdProced As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT DISTINCT SIPNOMBRE FROM GENSERIPS WHERE OID = " & IdProced
        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        End If

    End Function


    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()> _
    Public Shared Function BusqMedico(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText

        StrConsulta = "Select GENMEDICO.GMENOMCOM + N'(' + GENMEDICO.GMECODIGO + N')' AS Expr1 FROM GENMEDICO INNER JOIN  GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID WHERE (GENMEDICO.GMENOMCOM + N'(' + GENMEDICO.GMECODIGO + N')' LIKE N'%" & filtro & "%')"
        'StrConsulta = "SELECT DISTINCT RTRIM(GENSERIPS.SIPCODIGO + N' - ' + GENSERIPS.SIPNOMBRE) AS Expr1 FROM GENSERIPS WHERE  (RTRIM(GENSERIPS.SIPCODIGO + N' - ' + GENSERIPS.SIPNOMBRE) LIKE N'%" & filtro & "%')"

        'Select GENMEDICO.GMENOMCOM + N '(' + GENMEDICO.GMECODIGO + N')' AS Expr1 FROM GENMEDICO INNER JOIN  GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID WHERE (CONVERT(char(2), GENUSUARIO.USUNOMBRE) = 'MD') AND (GENMEDICO.GMENOMCOM + N'(' + GENMEDICO.GMECODIGO + N')' LIKE N'%" & filtro & "%')

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Dim i As Integer
            For i = 0 To objDS.Tables(0).Rows.Count - 1
                Lista.Add(objDS.Tables(0).Rows(i).Item(0).ToString)
            Next
        End If

        Return Lista
    End Function

    Protected Sub ButtonSelecMedico_Click(sender As Object, e As System.EventArgs) Handles ButtonSelecMedico.Click

        Dim Cadena As String

        Cadena = TextBoxBusqMedico.Text
        Cadena = Cadena.Substring(Cadena.LastIndexOf("(") + 1, Cadena.Length - (Cadena.LastIndexOf("(") + 2))

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT OID FROM GENMEDICO WHERE GMECODIGO = N'" & Cadena & "'"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            LabelIdMedico.Text = objDS.Tables(0).Rows(0).Item(0).ToString
        End If


    End Sub


    Protected Sub ButtonGuardarControlQx_Click(sender As Object, e As System.EventArgs) Handles ButtonGuardarControlQx.Click

        ''INSERT INTO Qx_ControlAmbulatoria (IdPersona, TiempoQuirurgico, FechaDiagnostico, FechaValAnestesia, FechaSolProgramacion, FechaEspecElegidoUsuario, FechaRealProgCirugia, IdMedicoCirujano, TiempoEspera, Observacion) VALUES        (32456, 1.5, CONVERT(DATETIME, '2017-10-31 00:00:00', 102), CONVERT(DATETIME, '2017-10-31 00:00:00', 102), CONVERT(DATETIME, '2017-10-31 00:00:00', 102), CONVERT(DATETIME, '2017-10-31 00:00:00',  102), CONVERT(DATETIME, '2017-10-31 00:00:00', 102), 123, 123, N'abcdesf')
        ''DataBridge.InsertCommand = "INSERT INTO Qx_ControlAmbulatoria (IdPersona, TiempoQuirurgico, FechaDiagnostico, FechaValAnestesia, FechaSolProgramacion, FechaEspecElegidoUsuario, FechaRealProgCirugia, IdMedicoCirujano, TiempoEspera, Observacion) "
        ''DataBridge.InsertCommand = DataBridge.InsertCommand + "VALUES  (" &  & ", 1.5, CONVERT(DATETIME, '2017-10-31 00:00:00', 102), CONVERT(DATETIME, '2017-10-31 00:00:00', 102), CONVERT(DATETIME, '2017-10-31 00:00:00', 102), CONVERT(DATETIME, '2017-10-31 00:00:00',  102), CONVERT(DATETIME, '2017-10-31 00:00:00', 102), 123, 123, N'abcdesf')"

        DataBridge.UpdateCommand = "UPDATE Qx_ControlAmbulatoria SET "
        DataBridge.UpdateCommand = DataBridge.UpdateCommand + "IdPersona = " & LabelId.Text & ", " '" &  & "
        DataBridge.UpdateCommand = DataBridge.UpdateCommand + "TiempoQuirurgico = " & TextBoxTiempoQx.Text.Replace(",", ".") & ", "
        DataBridge.UpdateCommand = DataBridge.UpdateCommand + "FechaDiagnostico = CONVERT(DATETIME, '" & CDate(TextBoxFechaDiag.Text).Year.ToString & "-" & CDate(TextBoxFechaDiag.Text).Month.ToString & "-" & CDate(TextBoxFechaDiag.Text).Day.ToString & " 00:00:00', 102), "
        DataBridge.UpdateCommand = DataBridge.UpdateCommand + "FechaValAnestesia = CONVERT(DATETIME, '" & CDate(TextBoxFechaAnestesia.Text).Year.ToString & "-" & CDate(TextBoxFechaAnestesia.Text).Month.ToString & "-" & CDate(TextBoxFechaAnestesia.Text).Day.ToString & " 00:00:00', 102), "
        DataBridge.UpdateCommand = DataBridge.UpdateCommand + "FechaSolProgramacion = CONVERT(DATETIME, '" & CDate(TextBoxFecSolProg.Text).Year.ToString & "-" & CDate(TextBoxFecSolProg.Text).Month.ToString & "-" & CDate(TextBoxFecSolProg.Text).Day.ToString & " 00:00:00', 102), "
        DataBridge.UpdateCommand = DataBridge.UpdateCommand + "FechaEspecElegidoUsuario = CONVERT(DATETIME, '" & CDate(TextBoxFechaEleUsuario.Text).Year.ToString & "-" & CDate(TextBoxFechaEleUsuario.Text).Month.ToString & "-" & CDate(TextBoxFechaEleUsuario.Text).Day.ToString & " 00:00:00', 102), "
        If IsDate(TextBoxFechaRealCirugia.Text) Then DataBridge.UpdateCommand = DataBridge.UpdateCommand + "FechaRealProgCirugia = CONVERT(DATETIME, '" & CDate(TextBoxFechaRealCirugia.Text).Year.ToString & "-" & CDate(TextBoxFechaRealCirugia.Text).Month.ToString & "-" & CDate(TextBoxFechaRealCirugia.Text).Day.ToString & " 00:00:00', 102), "
        DataBridge.UpdateCommand = DataBridge.UpdateCommand + "IdMedicoCirujano = " & LabelIdMedico.Text & ", "
        ''DataBridge.UpdateCommand = DataBridge.UpdateCommand + "TiempoEspera = 0, "
        DataBridge.UpdateCommand = DataBridge.UpdateCommand + "Observacion = N'" & TextBoxObservaciones.Text & "'"

        DataBridge.UpdateCommand = DataBridge.UpdateCommand + "  WHERE IdControlQx = " + LabelIdQxControl.Text

        Label1.Text = DataBridge.UpdateCommand

        'DataBridge.Update()

    End Sub

    Protected Sub GridHistorico_RowCreated(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridHistorico.RowCreated

        Dim vbLabel As Label

        vbLabel = e.Row.FindControl("LabelNomProced")

        Try
            vbLabel.Text = NomProced(e.Row.DataItem(3).ToString)
        Catch ex As Exception

        End Try


    End Sub

    'Protected Sub GridHistorico_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridHistorico.RowCommand

    '    Dim vbLabel As Label
    '    'Dim vbFila As Grid


    '    vbLabel = e.Row.FindControl("LabelNomProced")

    '    Try
    '        vbLabel.Text = NomProced(e.Row.DataItem(3).ToString)
    '    Catch ex As Exception

    '    End Try

    'End Sub

    Protected Sub GridHistorico_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridHistorico.RowDataBound

        Dim vbLabel As Label

        vbLabel = e.Row.FindControl("LabelNomProced")

        Try
            vbLabel.Text = NomProced(e.Row.DataItem(3).ToString)
        Catch ex As Exception

        End Try


    End Sub
End Class
