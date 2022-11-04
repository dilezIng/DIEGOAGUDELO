Public Class Control_Triage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LbPediatria.Text = "" + GridViewPed.Rows.Count.ToString
 LbPediatria2.Text = "" + GridViewdig.Rows.Count.ToString
        '  Response.Redirect("Tablero.aspx")

        Response.AddHeader("REFRESH", "10;Control_Triage.aspx")
    End Sub

End Class