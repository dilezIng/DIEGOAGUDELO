Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing



Partial Class Indicadores_Proyecto_CargarIndicadores
    Inherits System.Web.UI.Page

    Dim vbFunciones As New FunBasicas

    Protected Sub BtnSubirArchivoEquipo_Click(sender As Object, e As System.EventArgs)

        Dim vbLblImagen As Label
        Dim vbLblIdIndicador As Label
        Dim vbFileUpload As FileUpload
        Dim vbTxtObs As TextBox

        vbLblImagen = FormIndicador.FindControl("LblImagen")
        vbLblIdIndicador = FormIndicador.FindControl("LblIdResultado")
        vbFileUpload = FormIndicador.FindControl("FileUpload2")
        vbTxtObs = FormIndicador.FindControl("TxtObsArchivo")

        'LblImagen

        Dim path As String = Server.MapPath("~/Indicadores/Proyecto/Fotos/")
        Dim fileOK As Boolean = False

        If vbFileUpload.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.GetExtension(vbFileUpload.FileName).ToLower()
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

                    vbNomArchivo = vbGuid & "_" & vbFileUpload.FileName

                    vbNomArchivo = vbGuid & "_" & vbFileUpload.FileName

                    vbFileUpload.PostedFile.SaveAs(path & vbNomArchivo)

                    'ImagenCompo.ImageUrl = path & vbNomArchivo
                    vbLblImagen.Text = "Archivo subido con exito!"

                    FunAgregarUrlFotoEquipo("~/Indicadores/Proyecto/Fotos/" + vbNomArchivo, vbLblIdIndicador.Text, vbTxtObs.Text)

                    vbTxtObs.Text = ""

                Catch ex As Exception
                    vbLblImagen.Text = ex.Message '"No se pudo subir el archivo."
                End Try
            Else
                vbLblImagen.Text = "Tipo de archivo no permitido."
            End If
        Else
            vbLblImagen.Text = vbFileUpload.FileName.ToString
        End If


    End Sub



    Private Function FunAgregarUrlFotoEquipo(ByVal Url As String, ByVal IdResultado As String, ByVal Observaciones As String)

        'DataConsultas.InsertCommand = "INSERT INTO Sis_HV_FotosEquipos(UrlFoto, IdEquipo) VALUES (N'" & Url & "', " & IdEquipo & ")"

        DataConsultas.InsertCommand = "INSERT INTO Ind_FotosAdj (IdResultado, urlImagen, Observaciones)  VALUES (" & IdResultado & ", N'" & Url & "', N'" & Observaciones & "')"

        DataConsultas.Insert()

        Dim vbList As DataList
        vbList = FormIndicador.FindControl("ListFotos")

        vbList.DataBind()

    End Function

    Protected Sub ImageButton1_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)



    End Sub

    Protected Sub FormIndicador_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormIndicador.ItemUpdating


        Dim vbListFactibilidad As DropDownList
        Dim vbListGravedad As DropDownList
        Dim vbTxtEstrategias As TextBox
        Dim vbTxtAnalisis As TextBox

        vbListFactibilidad = FormIndicador.FindControl("ListFactibilidad")
        vbListGravedad = FormIndicador.FindControl("ListGravedad")
        vbTxtEstrategias = FormIndicador.FindControl("TxtEstrategias")
        vbTxtAnalisis = FormIndicador.FindControl("TxtAnalisis")

        FormIndicador.Visible = False
        GridIndicadores.Visible = True

        PanelMsg.Visible = True
        Image3.Visible = False

        If vbTxtAnalisis.Text.Length < 3 Then
            FormIndicador.Visible = True
            GridIndicadores.Visible = False
            LabelMsg.Text = "No ha proporcionado información en el Análisis"
            BtnMostrar_ModalPopupExtender.Show()
            e.Cancel = True
        End If

        If vbTxtEstrategias.Text.Length < 3 Then
            FormIndicador.Visible = True
            GridIndicadores.Visible = False
            LabelMsg.Text = "No ha proporcionado información en las Estrategias"
            BtnMostrar_ModalPopupExtender.Show()
            e.Cancel = True
        End If

        If vbListGravedad.SelectedIndex = 0 Then
            FormIndicador.Visible = True
            GridIndicadores.Visible = False
            LabelMsg.Text = "No ha seleccionado el nivel de Gravedad."
            BtnMostrar_ModalPopupExtender.Show()
            e.Cancel = True
        End If

        If vbListFactibilidad.SelectedIndex = 0 Then
            FormIndicador.Visible = True
            GridIndicadores.Visible = False
            LabelMsg.Text = "No ha seleccionado el nivel de Factibilidad."
            BtnMostrar_ModalPopupExtender.Show()
            e.Cancel = True
        End If

        

    End Sub

    Protected Sub GridIndicadores_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridIndicadores.SelectedIndexChanged

        FormIndicador.DataBind()

        FormIndicador.Visible = True
        GridIndicadores.Visible = False
        LblSubtitulo.Text = "Editando información del indicador"

    End Sub

    Protected Sub ListMeses_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListMeses.SelectedIndexChanged

        InsertIndicadores()

        LblSubtitulo.Visible = True
        FormIndicador.Visible = False
        GridIndicadores.Visible = True
        GridIndicadores.DataBind()



    End Sub

    Protected Sub FormIndicador_ItemUpdated(sender As Object, e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormIndicador.ItemUpdated

        GridIndicadores.DataBind()

    End Sub

    Protected Sub GridIndicadores_DataBound(sender As Object, e As System.EventArgs) Handles GridIndicadores.DataBound

        LblSubtitulo.Text = GridIndicadores.Rows.Count.ToString + " Indicadores asignados"

    End Sub



    Protected Sub ListFotos_ItemCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs)

        Dim vbDataList As DataList

        vbDataList = source

        LblSubtitulo.Text = vbDataList.DataKeys.Item(e.Item.ItemIndex).ToString()

        If e.CommandName = "EliminarFoto" Then
            DataConsultas.DeleteCommand = "DELETE FROM Ind_FotosAdj  WHERE IdFotoAdj = " + vbDataList.DataKeys.Item(e.Item.ItemIndex).ToString()
            DataConsultas.Delete()
            vbDataList.DataBind()
        ElseIf e.CommandName = "VerImagen" Then
            Image3.ImageUrl = urlImagen(vbDataList.DataKeys.Item(e.Item.ItemIndex).ToString())
            PanelMsg.Visible = False

            LblSubtitulo.Text = Server.MapPath(Image3.ImageUrl)

            Dim fs As FileStream = New FileStream(Server.MapPath(Image3.ImageUrl), FileMode.Open, FileAccess.Read, FileShare.Read)
            Dim LaImagen As System.Drawing.Image
            LaImagen = System.Drawing.Image.FromStream(fs)
            Image3.Width = LaImagen.Width
            Image3.Height = LaImagen.Height
            fs.Close()
            fs = Nothing

            Image3.Visible = True
            BtnMostrar_ModalPopupExtender.Show()
            

        End If

    End Sub


    Private Function urlImagen(ByVal IdFoto As String) As String

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter


        StrConsulta = "SELECT urlImagen  FROM Ind_FotosAdj WHERE  IdFotoAdj = " + IdFoto

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then

            Return objDS.Tables(0).Rows(0).Item(0).ToString

        End If


    End Function

    Protected Sub BtnCancelar_Click(sender As Object, e As System.EventArgs)

        FormIndicador.Visible = False
        GridIndicadores.Visible = True
        LblSubtitulo.Text = GridIndicadores.Rows.Count.ToString + " Indicadores asignados"

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        lblIdUsuario.Text = vbFunciones.IdUsuarioDgh(Membership.GetUser.ProviderUserKey.ToString)


    End Sub



    'INSERT INTO Ind_Resultados(IdIndicador, IdMes) SELECT IdIndicador, @Mes AS Expr1 FROM Ind_Principal WHERE (NOT (IdIndicador IN (SELECT Ind_Principal_1.IdIndicador FROM Ind_Principal AS Ind_Principal_1 INNER JOIN Ind_Resultados AS Ind_Resultados_1 ON Ind_Principal_1.IdIndicador = Ind_Resultados_1.IdIndicador WHERE (Ind_Resultados_1.IdMes = @Mes))))



    Private Function InsertIndicadores()

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter


        StrConsulta = "INSERT INTO Ind_Resultados(IdIndicador, IdMes) SELECT IdIndicador, " & ListMeses.SelectedValue.ToString & " AS Expr1 FROM Ind_Principal WHERE (NOT (IdIndicador IN (SELECT Ind_Principal_1.IdIndicador FROM Ind_Principal AS Ind_Principal_1 INNER JOIN Ind_Resultados AS Ind_Resultados_1 ON Ind_Principal_1.IdIndicador = Ind_Resultados_1.IdIndicador WHERE (Ind_Resultados_1.IdMes = " & ListMeses.SelectedValue.ToString & "))))"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)
        Dim ejecuta As Integer

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        ejecuta = Consulta.ExecuteNonQuery()

        Conexion.Close()


    End Function
End Class
