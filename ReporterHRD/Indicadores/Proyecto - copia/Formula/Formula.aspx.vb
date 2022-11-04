Imports System.Data
Imports System.Data.SqlClient


Partial Class Indicadores_Proyecto_Admins_AsocIndiUsers
    Inherits System.Web.UI.Page



    Protected Sub GridIndicadores_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridIndicadores.SelectedIndexChanged

        GridIndicadores.Visible = False
        TextBox1.Text = GridIndicadores.SelectedValue.ToString
        PanelFormula.Visible = True

        Dim id_indi As String = GridIndicadores.SelectedValue.ToString

        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Com2 As New SqlCommand
        Com2.Connection = timedate2
        timedate2.Open()
        SQL2 = "SELECT  TOP 1 case when Ind_Principal.Tipo_Formula is not null then Ind_Principal.Tipo_Formula else 1 end, case when Ind_Principal.Meta is not null then Ind_Principal.Meta else 0 end, CASE WHEN Ind_Principal.F1 IS NOT NULL THEN Ind_Principal.F1 ELSE 0 END, CASE WHEN Ind_Principal.F2 IS NOT NULL THEN Ind_Principal.F2 ELSE 0 END, CASE WHEN Ind_Principal.Fanual IS NOT NULL THEN Ind_Principal.Fanual ELSE 0 END FROM Ind_Principal  WHERE (Ind_Principal.IdIndicador  =N'" & id_indi & "')"
        Com2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Com2.ExecuteReader()
        Rs2.Read()

        Tipo_Formula.Text = Rs2(0)
        META1.text = Rs2(1)
        for1.Text = Rs2(2)
        for2.Text = Rs2(3)
        Fora.Text = Rs2(4)

        Rs2.Close()
        timedate2.Close()

    End Sub




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim Tipo As String = Tipo_Formula.Text
        Dim Id As String = TextBox1.Text
        Dim m1 As String = META1.Text
        Dim f1 As String = for1.Text
        Dim f2 As String = for2.Text
        Dim fa As String = Fora.Text

        DataGridindicadores0.UpdateCommand = "UPDATE Ind_Principal SET Tipo_Formula=N'" & Tipo & "', Meta=N'" & m1 & "', F1=N'" & f1 & "', F2=N'" & f2 & "', Fanual=N'" & fa & "' WHERE (IdIndicador=N'" & Id & "')"
        DataGridindicadores0.Update()
        PanelFormula.Visible = False
        GridIndicadores.Visible = True
        Response.AddHeader("REFRESH", "1;Formula.aspx")
    End Sub
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        Dim SQL2 As String
        Dim SQL21 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Com2 As New SqlCommand
        Dim Rs21 As SqlDataReader
        Dim Com21 As New SqlCommand
        Com2.Connection = timedate2
        Com21.Connection = timedate2
        timedate2.Open()
        SQL2 = "SELECT  IdAno FROM Ind_Resultado3 order by IdAno desc"
        SQL21 = "SELECT  IdAno  FROM Ind_Resultado3 order by IdAno desc"
        Com2 = New SqlCommand(SQL2, timedate2)
        Com21 = New SqlCommand(SQL21, timedate2)

        Rs2 = Com2.ExecuteReader()
        Rs2.Read()
        If Rs2.Read() Then
            Anual.Text = Rs2(0) + 1
            Anual2.Text = Rs2(0)
            Rs2.Close()
        End If
        Rs2.Close()





    End Sub


    Protected Sub BtnCrear_Click(sender As Object, e As EventArgs) Handles BtnCrear.Click
        Dim intFlag As Integer = 1
        Dim intFlag2 As Integer = 1
        Dim mes As String
        Dim Anual3 As String = Anual.Text
        Dim Finindi As Integer
        Dim SQL2 As String
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs2 As SqlDataReader
        Dim Com2 As New SqlCommand
        Com2.Connection = timedate2
        timedate2.Open()
        SQL2 = "select top 1 IdIndicador from Ind_Principal order by IdIndicador desc"
        Com2 = New SqlCommand(SQL2, timedate2)
        Rs2 = Com2.ExecuteReader()
        Rs2.Read()
        Finindi = Rs2(0)
        Rs2.Close()
        timedate2.Close()
        While (intFlag <= Finindi)
            intFlag2 = 1

            While (intFlag2 <= 12)
                mes = "[" & intFlag2 & "]"
                DataInsert.InsertCommand = "INSERT INTO [Ind_Grafica] ([IdIndi] , [Anual], [Mes], [Resultado]) VALUES (N'" & intFlag & "',N'" & Anual3 & "','" & mes & "',0)"
                DataInsert.Insert()
                intFlag2 = intFlag2 + 1
            End While
            DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',1,N'Numerador',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
            DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',2,N'Denominador',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',3,N'Resultado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',4,N'Observaciones',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',5,N'IdUsCargo',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',6,N'Analisis',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',7,N'Estrategias',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',8,N'Factibilidad',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',9,N'Gravedad',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',10,N'Actualizado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
                DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',11,N'Meta',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
                DataInsert.Insert()
            DataInsert.InsertCommand = "INSERT INTO [Ind_Resultado3] ([IdIndicador] , [IdAno], [IdItem], [Item],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], Anual, S1, S2) VALUES (N'" & intFlag & "',N'" & Anual3 & "',12,N'Distancia Meta',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"
            DataInsert.Insert()


            intFlag = intFlag + 1
        End While

    End Sub
End Class
