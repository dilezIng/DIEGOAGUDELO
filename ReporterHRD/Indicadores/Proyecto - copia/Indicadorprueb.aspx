<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master"  CodeFile="Indicadorprueb.aspx.vb" Inherits="Indicadorprueb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server" >

  <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
             
        }
        .auto-style11 {
            width: 124%;
        }
        .auto-style28 {
          font-size: small;
      }
        .auto-style37 {
          font-size: large;
      }
        .auto-style38 {
          height: 23px;
          text-align: left;
      }
        .auto-style39 {
          height: 24px;
          text-align: left;
      }
      .auto-style40 {
          height: 23px;
          width: 26px;
          text-align: center;
      }
      .auto-style41 {
          width: 26px;
          height: 300px;
      }
        .auto-style45 {
          height: 77px;
      }
        .auto-style46 {
          width: 100%;
      }
      .auto-style47 {
          height: 131px;
      }
        .auto-style48 {
          height: 300px;
      }
        .auto-style49 {
          width: 25%;
          height: 37px;
      }
      .auto-style50 {
          height: 37px;
      }
        .auto-style51 {
          font-size: xx-small;
      }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" ViewStateMode="Enabled" >
   
   
    <asp:Panel ID="Panel11" runat="server" CssClass="auto-style28">


         <table style="font-family: tahoma;" class="auto-style46" >
    <tr >
        <td class="auto-style49" >
            </td>
        <td colspan="2" class="auto-style50" >
            <asp:SqlDataSource ID="DataConsultas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
            </asp:SqlDataSource>
        </td>
        <td style="text-align: right;" class="auto-style49" >
            <asp:Label ID="lblIdUsuario" runat="server" Visible="true"></asp:Label>
        </td>
    </tr>
    <tr >
        <td colspan="4" 
            style="font-weight: bold; font-size: 15pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');" >
            <asp:Label ID="LblSubtitulo" runat="server" Visible="False"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Labelevent" runat="server"></asp:Label>
        </td>
    </tr>
    <tr >
        <td colspan="4" >
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            Seleccione Año:
            <asp:DropDownList ID="LAnual" runat="server" AutoPostBack="True" DataSourceID="Anual" DataTextField="IdAno" DataValueField="IdAno">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Anual" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT DISTINCT IdAno FROM Ind_Resultado3 ORDER BY IdAno"></asp:SqlDataSource>
            &nbsp;y Mes:
            <asp:DropDownList ID="listmes" runat="server" AutoPostBack="True">
                <asp:ListItem Value="[1]">Enero</asp:ListItem>
                <asp:ListItem Value="[2]">Febrero</asp:ListItem>
                <asp:ListItem Value="[3]">Marzo</asp:ListItem>
                <asp:ListItem Value="[4]">Abril</asp:ListItem>
                <asp:ListItem Value="[5]">Mayo</asp:ListItem>
                <asp:ListItem Value="[6]">Junio</asp:ListItem>
                <asp:ListItem Value="[7]">Julio</asp:ListItem>
                <asp:ListItem Value="[8]">Agosto</asp:ListItem>
                <asp:ListItem Value="[9]">Septiembre</asp:ListItem>
                <asp:ListItem Value="[10]">Octubre</asp:ListItem>
                <asp:ListItem Value="[11]">Noviembre</asp:ListItem>
                <asp:ListItem Value="[12]">Diciembre</asp:ListItem>
                <asp:ListItem Value="[S1]">1er Semestre</asp:ListItem>
                <asp:ListItem Value="[S2]">2do Semestre</asp:ListItem>
                <asp:ListItem Value="[Anual]">Anual</asp:ListItem>
            </asp:DropDownList>
           
            <br />
            <asp:GridView ID="GridIndicadores" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="IdIndicador" DataSourceID="DataGridindicadores" 
                AllowSorting="True" style="text-align: center" CssClass="auto-style37">
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <Columns>
                    
                    <asp:BoundField DataField="IdIndicador" HeaderText="Id Indicador" 
                        SortExpression="IdIndicador" InsertVisible="False" ReadOnly="True" >
                    </asp:BoundField>
                    <asp:BoundField DataField="CodIndicador" HeaderText="Cod Indicador" 
                        SortExpression="CodIndicador" >
                    </asp:BoundField>
                    <asp:BoundField DataField="NomIndicador" HeaderText="Indicador" 
                        SortExpression="NomIndicador" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Jerarquia" HeaderText="Jerarquia" SortExpression="Jerarquia" ReadOnly="True" />
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Inf.png"  SelectText="Ver" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DataGridindicadores" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                
                
                
                
                SelectCommand="SELECT DISTINCT Ind_Principal.IdIndicador, Ind_Principal.CodIndicador, Ind_Principal.NomIndicador, CASE WHEN Ind_Principal.IdPadre = 1 THEN 'Padre' ELSE LTRIM(RTRIM(Ind_Principal.CodIndicador)) END AS Jerarquia FROM Ind_Principal INNER JOIN Ind_IndiUsers ON Ind_Principal.IdIndicador = Ind_IndiUsers.IdIndicador WHERE (Ind_IndiUsers.IdUsuarioDG = @IdUsuario) ORDER BY Ind_Principal.IdIndicador">
               <SelectParameters>
                    <asp:ControlParameter ControlID="lblIdUsuario" Name="IdUsuario" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr >
        <td colspan="4" class="auto-style1" >
            
        </td>
    </tr>
   
    <tr >
        <td colspan="4" >
          </td>
    </tr>
    </table>

        </asp:Panel>
 

     <asp:Panel ID="PanelInf" runat="server" Width="100%">
        <asp:Button ID="Button1" runat="server" Text="Regresar" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Ind_Meses.Mes, Ind_Meses.Ano, Ind_Resultados.Numerador, Ind_Resultados.Denominador, Ind_Resultados.Observaciones, Ind_Resultados.analisis, Ind_Resultados.estrategias, Ind_Resultados.Factibilidad, Ind_Resultados.Gravedad, Ind_Principal.IdIndicador FROM Ind_Principal INNER JOIN Ind_Resultados ON Ind_Principal.IdIndicador = Ind_Resultados.IdIndicador INNER JOIN Ind_Meses ON Ind_Resultados.IdMes = Ind_Meses.IdMes WHERE (Ind_Principal.IdIndicador = @labelindi) order by Ind_Resultados.IdMes desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="Lbidindi" Name="labelindi" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="DataMES" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>


        <table class="auto-style11" width="70px">
            <tr>
                <td colspan="2" class="auto-style45">
                    <asp:TextBox ID="Nom_indi"   runat="server" Height="65px" Width="1128px" ReadOnly="True" BorderColor="White" BorderStyle="None" Font-Bold="True" Columns="1" TextMode="MultiLine" Font-Size="X-Large"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#3385D6" Text="Codigo: "></asp:Label>
                    <asp:Label ID="CodInd" runat="server"></asp:Label>
                    <asp:Label ID="Lbidindi" runat="server" Visible="false"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="mesanual" runat="server" ></asp:Label>
                    <br />
                   </td>
            </tr>
            <tr>
                <td class="auto-style40" rowspan="4" align="center">
                   
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="Grafica" Width="839px" EnableViewState="True">
                        <Series>
                   <asp:Series ChartArea="ChartArea1"  Name="2021" XValueMember="Mes" YValueMembers="2021" IsValueShownAsLabel="true" CustomProperties="DrawingStyle=LightToDark, PointWidth=0.5" Legend="Legend1" MarkerSize="1" XValueType="Double" YValueType="Double">
                                <EmptyPointStyle MarkerSize="2" />
                            </asp:Series>
                  <asp:Series ChartArea="ChartArea1" ChartType="FastLine" Name="2020" YValueMembers="2020"  IsValueShownAsLabel="true" Legend="Legend1" BorderWidth="3" Color="Red" >
                            </asp:Series>
                       <asp:Series ChartArea="ChartArea1" ChartType="FastLine" Name="2019" YValueMembers="2019"  IsValueShownAsLabel="true" Legend="Legend1" BorderWidth="3" Color="#00ff00" >
                            </asp:Series>
                          
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                <AxisY IntervalType="Number">
                                </AxisY>
                                <AxisX LabelAutoFitStyle="IncreaseFont, DecreaseFont, StaggeredLabels, LabelsAngleStep30, LabelsAngleStep45, WordWrap" IntervalAutoMode="VariableCount">
                                    <MajorGrid Interval="Auto"  />
                                    <MajorTickMark Interval="Auto" IntervalOffset="Auto" />
                                    <MinorTickMark IntervalType="Number" />
                                    <LabelStyle Interval="Auto"  />
                                    <ScaleBreakStyle Spacing="1" StartFromZero="YES" />
                                    <ScaleView Size="NotSet" Position="NotSet" />
                                </AxisX>
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1">
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                   
                    <br />
                    <br />
                   
                </td>
                <td class="auto-style38"><strong>ESTRATEGIAS O MEDIDAS</strong></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="Estrategia" runat="server" Height="150px" ReadOnly="True" TextMode="MultiLine" Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style39"><strong>ANALISIS</strong></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="Analisis" runat="server" Height="150px" ReadOnly="True" TextMode="MultiLine" Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style41" align="center">
                    
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="tabla" Font-Names="Tahoma" Font-Size="13px" >
                        <Columns>
                            <asp:BoundField DataField="MES" HeaderText="MES" SortExpression="MES" />
                            <asp:BoundField DataField="ENE" HeaderText="ENE" SortExpression="ENE" />
                            <asp:BoundField DataField="FEB" HeaderText="FEB" SortExpression="FEB" />
                            <asp:BoundField DataField="MAR" HeaderText="MAR" SortExpression="MAR" />
                            <asp:BoundField DataField="ABR" HeaderText="ABR" SortExpression="ABR" />
                            <asp:BoundField DataField="MAY" HeaderText="MAY" SortExpression="MAY" />
                            <asp:BoundField DataField="JUN" HeaderText="JUN" SortExpression="JUN" />
                            <asp:BoundField DataField="ISem" HeaderText="ISem" SortExpression="ISem" />
                            <asp:BoundField DataField="JUL" HeaderText="JUL" SortExpression="JUL" />
                            <asp:BoundField DataField="AGO" HeaderText="AGO" SortExpression="AGO" />
                            <asp:BoundField DataField="SEP" HeaderText="SEP" SortExpression="SEP" />
                            <asp:BoundField DataField="OCT" HeaderText="OCT" SortExpression="OCT" />
                            <asp:BoundField DataField="NOV" HeaderText="NOV" SortExpression="NOV" />
                            <asp:BoundField DataField="DIC" HeaderText="DIC" SortExpression="DIC" />
                            <asp:BoundField DataField="IISem" HeaderText="IISem" SortExpression="IISem" />
                            <asp:BoundField DataField="AÑO" HeaderText="AÑO" SortExpression="AÑO" />
                        </Columns>
                    </asp:GridView>
                    
                </td>
                <td class="auto-style48"  >
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/temp_idicador.JPG" Height="296px" Width="359px" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style47">
                    <asp:Label ID="Definicion" runat="server" Font-Bold="True" ForeColor="#3385D6" Text="Definicion Operacional: "></asp:Label>
                    
                    <br />
                    <asp:TextBox ID="DEF" runat="server" Height="97px" Width="1014px" Wrap="true" TextMode="MultiLine" ReadOnly="True" BorderStyle="None" Font-Bold="True"></asp:TextBox>
                    <br />
                    <span class="auto-style51"><strong>Ing. Diego A. Agudelo J.</strong></span><br />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    
                    <asp:SqlDataSource ID="tabla" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Ind_Resultado3.Item AS MES, Ind_Resultado3.[1] AS ENE, Ind_Resultado3.[2] AS FEB, Ind_Resultado3.[3] AS MAR, Ind_Resultado3.[4] AS ABR, Ind_Resultado3.[5] AS MAY, Ind_Resultado3.[6] AS JUN, Ind_Resultado3.S1 AS ISem, Ind_Resultado3.[7] AS JUL, Ind_Resultado3.[8] AS AGO, Ind_Resultado3.[9] AS SEP, Ind_Resultado3.[10] AS OCT, Ind_Resultado3.[11] AS NOV, Ind_Resultado3.[12] AS DIC, Ind_Resultado3.S2 AS IISem, Ind_Resultado3.Anual AS AÑO FROM Ind_Resultado3 INNER JOIN Ind_Principal ON Ind_Resultado3.IdIndicador = Ind_Principal.IdIndicador WHERE (Ind_Resultado3.IdIndicador = @INDI) AND (Ind_Resultado3.IdAno = @anual) AND (Ind_Resultado3.IdItem = 1 OR Ind_Resultado3.IdItem = 2 OR Ind_Resultado3.IdItem = 3 OR Ind_Resultado3.IdItem = 8 OR Ind_Resultado3.IdItem = 9 OR Ind_Resultado3.IdItem = 11 OR Ind_Resultado3.IdItem = 12)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Lbidindi" Name="INDI" PropertyName="Text" />
                            <asp:ControlParameter ControlID="LAnual" Name="anual" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="tabla0" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT * FROM (SELECT DISTINCT IdAno AS AÑO, [1] AS ENE, [2] AS FEB, [3] AS MAR, [4] AS ABR, [5] AS MAY, [6] AS JUN, [7] AS JUL, [8] AS AGO, [9] AS SEP, [10] AS OCT, [11] AS NOV, [12] AS DIC, IdItem AS ID FROM Ind_Resultado3 WHERE (IdIndicador = @idindi) AND (IdItem = 3) ) AS PT PIVOT (max(AÑO) FOR ID IN ([3])) AS ptA">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Lbidindi" Name="idindi" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <asp:SqlDataSource ID="Grafica" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT * FROM (SELECT Anual, CASE WHEN Mes = '[1]' THEN 1 WHEN Mes = '[2]' THEN 2 WHEN Mes = '[3]' THEN 3 WHEN Mes = '[4]' THEN 4 WHEN Mes = '[5]' THEN 5 WHEN Mes = '[6]' THEN 6 WHEN Mes = '[7]' THEN 7 WHEN Mes = '[8]' THEN 8 WHEN Mes = '[9]' THEN 9 WHEN Mes = '[10]' THEN 10 WHEN Mes = '[11]' THEN 11 WHEN Mes = '[12]' THEN 12 END AS Mes, Resultado FROM Ind_Grafica WHERE (IdIndi = @Indi) GROUP BY Anual, Mes, Resultado) pt PIVOT (max(Resultado) FOR [Anual] IN ([2018], [2019], [2020], [2021], [2022])) AS ptA">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Lbidindi" Name="Indi" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                </td>
            </tr>
        </table>

    </asp:Panel>



</asp:Content>

