Imports System.Data
Imports System.Data.SqlClient

Partial Class Update_DescoEpicri
    Inherits System.Web.UI.Page

    Dim vbFunciones As New FunBasicas
    Dim vbEmpresaConn As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        vbEmpresaConn = vbFunciones.ConexionesBDs(ListSedes.SelectedValue.ToString)
       
       

    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles ButtonConsultar.Click

        ListSedes.Enabled = False


        LabelInfo.Text = ""
        TextObservacion.Text = ""

        DataUpdate.ConnectionString = vbEmpresaConn

        DatPaciente(TextNumDoc.Text)
        PanelCambioDatos.Enabled = True

    End Sub


    Private Function DatPaciente(ByVal NumDocumento As String)

        Dim Conexion As New SqlConnection(vbEmpresaConn)
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT GENPACIEN.OID AS IdPaciente, GENPACIEN.PACNUMDOC, GENPACIEN.PACTIPDOC, GENPACIEN.GPANUMCAR, GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE + ' ' + GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM AS NomPaciente, GENTERCER.TERNUMDOC, GENTERCER.TERTIPDOC, GENTERCER.OID AS IdTercero, GENPACIEN.PACPRINOM, GENPACIEN.PACSEGNOM, GENPACIEN.PACPRIAPE, GENPACIEN.PACSEGAPE, GPANOMPAD, GPANOMMAD FROM GENPACIEN INNER JOIN GENTERCER ON GENPACIEN.GENTERCER = GENTERCER.OID   " 'WHERE ADNINGRESO.AINCONSEC = " + TxtNumEpicri.Text

        StrConsulta = StrConsulta + "WHERE GENPACIEN.PACTIPDOC=10 AND (GENPACIEN.PACNUMDOC = N'" & NumDocumento & "')" '+ TxtNumEpicri.Text 'Por Ingreso

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        PanelCambioDatos.Visible = True

        If objDS.Tables(0).Rows.Count > 0 Then

            LabelIdPaciente.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            LabelIdTercero.Text = objDS.Tables(0).Rows(0).Item(7).ToString

            LabelDatpaciente.Text = "Paciente: " + objDS.Tables(0).Rows(0).Item(4).ToString + "<br/>"

            TextNueNumDoc.Text = objDS.Tables(0).Rows(0).Item(1).ToString

            TextNuePrimNombre.Text = objDS.Tables(0).Rows(0).Item(8).ToString
            TextNueSegNombre.Text = objDS.Tables(0).Rows(0).Item(9).ToString
            TextNuePrimApel.Text = objDS.Tables(0).Rows(0).Item(10).ToString
            TextNueSegApel.Text = objDS.Tables(0).Rows(0).Item(11).ToString
            TextNueNomPadre.Text = objDS.Tables(0).Rows(0).Item(12).ToString
            TextNueNomMadre.Text = objDS.Tables(0).Rows(0).Item(13).ToString

            LabelDatpaciente.Text = LabelDatpaciente.Text + "Tipo Documento Paciente: " + vbFunciones.TipoDocGen(objDS.Tables(0).Rows(0).Item(2).ToString) + "<br/>"
           Try
              
            Catch ex As Exception

            End Try
            LabelDatpaciente.Text = LabelDatpaciente.Text + "Tipo Documento Tercero: " + vbFunciones.TipoDocGen(objDS.Tables(0).Rows(0).Item(6).ToString) + "<br/>"

            LabelDatpaciente.Text = LabelDatpaciente.Text + "Documento Tercero: " + objDS.Tables(0).Rows(0).Item(5).ToString + "<br/>"
            LabelDatpaciente.Text = LabelDatpaciente.Text + "Número Carpeta: " + objDS.Tables(0).Rows(0).Item(3).ToString + "<br/>"
        Else
            LabelInfo.ForeColor = Drawing.Color.Red
            LabelInfo.Text = "Paciente no encontrado."
            LabelDatpaciente.Text = ""
            PanelCambioDatos.Visible = False
        End If
       
    End Function

    Protected Sub BtnGrabar_Click(sender As Object, e As System.EventArgs) Handles BtnGrabar.Click

        LabelInfo.Text = ""
        LabelInfo.Visible = False
 Dim NumOld As String
 NumOld=TextNueNumDoc.Text
        DataUpdate.ConnectionString = vbEmpresaConn

        LabelInfo.ForeColor = Drawing.Color.Red

        If PacienteExiste(TextNueNumDoc.Text) = False Then
          
                'If TextObservacion.Text.Trim.ToUpper.Length > 0 Then

                If TextNueNumDoc.Text.Trim.ToUpper.Length > 0 And TextNuePrimNombre.Text.Trim.ToUpper.Length > 0 And TextNuePrimApel.Text.Trim.ToUpper.Length > 0 Then

                    DataUpdate.UpdateCommand = "UPDATE GENPACIEN SET PACNUMDOC = N'" & TextNueNumDoc.Text.Trim & "',  GPANUMCAR = N'" & TextNueNumDoc.Text.Trim & "', PACPRINOM = N'" & TextNuePrimNombre.Text.Trim.ToUpper & "', PACSEGNOM = N'" & TextNueSegNombre.Text.Trim.ToUpper & "', PACPRIAPE = N'" & TextNuePrimApel.Text.Trim.ToUpper & "', PACSEGAPE = N'" & TextNueSegApel.Text.Trim.ToUpper & "', GPANOMPAD = N'" & TextNueNomPadre.Text.Trim.ToUpper & "', GPANOMMAD = N'" & TextNueNomMadre.Text.Trim.ToUpper & "'  WHERE OID = " & LabelIdPaciente.Text
                    DataUpdate.Update()

                    DataUpdate.UpdateCommand = "UPDATE  GENTERCER SET TERNUMDOC = N'" & TextNueNumDoc.Text.Trim.ToUpper & "',  TERPRINOM = N'" & TextNuePrimNombre.Text.Trim.ToUpper & "', TERSEGNOM = N'" & TextNueSegNombre.Text.Trim.ToUpper & "', TERPRIAPE = N'" & TextNuePrimApel.Text.Trim.ToUpper & "', TERSEGAPE = N'" & TextNueSegApel.Text.Trim.ToUpper & "' WHERE OID = " & LabelIdTercero.Text
                    DataUpdate.Update()

                    TextObservacion.Text  = Page.User.Identity.Name.ToString+" Homologo el Número del consecutivo " + NumOld

                    DataUpdate.InsertCommand = "INSERT INTO GENHISPAC(GPACODIGO, GHPFECHIS, GPHMOTIVO, GPHESTFIN) VALUES (" & LabelIdPaciente.Text & ", GETDATE(), N'" & TextObservacion.Text.Trim & "', 1)"
                    If TextObservacion.Text.Length > 0 Then DataUpdate.Insert()

                    LabelInfo.Visible = True
                    LabelInfo.Text = "Se actualizo con éxito"
                    LabelInfo.ForeColor = Drawing.Color.Green

                    PanelCambioDatos.Enabled = False

                    DatPaciente(TextNueNumDoc.Text)
                    TextNumDoc.Text = ""

                Else
                    LabelInfo.Visible = True
                    LabelInfo.Text = "Debe contener minimo Número de Documento, Primer Nombre y Primer Apellido"
                End If
                'Else
                '    LabelInfo.Visible = True
                '    LabelInfo.Text = "El campo Descripción se encuentra en blanco"
                'End If
        

        Else
            LabelInfo.Text = "Ya existe un paciente con el nuevo número de documento, no se puede Actualizar la información."
            LabelInfo.Visible = True
        End If

    End Sub

    Private Function PacienteExiste(ByVal NumDocumento As String) As Boolean

        Dim Conexion As New SqlConnection(vbEmpresaConn)
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT OID FROM GENPACIEN WHERE PACNUMDOC = N'" & NumDocumento & "' AND OID <> " & LabelIdPaciente.Text


        'SELECT GENPACIEN.OID AS IdPaciente, GENTERCER.OID AS IdTercero FROM GENPACIEN FULL OUTER JOIN GENTERCER ON GENPACIEN.GENTERCER = GENTERCER.OID WHERE (GENPACIEN.PACNUMDOC = N'" & NumDocumento & "') OR (GENTERCER.TERNUMDOC = N'" & NumDocumento & "')

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        PanelCambioDatos.Visible = True

        If objDS.Tables(0).Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If

    End Function

End Class
