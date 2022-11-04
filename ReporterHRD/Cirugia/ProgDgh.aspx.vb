Imports System.Data.SqlClient
Imports System.Data

Partial Class Cirugia_ProgDgh
    Inherits System.Web.UI.Page


    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        'LblDetalles.Text = GridView1.SelectedRow.Cells(2).Text & " (" & GridView1.SelectedRow.Cells(3).Text & ")"


        'LblDetalles.Text = GridView1.SelectedDataKey.Value.ToString
        ProcedExisteSegui(GridView1.SelectedDataKey.Value.ToString)

        GridDetalle.DataBind()

        Panel1_ModalPopupExtender.Show()

    End Sub

    Protected Sub GridView1_DataBound(sender As Object, e As System.EventArgs) Handles GridView1.DataBound

        LabelCantPacs.Text = GridView1.Rows.Count.ToString + " Cirugias realizadas"

    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        GridView1.DataBind()
    End Sub



    Private Function ProcedExisteSegui(ByVal IdFolio As String)


        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DGEMPRES02ConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT HCMHCINQX.HCCAMPO01 AS Cirujano, HCMHCINQX.HCCAMPO10 AS HoraInicio, HCMHCINQX.HCCAMPO11 AS HoraFinal FROM HCNFOLIO INNER JOIN HCMHCINQX ON HCNFOLIO.OID = HCMHCINQX.HCNFOLIO WHERE HCNFOLIO.OID = " + IdFolio

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            LblDetalles.Text = "<strong>Cirujano:</strong> " + objDS.Tables(0).Rows(0).Item(0).ToString()
            LblDetalles.Text = LblDetalles.Text + "<BR /><strong>Hora Inicio:</strong> " + objDS.Tables(0).Rows(0).Item(1).ToString() + "   <strong>Hora Fin:</strong> " + objDS.Tables(0).Rows(0).Item(2).ToString()
        Else
            'Return False
        End If

    End Function



End Class
