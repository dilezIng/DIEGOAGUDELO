Imports System
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.UI.WebControls

Partial Class Varios_FirmasMedicos_Firma
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT GENMEDICO.GMEFOTOIMA FROM GENMEDICO INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID  WHERE GENUSUARIO.OID = " & LblIdUser.Text

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet

        ObjAdapter.Fill(objDS, "Registros")
        Label1.Text = objDS.Tables(0).Rows(0).Item(0).ToString()

        Dim Arrayimagen() As Byte = Consulta.ExecuteScalar

        Dim ms As New MemoryStream(Arrayimagen)

        Dim fs As FileStream = New FileStream("D:\ReporterHRD\Images\" & LblIdUser.Text & ".jpg", FileMode.Create, FileAccess.Write, FileShare.ReadWrite)

        ms.WriteTo(fs)

        fs.Flush()
        fs.Close()
        ms.Close()

        Conexion.Close()

        Label1.Text = ""

    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

        LblIdUser.Visible = False

        If FileUpload1.FileName.Length > 0 Then

            Try
                Dim vbPath As String
                vbPath = "D:\ReporterHRD\Images\"
                vbPath = Path.GetFullPath(FileUpload1.PostedFile.FileName)


                Dim ms As MemoryStream = New MemoryStream()
                'Dim fs As FileStream = New FileStream(vbPath + FileUpload1.FileName.ToString, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)
                Dim fs As FileStream = New FileStream(vbPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)

                Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionString").ToString())

                ms.SetLength(fs.Length)
                fs.Read(ms.GetBuffer(), 0, fs.Length)

                Dim arrImg() As Byte = ms.GetBuffer()
                ms.Flush()
                fs.Close()

                Dim cmd As SqlCommand = Conexion.CreateCommand()

                Conexion.Open()

                If RadioButtonList1.SelectedValue = "0" Then
                    cmd.CommandText = "UPDATE GENMEDICO SET  GMEFIRMA = @Imagen, GMEFOTOIMA = @Imagen FROM  GENMEDICO INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID WHERE GENUSUARIO.OID = " & LblIdUser.Text
                Else
                    cmd.CommandText = "UPDATE GENMEDICO SET  GMEFOTOIMA = @Imagen FROM  GENMEDICO INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID WHERE GENUSUARIO.OID = " & LblIdUser.Text
                End If


                cmd.Parameters.Add("@imagen", SqlDbType.VarBinary).Value = arrImg

                cmd.ExecuteNonQuery()
                '    End Using
                'End Using
                ms.Close()
                Conexion.Close()

                BajarImagen(LblIdUser.Text)
                Label1.Text = "Se anexo el archivo con exito."
                ImgFirma.Visible = True

            Catch ex As Exception
                Throw New Exception(ex.Message)
            End Try
        Else
            LblIdUser.Visible = True
            LblIdUser.Text = "El archivo seleccionado no es válido"
        End If
    End Sub


    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()> _
    Public Shared Function BusqUsuario(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText


        StrConsulta = "SELECT  GENUSUARIO.USUNOMBRE + N' (' + GENUSUARIO.USUDESCRI + N')' AS Usuario FROM GENMEDICO INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID  WHERE(GENUSUARIO.USUESTADO = 1)  AND (GENUSUARIO.USUNOMBRE + N' (' + GENUSUARIO.USUDESCRI + N')' LIKE N'%" & filtro & "%')  ORDER BY Usuario"

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


    Protected Sub BtnBuscar_Click(sender As Object, e As System.EventArgs) Handles BtnBuscar.Click

        Dim Cadena As String

        LblIdUser.Text = TextBox1.Text
        LblIdUser.Visible = True
        FileUpload1.Enabled = False
        Button2.Enabled = False
        ImgFirma.Visible = False

        If LblIdUser.Text.Length > 2 Then
            Try
                Cadena = LblIdUser.Text.Substring(0, LblIdUser.Text.IndexOf(" "))
            Catch ex As Exception
                Cadena = LblIdUser.Text
            End Try

            Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
            Dim StrConsulta As String
            Dim ObjAdapter As New SqlDataAdapter

            StrConsulta = "SELECT OID FROM GENUSUARIO WHERE USUNOMBRE = N'" & Cadena & "'"

            Dim Consulta As New SqlCommand(StrConsulta, Conexion)

            ObjAdapter.SelectCommand = Consulta

            Conexion.Open()

            Dim objDS As New DataSet
            ObjAdapter.Fill(objDS, "Registros")

            Dim Lista As List(Of String) = New List(Of String)

            Conexion.Close()

            If objDS.Tables(0).Rows.Count > 0 Then
                LblIdUser.Text = objDS.Tables(0).Rows(0).Item(0).ToString
                FileUpload1.Enabled = True
                LblIdUser.Visible = False
                Button2.Enabled = True
            Else
                LblIdUser.Text = "No existe un usuario con ese identificador"
            End If
        Else
            LblIdUser.Text = "SELECCION INVALIDA"
        End If


    End Sub

    Private Function BajarImagen(ByVal IdUsuario As String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DG_ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT GENMEDICO.GMEFOTOIMA FROM GENMEDICO INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID  WHERE GENUSUARIO.OID = " & IdUsuario

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet

        ObjAdapter.Fill(objDS, "Registros")
        'Label1.Text = objDS.Tables(0).Rows(0).Item(0).ToString()

        Dim Arrayimagen() As Byte = Consulta.ExecuteScalar

        Dim ms As New MemoryStream(Arrayimagen)

        Dim fs As FileStream = New FileStream("D:\ReporterHRD\Images\" & IdUsuario & ".jpg", FileMode.Create, FileAccess.Write, FileShare.ReadWrite)

        ms.WriteTo(fs)

        fs.Flush()
        fs.Close()
        ms.Close()

        Conexion.Close()

        ImgFirma.ImageUrl = "~/images/" + IdUsuario + ".jpg"
        'Label1.Text = ImgFirma.ImageUrl

    End Function


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        'If IsPostBack Then
        '    Dim path As String = Server.MapPath("~/")
        '    Dim fileOK As Boolean = False
        '    If FileUpload1.HasFile Then
        '        Dim fileExtension As String
        '        fileExtension = System.IO.Path. _
        '            GetExtension(FileUpload1.FileName).ToLower()
        '        Dim allowedExtensions As String() = _
        '            {".jpg", ".jpeg", ".png", ".gif"}
        '        For i As Integer = 0 To allowedExtensions.Length - 1
        '            If fileExtension = allowedExtensions(i) Then
        '                fileOK = True
        '            End If
        '        Next
        '        If fileOK Then
        '            Try
        '                FileUpload1.PostedFile.SaveAs(path & _
        '                     FileUpload1.FileName)
        '                Label1.Text = "Archivo Subido."
        '            Catch ex As Exception
        '                Label1.Text = "El archivo no se pudo subir."
        '            End Try
        '        Else
        '            Label1.Text = "Tipo de archivo no aceptado."
        '        End If
        '    End If
        'End If

    End Sub
End Class
