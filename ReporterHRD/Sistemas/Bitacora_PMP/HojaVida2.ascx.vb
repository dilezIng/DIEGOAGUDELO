Imports System.IO
Imports AjaxControlToolkit
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient


Partial Class Sistemas_Bitacora_PMP_HojaVida
    Inherits System.Web.UI.UserControl



    Protected Sub BtnSubirArchivo_Click(sender As Object, e As System.EventArgs) Handles BtnSubirArchivo.Click

        Dim path As String = Server.MapPath("~/Sistemas/Bitacora_PMP/Fotos/")
        Dim fileOK As Boolean = False

        If FileUpload1.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower()
            Dim allowedExtensions As String() = {".tif", ".jpg", ".jpeg", ".png", ".gif"} ', ".xls", ".xlsx", ".pdf", ".doc", ".docx", ".txt"}
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                End If
            Next

            If fileOK Then
                Try
                    Dim vbGuid As String
                    Dim vbIdArchivo As String
                    Dim vbNomArchivo As String
                   
                    vbGuid = System.Guid.NewGuid.ToString

                    vbIdArchivo = "1" 'IdArchivo(vbGuid)
  
                    vbNomArchivo = vbGuid & "_" & FileUpload1.FileName
 

                    FileUpload1.PostedFile.SaveAs(path & vbNomArchivo)

                    ImagenCompo.ImageUrl = path & vbNomArchivo
                    LabelUpload.Text = "Archivo subido con exito!"
                    ImagenCompo.ImageUrl = "~/Sistemas/Bitacora_PMP/Fotos/" + vbNomArchivo
                    'LabelUpload.Text = ImagenCompo.ImageUrl
                    ImagenCompo.Visible = True






                Catch ex As Exception
                    LabelUpload.Text = ex.Message '"No se pudo subir el archivo."
                End Try
            Else
                LabelUpload.Text = "Tipo de archivo no permitido."
            End If
        Else
            LabelUpload.Text = FileUpload1.FileName.ToString
        End If

        BtnMostrar_ModalPopupExtender.Show()

    End Sub


    Protected Sub BtnAgregar_Click(sender As Object, e As System.EventArgs) Handles BtnAgregar.Click
        If FunEquipoExiste() = False Then
            If ListTipoEquipo.SelectedValue > 1 Then
                If ListMarcaEquipo.SelectedValue > 1 Then

                    If TextFechaCompra.Text = "" Then
                        FnAgregarEquipo(ListTipoEquipo.SelectedValue.ToString, TextBoxCodigo.Text, CheckActivo.Checked.ToString, CDate("01/01/1950"), TextBoxSerial.Text, TextBoxDescripcion.Text, ListMarcaEquipo.SelectedValue.ToString, TextModeloEquipo.Text, TextBoxMAC.Text)
                    Else
                        FnAgregarEquipo(ListTipoEquipo.SelectedValue.ToString, TextBoxCodigo.Text, CheckActivo.Checked.ToString, TextFechaCompra.Text, TextBoxSerial.Text, TextBoxDescripcion.Text, ListMarcaEquipo.SelectedValue.ToString, TextModeloEquipo.Text, TextBoxMAC.Text)
                    End If

                    'BtnGuardar.Visible = True
                    BtnAgregar.Visible = False

                    FunMostarAdjuntarImagenEquipo(True)

                    VistaFotosEquipo.Visible = True
                    VistaFotosEquipo.DataBind()

                    GridComponentes.Visible = True
                    GridComponentes.DataBind()

                    PanelDatosEquipo.Enabled = False

                Else
                    FunFormModal(3)
                    LabelMsg.Text = "Debe seleccionar una marca para el equipo."
                End If
            Else
                FunFormModal(3)
                LabelMsg.Text = "Debe seleccionar un tipo de equipo."
            End If
        Else
            FunFormModal(3)
            'LabelMsg.Text = "Debe seleccionar un tipo de equipo."

        End If





    End Sub


    Private Function FnAgregarEquipo(ByVal Tipo As String, ByVal Codigo As String, ByVal Activo As String, ByVal FechaCompra As Date, ByVal Serial As String, ByVal Descripcion As String, ByVal Marca As String, ByVal Modelo As String, ByVal Mac As String)

        Dim vbActivo As String = 0

        If Activo = "True" Then vbActivo = 1

        If CDate(FechaCompra).Year > 1950 Then
            DataConsultas.InsertCommand = "INSERT INTO Sis_HV_Equipos(TipoEquipo, CodigoEquipo, Activo, FechaCompra, Serial, Descripcion, Marca, Modelo, MAC) VALUES (" & Tipo & ", N'" & Codigo & "', " & vbActivo & ", CONVERT (DATETIME, '" & FechaCompra.Date.Year & "-" & FechaCompra.Date.Month & "-" & FechaCompra.Date.Day & " 00:00:00', 102), N'" & Serial & "', N'" & Descripcion & "', " & Marca & ", N'" & Modelo & "', N'" & Mac & "')"
        Else
            DataConsultas.InsertCommand = "INSERT INTO Sis_HV_Equipos(TipoEquipo, CodigoEquipo, Activo, Serial, Descripcion, Marca, Modelo, MAC) VALUES (" & Tipo & ", N'" & Codigo & "', " & vbActivo & ", N'" & Serial & "', N'" & Descripcion & "', " & Marca & ", N'" & Modelo & "', N'" & Mac & "')"
            'Sin fecha Compra
        End If

        'DataConsultas.InsertCommand = "INSERT INTO Sis_HV_Equipos(TipoEquipo, CodigoEquipo, Activo, FechaCompra, Serial, Descripcion, Marca) VALUES (" & Tipo & ", N'" & Codigo & "', " & vbActivo & ", CONVERT (DATETIME, '" & FechaCompra.Date.Year & "-" & FechaCompra.Date.Month & "-" & FechaCompra.Date.Day & " 00:00:00', 102), N'" & Serial & "', N'" & Descripcion & "', " & Marca & ")"
        'Label1.Text = DataConsultas.InsertCommand



        DataConsultas.Insert()
        LabelIdEquipo.Text = IdRegInsertado("Sis_HV_Equipos")


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

    Protected Sub BtnSubirArchivoEquipo_Click(sender As Object, e As System.EventArgs) Handles BtnSubirArchivoEquipo.Click


        Dim path As String = Server.MapPath("~/Sistemas/Bitacora_PMP/Fotos/")
        Dim fileOK As Boolean = False

        If FileUpload2.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower()
            Dim allowedExtensions As String() = {".tif", ".jpg", ".jpeg", ".png", ".gif"} ', ".xls", ".xlsx", ".pdf", ".doc", ".docx", ".txt"}
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                End If
            Next

            If fileOK Then
                Try
                    Dim vbGuid As String
                    Dim vbNomArchivo As String
                
                    vbGuid = System.Guid.NewGuid.ToString

                    vbNomArchivo = vbGuid & "_" & FileUpload2.FileName
                
                    FileUpload2.PostedFile.SaveAs(path & vbNomArchivo)

                    'ImagenCompo.ImageUrl = path & vbNomArchivo
                    LabelUpload.Text = "Archivo subido con exito!"
                    
                    FunAgregarUrlFotoEquipo("~/Sistemas/Bitacora_PMP/Fotos/" + vbNomArchivo, LabelIdEquipo.Text)


                Catch ex As Exception
                    LabelUploadEquipo.Text = ex.Message '"No se pudo subir el archivo."
                End Try
            Else
                LabelUploadEquipo.Text = "Tipo de archivo no permitido."
            End If
        Else
            LabelUploadEquipo.Text = FileUpload1.FileName.ToString
        End If

    End Sub


    Private Function FunMostarAdjuntarImagenEquipo(ByVal Mostrar As Boolean)

        Literal1.Visible = Mostrar
        FileUpload2.Visible = Mostrar
        BtnSubirArchivoEquipo.Visible = Mostrar
        BtnAgregarComponente.Visible = Mostrar
        BtnUbicaciones.Visible = Mostrar
        BtnMantenimeintos.Visible = Mostrar

    End Function

    Protected Sub BtnAgregarComponente_Click(sender As Object, e As System.EventArgs) Handles BtnAgregarComponente.Click


        FunFormModal(0)
        LimpiarComponentes()


    End Sub

    Private Function FunAgregarUrlFotoEquipo(ByVal Url As String, ByVal IdEquipo As String)

        DataConsultas.InsertCommand = "INSERT INTO Sis_HV_FotosEquipos(UrlFoto, IdEquipo) VALUES (N'" & Url & "', " & IdEquipo & ")"
        DataConsultas.Insert()

        VistaFotosEquipo.DataBind()

    End Function

    Protected Sub ListComponentes_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListComponentes.SelectedIndexChanged

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String = ""
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT Sis_HV_UnidadesMedida.AbreviaturaUnidad, Sis_HV_UnidadesMedida.NomUnidad FROM Sis_HV_TiposComponentes INNER JOIN Sis_HV_UnidadesMedida ON Sis_HV_TiposComponentes.UnidadMedida = Sis_HV_UnidadesMedida.IdUnidadMedida WHERE Sis_HV_TiposComponentes.IdTipoComponente = " & ListComponentes.SelectedValue.ToString

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        LabelTamaño.Text = "2"
        If objDS.Tables(0).Rows.Count > 0 Then
            LabelTamaño.Text = objDS.Tables(0).Rows(0).Item(1).ToString
        End If

        BtnMostrar_ModalPopupExtender.Show()

    End Sub

    Protected Sub BtnInsertarComponente_Click(sender As Object, e As System.EventArgs) Handles BtnInsertarComponente.Click

        Dim time As String
        Dim SQLa As String
        Dim ID As Integer
        Dim useer As String = Page.User.Identity.Name.ToString
        Dim timedatea As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        time = Rsa(0)
        Rsa.Close()




        Dim vbFecha As Date

        If IsDate(TextFechaInstalacion.Text) Then
            vbFecha = CDate(TextFechaInstalacion.Text)
        Else
            vbFecha = Now.Date
        End If


        If ListComponentes.SelectedValue = 1 Then
            LabelMsgCompo.Text = "Debe seleccionar un Tipo de Componente"
            LabelMsgCompo.ForeColor = Drawing.Color.Red
            BtnMostrar_ModalPopupExtender.Show()
            LabelMsgCompo.Visible = True
        Else
            If ListMarcaCompo.SelectedValue = 1 Then
                LabelMsgCompo.Text = "Debe seleccionar una marca para el componente"
                LabelMsgCompo.ForeColor = Drawing.Color.Red
                BtnMostrar_ModalPopupExtender.Show()
                LabelMsgCompo.Visible = True
            Else
                DataConsultas.InsertCommand = "INSERT INTO Sis_HV_Componentes (IdEquipo, IdTipo, IdMarca, Tamaño, Observaciones, FechaInstalacion, UrlFoto) VALUES (" & LabelIdEquipo.Text & ", " & ListComponentes.SelectedValue.ToString & ", " & ListMarcaCompo.SelectedValue.ToString & ", N'" & TextTamaño.Text & "', N'" & TextObservaciones.Text & "', CONVERT(DATETIME, '" & vbFecha.Year & "-" & vbFecha.Month & "-" & vbFecha.Day & " 00:00:00', 102), N'" & ImagenCompo.ImageUrl & "')"
                DataConsultas.Insert()


                Dim SQLa2 As String
                Dim timedatea2 As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
                Dim Rsa2 As SqlDataReader
                Dim Coma2 As New SqlCommand
                Coma2.Connection = timedatea2
                timedatea2.Open()
                SQLa2 = "SELECT  TOP 1 IdComponente from Sis_HV_Componentes order by IdComponente desc "
                Coma2 = New SqlCommand(SQLa2, timedatea2)
                Rsa2 = Coma2.ExecuteReader()
                Rsa2.Read()
                ID = Rsa2(0)
                Rsa2.Close()

                Dim IDD As String

                IDD = "Com_" & ID
                DataNov0.UpdateCommand = "INSERT Sis_Hv_Audubica( Id_ubicaciones,Usuario,Dates) VALUES ('" & IDD & "','" & useer & "','" & time & "')"
                DataNov0.Update()






                'Label1.Text = DataConsultas.InsertCommand
                LabelMsgCompo.Visible = False
            End If
        End If

        GridComponentes.DataBind()

    End Sub

    Private Function LimpiarComponentes()

        ListComponentes.SelectedIndex = -1
        ListMarcaCompo.SelectedIndex = -1
        TextTamaño.Text = ""
        TextFechaInstalacion.Text = ""
        TextObservaciones.Text = ""
        ImagenCompo.Visible = False
        ImagenCompo.ImageUrl = ""
        LabelMsgCompo.Visible = False

        ListComponentes.DataBind()
        ListMarcaCompo.DataBind()

    End Function

    Protected Sub GridComponentes_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridComponentes.RowCommand

        'Label1.Text = "entro"

        'Dim a As Integer

        'a = CInt(e.CommandArgument)

        If e.CommandName = "Instalar" Then

            'Label1.Visible = True
            'Dim vbGrid As GridView
            'Label1.Text = GridComponentes.DataKeys(e.CommandArgument.ToString).Item(3).ToString

            Dim Estado As Integer = 1

            If GridComponentes.DataKeys(e.CommandArgument.ToString).Item(3).ToString = "True" Then Estado = 0

            DataConsultas.UpdateCommand = "UPDATE Sis_HV_Componentes SET Sustituido = " & Estado.ToString & " WHERE IdComponente = " & GridComponentes.DataKeys(e.CommandArgument.ToString).Item(0).ToString
            If Estado = 1 Then DataConsultas.UpdateCommand = "UPDATE Sis_HV_Componentes SET Sustituido = " & Estado.ToString & ", FechaSustitucion = GETDATE()  WHERE IdComponente = " & GridComponentes.DataKeys(e.CommandArgument.ToString).Item(0).ToString

            DataConsultas.Update()

            GridComponentes.DataBind()
            'UPDATE Sis_HV_Componentes SET Sustituido = 1 WHERE (IdComponente = 11)

            'Label1.Text = e.CommandArgument.ToString

        End If




    End Sub

    Protected Sub GridComponentes_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridComponentes.SelectedIndexChanged

        
        FunFormModal(1)
        ImagenCompoGrande.ImageUrl = GridComponentes.DataKeys(GridComponentes.SelectedIndex).Item(1).ToString
        LabelObsCompo.Text = GridComponentes.DataKeys(GridComponentes.SelectedIndex).Item(2).ToString

    End Sub

    Private Function FunFormModal(ByVal Formulario As Integer)



        PanelAgregarComponente.Visible = False  '0
        PanelFotoCompo.Visible = False          '1
        PanelUbicaciones.Visible = False        '2
        PanelMsg.Visible = False                '3
        PanelHistory.Visible = False             '4
        If Formulario = 0 Then
            PanelAgregarComponente.Visible = True
        ElseIf Formulario = 1 Then
            PanelFotoCompo.Visible = True
        ElseIf Formulario = 2 Then
            PanelUbicaciones.Visible = True
        ElseIf Formulario = 3 Then
            PanelMsg.Visible = True
        ElseIf Formulario = 4 Then
            PanelHistory.Visible = True
        End If

        BtnMostrar_ModalPopupExtender.Show()


    End Function

    Protected Sub BtnUbicaciones_Click(sender As Object, e As System.EventArgs) Handles BtnUbicaciones.Click

        FunFormModal(2)
        GridUbicaciones.DataBind()
        PanelNuevaUbicacion.Visible = False
        BtnNuevaUbicacion.Visible = True
        PanelHistory.Visible = False
    End Sub
    Protected Sub BtnMantenimeintos_Click(sender As Object, e As System.EventArgs) Handles BtnMantenimeintos.Click

        FunFormModal(4)
        BtnMostrar_ModalPopupExtender.Show()
        GridEventos.DataBind()


        PanelHistory.Visible = True


    End Sub
    Protected Sub ListDependencias_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListDependencias.SelectedIndexChanged

        BtnMostrar_ModalPopupExtender.Show()
        ListPuntos.DataBind()

    End Sub

    Protected Sub BtnGuardarUbicacion_Click(sender As Object, e As System.EventArgs) Handles BtnGuardarUbicacion.Click

        Dim vbFecha As Date
        Dim time As String
        Dim SQLa As String
        Dim ID As Integer
        Dim useer As String = Page.User.Identity.Name.ToString
        Dim timedatea As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        time = Rsa(0)
        Rsa.Close()

        LabelIdUsEntrego.Text = FunUsExiste(TextUsEntrego.Text)
        LabelIdUsEntrego.Visible = False
        LabelIdUsRecibio.Text = FunUsExiste(TextUsRecibio.Text)
        LabelIdUsRecibio.Visible = False

        If CInt(LabelIdUsEntrego.Text) > 0 Then
            If CInt(LabelIdUsRecibio.Text) > 0 Then
                If IsDate(TextFechaUbicacion.Text) Then
                    vbFecha = CDate(TextFechaUbicacion.Text)
                Else
                    vbFecha = Now.Date
                End If

                DataConsultas.UpdateCommand = "UPDATE Sis_HV_UbicacionesEquipos SET  UbicacionActual = 0 WHERE IdEquipo = " + LabelIdEquipo.Text
                DataConsultas.Update()

                DataConsultas.InsertCommand = "INSERT INTO Sis_HV_UbicacionesEquipos(IdEquipo, IdPuntoTrabajo, FechaInstalacion, Observaciones, FuncionarioEntrega, FuncionarioRecibe, NombreEquipo, DireccionIP, UbicacionActual, DireccionIP2, TipoConexion) VALUES (" & LabelIdEquipo.Text & ", " & ListPuntos.SelectedValue.ToString & ", CONVERT (DATETIME, '" & vbFecha.Year & "-" & vbFecha.Month & "-" & vbFecha.Day & " 00:00:00', 102), N'" & TextObsUbicacion.Text & "', " & LabelIdUsEntrego.Text & ", " & LabelIdUsRecibio.Text & ", N'" & TextNombreEnRed.Text & "', N'" & TextDireccionIP.Text & "' , 1, N'" & TextDireccionIP2.Text & "', " & ListTipoConexion.SelectedValue & ")" 'TextObsUbicacion
                DataConsultas.Insert()
                Dim SQLa2 As String
                Dim timedatea2 As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
                Dim Rsa2 As SqlDataReader
                Dim Coma2 As New SqlCommand
                Coma2.Connection = timedatea2
                timedatea2.Open()
                SQLa2 = "SELECT  TOP 1 IdUbicacion from Sis_HV_UbicacionesEquipos order by IdUbicacion desc "
                Coma2 = New SqlCommand(SQLa2, timedatea2)
                Rsa2 = Coma2.ExecuteReader()
                Rsa2.Read()
                ID = Rsa2(0)
                Rsa2.Close()

                Dim IDD As String

                IDD = "Ub_" & ID
                DataNov0.UpdateCommand = "INSERT Sis_Hv_Audubica( Id_ubicaciones,Usuario,Dates) VALUES ('" & IDD & "','" & useer & "','" & time & "')"
                DataNov0.Update()

                GridUbicaciones.DataBind()
                FunUbicacionIP()

                PanelNuevaUbicacion.Enabled = False
            Else
                LabelIdUsRecibio.Visible = True
                LabelIdUsRecibio.Text = "<br/>Selección inválida de usuario"
            End If
        Else
            LabelIdUsEntrego.Text = "<br/>Selección inválida de usuario"
            LabelIdUsEntrego.Visible = True
        End If

        BtnMostrar_ModalPopupExtender.Show()

    End Sub


    Private Function FunUsExiste(ByVal NomUsuario As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        'Dim filtro As String
        'filtro = prefixText

        StrConsulta = "SELECT OID FROM  GENUSUARIO WHERE (USUESTADO = 1) AND (USUDESCRI + N' (' + USUNOMBRE + N')' = N'" & NomUsuario & "')"

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


    Protected Sub BtnMostrarNuevoEquipo_Click(sender As Object, e As System.EventArgs) Handles BtnMostrarNuevoEquipo.Click

        PanelDatosEquipo.Visible = True
        PanelDatosEquipo.Enabled = True
        PanelBusqPorComponente.Visible = False
        PanelHistory.Visible = False
        GridEquipos.Visible = False
        BtnMostrarNuevoEquipo.Visible = False
        BtnFinalizar.Visible = True
        BtnAgregar.Visible = True
        BtnBuscarCompo.Enabled = False

        LabelIdEquipo.Text = ""
        TextBoxCodigo.Text = ""
        TextFechaCompra.Text = ""
        TextBoxSerial.Text = ""
        TextModeloEquipo.Text = ""
        TextBoxDescripcion.Text = ""
        LabelCantCompo.Text = ""
        TextBoxMAC.Text = ""
        ListTipoEquipo.SelectedIndex = -1
        ListMarcaEquipo.SelectedIndex = -1
        PanelFormEquipo.Visible = True
        ListDependenciasFil.Enabled = False
        TxtSerialEquipoFil.Enabled = False
        ListTipoEqFil.Enabled = False
        BtnBuscarCompo.Enabled = False

    End Sub

    Protected Sub BtnGuardar_Click(sender As Object, e As System.EventArgs) Handles BtnGuardar.Click




    End Sub

    Protected Sub GridUbicaciones_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridUbicaciones.SelectedIndexChanged

        BtnMostrar_ModalPopupExtender.Show()
        LblFormUbicaciones.Text = "EDITAR UBICACION"

        BtnGuardarUbicacion.Visible = False
        BtnActuUbicacion.Visible = True
        'LblFormUbicaciones.Text = GridUbicaciones.SelectedValue.ToString

        ListDependencias.DataBind()

        FunDatosUbicacion(GridUbicaciones.SelectedValue.ToString)

        PanelNuevaUbicacion.Visible = True
        PanelNuevaUbicacion.Enabled = True
        BtnNuevaUbicacion.Visible = False

        PanelHistory.Visible = False
    End Sub

    Private Function FunDatosUbicacion(ByVal IdUbicacion As String)


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT Sis_HV_UbicacionesEquipos.IdUbicacion, Sis_HV_UbicacionesEquipos.IdEquipo, Sis_HV_PuntosTrabajo.IdDependencia, Sis_HV_UbicacionesEquipos.IdPuntoTrabajo, Sis_HV_UbicacionesEquipos.FechaInstalacion, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.DireccionIP2, Sis_HV_UbicacionesEquipos.TipoConexion, Sis_HV_UbicacionesEquipos.NombreEquipo, Sis_HV_UbicacionesEquipos.Observaciones, Sis_HV_UbicacionesEquipos.FuncionarioEntrega, Sis_HV_UbicacionesEquipos.FuncionarioRecibe, Sis_HV_UbicacionesEquipos.FechaRetiro FROM Sis_HV_UbicacionesEquipos INNER JOIN Sis_HV_PuntosTrabajo ON Sis_HV_UbicacionesEquipos.IdPuntoTrabajo = Sis_HV_PuntosTrabajo.IdPuntoTrabajo WHERE IdUbicacion = " + IdUbicacion

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()
        Dim i As Integer



        If objDS.Tables(0).Rows.Count > 0 Then
            LabelUbicacion.Text = objDS.Tables(0).Rows(0).Item(1).ToString
            Label_IP.Text = objDS.Tables(0).Rows(0).Item(0).ToString

            For i = 0 To ListDependencias.Items.Count - 1
                If ListDependencias.Items.Item(i).Value = objDS.Tables(0).Rows(0).Item(2).ToString Then
                    ListDependencias.SelectedIndex = i
                    ListPuntos.DataBind()
                    Exit For
                End If
            Next

            For i = 0 To ListPuntos.Items.Count - 1
                If ListPuntos.Items.Item(i).Value = objDS.Tables(0).Rows(0).Item(3).ToString Then
                    ListPuntos.SelectedIndex = i
                    Exit For
                End If
            Next

            TextFechaUbicacion.Text = objDS.Tables(0).Rows(0).Item(4).ToString.Substring(0, 10)
            TextDireccionIP.Text = objDS.Tables(0).Rows(0).Item(5).ToString
            TextDireccionIP2.Text = objDS.Tables(0).Rows(0).Item(6).ToString

            For i = 0 To ListTipoConexion.Items.Count - 1
                If ListTipoConexion.Items.Item(i).Value = objDS.Tables(0).Rows(0).Item(7).ToString Then
                    ListTipoConexion.SelectedIndex = i
                    Exit For
                End If
            Next


            TextNombreEnRed.Text = objDS.Tables(0).Rows(0).Item(8).ToString
            TextObsUbicacion.Text = objDS.Tables(0).Rows(0).Item(9).ToString

            TextUsEntrego.Text = FunNomUs(objDS.Tables(0).Rows(0).Item(10).ToString)
            LabelIdUsEntrego.Text = objDS.Tables(0).Rows(0).Item(10).ToString

            TextUsRecibio.Text = FunNomUs(objDS.Tables(0).Rows(0).Item(11).ToString)
            LabelIdUsRecibio.Text = objDS.Tables(0).Rows(0).Item(11).ToString

        End If


    End Function

    Protected Sub BtnActuUbicacion_Click(sender As Object, e As System.EventArgs) Handles BtnActuUbicacion.Click

        Dim vbFecha As Date
        Dim SQLa As String
        Dim time As String
        Dim useer As String = Page.User.Identity.Name.ToString
        Dim timedatea As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        time = Rsa(0)
        Rsa.Close()
        LabelIdUsEntrego.Text = FunUsExiste(TextUsEntrego.Text)
        LabelIdUsEntrego.Visible = False
        LabelIdUsRecibio.Text = FunUsExiste(TextUsRecibio.Text)
        LabelIdUsRecibio.Visible = False

        If CInt(LabelIdUsEntrego.Text) > 0 Then
            If CInt(LabelIdUsRecibio.Text) > 0 Then
                If IsDate(TextFechaUbicacion.Text) Then
                    vbFecha = CDate(TextFechaUbicacion.Text)
                Else
                    vbFecha = Now.Date
                End If

                DataConsultas.UpdateCommand = "UPDATE Sis_HV_UbicacionesEquipos SET IdEquipo = " & LabelIdEquipo.Text & ", IdPuntoTrabajo = " & ListPuntos.SelectedValue.ToString & ", FechaInstalacion = CONVERT (DATETIME, '" & vbFecha.Year & "-" & vbFecha.Month & "-" & vbFecha.Day & " 00:00:00', 102), Observaciones = N'" & TextObsUbicacion.Text & "', FuncionarioEntrega = " & LabelIdUsEntrego.Text & ", FuncionarioRecibe = " & LabelIdUsRecibio.Text & ", NombreEquipo = N'" & TextNombreEnRed.Text & "', DireccionIP = N'" & TextDireccionIP.Text & "', DireccionIP2 = N'" & TextDireccionIP2.Text & "', TipoConexion = " & ListTipoConexion.SelectedValue & "  WHERE IdUbicacion = " + GridUbicaciones.SelectedValue.ToString
                DataConsultas.Update()

                Dim IDD As String

                IDD = "Ub_" & GridUbicaciones.SelectedValue.ToString
                DataNov0.UpdateCommand = "INSERT Sis_Hv_Audubica( Id_ubicaciones,Usuario,Dates) VALUES ('" & IDD & "','" & useer & "','" & time & "')"
                DataNov0.Update()
                GridUbicaciones.DataBind()
                FunUbicacionIP()

                PanelNuevaUbicacion.Enabled = False
            Else
                LabelIdUsRecibio.Visible = True
                LabelIdUsRecibio.Text = "<br/>Selección inválida de usuario"
            End If
        Else
            LabelIdUsEntrego.Text = "<br/>Selección inválida de usuario"
            LabelIdUsEntrego.Visible = True
        End If

        BtnMostrar_ModalPopupExtender.Show()


    End Sub

    Private Function FunNomUs(ByVal IdUsuario As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        'filtro = prefixText

        StrConsulta = "SELECT USUDESCRI + N' (' + USUNOMBRE + N')' AS NomUsuario FROM  GENUSUARIO WHERE OID = " + IdUsuario

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
            Return ""
        End If

    End Function


    Protected Sub BtnNuevaUbicacion_Click(sender As Object, e As System.EventArgs) Handles BtnNuevaUbicacion.Click

        PanelNuevaUbicacion.Visible = True
        PanelNuevaUbicacion.Enabled = True
        BtnMostrar_ModalPopupExtender.Show()
        BtnNuevaUbicacion.Visible = False
        PanelHistory.Visible = False
        BtnGuardarUbicacion.Visible = True
        BtnActuUbicacion.Visible = False

        LblFormUbicaciones.Text = "NUEVA UBICACION"


        ListDependencias.SelectedIndex = -1
        ListPuntos.SelectedIndex = -1
        TextFechaUbicacion.Text = ""
        TextDireccionIP.Text = ""
        TextNombreEnRed.Text = ""
        TextObsUbicacion.Text = ""
        TextUsEntrego.Text = ""
        TextUsRecibio.Text = ""

    End Sub

    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()> _
    Public Shared Function BusqUsuario(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText

        StrConsulta = "SELECT USUDESCRI + N' (' + USUNOMBRE + N')' AS NomUsuario FROM  GENUSUARIO WHERE (USUESTADO = 1) AND (USUDESCRI + N' (' + USUNOMBRE + N')' LIKE N'%" & filtro & "%') ORDER BY NomUsuario"

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

    Private Function FunUbicacionIP()


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_PuntosTrabajo.NombrePunto + N' (' + Sis_HV_Dependencias.NombreDependecia + N')' AS Ubicacion FROM Sis_HV_UbicacionesEquipos INNER JOIN Sis_HV_PuntosTrabajo ON Sis_HV_UbicacionesEquipos.IdPuntoTrabajo = Sis_HV_PuntosTrabajo.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia WHERE (Sis_HV_UbicacionesEquipos.IdEquipo = " & LabelIdEquipo.Text & ") AND (Sis_HV_UbicacionesEquipos.UbicacionActual = 1)"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            LabelUbicacion.Text = objDS.Tables(0).Rows(0).Item(1).ToString
            Label_IP.Text = objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            LabelUbicacion.Text = "No tiene ubicación activa"
            Label_IP.Text = "No tiene Dirección IP asignada"
        End If


    End Function


    Private Function FunDatosEquipo()

        'LabelIdEquipo.Text = GridEquipos.SelectedValue.ToString
        ListEstadoComponentes.SelectedIndex = 0


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter
        Dim i As Integer

        'StrConsulta = "SELECT TOP (1) Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.FechaCompra, Sis_HV_Equipos.FechaCreacion, Sis_HV_Equipos.Serial, Sis_HV_Equipos.Modelo, Sis_HV_Equipos.Descripcion, Sis_HV_Equipos.Marca, Sis_HV_Equipos.Activo, Sis_HV_Equipos.TipoEquipo, Sis_HV_Equipos.MAC, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.DireccionIP2, Sis_HV_TiposConexionRed.NomTipoConexion, Sis_HV_PuntosTrabajo.NombrePunto + N' (' + Sis_HV_Dependencias.NombreDependecia + N')' AS Ubicacion FROM Sis_HV_Equipos INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_Equipos.IdEquipo = Sis_HV_UbicacionesEquipos.IdEquipo INNER JOIN Sis_HV_TiposConexionRed ON Sis_HV_UbicacionesEquipos.TipoConexion = Sis_HV_TiposConexionRed.IdTipoConexion INNER JOIN Sis_HV_PuntosTrabajo ON Sis_HV_UbicacionesEquipos.IdPuntoTrabajo = Sis_HV_PuntosTrabajo.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia WHERE Sis_HV_Equipos.IdEquipo = " & LabelIdEquipo.Text & " AND Sis_HV_UbicacionesEquipos.UbicacionActual = 1" 'ORDER BY Sis_HV_UbicacionesEquipos.IdUbicacion Desc"

        StrConsulta = "SELECT TOP (1) Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.FechaCompra, Sis_HV_Equipos.FechaCreacion, Sis_HV_Equipos.Serial, Sis_HV_Equipos.Modelo, Sis_HV_Equipos.Descripcion, Sis_HV_Equipos.Marca, Sis_HV_Equipos.Activo, Sis_HV_Equipos.TipoEquipo, Sis_HV_Equipos.MAC, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.DireccionIP2, Sis_HV_TiposConexionRed.NomTipoConexion, Sis_HV_PuntosTrabajo.NombrePunto + N' (' + Sis_HV_Dependencias.NombreDependecia + N')' AS Ubicacion FROM Sis_HV_TiposConexionRed INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_TiposConexionRed.IdTipoConexion = Sis_HV_UbicacionesEquipos.TipoConexion INNER JOIN Sis_HV_PuntosTrabajo ON Sis_HV_UbicacionesEquipos.IdPuntoTrabajo = Sis_HV_PuntosTrabajo.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia RIGHT OUTER JOIN Sis_HV_Equipos ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_Equipos.IdEquipo = " & LabelIdEquipo.Text & ") AND (Sis_HV_UbicacionesEquipos.UbicacionActual = 1 OR Sis_HV_UbicacionesEquipos.UbicacionActual IS NULL)"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            TextBoxCodigo.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            TextFechaCompra.Text = objDS.Tables(0).Rows(0).Item(1).ToString
            TextBoxSerial.Text = objDS.Tables(0).Rows(0).Item(3).ToString
            TextModeloEquipo.Text = objDS.Tables(0).Rows(0).Item(4).ToString
            TextBoxDescripcion.Text = objDS.Tables(0).Rows(0).Item(5).ToString
            TextBoxMAC.Text = objDS.Tables(0).Rows(0).Item(9).ToString
            LabelUbicacion.Text = objDS.Tables(0).Rows(0).Item(13).ToString
            Label_IP.Text = objDS.Tables(0).Rows(0).Item(10).ToString & " - IP2: " & objDS.Tables(0).Rows(0).Item(11).ToString
            LabelTipoConexion.Text = objDS.Tables(0).Rows(0).Item(12).ToString

            ListTipoEquipo.DataBind()

            For i = 0 To ListTipoEquipo.Items.Count - 1
                'Label1.Text = ListTipoEquipo.Items.Count 'Label1.Text + " " + ListTipoEquipo.Items(i).Value.ToString
                If ListTipoEquipo.Items(i).Value.ToString = objDS.Tables(0).Rows(0).Item(8).ToString Then ListTipoEquipo.SelectedIndex = i
            Next

            ListMarcaEquipo.DataBind()

            For i = 0 To ListMarcaEquipo.Items.Count - 1
                If ListMarcaEquipo.Items(i).Value.ToString = objDS.Tables(0).Rows(0).Item(6).ToString Then ListMarcaEquipo.SelectedIndex = i
            Next

        Else

        End If

    End Function

    'Protected Sub TextFunEntrego_TextChanged(sender As Object, e As System.EventArgs) Handles TextFunEntrego.TextChanged
    '    'BtnMostrar_ModalPopupExtender.Show()
    'End Sub

    Protected Sub GridEquipos_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridEquipos.SelectedIndexChanged

        LabelIdEquipo.Text = GridEquipos.SelectedValue.ToString

        FunDatosEquipo()
        PanelDatosEquipo.Visible = True
        GridComponentes.Visible = True
        PanelDatosEquipo.Enabled = False
        GridEquipos.Visible = False
        PanelFormEquipo.Visible = True
        PanelBusqPorComponente.Visible = False
        PanelHistory.visible = False
        BtnMostrarNuevoEquipo.Visible = False

        BtnAgregar.Visible = False

        FunMostarAdjuntarImagenEquipo(True)

        VistaFotosEquipo.Visible = True
        VistaFotosEquipo.DataBind()

        BtnFinalizar.Visible = True
        BtnEditarEq.Visible = True
        ListEstadoComponentes.Visible = True
        ListDependenciasFil.Enabled = False
        TxtSerialEquipoFil.Enabled = False
        ListTipoEqFil.Enabled = False

    End Sub

    Protected Sub BtnFinalizar_Click(sender As Object, e As System.EventArgs) Handles BtnFinalizar.Click

        GridEquipos.Visible = True
        BtnFinalizar.Visible = False
        PanelHistory.Visible = True
        PanelDatosEquipo.Visible = False
        BtnMostrarNuevoEquipo.Visible = True
        FunMostarAdjuntarImagenEquipo(False)

        VistaFotosEquipo.Visible = False
        GridComponentes.Visible = False
        ListEstadoComponentes.Visible = False
        ListDependenciasFil.SelectedIndex = -1
        ListTipoEqFil.SelectedIndex = -1
        PanelFormEquipo.Visible = False
        ListDependenciasFil.Enabled = True
        TxtSerialEquipoFil.Enabled = True
        ListTipoEqFil.Enabled = True
        BtnBuscarCompo.Enabled = True
        BtnEditarEq.Visible = False

        GridEquipos.DataBind()
    End Sub


    Private Function FunEquipoExiste() As Boolean

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        'Dim filtro As String
        'filtro = prefixText

        'StrConsulta = "SELECT OID FROM  GENUSUARIO WHERE (USUESTADO = 1) AND (USUDESCRI + N' (' + USUNOMBRE + N')' = N'" & NomUsuario & "')"

        If TextBoxSerial.Text = "" Then
            StrConsulta = "SELECT IdEquipo, CodigoEquipo FROM Sis_HV_Equipos WHERE MAC = N'" & TextBoxMAC.Text & "'"
        ElseIf TextBoxMAC.Text = "" Then
            StrConsulta = "SELECT IdEquipo, CodigoEquipo FROM Sis_HV_Equipos WHERE Serial = N'" & TextBoxSerial.Text & "'"
        Else
            StrConsulta = "SELECT IdEquipo, CodigoEquipo FROM Sis_HV_Equipos WHERE MAC = N'" & TextBoxMAC.Text & "' OR Serial = N'" & TextBoxSerial.Text & "'"
        End If

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            LabelMsg.Text = "La MAC o el Serial ya estan asignados Equipo " & objDS.Tables(0).Rows(0).Item(1).ToString & " (ID: " & objDS.Tables(0).Rows(0).Item(0).ToString & ")"
            Return True
        Else
            Return False
        End If

    End Function


    Protected Sub ListEstadoComponentes_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListEstadoComponentes.SelectedIndexChanged

        GridComponentes.Columns(4).Visible = False
        If ListEstadoComponentes.SelectedValue = 1 Then
            GridComponentes.Columns(4).Visible = True
        End If

    End Sub

    Protected Sub GridComponentes_DataBound(sender As Object, e As System.EventArgs) Handles GridComponentes.DataBound

        LabelCantCompo.Text = GridComponentes.Rows.Count.ToString + " componentes encontrados."

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BtnMantenimeintos.Visible = True


    End Sub

    Protected Sub ListDependenciasFil_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListDependenciasFil.SelectedIndexChanged
        
        If ListDependenciasFil.SelectedValue = "1" Then
            DataListEquipos.SelectCommand = "SELECT Sis_HV_Equipos.IdEquipo, Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.Serial, Sis_HV_TiposEquipo.NomTipoEquipo, Sis_HV_Marcas_1.NombreMarca, Sis_HV_Equipos.Activo, Sis_HV_Dependencias.NombreDependecia, Sis_HV_PuntosTrabajo.NombrePunto, CASE WHEN Sis_HV_PuntosTrabajo.IdDependencia IS NULL THEN 1 ELSE Sis_HV_PuntosTrabajo.IdDependencia END AS IdDependencia, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia RIGHT OUTER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_1 INNER JOIN Sis_HV_Equipos ON Sis_HV_Marcas_1.IdMarca = Sis_HV_Equipos.Marca INNER JOIN Sis_HV_TiposEquipo ON Sis_HV_Equipos.TipoEquipo = Sis_HV_TiposEquipo.IdTipoEquipo ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_UbicacionesEquipos.UbicacionActual = 1 OR Sis_HV_UbicacionesEquipos.UbicacionActual IS NULL)"
        Else
            DataListEquipos.SelectCommand = "SELECT Sis_HV_Equipos.IdEquipo, Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.Serial, Sis_HV_TiposEquipo.NomTipoEquipo, Sis_HV_Marcas_1.NombreMarca, Sis_HV_Equipos.Activo, Sis_HV_Dependencias.NombreDependecia, Sis_HV_PuntosTrabajo.NombrePunto, CASE WHEN Sis_HV_PuntosTrabajo.IdDependencia IS NULL THEN 1 ELSE Sis_HV_PuntosTrabajo.IdDependencia END AS IdDependencia, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia RIGHT OUTER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_1 INNER JOIN Sis_HV_Equipos ON Sis_HV_Marcas_1.IdMarca = Sis_HV_Equipos.Marca INNER JOIN Sis_HV_TiposEquipo ON Sis_HV_Equipos.TipoEquipo = Sis_HV_TiposEquipo.IdTipoEquipo ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_UbicacionesEquipos.UbicacionActual = 1 OR Sis_HV_UbicacionesEquipos.UbicacionActual IS NULL) AND Sis_HV_PuntosTrabajo.IdDependencia = " & ListDependenciasFil.SelectedValue.ToString
        End If

        TxtSerialEquipoFil.Text = ""

        GridEquipos.DataBind()

    End Sub

    Protected Sub GridEquipos_DataBound(sender As Object, e As System.EventArgs) Handles GridEquipos.DataBound

        LabelCantEquipos.Text = GridEquipos.Rows.Count.ToString + " Equipos encontrados."

    End Sub

    Protected Sub TxtSerialEquipoFil_TextChanged(sender As Object, e As System.EventArgs) Handles TxtSerialEquipoFil.TextChanged

        'If ListDependenciasFil.SelectedValue = "1" Then
        'DataListEquipos.SelectCommand = "SELECT Sis_HV_Equipos.IdEquipo, Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.Serial, Sis_HV_TiposEquipo.NomTipoEquipo, Sis_HV_Marcas_1.NombreMarca, Sis_HV_Equipos.Activo, Sis_HV_Dependencias.NombreDependecia, Sis_HV_PuntosTrabajo.NombrePunto, CASE WHEN Sis_HV_PuntosTrabajo.IdDependencia IS NULL THEN 1 ELSE Sis_HV_PuntosTrabajo.IdDependencia END AS IdDependencia FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia RIGHT OUTER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_1 INNER JOIN Sis_HV_Equipos ON Sis_HV_Marcas_1.IdMarca = Sis_HV_Equipos.Marca INNER JOIN Sis_HV_TiposEquipo ON Sis_HV_Equipos.TipoEquipo = Sis_HV_TiposEquipo.IdTipoEquipo ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_UbicacionesEquipos.UbicacionActual = 1 OR Sis_HV_UbicacionesEquipos.UbicacionActual IS NULL)"
        'Else
        'DataListEquipos.SelectCommand = "SELECT Sis_HV_Equipos.IdEquipo, Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.Serial, Sis_HV_TiposEquipo.NomTipoEquipo, Sis_HV_Marcas_1.NombreMarca, Sis_HV_Equipos.Activo, Sis_HV_Dependencias.NombreDependecia, Sis_HV_PuntosTrabajo.NombrePunto, CASE WHEN Sis_HV_PuntosTrabajo.IdDependencia IS NULL THEN 1 ELSE Sis_HV_PuntosTrabajo.IdDependencia END AS IdDependencia FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia RIGHT OUTER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_1 INNER JOIN Sis_HV_Equipos ON Sis_HV_Marcas_1.IdMarca = Sis_HV_Equipos.Marca INNER JOIN Sis_HV_TiposEquipo ON Sis_HV_Equipos.TipoEquipo = Sis_HV_TiposEquipo.IdTipoEquipo ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_Equipos.Serial = N'" & TxtSerialEquipoFil.Text + "')"
        DataListEquipos.SelectCommand = "SELECT Sis_HV_Equipos.IdEquipo, Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.Serial, Sis_HV_TiposEquipo.NomTipoEquipo, Sis_HV_Marcas_1.NombreMarca, Sis_HV_Equipos.Activo, Sis_HV_Dependencias.NombreDependecia, Sis_HV_PuntosTrabajo.NombrePunto, CASE WHEN Sis_HV_PuntosTrabajo.IdDependencia IS NULL THEN 1 ELSE Sis_HV_PuntosTrabajo.IdDependencia END AS IdDependencia, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia RIGHT OUTER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_1 INNER JOIN Sis_HV_Equipos ON Sis_HV_Marcas_1.IdMarca = Sis_HV_Equipos.Marca INNER JOIN Sis_HV_TiposEquipo ON Sis_HV_Equipos.TipoEquipo = Sis_HV_TiposEquipo.IdTipoEquipo ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_Equipos.Serial LIKE N'%" & TxtSerialEquipoFil.Text + "%') AND (Sis_HV_UbicacionesEquipos.UbicacionActual = 1)"
        'End If

        ListDependenciasFil.SelectedIndex = -1

        GridEquipos.DataBind()


    End Sub


    Protected Sub BtnBuscarCompo_Click(sender As Object, e As System.EventArgs) Handles BtnBuscarCompo.Click

        PanelBusqPorComponente.Visible = True
        BtnMostrar_ModalPopupExtender.Show()

        TxtBuscObservacion.Text = ""

        PanelDatosEquipo.Visible = False
        PanelMsg.Visible = False
        PanelUbicaciones.Visible = False
        PanelHistory.Visible = False
        PanelAgregarComponente.Visible = False
        PanelFormEquipo.Visible = False
        PanelFotoCompo.Visible = False

    End Sub


    Protected Sub BtnBuscarDesc_Click(sender As Object, e As System.EventArgs) Handles BtnBuscarDesc.Click
        

        BtnMostrar_ModalPopupExtender.Show()
        GridBuscDescripcion.DataBind()



    End Sub

    Protected Sub GridBuscDescripcion_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridBuscDescripcion.SelectedIndexChanged

        LabelIdEquipo.Text = GridBuscDescripcion.SelectedValue.ToString

        FunDatosEquipo()
        PanelDatosEquipo.Visible = True
        PanelHistory.Visible = False
        GridComponentes.Visible = True
        PanelDatosEquipo.Enabled = False
        GridEquipos.Visible = False
        PanelFormEquipo.Visible = True
        PanelBusqPorComponente.Visible = False

        BtnMostrarNuevoEquipo.Visible = False

        BtnAgregar.Visible = False

        FunMostarAdjuntarImagenEquipo(True)

        VistaFotosEquipo.Visible = True
        VistaFotosEquipo.DataBind()

        BtnFinalizar.Visible = True
        ListEstadoComponentes.Visible = True
        ListDependenciasFil.Enabled = False
        TxtSerialEquipoFil.Enabled = False
        ListTipoEqFil.Enabled = False

    End Sub

    Protected Sub BtnEditarEq_Click(sender As Object, e As System.EventArgs) Handles BtnEditarEq.Click

        PanelDatosEquipo.Enabled = True
        BtnEditarEq.Visible = False

    End Sub

    Protected Sub BtnGuardarEq_Click(sender As Object, e As System.EventArgs) Handles BtnGuardarEq.Click

        Dim FechaCompra As Date = CDate("01/01/1950")
        Dim vbActivo As String = 0

        If IsDate(TextFechaCompra.Text) Then FechaCompra = CDate(TextFechaCompra.Text)

        If CheckActivo.Checked Then vbActivo = 1

        If CDate(FechaCompra).Year > 1950 Then
            DataConsultas.UpdateCommand = "UPDATE Sis_HV_Equipos SET FechaCompra = CONVERT (DATETIME, '" & FechaCompra.Date.Year & "-" & FechaCompra.Date.Month & "-" & FechaCompra.Date.Day & " 00:00:00', 102), UltimaEdicion = GETDATE(), Serial = N'" & TextBoxSerial.Text & "', Modelo = N'" & TextModeloEquipo.Text & "', Descripcion = N'" & TextBoxDescripcion.Text & "', Marca = " & ListMarcaEquipo.SelectedValue.ToString & ", Activo = " & vbActivo & ", TipoEquipo = " & ListTipoEquipo.SelectedValue.ToString & ", MAC = N'" & TextBoxMAC.Text & "', CodigoEquipo = N'" & TextBoxCodigo.Text & "' WHERE IdEquipo = " & LabelIdEquipo.Text
        Else
            DataConsultas.UpdateCommand = "UPDATE Sis_HV_Equipos SET FechaCompra = NULL, UltimaEdicion = GETDATE(), Serial = N'" & TextBoxSerial.Text & "', Modelo = N'" & TextModeloEquipo.Text & "', Descripcion = N'" & TextBoxDescripcion.Text & "', Marca = " & ListMarcaEquipo.SelectedValue.ToString & ", Activo = " & vbActivo & ", TipoEquipo = " & ListTipoEquipo.SelectedValue.ToString & ", MAC = N'" & TextBoxMAC.Text & "', CodigoEquipo = N'" & TextBoxCodigo.Text & "' WHERE IdEquipo = " & LabelIdEquipo.Text
            'Sin fecha Compra
        End If

        DataConsultas.Update()
        PanelDatosEquipo.Enabled = False
        BtnEditarEq.Visible = True

    End Sub

    Protected Sub ListTipoEqFil_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListTipoEqFil.SelectedIndexChanged

        If ListTipoEqFil.SelectedValue = "1" Then
            DataListEquipos.SelectCommand = "SELECT Sis_HV_Equipos.IdEquipo, Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.Serial, Sis_HV_TiposEquipo.NomTipoEquipo, Sis_HV_Marcas_1.NombreMarca, Sis_HV_Equipos.Activo, Sis_HV_Dependencias.NombreDependecia, Sis_HV_PuntosTrabajo.NombrePunto, CASE WHEN Sis_HV_PuntosTrabajo.IdDependencia IS NULL THEN 1 ELSE Sis_HV_PuntosTrabajo.IdDependencia END AS IdDependencia, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia RIGHT OUTER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_1 INNER JOIN Sis_HV_Equipos ON Sis_HV_Marcas_1.IdMarca = Sis_HV_Equipos.Marca INNER JOIN Sis_HV_TiposEquipo ON Sis_HV_Equipos.TipoEquipo = Sis_HV_TiposEquipo.IdTipoEquipo ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_UbicacionesEquipos.UbicacionActual = 1 OR Sis_HV_UbicacionesEquipos.UbicacionActual IS NULL)"
        Else
            DataListEquipos.SelectCommand = "SELECT Sis_HV_Equipos.IdEquipo, Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.Serial, Sis_HV_TiposEquipo.NomTipoEquipo, Sis_HV_Marcas_1.NombreMarca, Sis_HV_Equipos.Activo, Sis_HV_Dependencias.NombreDependecia, Sis_HV_PuntosTrabajo.NombrePunto, CASE WHEN Sis_HV_PuntosTrabajo.IdDependencia IS NULL THEN 1 ELSE Sis_HV_PuntosTrabajo.IdDependencia END AS IdDependencia, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia RIGHT OUTER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_1 INNER JOIN Sis_HV_Equipos ON Sis_HV_Marcas_1.IdMarca = Sis_HV_Equipos.Marca INNER JOIN Sis_HV_TiposEquipo ON Sis_HV_Equipos.TipoEquipo = Sis_HV_TiposEquipo.IdTipoEquipo ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_UbicacionesEquipos.UbicacionActual = 1 OR Sis_HV_UbicacionesEquipos.UbicacionActual IS NULL) AND Sis_HV_Equipos.TipoEquipo = " & ListTipoEqFil.SelectedValue.ToString
        End If

        TxtSerialEquipoFil.Text = ""

        GridEquipos.DataBind()


    End Sub

End Class
