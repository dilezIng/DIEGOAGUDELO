Imports System.Drawing
Imports System.Configuration
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Mvc

Imports AjaxControlToolkit
Imports System.Web.Services
Imports System.Web.Script.Services



Public Class TempVoIPED
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Panel2.Visible = False
        Panel3.Visible = False
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim TextBox As Integer = TextBox1.Text
        Dim TextBox22 As String = TextBox2.Text
        Dim T As Integer = TextBox7.Text
        SqlDataSource1.UpdateCommand = "UPDATE [EXTENSION ] SET EXTENSION='" & TextBox22 & "'  WHERE (Id ='" & T & "')"
        SqlDataSource1.Update()


        Dim Hora As String
        Dim Useri As String
        Dim SQLa As String
        Dim TextBoxev As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        TextBoxev = Rsa(0)
        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()
        Useri = Page.User.Identity.Name.ToString
        Dim IDD As String

        IDD = "UPDATE_" & TextBox & " a " & TextBox22
        DataH0.UpdateCommand = "INSERT Sis_Hv_Audubica( Id_ubicaciones,Usuario,Dates) VALUES ('" & IDD & "','" & Useri & "','" & TextBoxev & "')"
        DataH0.Update()





        Response.AddHeader("REFRESH", "1;TempVoIPED.aspx")

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Dim T1 As Integer = TextBox3.Text
        Dim T2 As String = TextBox4.Text
        Dim T3 As String = DropDownList2.Text
        Dim T4 As Integer = DropDownList1.Text
        DataH0.InsertCommand = "INSERT [EXTENSION ]    ([EXTENSION] ,[UBICACION] ,[DEPENDENCIA] ,[VISIBLE])  VALUES (N'" & T1 & "','" & T2 & "','" & T3 & "','" & T4 & "')"
        DataH0.Insert()


        Dim Hora As String
        Dim Useri As String
        Dim SQLa As String
        Dim TextBoxev As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        TextBoxev = Rsa(0)
        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()
        Useri = Page.User.Identity.Name.ToString
        Dim IDD As String

        IDD = "CREA " & T1
        DataH0.UpdateCommand = "INSERT Sis_Hv_Audubica( Id_ubicaciones,Usuario,Dates) VALUES ('" & IDD & "','" & Useri & "','" & TextBoxev & "')"
        DataH0.Update()



        Response.AddHeader("REFRESH", "1;TempVoIPED.aspx")
    End Sub


    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

        Dim T As Integer = TextBox7.Text
        Dim T1 As Integer = TextBox6.Text
        Dim T2 As String = TextBox5.Text
        Dim T3 As String = DropDownList3.Text
        Dim T4 As Integer = DropDownList4.Text


        Dim TTT As Integer = TextBox1.Text
        Dim TTT1 As String = TextBox2.Text

        SqlDataSource1.UpdateCommand = "UPDATE [EXTENSION ] SET EXTENSION='" & T1 & "' ,[UBICACION]='" & T2 & "' ,[DEPENDENCIA]='" & T3 & "' ,[VISIBLE]='" & T4 & "' where Id='" & T & "'"
        SqlDataSource1.Update()



        Dim Hora As String
        Dim Useri As String
        Dim SQLa As String
        Dim TextBoxev As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        TextBoxev = Rsa(0)
        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()
        Useri = Page.User.Identity.Name.ToString
        Dim IDD As String

        IDD = "UPDATE_" & TTT & " a " & TTT1

        DataH0.UpdateCommand = "INSERT Sis_Hv_Audubica( Id_ubicaciones,Usuario,Dates) VALUES ('" & IDD & "','" & Useri & "','" & TextBoxev & "')"
        DataH0.Update()

        Response.AddHeader("REFRESH", "1;TempVoIPED.aspx")

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Panel3.Visible = False
        TextBox7.Text = GridView1.SelectedValue.ToString
        TextBox8.Text = TextBox7.Text
        Dim T As Integer = TextBox7.Text
        Dim Dep As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand

        Com.Connection = timedate
        timedate.Open()
        SQL = "Select  EXTENSION,UBICACION,DEPENDENCIA From [EXTENSION ] WHERE (Id =N'" & T & "')"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        TextBox1.Text = Rs(0)
        TextBox6.Text = Rs(0)
        TextBox5.Text = Rs(1)

        TextBox9.Text = Rs(0)
        Dep = Rs(1)

        Rs.Close()
        timedate.Close()



        Panel2.Visible = True




    End Sub


    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click

        Panel3.Visible = True
        Panel2.Visible = False
    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click

        Dim T As Integer = TextBox7.Text

        SqlDataSource1.DeleteCommand = "DELETE From [EXTENSION ]  WHERE (Id ='" & T & "')"
        SqlDataSource1.Delete()

        Dim TTT As Integer = TextBox1.Text

        Dim Hora As String
        Dim Useri As String
        Dim SQLa As String
        Dim TextBoxev As String
        Dim timedatea As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa As SqlDataReader
        Dim Coma As New SqlCommand
        Coma.Connection = timedatea
        timedatea.Open()
        SQLa = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
        Coma = New SqlCommand(SQLa, timedatea)
        Rsa = Coma.ExecuteReader()
        Rsa.Read()
        TextBoxev = Rsa(0)
        Hora = Rsa(0)
        Rsa.Close()
        timedatea.Close()
        Useri = Page.User.Identity.Name.ToString
        Dim IDD As String

        IDD = "ELIMINO_" & TTT

        DataH0.UpdateCommand = "INSERT Sis_Hv_Audubica( Id_ubicaciones,Usuario,Dates) VALUES ('" & IDD & "','" & Useri & "','" & TextBoxev & "')"
        DataH0.Update()




        Response.AddHeader("REFRESH", "1;TempVoIPED.aspx")


    End Sub
End Class