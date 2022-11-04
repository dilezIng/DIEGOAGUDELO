Imports System.Data


Partial Class PaginaBase
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        If IsPostBack Then

            Dim dt As DataTable

            dt.Columns.Add("Año")
            dt.Columns.Add("Valor")

            dt.Rows.Add("1991", 15)
            dt.Rows.Add("1992", 8)
            dt.Rows.Add("1993", 25)
            dt.Rows.Add("1994", 12)
            dt.Rows.Add("1995", 33)


            'AreaChart1.Series[0].ChartType.Series.ChartType.

            AreaChart1.Series[0].


        End If

        'BubbleChart1.BubbleChartValues.Add(0)


        '<ajaxToolkit:BubbleChartValue Category="Software" X="25" Y="90000" Data="7" BubbleColor="#6C1E83" />

    End Sub
End Class
