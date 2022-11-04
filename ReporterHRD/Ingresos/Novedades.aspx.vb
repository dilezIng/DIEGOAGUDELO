Imports System.Data
Imports System.Data.SqlClient


Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Dim vbFunciones As New FunBasicas

    Protected Sub BtnBuscar_Click(sender As Object, e As System.EventArgs) Handles BtnBuscar.Click

        DataGridIngresos.SelectCommand = "SELECT ADNINGRESO.OID, ADNINGRESO.AINCONSEC, ADNINGRESO.AINURGCON, AINESTADO, ADNINGRESO.AINFECING, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC, GENPACIEN.PACPRINOM, GENPACIEN.PACSEGNOM, GENPACIEN.PACPRIAPE, GENPACIEN.PACSEGAPE FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID  "


        If ListTipoBusqueda.SelectedValue = "0" Then
            DataGridIngresos.SelectCommand = DataGridIngresos.SelectCommand + "WHERE ADNINGRESO.AINCONSEC = " & TextBusqueda.Text
        ElseIf ListTipoBusqueda.SelectedValue = "1" Then
            DataGridIngresos.SelectCommand = DataGridIngresos.SelectCommand + "WHERE GENPACIEN.PACNUMDOC = N'" & TextBusqueda.Text & "'"
        Else
            'Igual que si fuera 0
            DataGridIngresos.SelectCommand = DataGridIngresos.SelectCommand + "WHERE ADNINGRESO.AINCONSEC = " & TextBusqueda.Text
        End If


        DataGridIngresos.SelectCommand = DataGridIngresos.SelectCommand + " ORDER BY ADNINGRESO.AINCONSEC DESC"

        GridIngresos.SelectedIndex = -1
        GridIngresos.Visible = True
        GridIngresos.DataBind()

        BtnNuevaNovedad.Visible = False


    End Sub

    Protected Sub GridIngresos_RowCreated(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridIngresos.RowCreated


        Dim vbLabel, vbLabel1, vbLabel2 As Label

        vbLabel = e.Row.FindControl("LabelIngPor")
        vbLabel1 = e.Row.FindControl("labelCantNovs")
        vbLabel2 = e.Row.FindControl("LabelEstado")

        Try
            vbLabel.Text = vbFunciones.IngresoPor(e.Row.DataItem(2))
            vbLabel1.Text = FunCantsNovedades(e.Row.DataItem(0))
            vbLabel2.Text = vbFunciones.EstadoIngreso(e.Row.DataItem(3))
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub GridIngresos_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridIngresos.SelectedIndexChanged

        ListNovedades.DataBind()
        BtnNuevaNovedad.Visible = True
        BtnNuevaNovedad.Text = "Agregar Novedad al Ingreso " & GridIngresos.SelectedRow.Cells(0).Text


        Dim vbLabel, vbLabel1, vbLabel2 As Label

        For i = 0 To GridIngresos.Rows.Count - 1

            vbLabel = GridIngresos.Rows(i).FindControl("LabelIngPor")
            vbLabel1 = GridIngresos.Rows(i).FindControl("labelCantNovs")
            vbLabel2 = GridIngresos.Rows(i).FindControl("LabelEstado")


            Try
                vbLabel.Text = vbFunciones.IngresoPor(GridIngresos.DataKeys(i).Item(1)) ' Rows.SelectedDataKey(1).ToString) 'vbLabel1.Text
                vbLabel1.Text = FunCantsNovedades(GridIngresos.DataKeys(i).Item(0))
                vbLabel2.Text = vbFunciones.EstadoIngreso(GridIngresos.DataKeys(i).Item(2))
            Catch ex As Exception

            End Try
        Next




    End Sub

    Protected Sub BtnNuevaNovedad_Click(sender As Object, e As System.EventArgs) Handles BtnNuevaNovedad.Click

        'BtnNuevaNovedad.Visible = False
        'FunFormNuevaNovedad(True)
        BtnMostrar_ModalPopupExtender.Show()
        TextoNuevaNovedad.ReadOnly = False
        TextTitulo.Enabled = True
        TextoNuevaNovedad.Text = ""
        TextTitulo.Text = ""
        LabelIdNovedad.Text = ""
        LabelUsRegistra.Text = ""
        ListArchivos.DataBind()
        FileUpload1.Visible = False
        BtnAdjuntarArchivo.Visible = False
        LabelAdjArchivos.Text = "Puede adjuntar archivos despues de guardar el texto de la Novedad."
        LabelAdjArchivos.ForeColor = Drawing.Color.Blue
        BtnGrabarNovedad.Enabled = True

    End Sub

    Private Function FunFormNuevaNovedad(ByVal Mostrar As Boolean)

        TextoNuevaNovedad.Visible = Mostrar
        BtnGrabarNovedad.Visible = Mostrar
        BtnMostrar_ModalPopupExtender.Show()

    End Function


    Protected Sub BtnGrabarNovedad_Click(sender As Object, e As System.EventArgs) Handles BtnGrabarNovedad.Click

        'Label2.Text = TextoNuevaNovedad.Text

        If TextTitulo.Text.Length > 1 Then

            TextoNuevaNovedad.Text = TextoNuevaNovedad.Text.Replace("'", "`")


            DataConsultas.InsertCommand = "INSERT INTO Ing_Novedades(IdIngresoDGH, Titulo, Novedad, IdUsInserto) VALUES (" & GridIngresos.SelectedValue.ToString & ", N'" & TextTitulo.Text & "', N'" & TextoNuevaNovedad.Text & "', " & vbFunciones.IdUsuarioDgh(Membership.GetUser.ProviderUserKey.ToString) & ")"
            DataConsultas.Insert()

            LabelIdNovedad.Text = IdRegInsertado("Ing_Novedades").ToString

            ListNovedades.DataBind()
            'GridIngresos.DataBind()

            LabelUsRegistra.Text = NomUsuarioDgh(vbFunciones.IdUsuarioDgh(Membership.GetUser.ProviderUserKey.ToString))

            TextoNuevaNovedad.ReadOnly = True
            TextTitulo.Enabled = False
            FileUpload1.Visible = True
            BtnGrabarNovedad.Enabled = False
            BtnAdjuntarArchivo.Visible = True
            LabelAdjArchivos.Text = ""

        Else
            LabelAdjArchivos.Text = "La Novedad no tiene titulo, no se puede grabar."
            LabelAdjArchivos.ForeColor = Drawing.Color.Red
        End If


        BtnMostrar_ModalPopupExtender.Show()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        'LabelEstado.Text = Request.ServerVariables("REMOTE_ADDR")

    End Sub


    Private Function FunCantsNovedades(ByVal IdIngreso As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT IdNovedad FROM Ing_Novedades WHERE IdIngresoDGH = " & IdIngreso


        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()


        Return objDS.Tables(0).Rows.Count


    End Function

    Protected Sub GridIngresos_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridIngresos.RowCommand


    End Sub

    Protected Sub BtnAdjuntarArchivo_Click(sender As Object, e As System.EventArgs) Handles BtnAdjuntarArchivo.Click


        Dim path As String = Server.MapPath("~/Ingresos/Archivos/")
        Dim fileOK As Boolean = False

        If FileUpload1.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower()
            Dim allowedExtensions As String() = {".tif", ".jpg", ".jpeg", ".png", ".gif", ".pdf", ".doc", ".xls", ".xlsx", ".docx", ".ppt", ".pptx", ".txt"}
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                End If
            Next

            If fileOK Then
                Try
                    Dim vbGuid As String
                    'Dim vbIdArchivo As String
                    Dim vbNomArchivo As String

                    vbGuid = System.Guid.NewGuid.ToString

                    vbNomArchivo = vbGuid & "__" & FileUpload1.FileName

                    FileUpload1.PostedFile.SaveAs(path & vbNomArchivo)

                    LabelAdjArchivos.Text = "Archivo subido con éxito!"
                    LabelAdjArchivos.ForeColor = Drawing.Color.Green

                    DataConsultas.InsertCommand = "INSERT INTO Ing_Archivos (UrlArchivo, IdNovedad, NomArchivo) VALUES  (N'" & "~/Ingresos/Archivos/" & vbNomArchivo & "', " & LabelIdNovedad.Text & ",N'" & FileUpload1.FileName & "')"
                    DataConsultas.Insert()

                    ListArchivos.DataBind()
                    ListNovedades.DataBind()

                Catch ex As Exception
                    LabelAdjArchivos.Text = ex.Message '"No se pudo subir el archivo."
                End Try
            Else
                LabelAdjArchivos.Text = "Tipo de archivo no permitido. No se adjunto el archivo."
                LabelAdjArchivos.ForeColor = Drawing.Color.Red
            End If
        Else
            LabelAdjArchivos.Text = "No hay archivo para adjuntar" 'FileUpload1.FileName.ToString
            LabelAdjArchivos.ForeColor = Drawing.Color.Red
        End If

        BtnMostrar_ModalPopupExtender.Show()





        'BtnAdjuntarArchivo.Enabled = False

    End Sub

    Private Function NomUsuarioDgh(ByVal IdUsuario As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT USUDESCRI FROM GENUSUARIO WHERE OID = " & IdUsuario

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

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Page_PreLoad(sender As Object, e As System.EventArgs) Handles Me.PreLoad
        Response.Cache.SetExpires(Now.AddMinutes(-1))
        Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Cache.SetNoStore()
    End Sub

    Protected Sub ListNovedades_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles ListNovedades.ItemDataBound

        Dim vbLabel, vbLabel1 As Label

        Try
            vbLabel = e.Item.FindControl("IdUsInsertoLabel")
            vbLabel1 = e.Item.FindControl("LabelNomUs")

            vbLabel1.Text = "Por: " & NomUsuarioDgh(vbLabel.Text)
        Catch ex As Exception

        End Try

    End Sub

End Class
