
Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub BtnActualizar_Click(sender As Object, e As System.EventArgs) Handles BtnActualizar.Click

        LabelSubTitulo.Text = ""
        GridPrincipal.Visible = False

        Dim vbHoraIni, vbHoraFin, vbIniPM, vbFinPM As String

        vbIniPM = 0
        vbFinPM = 0
        Label1.Text = ""

        vbHoraIni = HoraInicial.SelectedValue.ToString.Substring(10)
        vbHoraFin = HoraFinal.SelectedValue.ToString.Substring(10)


        If IsDate(TextFechaIni.Text) AndAlso IsDate(TextFechaFin.Text) Then

            If HoraInicial.SelectedValue.ToString.Contains("p") And CInt(vbHoraIni.Substring(0, vbHoraIni.IndexOf(":"))) <> 12 Then vbIniPM = 12
            If HoraFinal.SelectedValue.ToString.Contains("p") And CInt(vbHoraFin.Substring(0, vbHoraFin.IndexOf(":"))) <> 12 Then vbFinPM = 12

            Try
                LabelFechaIni.Text = CDate(TextFechaIni.Text).AddHours(CInt(vbIniPM) + CInt(vbHoraIni.Trim.Substring(0, vbHoraIni.IndexOf(":") - 1)))

                If CInt(vbHoraIni.Substring(0, vbHoraIni.IndexOf(":"))) = 12 And vbHoraIni.Contains("a") Then
                    LabelFechaIni.Text = CDate(LabelFechaIni.Text).AddHours(-12)

                End If


                LabelFechaFin.Text = CDate(TextFechaFin.Text).AddHours(CInt(vbFinPM) + CInt(vbHoraFin.Trim.Substring(0, vbHoraFin.IndexOf(":") - 1)))

                If CInt(vbHoraFin.Substring(0, vbHoraFin.IndexOf(":"))) = 12 And vbHoraFin.Contains("a") Then
                    LabelFechaFin.Text = CDate(LabelFechaFin.Text).AddHours(-12)
                End If

            Catch ex As Exception
                Label1.Text = ex.Message
            End Try

            GridPrincipal.Visible = True

        End If

        LabelDocPaciente.Text = "@"
        If TextDocPaciente.Text.Length > 0 Then LabelDocPaciente.Text = TextDocPaciente.Text


    End Sub

    Protected Sub GridFacturas_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridPrincipal.SelectedIndexChanged

        Panel1_ModalPopupExtender.Show()
        Panel1.GroupingText = GridPrincipal.SelectedDataKey.Item(1).ToString

    End Sub

    

    Protected Sub BtnCerrarTraza_Click(sender As Object, e As System.EventArgs) Handles BtnCerrarTraza.Click



        BtnClose.Enabled = True
        BtnCerrarTraza.Visible = False

        Panel1_ModalPopupExtender.Show()

    End Sub


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub
End Class
