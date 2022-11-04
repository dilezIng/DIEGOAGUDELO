Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient


Public Class Crear
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        PanelCREARCAPACITACION.Visible = False
        PanelLiderA.visible = False
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
        If String.IsNullOrEmpty(Rs(0)) Then
        Else

            If (Rs(0) = 1) Then
                PanelCREARCAPACITACION.Visible = False

                Label1.Text = "Todos los Empleados cuentan con plan de Inducción"
            Else
                PanelCREARCAPACITACION.Visible = True
            End If

        End If

        Rs.Read()
        '  LabelCargo.Text = Rs(0)



        Rs.Close()
        timedate.Close()




    End Sub



    Protected Sub Listempleados_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Listempleados.SelectedIndexChanged

        PanelCREARCAPACITACION.Visible = True


        Labelnom.text = Listempleados.Text


        Dim empleado2 As String = Listempleados.Text
        Dim SQL3 As String
        Dim timedate2 As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\CAPACITACION.mdf;Integrated Security=True;User Instance=True")
        Dim Rs2 As SqlDataReader
        Dim Com2 As New SqlCommand
        Com2.Connection = timedate2
        timedate2.Open()
        SQL3 = "SELECT  Documento, Nombre1 + ' ' + Nombre2 + ' ' + Apellido1 + ' ' + Apellido2, (SELECT CARGOS.Nombre_Cargo + ' (' + NIVELES.Nombre_Nivel + ')'  FROM CARGOS INNER JOIN PUESTO ON CARGOS.Id = PUESTO.Id_Cargo INNER JOIN AREA_NIVEL ON PUESTO.Id_Areanivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id WHERE (PUESTO.Puestos = EMPLEADO.Puesto)) AS Puesto,  Observaciones FROM EMPLEADO WHERE (Id = N'" & Listempleados.Text & "')"
        Com2 = New SqlCommand(SQL3, timedate2)
        Rs2 = Com2.ExecuteReader()
        Rs2.Read()
        If String.IsNullOrEmpty(Rs2(0)) Then
        Else LabelDocu.Text = Rs2(0)
        End If

        If String.IsNullOrEmpty(Rs2(1)) Then
        Else Labelnom.text = Rs2(1)
        End If

        If String.IsNullOrEmpty(Rs2(2)) Then
        Else LabelCargo.Text = Rs2(2)
        End If

        If String.IsNullOrEmpty(Rs2(3)) Then
        Else LabelObser.Text = Rs2(3)
        End If

        Rs2.Close()
        timedate2.Close()


    End Sub
    Protected Sub btNCREARPLANCAPACITACIONES_Click(sender As Object, e As EventArgs) Handles btNCREARPLANCAPACITACIONES.Click

        Dim empleado As Integer = Listempleados.Text
        Dim i As Integer
        Dim f As Integer
        Dim SQL As String
        Dim SQL22 As String
        Dim SQL3 As String
        Dim timedate As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\CAPACITACION.mdf;Integrated Security=True;User Instance=True")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL22 = "SELECT top 1 TEMAS.ID AS Tema FROM TEMAS INNER JOIN AREA_NIVEL ON TEMAS.Id_Area_Nivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN PUESTO ON AREA_NIVEL.Id_Area_Nivel = PUESTO.Id_Areanivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id INNER JOIN AREAS ON AREA_NIVEL.Id_Area = AREAS.Id INNER JOIN INSTRUCTOR ON TEMAS.Id_Instructor = INSTRUCTOR.Id WHERE (PUESTO.Puestos = (SELECT Puesto FROM EMPLEADO WHERE (Id = " & empleado & "))) AND (TEMAS.Obligatorio = 1)  ORDER BY Tema"
        Com = New SqlCommand(SQL22, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        i = Rs(0)
        Rs.Close()
        timedate.Close()

        Com.Connection = timedate
        timedate.Open()
        SQL3 = "SELECT top 1 TEMAS.ID AS Tema FROM TEMAS INNER JOIN AREA_NIVEL ON TEMAS.Id_Area_Nivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN PUESTO ON AREA_NIVEL.Id_Area_Nivel = PUESTO.Id_Areanivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id INNER JOIN AREAS ON AREA_NIVEL.Id_Area = AREAS.Id INNER JOIN INSTRUCTOR ON TEMAS.Id_Instructor = INSTRUCTOR.Id WHERE (PUESTO.Puestos = (SELECT Puesto FROM EMPLEADO WHERE (Id = " & empleado & "))) AND (TEMAS.Obligatorio = 1)  ORDER BY Tema desc"
        Com = New SqlCommand(SQL3, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()
        f = Rs(0)
        Rs.Close()
        timedate.Close()

        While (i <= f)

            Com.Connection = timedate
            timedate.Open()

            SQL = "SELECT TOP 1  TEMAS.ID  AS Tema, TEMAS.Evaluación as Eval, (Select INSTRUCTOR.[User] from INSTRUCTOR where INSTRUCTOR.Id=TEMAS.Id_Instructor) as Instructor FROM TEMAS INNER JOIN AREA_NIVEL ON TEMAS.Id_Area_Nivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN PUESTO ON AREA_NIVEL.Id_Area_Nivel = PUESTO.Id_Areanivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id INNER JOIN AREAS ON AREA_NIVEL.Id_Area = AREAS.Id  WHERE (PUESTO.Puestos = (SELECT Puesto FROM EMPLEADO WHERE (Id = " & empleado & "))) AND (TEMAS.Obligatorio = 1) and (TEMAS.ID=" & i & ")  ORDER BY Tema "
            Com = New SqlCommand(SQL, timedate)
            Rs = Com.ExecuteReader()


            If Rs.Read() Then
                If String.IsNullOrEmpty(Rs(0)) Then

                Else

                    VISUALCAPACITA.InsertCommand = "INSERT INTO CAPACITACION ([Tema] ,[Empleado],[Evalua],[Observaciones], [Fech_Crea], [Instructor]) VALUES (" & Rs(0) & " ," & empleado & " ," & Rs(1) & " ,'',GETDATE(),N'" & Rs(2) & "' ) "
                    VISUALCAPACITA.Insert()


                End If
            End If
            Rs.Close()
            timedate.Close()
            i = i + 1
        End While
        ''TextBox1.Text = SqlDataLider0.SelectCommand = "SELECT TOP (1) CAPACITACION.Id AS ID FROM EMPLEADO INNER JOIN CAPACITACION ON EMPLEADO.Id = CAPACITACION.Empleado INNER JOIN INSTRUCTOR ON CAPACITACION.Instructor = INSTRUCTOR.Id INNER JOIN TEMAS ON CAPACITACION.Tema = TEMAS.ID WHERE (TEMAS.Nombre_Tema LIKE 'Entrenamiento en el area de desempeño') ORDER BY ID DESC"
        TextBox1.Text = empleado

        PanelLiderA.visible = True
        '   PanelCrea.Visible = False
        ' PanelEdita.Visible = False
        '  PanelInicio.visible = False
        PanelCREARCAPACITACION.Visible = False


    End Sub

    Protected Sub BtnLider_Click(sender As Object, e As EventArgs) Handles BtnLider.Click


        Dim lider As String = DropDownList1.Text
        Dim Usuario As String = TextBox1.Text
        VISUALCAPACITA.UpdateCommand = "Update  CAPACITACION set  Instructor = N'" & lider & "' Where [Empleado]=" & Usuario & " and Instructor= 'LDA001'  "
        VISUALCAPACITA.Update()
        Response.AddHeader("REFRESH", "1;Crear.aspx")

    End Sub




End Class