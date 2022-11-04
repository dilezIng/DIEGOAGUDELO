Imports System.Drawing
Imports System.Configuration
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Mvc

Public Class Indicadorprueb
    Inherits System.Web.UI.Page

    Dim vbFunciones As New FunBasicas







    Protected Sub ImageButton1_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)



    End Sub



    Protected Sub GridIndicadores_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridIndicadores.SelectedIndexChanged
        Lbidindi.Text = GridIndicadores.SelectedValue.ToString
        Panel11.Visible = False
        GridIndicadores.Visible = False
        PanelInf.Visible = True
        Dim Mes As String = ListMes.text
        Dim Anual As String = LAnual.text
        Dim IdIndi As String = GridIndicadores.SelectedValue.ToString


        Dim SQL3 As String
        Dim SQL6 As String
        Dim SQL7 As String




        Dim Rs3 As SqlDataReader
        Dim Rs6 As SqlDataReader
        Dim Rs7 As SqlDataReader



        Dim Com3 As New SqlCommand
        Dim Com6 As New SqlCommand
        Dim Com7 As New SqlCommand

        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")

        Com3.Connection = timedate2
        Com6.Connection = timedate2
        Com7.Connection = timedate2

        timedate2.Open()
        SQL3 = "SELECT  TOP 1 Ind_Principal.CodIndicador, Ind_Principal.NomIndicador, case when  Ind_Principal.DefOperacional is null then 'Sin Definición' else Ind_Principal.DefOperacional end FROM Ind_Principal  WHERE (Ind_Principal.IdIndicador  =N'" & IdIndi & "') "
        SQL6 = "Select " & Mes & " AS UrlEstado from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 6) "
        SQL7 = "Select " & Mes & " AS UrlEstado from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 7) "


        Com3 = New SqlCommand(SQL3, timedate2)
        Com6 = New SqlCommand(SQL6, timedate2)
        Com7 = New SqlCommand(SQL7, timedate2)




        Rs3 = Com3.ExecuteReader()
        Rs3.Read()
        CodInd.Text = Rs3(0)
        Nom_indi.text = Rs3(1)
        DEF.Text = Rs3(2)

        Rs3.Close()

        Rs6 = Com6.ExecuteReader()
        Rs6.Read()
        Analisis.Text = Rs6(0)
        Rs6.Close()

        Rs7 = Com7.ExecuteReader()
        Rs7.Read()
        Estrategia.Text = Rs7(0)
        Rs7.Close()




        timedate2.Close()







    End Sub





    Protected Sub GridIndicadores_DataBound(sender As Object, e As System.EventArgs) Handles GridIndicadores.DataBound









    End Sub




    Protected Sub BtnCancelar_Click(sender As Object, e As System.EventArgs)

        PanelInf.Visible = False
        GridIndicadores.Visible = True
        LblSubtitulo.Text = GridIndicadores.Rows.Count.ToString + " Indicadores asignados"

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        lblIdUsuario.Text = vbFunciones.IdUsuarioDgh(Membership.GetUser.ProviderUserKey.ToString)
        GridIndicadores.Visible = True
        PanelInf.Visible = False


    End Sub



    'INSERT INTO Ind_Resultados(IdIndicador, IdMes) SELECT IdIndicador, @Mes AS Expr1 FROM Ind_Principal WHERE (NOT (IdIndicador IN (SELECT Ind_Principal_1.IdIndicador FROM Ind_Principal AS Ind_Principal_1 INNER JOIN Ind_Resultados AS Ind_Resultados_1 ON Ind_Principal_1.IdIndicador = Ind_Resultados_1.IdIndicador WHERE (Ind_Resultados_1.IdMes = @Mes))))




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Response.Redirect("Indicadorprueb.aspx")

        lblIdUsuario.Text = vbFunciones.IdUsuarioDgh(Membership.GetUser.ProviderUserKey.ToString)
        GridIndicadores.Visible = True
        PanelInf.Visible = False

    End Sub

End Class