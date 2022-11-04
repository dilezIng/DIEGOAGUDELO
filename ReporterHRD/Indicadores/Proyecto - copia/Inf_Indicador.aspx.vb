Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing



Partial Class Indicadores_Proyecto_CargarIndicadores
    Inherits System.Web.UI.Page

    Dim vbFunciones As New FunBasicas







    Protected Sub ImageButton1_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)



    End Sub



    Protected Sub GridIndicadores_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridIndicadores.SelectedIndexChanged
        Lbidindi.Text = GridIndicadores.SelectedValue.ToString



        LblSubtitulo.Text = "Editando información del indicador "

        GridIndicadores.Visible = False
        PanelInf.Visible = True

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

        Response.Redirect("Inf_Indicador.aspx")

        lblIdUsuario.Text = vbFunciones.IdUsuarioDgh(Membership.GetUser.ProviderUserKey.ToString)
        GridIndicadores.Visible = True
        PanelInf.Visible = False
    End Sub
End Class
