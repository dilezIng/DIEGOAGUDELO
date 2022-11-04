
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Partial Class Varios_ImportarExcelNiif
    Inherits System.Web.UI.Page

    'Dim vbConexion As String = "Data Source=PC-SISTEM-HRD-4;Initial Catalog=dgempres99;User ID=sa;Password=admin"
    Dim vbConexion As String = "Data Source=PRINCIPALNET;Initial Catalog=dgempres02;User ID=dghnet;Password=2"
    'Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES98;User ID=dghnet;Password=***********


    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click

        Dim i As Integer
        Dim AñoTabla As String = "2015"
        Dim vbIdInsertadoA, vbIdInsertadoB As String

        DataParaDinamica.InsertCommand = "INSERT  INTO IFNCFC" & AñoTabla & " (COMFCONSEC, IFNTIPCOM, COMFFECHA, COMFESTADO, COMFOBSERV, COMFNUMDOC, COMFTIPDOC, COMFCIERANU) VALUES  (" & 304.ToString & ", 55, CONVERT(DATETIME, '2015-12-30 17:03:25', 102), 1, '" & GridView1.Rows(0).Cells(2).Text & "', '" & GridView1.Rows(i).Cells(3).Text & "', 1996, 0)"
        'DataParaDinamica.InsertCommand = "INSERT  INTO IFNCFC" & AñoTabla & " (COMFCONSEC, IFNTIPCOM, COMFFECHA, COMFESTADO, COMFOBSERV, COMFNUMDOC, COMFTIPDOC, COMFCIERANU) VALUES  (" & 304.ToString & ", 55, CONVERT(DATETIME, '2015-12-30 17:03:25', 102), 1, 'SALDOS INICIALES', '" & GridView1.Rows(i).Cells(2).Text & "', 1996, 0)"

        DataParaDinamica.Insert()


        Dim Conexion As New SqlConnection(vbConexion)
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT IDENT_CURRENT('IFNCFC" & AñoTabla & "') AS Current_Identity"
        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            vbIdInsertadoA = objDS.Tables(0).Rows(0).Item(0).ToString
            DataParaDinamica.UpdateCommand = "UPDATE IFNCFC" & AñoTabla & " SET COMFOIDDOC = " & vbIdInsertadoA & " WHERE OID = " & vbIdInsertadoA
            DataParaDinamica.Update()
        End If



        For i = 0 To GridView1.Rows.Count - 1

            'INSERT INTO IFNCFD2015 (IFNCOMFIN, IFNCUENTA, GENTERCER, CFDVALDEB, CFDVALCRE, CFDOBSERVA) VALUES        (1, 2, 3, 5, 6, '7')

            DataParaDinamica.InsertCommand = "INSERT INTO IFNCFD2015 (IFNCOMFIN, IFNCUENTA, GENTERCER, IFNCENCOS, CFDVALDEB, CFDVALCRE, CFDOBSERVA) VALUES "

            'If i = 48 Then
            '    DataParaDinamica.InsertCommand = DataParaDinamica.InsertCommand + "(" & vbIdInsertadoA & ", " & IdCuenta("32080101") & ", " & IdTercero(GridView1.Rows(i).Cells(6).Text.Substring(0, GridView1.Rows(i).Cells(6).Text.Length - 1)) & ", Null, " & GridView1.Rows(i).Cells(8).Text.Replace(",", ".") & ", " & GridView1.Rows(i).Cells(9).Text.Replace(",", ".") & ", '" & GridView1.Rows(i).Cells(10).Text & "')"
            'Else
            DataParaDinamica.InsertCommand = DataParaDinamica.InsertCommand + "(" & vbIdInsertadoA & ", " & IdCuenta(GridView1.Rows(i).Cells(4).Text) & ", " & IdTercero(GridView1.Rows(i).Cells(6).Text.Substring(0, GridView1.Rows(i).Cells(6).Text.Length - 1)) & ", Null, " & GridView1.Rows(i).Cells(8).Text.Replace(",", ".") & ", " & GridView1.Rows(i).Cells(9).Text.Replace(",", ".") & ", '" & GridView1.Rows(i).Cells(10).Text & "')"
            'End If

            Try
                DataParaDinamica.Insert()
            Catch ex As Exception
                Label1.Text = DataParaDinamica.InsertCommand + Label1.Text & " - " & ex.Message & " (" & GridView1.Rows(i).Cells(0).Text & ")"
            End Try

        Next

        Label1.Text = Label1.Text & "<BR />Se hizo inserción de " & i.ToString & " registros."
        GridView1.Visible = False

    End Sub

    Private Function IdCuenta(ByVal CodCuenta As String) As String

        Dim Conexion As New SqlConnection(vbConexion)
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        'Select User_Puente.GuidBDUser  FROM User_Puente INNER JOIN Dat_Pacientes ON User_Puente.IdBDLocal = Dat_Pacientes.IdPaciente WHERE (User_Puente.UsuarioActivo = 1) AND (Dat_Pacientes.IdAntiguo = " & IdAnt & ")"

        StrConsulta = "Select OID FROM IFNCUENTA WHERE CUCCODIGO = N'" & CodCuenta & "'"


        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            Return "null"
            'Return "00000000-0000-0000-0000-000000000000"
        End If

    End Function


    Private Function IdTercero(ByVal CodTercero As String) As String

        Dim Conexion As New SqlConnection(vbConexion)
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT  OID  FROM GENTERCER WHERE TERNUMDOC = N'" & CodTercero & "'" '"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            Return "null"
        End If

    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim Consulta As String
        Dim Conexion As String

        Conexion = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + TextBox1.Text + "; Extended Properties=Excel 8.0;"

        Consulta = "Select " & TextBox3.Text & " From [" + TextBox2.Text + "$] " 'where Seguridad = 14"

        If TextBox4.Text <> "" Then Consulta = Consulta + " where " & TextBox4.Text

        Dim ds As New DataSet

        Dim ConexionOle As New OleDb.OleDbConnection(Conexion)

        Dim ComandoOle As New OleDb.OleDbCommand(Consulta, ConexionOle)

        Dim AdaptadorOle As New OleDb.OleDbDataAdapter(ComandoOle)

        AdaptadorOle.Fill(ds)

        GridView1.DataSource = ds

        GridView1.DataBind()

        Label1.Text = "Se Consulto archivo Excel (" & GridView1.Rows.Count.ToString & " registros) "
        GridView1.Visible = True

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        TextBox1.Text = Request.PhysicalPath.ToString

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click

        'Dim remplazo As String

        Dim i As Integer

        Label1.Text = ""

        For i = 0 To GridView1.Rows.Count - 1
            'remplazo = GridView1.Rows(i).Cells(2).Text

            SqlDataSource1.InsertCommand = "INSERT INTO IFNCFC (COMFCONSEC, IFNTIPCOM, COMFFECHA, COMFESTADO, COMFOBSERV, COMFNUMDOC, COMFTIPDOC, COMFCIERANU) VALUES  (1, 55, CONVERT(DATETIME, '2015-12-31 17:03:25', 102), 1, '" & GridView1.Rows(i).Cells(2).Text & "', '" & GridView1.Rows(i).Cells(2).Text & "', 1996, 0)"

            Try
                SqlDataSource1.Insert()
            Catch ex As Exception
                Label1.Text = SqlDataSource1.InsertCommand + Label1.Text & " - " & ex.Message & " (" & GridView1.Rows(i).Cells(0).Text & ")"
            End Try

            'If i = 1102 Then Exit For

            'CrearUsuario(
        Next

        Label1.Text = Label1.Text & "Se hizo inserción de " & i.ToString & " registros"
        GridView1.Visible = False

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click



        'INSERT INTO Ind_Principal SET (CodIndicador, NomIndicador, DefOperacional) VALUES (N'abc', N'abc', N'abc')

        Dim i As Integer

        Label1.Text = ""

        For i = 0 To GridView1.Rows.Count - 1
            'remplazo = GridView1.Rows(i).Cells(2).Text

            SqlDataSource1.InsertCommand = "INSERT INTO Ind_Principal (CodIndicador, NomIndicador, DefOperacional) VALUES (N'" & GridView1.Rows(i).Cells(0).Text & "', N'" & GridView1.Rows(i).Cells(1).Text & "', N'" & GridView1.Rows(i).Cells(2).Text & "')" '" & GridView1.Rows(i).Cells(2).Text & "', 1996, 0)"

            Try
                SqlDataSource1.Insert()
            Catch ex As Exception
                Label1.Text = SqlDataSource1.InsertCommand + Label1.Text & " - " & ex.Message & " (" & GridView1.Rows(i).Cells(0).Text & ")"
            End Try

            'If i = 1102 Then Exit For

            'CrearUsuario(
        Next

        Label1.Text = Label1.Text & "Se hizo inserción de " & i.ToString & " registros"
        GridView1.Visible = False


    End Sub


End Class
