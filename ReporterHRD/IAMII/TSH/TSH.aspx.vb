Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web

Public Class TSH
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Panelmantenimiento.Visible = False
        Dim user As String
        user = Page.User.Identity.Name.ToString
        If String.IsNullOrEmpty(user) Then
            Label1.text = "Ingrese con usario y contraseña"
        Else

            Dim solcit As String = Page.User.Identity.Name.ToString
            Dim sq As String
            Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
            Dim Rsa1983 As SqlDataReader
            Dim Coma123456 As New SqlCommand
            Coma123456.Connection = timd
            timd.Open()
            sq = "SELECT USUNOMBRE FROM GENUSUARIO where (USUNOMBRE = N'" & user & "')"
            Coma123456 = New SqlCommand(sq, timd)
            Rsa1983 = Coma123456.ExecuteReader()
            Rsa1983.Read()

            If String.IsNullOrEmpty(Rsa1983(0)) Then
                Label1.text = "Ingrese con usario y contraseña"
            Else

                If Rsa1983(0).Substring(1, 2) = "en" Then
                    Panelmantenimiento.Visible = True
                Else
                    Label1.text = "Debe Tener Perfil de Enfermeria"

                End If
                If Rsa1983(0).Substring(1, 2) = "EN" Then
                    Panelmantenimiento.Visible = True
                Else
                    Label1.text = "Debe Tener Perfil de Enfermeria"

                End If
            End If

            Rsa1983.Close()
            timd.Close()
        End If


    End Sub


    Protected Sub BtnExportar_Click(sender As Object, e As System.EventArgs) Handles BtnExportar.Click

        GridView1.AllowPaging = False
        GridView1.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridView1.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridView1)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=TSH.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

    End Try
        GridView1.AllowPaging = True



    End Sub


End Class