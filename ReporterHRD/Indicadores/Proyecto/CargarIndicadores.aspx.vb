Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing



Partial Class Indicadores_Proyecto_CargarIndicadores
    Inherits System.Web.UI.Page

    Dim vbFunciones As New FunBasicas




    Protected Sub GridIndicadores_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridIndicadores.SelectedIndexChanged
        LabelIdResIndicador.Text = GridIndicadores.SelectedValue.ToString
        Panel1.Visible = False
        GridIndicadores.Visible = False
        PanelUPDATE.Visible = True
        LblSubtitulo.Text = "Editando información del indicador"
        Dim Mes As String = ListMese.text
        Dim Anual As String = LAnual.text
        Dim IdIndi As String = GridIndicadores.SelectedValue.ToString

        Dim SQL1 As String
        Dim SQL2 As String
        Dim SQL3 As String
        Dim SQL6 As String
        Dim SQL7 As String
        Dim SQL8 As String
        Dim SQL9 As String


        Dim Rs1 As SqlDataReader
        Dim Rs2 As SqlDataReader
        Dim Rs3 As SqlDataReader
        Dim Rs6 As SqlDataReader
        Dim Rs7 As SqlDataReader
        Dim Rs8 As SqlDataReader
        Dim Rs9 As SqlDataReader

        Dim Com1 As New SqlCommand
        Dim Com2 As New SqlCommand
        Dim Com3 As New SqlCommand
        Dim Com6 As New SqlCommand
        Dim Com7 As New SqlCommand
        Dim Com8 As New SqlCommand
        Dim Com9 As New SqlCommand
        Dim timedate2 As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Com1.Connection = timedate2

        Com2.Connection = timedate2
        Com3.Connection = timedate2
        Com6.Connection = timedate2
        Com7.Connection = timedate2
        Com8.Connection = timedate2
        Com9.Connection = timedate2
        timedate2.Open()
        SQL3 = "SELECT  TOP 1 Ind_Principal.CodIndicador, Ind_Principal.NomIndicador, case when  Ind_Principal.DefOperacional is null then 'Sin Definición' else Ind_Principal.DefOperacional end FROM Ind_Principal  WHERE (Ind_Principal.IdIndicador  =N'" & IdIndi & "') "
        SQL1 = "Select " & Mes & " AS UrlEstado from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 1) "
        SQL2 = "Select " & Mes & " AS UrlEstado from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 2) "
        SQL6 = "Select " & Mes & " AS UrlEstado from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 6) "
        SQL7 = "Select " & Mes & " AS UrlEstado from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 7) "
        SQL8 = "Select " & Mes & " AS UrlEstado from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 8) "
        SQL9 = "Select " & Mes & " AS UrlEstado from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 9) "

        Com1 = New SqlCommand(SQL1, timedate2)
        Com2 = New SqlCommand(SQL2, timedate2)
        Com3 = New SqlCommand(SQL3, timedate2)
        Com6 = New SqlCommand(SQL6, timedate2)
        Com7 = New SqlCommand(SQL7, timedate2)
        Com8 = New SqlCommand(SQL8, timedate2)
        Com9 = New SqlCommand(SQL9, timedate2)

        Rs1 = Com1.ExecuteReader()

        Rs1.Read()
        TextNumerador.Text = Rs1(0)
        Rs1.Close()

        Rs2 = Com2.ExecuteReader()
        Rs2.Read()
        TextDenominador.Text = Rs2(0)
        Rs2.Close()

        Rs3 = Com3.ExecuteReader()
        Rs3.Read()
        LabelIdResIndicado.Text = Rs3(0)
        LabelNomIndicador.text = Rs3(1)
        LabelDefOperacional.Text = Rs3(2)

        Rs3.Close()

        Rs6 = Com6.ExecuteReader()
        Rs6.Read()
        TxtAnalisis.Text = Rs6(0)
        Rs6.Close()

        Rs7 = Com7.ExecuteReader()
        Rs7.Read()
        TxtEstrategias.Text = Rs7(0)
        Rs7.Close()

        Rs8 = Com8.ExecuteReader()
        Rs8.Read()
        ListFactibilidad.Text = Rs8(0)
        Rs8.Close()

        Rs9 = Com9.ExecuteReader()
        Rs9.Read()
        ListGravedad.Text = Rs9(0)
        Rs9.Close()


        timedate2.Close()



    End Sub

    Protected Sub BtnCancelar_Click(sender As Object, e As System.EventArgs)


        GridIndicadores.Visible = True
        LblSubtitulo.Text = GridIndicadores.Rows.Count.ToString + " Indicadores asignados"

    End Sub








    Protected Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click




        If String.IsNullOrEmpty(TxtAnalisis.Text) Or TxtAnalisis.Text = "0" Then
                    Label1.Text = "No puede dejar el Analisis en blanco "
                    PanelUPDATE.Visible = True
                    Panel1.Visible = True

                Else
                    If String.IsNullOrEmpty(TxtEstrategias.Text) Or TxtEstrategias.Text = "0" Then
                        Label1.Text = "No puede dejar las Estrategias en blanco "
                        PanelUPDATE.Visible = True
                        Panel1.Visible = True

                    Else

                        If String.IsNullOrEmpty(ListFactibilidad.Text) Or ListFactibilidad.Text = "0" Then
                            Label1.Text = "Selecione una Factibilidad "
                            PanelUPDATE.Visible = True
                            Panel1.Visible = True

                        Else

                            If String.IsNullOrEmpty(ListGravedad.Text) Or ListGravedad.Text = "0" Then
                                Label1.Text = "Selecione una Gravedad"
                                PanelUPDATE.Visible = True
                                Panel1.Visible = True

                            Else





                                Label1.Text = "Guardando Indicador "
                                Dim Mes As String = ListMese.text
                                Dim Anual As String = LAnual.text
                                Dim IdIndi As String = LabelIdResIndicador.Text
                                Dim DE As String = TextDenominador.Text
                                Dim SDE As Integer
                                Dim SDE2 As Integer
                                Dim NU As String = TextNumerador.Text
                                Dim SNU As Integer
                                Dim SNU2 As Integer
                                Dim AN As String = TxtAnalisis.Text
                                Dim ES As String = TxtEstrategias.Text
                                Dim FA As String = ListFactibilidad.Text
                                Dim GR As String = ListGravedad.Text
                                Dim HORA As String
                                Dim USER As String = Page.User.Identity.Name.ToString
                                Dim META As String
                                Dim FORMULA As String
                                Dim F1 As String
                                Dim F2 As String
                                Dim Fanual As String
                                Dim RESULTADO As Double
                                Dim RESULTADO2 As Double
                                Dim RESULTADO2A As Double
                                Dim RESULTADO3 As Double
                                Dim DIS_META As String
                                Dim DIS_META2 As String
                                Dim DIS_META3 As String
                                Dim SQL As String
                                Dim SQL1 As String
                                Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
                                Dim Rs As SqlDataReader
                                Dim Rs1 As SqlDataReader
                                Dim Com As New SqlCommand
                                Dim Com1 As New SqlCommand
                                Com.Connection = timedate
                                Com1.Connection = timedate
                                timedate.Open()
                                SQL = "SELECT CONVERT (VARCHAR(10), GETDATE(), 103) + ' ' + CONVERT (VARCHAR(8), GETDATE(), 108) AS Expr1"
                                SQL1 = "SELECT  Tipo_Formula, Meta, F1,F2,Fanual FROM Ind_Principal  WHERE (Ind_Principal.IdIndicador  =N'" & IdIndi & "') "

                                Com = New SqlCommand(SQL, timedate)
                                Com1 = New SqlCommand(SQL1, timedate)
                                Rs = Com.ExecuteReader()
                                Rs.Read()
                                HORA = Rs(0)
                                Rs.Close()

                                Rs1 = Com1.ExecuteReader()
                                Rs1.Read()
                                FORMULA = Rs1(0)
                                META = Rs1(1)
                                F1 = Rs1(2)
                                F2 = Rs1(3)
                                Fanual = Rs1(4)
                                Rs1.Close()
                                timedate.Close()
                        ''aplicación de la formula que se parametrizo en el indicador para el mes

                        If DE = 0 Or NU = 0 Then
                            RESULTADO = 0
                        Else

                            If FORMULA = 0 Then
                                RESULTADO = (NU / DE)
                            End If
                            If FORMULA = 1 Then
                                RESULTADO = (NU / DE) * 100
                            End If
                            If FORMULA = 2 Then
                                RESULTADO = (NU / DE) * 1000
                            End If

                            If FORMULA = 3 Then
                                RESULTADO = (NU / DE) * 100000
                            End If
                            If FORMULA = 4 Then
                                RESULTADO = NU
                            End If

                            RESULTADO = Math.Round(RESULTADO, 2)
                        End If
                        DIS_META = CInt(META) - RESULTADO
                                'Actualiza los datos en el indicador segun el mes seleccionado

                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & NU & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 1) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & DE & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 2) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & RESULTADO & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 3) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & USER & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 5) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & AN & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 6) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & ES & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 7) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & FA & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 8) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & GR & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 9) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & HORA & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 10) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & META & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 11) "
                                Dataupdate.Update()
                                Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET " & Mes & "=N'" & DIS_META & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 12) "
                                Dataupdate.Update()


                                Dataupdate.UpdateCommand = "UPDATE Ind_Grafica SET Resultado='" & RESULTADO & "'  WHERE  (Ind_Grafica.IdIndi =N'" & IdIndi & "'   ) AND (Ind_Grafica.Anual =N'" & Anual & "') AND (Ind_Grafica.Mes=N'" & Mes & "' ) "
                                Dataupdate.Update()

                                Dim SQLs As String
                                Dim SQLs2 As String
                                Dim timedates As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
                                Dim Coms As New SqlCommand
                                Dim Coms2 As New SqlCommand
                                Dim Rss As SqlDataReader
                                Dim Rss2 As SqlDataReader
                                Coms.Connection = timedates
                                Coms2.Connection = timedates
                                timedates.Open()
                                SQLs = "Select [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12] from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 1) "
                                SQLs2 = "Select [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[S1],[S2] from Ind_Resultado3 WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 2) "
                                Coms = New SqlCommand(SQLs, timedates)
                                Coms2 = New SqlCommand(SQLs2, timedates)
                                Rss = Coms.ExecuteReader()
                                Rss.Read()
                                'Verifica que los numeradores del semestre 1 no esten en 0 para el calculo
                                If Rss(0) = "0" Then
                                Else
                                    SNU = CInt(Rss(0))
                                    If Rss(1) = "0" Then
                                    Else
                                        SNU = SNU + CInt(Rss(1))
                                        If Rss(2) = "0" Then
                                        Else
                                            SNU = SNU + CInt(Rss(2))
                                            If Rss(3) = "0" Then
                                            Else
                                                SNU = SNU + CInt(Rss(3))
                                                If Rss(4) = "0" Then
                                                Else
                                                    SNU = SNU + CInt(Rss(4))
                                                    If Rss(5) = "0" Then
                                                    Else
                                                        SNU = SNU + CInt(Rss(5))
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S1]=N'" & SNU & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 1) "
                                                        Dataupdate.Update()
                                                    End If
                                                End If

                                            End If

                                        End If

                                    End If

                                End If

                                'Verifica que los numeradores del semestre 2 no esten en 0 para el calculo
                                If Rss(6) = "0" Then
                                Else
                                    SNU2 = CInt(Rss(6))
                                    If Rss(7) = "0" Then
                                    Else
                                        SNU2 = SNU2 + CInt(Rss(7))
                                        If Rss(8) = "0" Then
                                        Else
                                            SNU2 = SNU2 + CInt(Rss(8))
                                            If Rss(9) = "0" Then
                                            Else
                                                SNU2 = SNU2 + CInt(Rss(9))
                                                If Rss(10) = "0" Then
                                                Else
                                                    SNU2 = SNU2 + CInt(Rss(10))
                                                    If Rss(11) = "0" Then

                                                    Else

                                                        SNU2 = SNU2 + CInt(Rss(11))

                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S2]=N'" & SNU2 & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 1) "
                                                        Dataupdate.Update()
                                                        ' se suman los numeradores de los dos semestres y se almacenan en el anual
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [Anual]=CONVERT(INT, Ind_Resultado3.[S1])+CONVERT(INT, Ind_Resultado3.[S2])  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 1) AND (Ind_Resultado3.[S1]<> 0)"
                                                        Dataupdate.Update()

                                                    End If

                                                End If

                                            End If

                                        End If

                                    End If

                                End If

                                Rss.Close()

                                Rss2 = Coms2.ExecuteReader()
                                Rss2.Read()
                                'Verifica que los Denominadores del semestre 1 no esten en 0 para el calculo
                                If Rss2(0) = "0" Then
                                Else
                                    SDE = CInt(Rss2(0))
                                    If Rss2(1) = "0" Then
                                    Else
                                        SDE = SDE + CInt(Rss2(1))
                                        If Rss2(2) = "0" Then
                                        Else
                                            SDE = SDE + CInt(Rss2(2))
                                            If Rss2(3) = "0" Then
                                            Else
                                                SDE = SDE + CInt(Rss2(3))
                                                If Rss2(4) = "0" Then
                                                Else
                                                    SDE = SDE + CInt(Rss2(4))
                                                    If Rss2(5) = "0" Then

                                                    Else

                                                        SDE = SDE + CInt(Rss2(5))

                                                        ' aplicación de la formula que se parametrizo en el indicador para el semestre 1
                                                        If F1 = 0 Then
                                                            RESULTADO2 = (SNU / SDE)
                                                        End If
                                                        If F1 = 1 Then
                                                            RESULTADO2 = (SNU / CInt(Rss2(5)))
                                                        End If
                                                        If F1 = 2 Then
                                                            RESULTADO2 = SNU
                                                        End If

                                                        If F1 = 3 Then
                                                            RESULTADO2 = (SNU / CInt(Rss2(0)))
                                                        End If
                                                        RESULTADO2 = Math.Round(RESULTADO2, 2)
                                                        DIS_META2 = CInt(META) - RESULTADO2

                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S1]=N'" & SDE & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 2) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S1]= '" & RESULTADO2 & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 3) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S1]=N'" & USER & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 5) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S1]=N'" & HORA & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 10) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S1]=N'" & META & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 11) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S1]=N'" & DIS_META2 & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 12) "
                                                        Dataupdate.Update()


                                                    End If

                                                End If

                                            End If

                                        End If

                                    End If

                                End If
                                'Verifica que los Denominadores del semestre 2 no esten en 0 para el calculo
                                If Rss2(6) = "0" Then
                                Else
                                    SDE2 = CInt(Rss2(6))
                                    If Rss2(7) = "0" Then
                                    Else
                                        SDE2 = SDE2 + CInt(Rss2(7))
                                        If Rss2(8) = "0" Then
                                        Else
                                            SDE2 = SDE2 + CInt(Rss2(8))
                                            If Rss2(9) = "0" Then
                                            Else
                                                SDE2 = SDE2 + CInt(Rss2(9))
                                                If Rss2(10) = "0" Then
                                                Else
                                                    SDE2 = SDE2 + CInt(Rss2(10))
                                                    If Rss2(11) = "0" Then

                                                    Else

                                                        SDE2 = SDE2 + CInt(Rss2(11))

                                                        ' aplicación de la formula que se parametrizo en el indicador para el semestre 2
                                                        If F2 = 0 Then
                                                            RESULTADO2A = (SNU2 / SDE2)
                                                        End If
                                                        If F2 = 1 Then
                                                            RESULTADO2A = (SNU2 / CInt(Rss2(11)))
                                                        End If
                                                        If F2 = 2 Then
                                                            RESULTADO2A = SNU2
                                                        End If

                                                        If F2 = 3 Then
                                                            RESULTADO2A = (SNU2 / CInt(Rss2(0)))
                                                        End If
                                                        RESULTADO2A = Math.Round(RESULTADO2A, 2)
                                                        DIS_META2 = CInt(META) - RESULTADO2A
                                                        ' se suman los denominadores de los dos semestres y se almacenan en el anual

                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S2]=N'" & SDE2 & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 2) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S2]= '" & RESULTADO2A & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 3) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S2]=N'" & USER & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 5) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S2]=N'" & HORA & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 10) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S2]=N'" & META & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 11) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [S2]=N'" & DIS_META2 & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 12) "
                                                        Dataupdate.Update()
                                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [Anual]=CONVERT(INT, Ind_Resultado3.[S1])+CONVERT(INT, Ind_Resultado3.[S2])  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 2) AND (Ind_Resultado3.[S1]<> 0)"
                                                        Dataupdate.Update()

                                                    End If

                                                End If

                                            End If

                                        End If

                                    End If

                                End If




                                If SNU = "0" Then
                                Else

                                    If SNU2 = "0" Then

                                    Else
                                        ' aplicación de la formula que se parametrizo en el indicador para el año
                                        SDE2 = SDE2 + SDE
                                        SNU2 = SNU2 + SNU


                                        If Fanual = 0 Then
                                            RESULTADO3 = (SNU2 / SDE2)
                                        End If
                                        If Fanual = 1 Then
                                            RESULTADO3 = (SNU2 / CInt(Rss2(11)))
                                        End If
                                        If Fanual = 2 Then
                                            RESULTADO3 = SNU2
                                        End If

                                        If Fanual = 3 Then
                                            RESULTADO3 = (SNU2 / CInt(Rss2(0)))
                                        End If
                                        RESULTADO3 = Math.Round(RESULTADO3, 2)
                                        DIS_META3 = CInt(META) - RESULTADO3


                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [Anual]= '" & RESULTADO3 & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 3) "
                                        Dataupdate.Update()
                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [Anual]=N'" & USER & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 5) "
                                        Dataupdate.Update()
                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [Anual]=N'" & HORA & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 10) "
                                        Dataupdate.Update()
                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [Anual]=N'" & META & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 11) "
                                        Dataupdate.Update()
                                        Dataupdate.UpdateCommand = "UPDATE Ind_Resultado3 SET [Anual]=N'" & DIS_META3 & "'  WHERE  (Ind_Resultado3.IdIndicador =N'" & IdIndi & "'   ) AND (Ind_Resultado3.IdAno =N'" & Anual & "') AND (Ind_Resultado3.IdItem = 12) "
                                        Dataupdate.Update()


                                    End If

                                End If


                                Rss2.Close()
                                timedates.Close()
                                Response.AddHeader("REFRESH", "1;CargarIndicadores.aspx")
                            End If
                        End If

                    End If


                End If

    End Sub
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load, Anual.Load, ListMese.Load
        LblSubtitulo.Text = GridIndicadores.Rows.Count.ToString + " Indicadores asignados"

        PanelUPDATE.Visible = False
        Panel1.Visible = True

        Dim soli As String = Page.User.Identity.Name.ToString
        Dim USUARIO As String
        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=ASPNETDB;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT  IdUsDgh  FROM  aspnet_Users  WHERE  LoweredUserName = '" & soli & "'"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()

        USUARIO = Rs(0)

        Rs.Close()
        timedate.Close()

        lblIdUsuario.Text = USUARIO


    End Sub





    Protected Sub Btncalres_Click(sender As Object, e As EventArgs) Handles Btncalres.Click
        PanelUPDATE.Visible = True
        Panel1.Visible = False
        BtnGuardar.Visible = True
        Dim Denominador As Long = TextDenominador.Text
        Dim Numerador As Long = TextNumerador.Text
        Dim IdIndi As String = LabelIdResIndicador.text
        Dim Resultado As Double
        Dim tempid As Integer
        Dim image As String
        Dim factibilidad As Integer = Convert.ToInt64(ListFactibilidad.Text)
        Dim gravedad As Integer = Convert.ToInt64(ListGravedad.Text)
        Dim mapacalor As Integer
        If String.IsNullOrEmpty(IdIndi) Then
        Else tempid = Convert.ToInt32(IdIndi)
            TextResul.Text = tempid
        End If

        Dim SQL As String
        Dim timedate As New SqlConnection("Server=pach\SQLEXPRESS;Database=DbBridge;User ID=sa;Password=Hrd2021Gi")
        Dim Rs As SqlDataReader
        Dim Com As New SqlCommand
        Com.Connection = timedate
        timedate.Open()
        SQL = "SELECT Tipo_Formula FROM Ind_Principal WHERE (IdIndicador = " & tempid & ")"
        Com = New SqlCommand(SQL, timedate)
        Rs = Com.ExecuteReader()
        Rs.Read()

        If Denominador = 0 Or Numerador = 0 Then
            Resultado = 0
        Else

            If Rs(0) = 0 Then
                Resultado = Numerador / Denominador
            End If
            If Rs(0) = 1 Then
                Resultado = (Numerador / Denominador) * 100
            End If
            If Rs(0) = 2 Then
                Resultado = (Numerador / Denominador) * 1000
            End If

            If Rs(0) = 3 Then
                Resultado = (Numerador / Denominador) * 100000
            End If
            If Rs(0) = 4 Then
                Resultado = Numerador
            End If

            Resultado = Math.Round(Resultado, 2)
        End If
        TextResul.Text = Resultado
        Rs.Close()
        timedate.Close()
        mapacalor = gravedad + factibilidad

        If mapacalor < 5 Then

            Image1.Visible = True
            Image2.Visible = False
            Image3.Visible = False
            Image4.Visible = False
        Else
            If mapacalor = 5 Then
                Image2.Visible = True
                Image1.Visible = False
                Image3.Visible = False
                Image4.Visible = False

            End If
            If mapacalor = 6 Then
                Image3.Visible = True
                Image2.Visible = False
                Image1.Visible = False
                Image4.Visible = False

            End If
            If mapacalor > 6 Then
                Image4.Visible = True
                Image2.Visible = False
                Image3.Visible = False
                Image1.Visible = False
            End If

        End If


    End Sub
End Class
