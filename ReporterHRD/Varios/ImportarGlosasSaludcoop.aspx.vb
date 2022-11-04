Imports System
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient


Partial Class Varios_ImportarGlosasSaludcoop
    Inherits System.Web.UI.Page

    Protected Sub BtnImportar_Click(sender As Object, e As System.EventArgs) Handles BtnImportar.Click

        LblArchivo.Text = ""

        'Dim arrListaArchivos As String()

        For Each Archivo As String In My.Computer.FileSystem.GetFiles("D:\ReporterHRD\Varios\CSV\", FileIO.SearchOption.SearchAllSubDirectories, "*.csv")
            LeerArchivo(Archivo)
        Next

    End Sub

    Private Function LeerArchivo(ByVal NomArchivo As String)


        Dim objReader As New StreamReader(NomArchivo)
        Dim sLine As String = ""
        Dim arrText As New ArrayList()


        Dim vbNumFactura As String
        Dim vbCodConcepto As String
        Dim vbConcepto As String
        Dim vbObservacion As String
        Dim vbValor As String
        Dim vbValor2 As Decimal
        Dim vbSoporte As String

        vbNumFactura = NomArchivo.Substring(NomArchivo.LastIndexOf("\") + 1, NomArchivo.Length - NomArchivo.LastIndexOf(".") + 3)
        If vbNumFactura.Contains(".c") Then vbNumFactura = vbNumFactura.Substring(0, vbNumFactura.IndexOf("."))


        Do
            sLine = objReader.ReadLine
            If Not sLine Is Nothing Then
                arrText.Add(sLine & vbCrLf)
            End If

        Loop Until sLine Is Nothing

        objReader.Close()

        Dim i As Integer = 0

        For Each sLine In arrText



            If i > 0 Then

                Try
                    sLine = sLine.Replace("," + Chr(34) & Chr(34), Chr(34) & "," + Chr(34))

                    sLine = sLine.Replace(Chr(34) & Chr(34) & ",", Chr(34) & ",")

                    sLine = sLine.Replace("|", "")

                    'If sLine.Substring(sLine.Length - 1, 1) = Chr(34) Then
                    sLine = sLine.Substring(0, sLine.Length - 3)
                    'End If

                    vbCodConcepto = sLine.Substring(1, sLine.IndexOf("-") - 2)
                    'vbCodConcepto = "113"


                    vbConcepto = sLine.Substring(sLine.IndexOf("-") + 2, sLine.IndexOf(Chr(34), 5) - sLine.IndexOf("-") - 2)

                    'vbConcepto = "pRUEBA"



                    'If sLine.Contains(Chr(34) & Chr(34) & "GLOSA AUTOMATICA") = True Then
                    'vbObservacion = "GLOSA AUTOMATICA"
                    'sLine = sLine.Replace(Chr(34) & Chr(34) & "GLOSA AUTOMATICA" & Chr(34) & Chr(34), "GLOSA AUTOMATICA")


                    If sLine.Contains(Chr(34) & Chr(34)) = True Then
                        vbObservacion = "No se encontro información"
                    Else
                        vbObservacion = sLine.Substring(sLine.IndexOf(Chr(34), 5) + 3, sLine.IndexOf(Chr(34), sLine.IndexOf(Chr(34), 5) + 4) - sLine.IndexOf(Chr(34), 5) - 3)
                    End If

                    vbValor = sLine.Substring(sLine.LastIndexOf(Chr(34)) + 2, sLine.LastIndexOf(",") - sLine.LastIndexOf(Chr(34)) - 2)
                    vbValor2 = CDec(vbValor)
                    'vbValor = vbValor


                    vbSoporte = sLine.Substring(sLine.LastIndexOf(",") + 1, 1)

                    If vbSoporte = "F" Then
                        vbSoporte = "0"
                    Else
                        vbSoporte = "1"
                    End If

                    'LblArchivo.Text = LblArchivo.Text + " - (" + vbNumFactura + ") (" + vbCodConcepto & ") (" + vbConcepto & ") (" + vbObservacion & ") (" + vbValor & ") (" + vbSoporte + ")</br>"

                    SqlDataSource1.InsertCommand = "INSERT INTO z_DetalleGlosasSaludcoop(IdFactura, CodConcepto, Concepto, Observacion, ValorGlosado, Soporte) VALUES (" & vbNumFactura & ", " & vbCodConcepto & ", N'" & vbConcepto & "', N'" & vbObservacion & "', " & vbValor & ", " & vbSoporte & ")"

                    label1.Text = label1.Text + "<BR />" + SqlDataSource1.InsertCommand

                    SqlDataSource1.Insert()

                Catch ex As Exception
                    LblArchivo.Text = LblArchivo.Text + i.ToString + " " + vbNumFactura + " (" + sLine + ")</br>  " + ex.Message + "</br>"
                    LblArchivo.Text = LblArchivo.Text + vbNumFactura + " > " + vbCodConcepto + " > " + vbConcepto + " > " + vbObservacion + " > " + vbValor + " > " + vbSoporte + "</br>"
                    Exit For
                    'SqlDataSource1.Insert()
                End Try
            End If

            i = i + 1

            'label1.Text = vbNumFactura + " - " + NomArchivo

            vbCodConcepto = ""
            vbConcepto = ""
            vbObservacion = ""
            vbValor = ""
            vbSoporte = ""



        Next

    End Function


    Protected Sub BtnImportar0_Click(sender As Object, e As System.EventArgs) Handles BtnImportar0.Click

        Dim Consulta As String
        Dim Conexion As String
        Dim archivo As String = "D:\ReporterHRD\Varios\CSV\Sogamoso.xls"

        Conexion = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + archivo + "; Extended Properties=Excel 8.0;"

        Consulta = "Select * From [detalleSogamoso$]"

        Dim ds As New DataSet

        Dim ConexionOle As New OleDb.OleDbConnection(Conexion)

        Dim ComandoOle As New OleDb.OleDbCommand(Consulta, ConexionOle)

        Dim AdaptadorOle As New OleDb.OleDbDataAdapter(ComandoOle)

        AdaptadorOle.Fill(ds)

        GridView1.DataSource = ds

        GridView1.DataBind()


        'If GridView1.Rows(5).Cells(1).Text.LastIndexOf(" ") > 0 Then
        '    Label1.Text = Trim(GridView1.Rows(5).Cells(1).Text.Substring(GridView1.Rows(5).Cells(1).Text.LastIndexOf(" "))).ToUpper
        'Else
        '    Label1.Text = "sin apel"
        'End If




        'Dim Nomarchivo As String = "D:\ReporterHRD\Varios\CSV\ListadoFacturas.csv"

        'Dim objReader As New StreamReader(NomArchivo)
        'Dim sLine As String = ""
        'Dim arrText As New ArrayList()

        'Dim vbPrefijofactura As String
        'Dim vbNumFactura As String
        'Dim vbFechaFactura As String


        ''Dim vbCodConcepto As String
        ''Dim vbConcepto As String
        ''Dim vbObservacion As String
        ''Dim vbValor As String
        ''Dim vbSoporte As String

        ''vbNumFactura = NomArchivo.Substring(NomArchivo.LastIndexOf("\") + 1, NomArchivo.Length - NomArchivo.LastIndexOf(".") + 3)

        'Do
        '    sLine = objReader.ReadLine
        '    If Not sLine Is Nothing Then
        '        arrText.Add(sLine & vbCrLf)
        '    End If

        'Loop Until sLine Is Nothing

        'objReader.Close()

        'Dim i As Integer = 0

        'For Each sLine In arrText

        '    If i > 0 Then
        '        Try
        '            vbCodConcepto = sLine.Substring(1, sLine.IndexOf("-") - 2)
        '            vbConcepto = sLine.Substring(sLine.IndexOf("-") + 2, sLine.IndexOf(Chr(34), 5) - sLine.IndexOf("-") - 2)

        '            If sLine.Contains(Chr(34) & Chr(34)) = True Then
        '                vbObservacion = "No se encontro información"
        '            Else
        '                vbObservacion = sLine.Substring(sLine.IndexOf(Chr(34), 5) + 3, sLine.IndexOf(Chr(34), sLine.IndexOf(Chr(34), 5) + 4) - sLine.IndexOf(Chr(34), 5) - 3)
        '            End If

        '            vbValor = sLine.Substring(sLine.LastIndexOf(Chr(34)) + 2, sLine.LastIndexOf(",") - sLine.LastIndexOf(Chr(34)) - 2)
        '            vbSoporte = sLine.Substring(sLine.LastIndexOf(",") + 1, 1)

        '            If vbSoporte = "F" Then
        '                vbSoporte = "0"
        '            Else
        '                vbSoporte = "1"
        '            End If

        '            'LblArchivo.Text = LblArchivo.Text + " - (" + vbNumFactura + ") (" + vbCodConcepto & ") (" + vbConcepto & ") (" + vbObservacion & ") (" + vbValor & ") (" + vbSoporte + ")</br>"

        '            SqlDataSource1.InsertCommand = "INSERT INTO z_DetalleGlosasSaludcoop(IdFactura, CodConcepto, Concepto, Observacion, ValorGlosado, Soporte) VALUES (" & vbNumFactura & ", " & vbCodConcepto & ", N'" & vbConcepto & "', N'" & vbObservacion & "', " & vbValor & ", " & vbSoporte & ")"
        '            SqlDataSource1.Insert()

        '        Catch ex As Exception
        '            LblArchivo.Text = LblArchivo.Text + i.ToString + " " + vbNumFactura + " (" + ex.Message.ToString + ")</br>"
        '        End Try
        '    End If

        '    i = i + 1
        'Next



    End Sub

    Protected Sub BtnImportar1_Click(sender As Object, e As System.EventArgs) Handles BtnImportar1.Click

        Dim i As Integer
        label1.Text = ""
        Dim fecha As String

        For i = 0 To GridView1.Rows.Count - 1
            Try
                fecha = GridView1.Rows(i).Cells(2).Text.Substring(0, 10)
                If GridView1.Rows(i).Cells(2).Text.Substring(0, 10) = "" Then fecha = "2000-01-01"

                SqlDataSource1.InsertCommand = "INSERT INTO z_FacturasGlosasSaludCoop(PrefijoFactura, NumFactura, FechaFactura, Soporte, ValorReclamado, Retenciones, Copagos, Descuentos, ValorGlosa, ValorPago, ValorReconocido, CodigosGlosa) VALUES (N'" & GridView1.Rows(i).Cells(0).Text & "', " & GridView1.Rows(i).Cells(1).Text & ", CONVERT (DATETIME, '" & fecha & " 00:00:00', 102), N'', " & GridView1.Rows(i).Cells(4).Text & ", "

                If IsNumeric(GridView1.Rows(i).Cells(5).Text) Then
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + GridView1.Rows(i).Cells(5).Text.Replace(",", ".") + ", "
                Else
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + "0, "
                End If

                If IsNumeric(GridView1.Rows(i).Cells(6).Text) Then
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + GridView1.Rows(i).Cells(6).Text.Replace(",", ".") + ", "
                Else
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + "0, "
                End If

                If IsNumeric(GridView1.Rows(i).Cells(7).Text) Then
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + GridView1.Rows(i).Cells(7).Text.Replace(",", ".") + ", "
                Else
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + "0, "
                End If

                If IsNumeric(GridView1.Rows(i).Cells(8).Text) Then
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + GridView1.Rows(i).Cells(8).Text.Replace(",", ".") + ", "
                Else
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + "0, "
                End If

                If IsNumeric(GridView1.Rows(i).Cells(9).Text) Then
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + GridView1.Rows(i).Cells(9).Text.Replace(",", ".") + ", "
                Else
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + "0, "
                End If

                If IsNumeric(GridView1.Rows(i).Cells(10).Text) Then
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + GridView1.Rows(i).Cells(10).Text.Replace(",", ".") + ", "
                Else
                    SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + "0, "
                End If


                SqlDataSource1.InsertCommand = SqlDataSource1.InsertCommand + "N'" & GridView1.Rows(i).Cells(11).Text & "')"


                SqlDataSource1.Insert()
            Catch ex As Exception
                label1.Text = i.ToString + " - " + SqlDataSource1.InsertCommand
                Exit For
            End Try



        Next

       


    End Sub
End Class
