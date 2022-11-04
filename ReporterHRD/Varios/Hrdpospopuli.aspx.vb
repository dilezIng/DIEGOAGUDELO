Imports System
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.UI.WebControls
Partial Class Varios_Default
    Inherits System.Web.UI.Page

    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()>
    Public Shared Function BusqUsuario(ByVal prefixText As String, ByVal count As Integer) As List(Of String)

        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        Dim filtro As String
        filtro = prefixText


        StrConsulta = "SELECT  CODIGO+'_'+DESCRIPCION AS CODIGO FROM [Aud_POSPOPULIHRD] WHERE CODIGO+'_'+DESCRIPCION LIKE N'%" & filtro & "%'  ORDER BY CODIGO"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Dim i As Integer
            For i = 0 To objDS.Tables(0).Rows.Count - 1
                Lista.Add(objDS.Tables(0).Rows(i).Item(0).ToString)
            Next
        End If

        Return Lista

    End Function



    Protected Sub BtnBuscar_Click(sender As Object, e As System.EventArgs) Handles BtnBuscar.Click
        ' Panel_RESULTADO.Visible = True
        LblIdUser.Text = TextBox1.Text
        ' GridView5.Visible = False
        Dim buscar As String = TextBox1.Text
        Dim Cadena As String
        Cadena = LblIdUser.Text
        Dim AUD As String = "AUD"
        Dim SUA As String = "SUA"
        Dim lbl As New Label
        lbl.Text = Page.User.Identity.Name.ToString
        Dim useer As String = Page.User.Identity.Name.ToString
        LbPospopuli.text = useer


        Dim caracteres As String
        Dim ArrCadena As String() = Cadena.Split("_")
        Dim Cadena2 As String = ArrCadena(0)
        Dim Conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DbBridgeConnectionString").ToString())
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter
        LblIdUser.Text = buscar

        lbl.Text = ArrCadena(0)
        StrConsulta = "SELECT CODIGO FROM Aud_POSPOPULIHRD WHERE CODIGO+'_'+DESCRIPCION  = N'" & buscar & "'"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        Dim sq As String

        Dim timd As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rsa1983 As SqlDataReader

        Dim Coma123456 As New SqlCommand
        Coma123456.Connection = timd
        timd.Open()
        sq = "SELECT DESCRIPCIONPXPOSPOPULI,SECCION,ALERTAPBS,CAPITULO, ALERTA6,GRUPOCONC,ALERTA2,  SUBGRUPOCONC,ALERTA3,CATEGORIA,ALERTA4, CODIGO2,ALERTA5,DESCRIPCION2,ALERTA6,REALIZALHRD,ALERTA7,ESPECIALIDAD,CODIGOSOAT,DESCRIPCIONSOAT,OBSERVACION,GRUPOQUIRURPUNTOS,GRUPO,ESPECIALIDAD1,PUNTOSACALCULAR,OBSDEPC,VALORASOATPLENO,CODIGOSOAT,DESCRIPCIONSOAT,PUNTOSACALCULAR,GRUPO,ESPECIALIDAD1, case when SEXO='M' THEN 'Masculino' when SEXO='F' THEN 'Femenino' when SEXO='Z' THEN 'Todos' END, CASE WHEN AMBITO='A' THEN 'Ambulatorio' WHEN AMBITO='H' THEN 'Hospitalario' WHEN AMBITO='U' THEN 'Urgencias' WHEN AMBITO='D' THEN 'Domiciliario' WHEN AMBITO='Z' THEN 'Sin Restricción' END,CASE WHEN ESTANCIA='E' THEN 'Debe Terner Asociado' WHEN ESTANCIA='Z' THEN 'Sin Restricción' END ,CASE WHEN COBERTURA='PBS' THEN 'Hace parte del Plan de Beneficios' WHEN COBERTURA='NOPBS' THEN 'NO Hace parte del Plan de Beneficios' END ,CASE WHEN DUPLICADO='A' THEN 'Procedimento que  se realiza una vez en el año' WHEN DUPLICADO='D' THEN 'Procedimento que  se realiza una vez en el día'  WHEN DUPLICADO='Z' THEN 'Sin Restricción' END ,CASE WHEN VIDA='V' THEN 'Procedimento que  se realiza una vez en la vida' WHEN VIDA='Z' THEN 'Sin Restricción' END,CIE10RELACIONADOS  FROM Aud_POSPOPULIHRD WHERE CODIGO+'_'+DESCRIPCION  = N'" & buscar & "'"
        Coma123456 = New SqlCommand(sq, timd)
        Rsa1983 = Coma123456.ExecuteReader()
        If Rsa1983.Read() Then

            If String.IsNullOrEmpty(Rsa1983(0)) Then
            Else LbPospopuli.Text = Rsa1983(0)
            End If
            If String.IsNullOrEmpty(Rsa1983(1)) Then
            Else A1.text = Rsa1983(1)
            End If
            If String.IsNullOrEmpty(Rsa1983(2)) Then
            Else A2.text = Rsa1983(2)
            End If
            If String.IsNullOrEmpty(Rsa1983(3)) Then
            Else B1.Text = Rsa1983(3)
            End If
            If String.IsNullOrEmpty(Rsa1983(4)) Then
            Else B2.text = Rsa1983(4)
            End If
            If String.IsNullOrEmpty(Rsa1983(5)) Then
            Else C1.text = Rsa1983(5)
            End If
            If String.IsNullOrEmpty(Rsa1983(6)) Then
            Else C2.text = Rsa1983(6)
            End If
            If String.IsNullOrEmpty(Rsa1983(7)) Then
            Else D1.text = Rsa1983(7)
            End If
            If String.IsNullOrEmpty(Rsa1983(8)) Then
            Else D2.text = Rsa1983(8)
            End If
            If String.IsNullOrEmpty(Rsa1983(9)) Then
            Else E1.text = Rsa1983(9)
            End If
            If String.IsNullOrEmpty(Rsa1983(10)) Then
            Else E2.text = Rsa1983(10)
            End If
            If String.IsNullOrEmpty(Rsa1983(11)) Then
            Else F1.text = Rsa1983(11)
            End If
            If String.IsNullOrEmpty(Rsa1983(12)) Then
            Else F2.text = Rsa1983(12)
            End If
            If String.IsNullOrEmpty(Rsa1983(13)) Then
            Else G1.text = Rsa1983(13)
            End If
            If String.IsNullOrEmpty(Rsa1983(14)) Then
            Else G2.text = Rsa1983(14)
            End If
            If String.IsNullOrEmpty(Rsa1983(15)) Then
            Else H1.text = Rsa1983(15)
            End If
            If String.IsNullOrEmpty(Rsa1983(16)) Then
            Else H2.text = Rsa1983(16)
            End If
            If String.IsNullOrEmpty(Rsa1983(17)) Then
            Else I1.text = Rsa1983(17)
            End If
            If String.IsNullOrEmpty(Convert.ToString(Rsa1983(18))) Then
            Else k1.text = Rsa1983(18)
            End If
            If String.IsNullOrEmpty(Rsa1983(19)) Then
            Else L1.text = Rsa1983(19)
            End If

            If String.IsNullOrEmpty(Rsa1983(20)) Then
            Else USER1.text = Rsa1983(20)
            End If
            If String.IsNullOrEmpty(Rsa1983(21)) Then
            Else USER2.text = Rsa1983(21)
            End If
            If String.IsNullOrEmpty(Rsa1983(22)) Then
            Else USER3.text = Rsa1983(22)
            End If
            If String.IsNullOrEmpty(Rsa1983(23)) Then
            Else USER4.text = Rsa1983(23)
            End If
            If String.IsNullOrEmpty(Convert.ToString(Rsa1983(24))) Then
            Else USER5.text = Rsa1983(24)
            End If
            If String.IsNullOrEmpty(Convert.ToString(Rsa1983(25))) Then
            Else USER6.text = Rsa1983(25)
            End If

            If String.IsNullOrEmpty(Convert.ToString(Rsa1983(26))) Then
            Else AU1.text = CInt(Rsa1983(26))
            End If
            If String.IsNullOrEmpty(Convert.ToString(Rsa1983(27))) Then
            Else AU2.text = Rsa1983(27)
            End If
            If String.IsNullOrEmpty(Convert.ToString(Rsa1983(28))) Then
            Else AU3.text = Rsa1983(28)
            End If
            If String.IsNullOrEmpty(Convert.ToString(Rsa1983(29))) Then
            Else AU4.text = Rsa1983(29)
            End If
            If String.IsNullOrEmpty(Convert.ToString(Rsa1983(30))) Then
            Else AU5.text = Rsa1983(30)
            End If
            If String.IsNullOrEmpty(Convert.ToString(Rsa1983(31))) Then
            Else AU6.text = Rsa1983(31)
            End If


            If String.IsNullOrEmpty(Rsa1983(32)) Then
            Else Label1.text = Rsa1983(32)
            End If
            If String.IsNullOrEmpty(Rsa1983(33)) Then
            Else Label2.text = Rsa1983(33)
            End If
            If String.IsNullOrEmpty(Rsa1983(34)) Then
            Else Label3.text = Rsa1983(34)
            End If
            If String.IsNullOrEmpty(Rsa1983(35)) Then
            Else Label4.text = Rsa1983(35)
            End If
            If String.IsNullOrEmpty(Rsa1983(36)) Then
            Else Label5.text = Rsa1983(36)
            End If
            If String.IsNullOrEmpty(Rsa1983(37)) Then
            Else Label6.text = Rsa1983(37)
            End If
            If String.IsNullOrEmpty(Rsa1983(38)) Then
            Else Label7.text = Rsa1983(38)
            End If

            Rsa1983.Close()


        End If


        timd.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            LblIdUser.Text = objDS.Tables(0).Rows(0).Item(0).ToString
            LblIdUser2.Text = buscar
            LblIdUser.Visible = True

        Else
            LblIdUser.Text = Cadena
            LblIdUser2.Text = Cadena2
        End If


        If String.IsNullOrEmpty(useer) Then
        Else
            caracteres = useer.Substring(0, 3)
        End If

        If String.IsNullOrEmpty(useer) Then
            Panel_RESULTADO.Visible = True
            Panel_USER.Visible = False
            Panel_aud.Visible = False
        Else

            If caracteres = SUA Then
                Panel_RESULTADO.Visible = True
                Panel_USER.Visible = True
                Panel_aud.Visible = False
            ElseIf caracteres = AUD Then
                Panel_RESULTADO.Visible = True
                Panel_USER.Visible = True
                Panel_aud.Visible = True



            End If
        End If





    End Sub




    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Panel_RESULTADO.Visible = False
        Panel_USER.Visible = False
        Panel_aud.Visible = False
    End Sub
End Class
