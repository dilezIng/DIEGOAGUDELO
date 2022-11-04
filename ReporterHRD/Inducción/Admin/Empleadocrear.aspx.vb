Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Public Class Empleadocrear
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        PanelCrea.Visible = False
        PanelEdita.Visible = False
        PanelInicio.visible = True


        Edit_Empleado.visible = False
        Dim SQL22 As String

        Dim ii As Integer
        Dim timedate As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\CAPACITACION.mdf;Integrated Security=True;User Instance=True")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL22 = "Select case when (SELECT TOP 1 Id FROM EMPLEADO WHERE ((SELECT TOP (1) Empleado FROM CAPACITACION WHERE (Empleado = EMPLEADO.Id)) IS NULL) ) is null then 1 else 2 end"
        Com = New SqlCommand(SQL22, timedate)
        Rs = Com.ExecuteReader()
        '    Rs.Read()
        ' ii = Rs(0)

        Rs.Read()
        '  LabelCargo.Text = Rs(0)



        Rs.Close()
        timedate.Close()

    End Sub

    Protected Sub CREAR_Click(sender As Object, e As EventArgs) Handles CREAR.Click

        PanelCrea.Visible = True
        PanelEdita.Visible = False
        PanelInicio.visible = False

        Edit_Empleado.visible = False

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        If String.IsNullOrEmpty(doc.Text) Or String.IsNullOrEmpty(nom1.Text) Or String.IsNullOrEmpty(ape1.Text) Or String.IsNullOrEmpty(tel.Text) Or String.IsNullOrEmpty(correo.Text) Or String.IsNullOrEmpty(listpuest.Text) Or listpuest.Text = 34 Then

            Label1.Text = "Existen campos vacios "

            If String.IsNullOrEmpty(doc.Text) Then
                Labeldoc.text = "***"
            Else Labeldoc.text = " "
            End If

            If String.IsNullOrEmpty(nom1.Text) Then
                Labelnom1.text = "***"
            Else Labelnom1.text = " "
            End If


            If String.IsNullOrEmpty(ape1.Text) Then
                Labelap1.text = "***"
            Else
                Labelap1.text = " "
            End If



            If String.IsNullOrEmpty(tel.Text) Then
                Labeltel.text = "***"

            Else Labeltel.text = " "
            End If

            If String.IsNullOrEmpty(correo.Text) Then
                Labelcorreo.text = "***"


            Else Labelcorreo.text = " "
            End If



            If listpuest.Text = 34 Then
                Labelpuesto.text = "***"
            Else Labelpuesto.text = " "

            End If


            PanelCrea.Visible = True
            PanelEdita.Visible = False
            PanelInicio.visible = False

            Edit_Empleado.visible = False
        Else

            SqlDataEmpl.InsertCommand = "INSERT INTO EMPLEADO (Documento ,Nombre1 ,Nombre2 ,Apellido1 ,Apellido2 ,Telefono ,Correo ,Puesto ,Observaciones) VALUES(N'" & doc.Text & "',N'" & nom1.Text & "',N'" & nom2.Text & "',N'" & ape1.Text & "',N'" & ape2.Text & "',N'" & tel.Text & "',N'" & correo.Text & "',N'" & listpuest.text & "',N'" & observacion.text & "')"
            SqlDataEmpl.Insert()
            PanelCrea.Visible = False
            PanelEdita.Visible = False
            PanelInicio.visible = True

            Edit_Empleado.visible = False

        End If

    End Sub







    Protected Sub EDITAR_Click(sender As Object, e As EventArgs) Handles EDITAR.Click
        PanelCrea.Visible = False
        PanelEdita.Visible = False
        PanelInicio.visible = False

        Edit_Empleado.visible = True
        GridView5.Visible = True
        Editemple.visible = False

    End Sub


    Protected Sub GridView5_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView5.SelectedIndexChanged
        PanelCrea.Visible = False
        PanelEdita.Visible = False
        PanelInicio.visible = False

        Edit_Empleado.visible = True
        GridView5.Visible = False
        Editemple.visible = True
        Dim Empleado As Integer = GridView5.SelectedValue.ToString


        Dim SQL22 As String

        Dim timedate As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\CAPACITACION.mdf;Integrated Security=True;User Instance=True")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL22 = "Select Documento ,Nombre1 ,Nombre2 ,Apellido1 ,Apellido2 ,Telefono ,Correo ,Puesto ,Observaciones from EMPLEADO Where (Id=" & Empleado & ") "
        Com = New SqlCommand(SQL22, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        TextBox2.Text = Rs(0)
        TextBox3.Text = Rs(1)
        TextBox4.Text = Rs(2)
        TextBox5.Text = Rs(3)
        TextBox6.Text = Rs(4)
        TextBox7.Text = Rs(5)
        TextBox8.Text = Rs(6)
        textDropDownList2.Text = Empleado
        textDropDownList3.text = Rs(7)
        ' SqlDataSource2.SelectCommand = "SELECT PUESTO.Puestos AS Id, CARGOS.Nombre_Cargo + ' (' + NIVELES.Nombre_Nivel + ')' AS Expr1 FROM CARGOS INNER JOIN PUESTO ON CARGOS.Id = PUESTO.Id_Cargo INNER JOIN AREA_NIVEL ON PUESTO.Id_Areanivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id where PUESTO.Puestos=" & Rs(7) & "  ORDER BY CARGOS.Nombre_Cargo"
        ' DropDownList2.DataBind()

        TextBox9.Text = Rs(8)
        Rs.Close()
        timedate.Close()





    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim Empleado As Integer = textDropDownList2.Text
        VISUALCAPACITA.UpdateCommand = "Update  EMPLEADO set  Documento =" & TextBox2.Text & " ,Nombre1 =N'" & TextBox3.Text & "',Nombre2 =N'" & TextBox4.Text & "',Apellido1 =N'" & TextBox5.Text & "',Apellido2 =N'" & TextBox6.Text & "',Telefono =N'" & TextBox7.Text & "',Correo =N'" & TextBox8.Text & "',Observaciones =N'" & TextBox9.Text & "' Where (Id=" & Empleado & " )"

        VISUALCAPACITA.Update()


    End Sub

End Class