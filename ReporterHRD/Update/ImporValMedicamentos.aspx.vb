Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class Update_ImporValMedicamentos
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        Dim Consulta As String
        Dim Conexion As String

        Conexion = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + TextBoxRuta.Text + "; Extended Properties=Excel 8.0;"

        Consulta = "Select " & TextBoxCampos.Text & " From [" + TextBoxHoja.Text + "$] " 'where Seguridad = 14"

        'If TextBox4.Text <> "" Then Consulta = Consulta + " where " & TextBox4.Text

        Dim ds As New DataSet

        Dim ConexionOle As New OleDb.OleDbConnection(Conexion)

        Dim ComandoOle As New OleDb.OleDbCommand(Consulta, ConexionOle)

        Dim AdaptadorOle As New OleDb.OleDbDataAdapter(ComandoOle)

        AdaptadorOle.Fill(ds)

        GridView1.DataSource = ds

        GridView1.DataBind()

        'Label1.Text = "Se Consulto archivo Excel (" & GridView1.Rows.Count.ToString & " registros) "
        GridView1.Visible = True

    End Sub

    Protected Sub ButtonActualizar_Click(sender As Object, e As System.EventArgs) Handles ButtonActualizar.Click

        Dim i As Integer
        Dim Cod, Val As String

        For i = 0 To GridView1.Rows.Count - 1
            'Cod = GridView1.Rows(i).Cells(0).Text.Substring(0, GridView1.Rows(i).Cells(0).Text.IndexOf("_"))

            Cod = GridView1.Rows(i).Cells(0).Text
            Val = GridView1.Rows(i).Cells(1).Text

            'Actualizar en Innmantar
            'DataParaDinamica.UpdateCommand = "UPDATE INNMANTAR SET IMTVALPRO =  " & Val & " FROM GENMANUAL INNER JOIN INNPROEPS ON GENMANUAL.OID = INNPROEPS.GENMANUAL INNER JOIN INNPRODUC ON INNPROEPS.INNPRODUC = INNPRODUC.OID INNER JOIN INNMANTAR ON INNPROEPS.OID = INNMANTAR.INNPROEPS WHERE (GENMANUAL.GENMANUAL = N'" & TextBoxHoja.Text & "') AND (INNMANTAR.IMTFECFIN > CONVERT (DATETIME, '2017-12-30 00:00:00', 102)) AND (INNPRODUC.IPRCODIGO = N'" & Cod & "') "

            'Actualizar en Innproduct
            DataParaDinamica.UpdateCommand = "UPDATE INNPRODUC SET IPRPREVPE = " & Val & " WHERE (IPRCODIGO = N'" & Cod & "')"

            DataParaDinamica.Update()
            Label1.Text = DataParaDinamica.UpdateCommand
        Next

    End Sub
End Class
