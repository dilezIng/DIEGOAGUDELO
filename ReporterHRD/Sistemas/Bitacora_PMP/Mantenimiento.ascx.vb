Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Partial Class Sistemas_Bitacora_PMP_Mantenimiento
    Inherits System.Web.UI.UserControl
  
   

    Protected Sub Btnguardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnguardar.Click



        If String.IsNullOrEmpty(Nota.text) Then
            notavalida.text = "No puede dejar campos en blanco"
            Panel_evento.Visible = False 'True
            Panelmantenimiento.Visible = True 'False
        Else

            Dim Even As String = Labelevent.Text
            Dim Act As String = Nota.text

            Dim Aud As String = TextBox1.text
            Dim Estado As Integer = ListEstado.Text
            Dim reali As String
            Dim solcit As String = Page.User.Identity.Name.ToString
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
            reali = Rsa1983(0)
            Rsa1983.Close()
            timd.Close()


            LabelMsg().Text = "Evento Registrado: " & Even & " Fecha cierre del Evento: " & Aud
            DataConsultas.UpdateCommand = "UPDATE Sis_HV_Historial SET Actividad=N'" & Act & "', Fech_En =N'" & Aud & "',Aud_Time_Act =N'" & Aud & "', Estado=" & Estado & " WHERE (Id_Evento =N'" & Even & "')"
            DataConsultas.Update()
                    Dataevent.UpdateCommand = "UPDATE Sis_HV_Novedad SET Estado=" & Estado & " WHERE (Id_Evento =N'" & Even & "')"
            Dataevent.Update()
            Dataevent0.UpdateCommand = "INSERT INTO Sis_HV_NOVHIST(Evento,  Realiza, NotaRealiza, Date) VALUES (N'" & Even & "','" & reali & "','" & Act & "','" & Aud & "')"
            Dataevent0.Update()
            Panel_evento.Visible = True
                    Panelmantenimiento.Visible = False




        End If





        ' Response.Redirect("/Sistemas/Bitacora_PMP/PaginaBase.aspx")






    End Sub

    Protected Sub pendiente_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles pendiente.SelectedIndexChanged

        History.Visible = True
        TextBox2.Text = pendiente.SelectedValue.ToString
        Labelevent.Text = pendiente.SelectedValue.ToString

        LabelMsg.Text() = "" & pendiente.SelectedValue.ToString
        Panelmantenimiento.Visible = False
        Panel_evento.Visible = False

    End Sub

    Protected Sub GridEvento_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento.SelectedIndexChanged
        History.Visible = True
        TextBox2.Text = GridEvento.SelectedValue.ToString
        Labelevent.Text = GridEvento.SelectedValue.ToString

        LabelMsg.Text() = "" & GridEvento.SelectedValue.ToString
        Panelmantenimiento.Visible = True
        Panel_evento.Visible = False
        Dim Even As String = Labelevent.Text
        Dim solcit As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "Select Id_Equipo, Id_Sol From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo.Text = Rs(0)
        solcit = Rs(1)
        Label4.text = Rs(1)
        Rs.Close()
        timedate.Close()



        ' Response.Redirect("/Sistemas/Bitacora_PMP/PaginaBase.aspx")


    End Sub
    Protected Sub GridEvento2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEvento2.SelectedIndexChanged
        History.Visible = True
        TextBox2.Text = GridEvento2.SelectedValue.ToString
        Labelevent.Text = GridEvento2.SelectedValue.ToString

        LabelMsg.Text() = "" & GridEvento2.SelectedValue.ToString
        Panelmantenimiento.Visible = True
        Panel_evento.Visible = False
        Dim Even As String = Labelevent.Text
        Dim solcit As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand

        Com.Connection = timedate
        timedate.Open()
        SQL = "Select Id_Equipo, Id_Sol From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo.Text = Rs(0)
        solcit = Rs(1)
        Label4.text = Rs(1)
        Rs.Close()
        timedate.Close()




        '  Response.Redirect("/Sistemas/Bitacora_PMP/PaginaBase.aspx")

    End Sub

    Protected Sub Gridopen_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Gridopen.SelectedIndexChanged
        History.Visible = True

        Labelevent.Text = Gridopen.SelectedValue.ToString
        TextBox2.Text = Gridopen.SelectedValue.ToString

        LabelMsg.Text() = "" & Gridopen.SelectedValue.ToString
        Panelmantenimiento.Visible = True
        Panel_evento.Visible = False
        Dim Even As String = Labelevent.Text
        Dim solcit As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand

        Com.Connection = timedate
        timedate.Open()
        SQL = "Select Id_Equipo, Id_Sol From Sis_HV_Novedad WHERE (Id_Evento =N'" & Even & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        Codigo.Text = Rs(0)
        solcit = Rs(1)
        Label4.text = Rs(1)
        Rs.Close()
        timedate.Close()

        '  Dim sq As String
        ' Dim timd As New SqlConnection("Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica;")
        'Dim Rsa1983 As SqlDataReader
        'Dim Coma123456 As New SqlCommand
        '      Coma123456.Connection = timd
        '     timd.Open()
        '    sq = "SELECT USUDESCRI FROM GENUSUARIO where (USUNOMBRE = N'" & solcit & "')"
        '   Coma123456 = New SqlCommand(sq, timd)
        '  Rsa1983 = Coma123456.ExecuteReader()
        '  Rsa1983.Read()
        '  Label4.text = Rsa1983(0)
        '  Rsa1983.Close()*/


        '  Response.Redirect("/Sistemas/Bitacora_PMP/PaginaBase.aspx")

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, TextBox1.Load, DataTime.Load, TextBoxev.load

        Response.AddHeader("REFRESH", "10;PaginaBase.aspx")

        History.Visible = False
        Panelmantenimiento.Visible = False
        Panel_evento.Visible = True
        Dim SQL As String
        Dim timedate As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        TextBox1.Text = Rs(0)
        Rs.Close()
        timedate.Close()
        Dim SQLa As String
        Dim timedatea As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True;")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT  GETDATE() AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        TextBoxev.Text = Rsa(0)
        Rsa.Close()
        timedatea.Close()
        User.Text = Page.User.Identity.Name.ToString
        User0.Text = Page.User.Identity.Name.ToString

        LabelEstadoForm4.Text = " " + GridEvento.Rows.Count.ToString
        LabelEstadoForm1.Text = " " + GridEvento2.Rows.Count.ToString
        Label3.Text = "  " + Gridopen.Rows.Count.ToString
        LabelEstadoForm3.Text = " " + pendiente.Rows.Count.ToString




    End Sub

    Protected Sub History0_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles History0.Selecting

    End Sub
End Class
