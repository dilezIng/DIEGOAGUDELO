Public Class Tablero
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LbPediatria.Text = "" + GridViewPed.Rows.Count.ToString
        LbAdulto.Text = "" + GridViewAdul.Rows.Count.ToString
        LbAdulto0.Text = "" + GridView4.Rows.Count.ToString
        '  Response.Redirect("Tablero.aspx")

        Response.AddHeader("REFRESH", "300;Tablero.aspx")

    End Sub

End Class