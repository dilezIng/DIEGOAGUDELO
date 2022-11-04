<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="CargarIndicadores.aspx.vb" Inherits="Indicadores_Proyecto_CargarIndicadores" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>



<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script language="javascript">

    function ShowModalPopup() {

        $find("Panel1_ModalPopupExtender").show();

    }

    function HideModalPopup() {

        $find("Panel1_ModalPopupExtender").hide();

    }

</script>
  
    
<style type="text/css">
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
    .modalPopup
    {
        border: 3px solid black;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-left: 10px;
        }
           
    .style1
    {
        width: 100%;
    }
           
</style>

    <style type="text/css">
        .style1
        {
            font-size: 16pt;
        }
        .style2
        {
            width: 100%;
        }
        .auto-style1 {
            height: 28px;
        }
        .auto-style2 {
            width: 9%;
        }
        .auto-style3 {
            width: 7%;
        }
        .auto-style4 {
            color: #FFFFFF;
        }
        .auto-style7 {
            font-size: xx-small;
        }
        .auto-style10 {
            width: 30%;
        }
        .auto-style11 {
            width: 32%;
        }
        .auto-style12 {
            text-align: center;
            height: 296px;
        }
        .auto-style15 {
            margin-top: 0px;
        }
        .auto-style16 {
            width: 16%;
            height: 19px;
        }
        .auto-style17 {
            color: #FF0000;
            font-size: x-large;
            background-color: #FFFF99;
        }
        .auto-style18 {
            width: 30%;
            text-align: center;
            height: 125px;
        }
        .auto-style19 {
            width: 16%;
            height: 77px;
        }
        .auto-style20 {
            width: 32%;
            text-align: center;
            height: 125px;
        }
        .auto-style22 {
            width: 1050px;
            height: 853px;
        }
        .auto-style23 {
            width: 16%;
            height: 44px;
        }
        .auto-style24 {
            width: 30%;
            height: 25px;
        }
        .auto-style25 {
            width: 32%;
            height: 25px;
        }
        .auto-style27 {
            width: 16%;
            height: 71px;
        }
        .auto-style29 {
            height: 26px;
        }
        .auto-style30 {
            width: 16%;
            height: 26px;
        }
        .auto-style31 {
            height: 21px;
            text-align: left;
        }
        .auto-style32 {
            width: 16%;
            height: 21px;
        }
        .auto-style33 {
            height: 32px;
        }
        .auto-style34 {
            width: 16%;
            height: 28px;
        }
        .auto-style35 {
            height: 296px;
        }
        .auto-style36 {
            width: 30%;
            height: 19px;
        }
        .auto-style37 {
            width: 32%;
            height: 19px;
        }
        .auto-style38 {
            width: 16%;
        }
        .auto-style39 {
            margin-bottom: 0px;
        }
        .auto-style40 {
            width: 16%;
            height: 18px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma;" >
    <tr >
        <td colspan="4" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');" >
            Cargar Indicadores</td>
    </tr>
        </table>

    <asp:Panel ID="Panel1" runat="server">
         <table style="width: 100%; font-family: tahoma;" >

    <tr >
        <td class="auto-style3" >
            &nbsp;Año:
            <asp:DropDownList ID="LAnual" runat="server" DataSourceID="Anual" DataTextField="IdAno" DataValueField="IdAno" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Anual" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT DISTINCT IdAno FROM Ind_Resultado3 ORDER BY IdAno desc"></asp:SqlDataSource>
        </td>
        <td colspan="2" >
            <asp:DropDownList ID="ListIndicadores" runat="server" AutoPostBack="True" 
                DataSourceID="DataListindicadores" DataTextField="NomIndicador" 
                DataValueField="IdIndicador" Width="80%" Visible="False">
            </asp:DropDownList>
            <asp:SqlDataSource ID="DataListindicadores" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                
                
                
                
                SelectCommand="SELECT Ind_Principal.IdIndicador, Ind_Principal.CodIndicador, Ind_Principal.NomIndicador FROM Ind_Principal INNER JOIN Ind_Resultados ON Ind_Principal.IdIndicador = Ind_Resultados.IdIndicador INNER JOIN Ind_Meses ON Ind_Resultados.IdMes = Ind_Meses.IdMes INNER JOIN Ind_IndiUsers ON Ind_Principal.IdIndicador = Ind_IndiUsers.IdIndicador WHERE (Ind_IndiUsers.IdUsuarioDG = @IdUsuario) AND (Ind_Resultados.IdMes = @IdMes)" 
                ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>">
                <SelectParameters>
                   
                    <asp:Parameter  Name="IdUsuario" />
                </SelectParameters>
            </asp:SqlDataSource>
            Mes:
            <asp:DropDownList ID="ListMese" runat="server" AutoPostBack="True">
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
            <asp:SqlDataSource ID="DataConsultas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
            </asp:SqlDataSource>
        </td>
        <td style="width: 25%; text-align: right;" >
            <asp:Label ID="lblIdUsuario" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="Label1" runat="server" ></asp:Label>
        </td>
    </tr>
    <tr >
        <td colspan="4" 
            style="font-weight: bold; font-size: 15pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');" class="auto-style1" >
            <asp:Label ID="LblSubtitulo" runat="server" Visible="False" CssClass="auto-style4"></asp:Label>
        </td>
    </tr>
    <tr >
        <td colspan="4" >
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:GridView ID="GridIndicadores" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="IdIndicador" DataSourceID="DataGridindicadores" 
                AllowSorting="True" style="text-align: center">
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Images/Ok.png" />
                    <asp:BoundField DataField="IdIndicador" HeaderText="IdIndicador" SortExpression="IdIndicador" />
                    <asp:BoundField DataField="CodIndicador" HeaderText="CodIndicador" SortExpression="CodIndicador" />
                    <asp:BoundField DataField="NomIndicador" HeaderText="NomIndicador" SortExpression="NomIndicador" />
                    <asp:BoundField DataField="Fecha_Actualizado" HeaderText="Fecha_Actualizado"  SortExpression="Fecha_Actualizado" />

                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DataGridindicadores" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                
                
                
                
                SelectCommand="DECLARE  @dos AS varchar(1000)
                
SET                @dos = 'SELECT DISTINCT 
                         Ind_Principal.IdIndicador, Ind_Principal.CodIndicador, Ind_Principal.NomIndicador, Ind_Resultado3.' + @ListMese + ' AS Fecha_Actualizado
FROM            Ind_Principal INNER JOIN
                         Ind_IndiUsers ON Ind_Principal.IdIndicador = Ind_IndiUsers.IdIndicador INNER JOIN
                         Ind_Resultado3 ON Ind_Principal.IdIndicador = Ind_Resultado3.IdIndicador
WHERE        (Ind_IndiUsers.IdUsuarioDG ='
                          + @IdUsuario + '  ) AND (Ind_Resultado3.IdAno = ' + @LAnual + ') AND (Ind_Resultado3.IdItem = 10)
ORDER BY Ind_Principal.IdIndicador' EXEC (@dos)">
                <SelectParameters>
               <asp:ControlParameter ControlID="lblIdUsuario" Name="IdUsuario" PropertyName="Text" />
                    <asp:ControlParameter ControlID="LAnual" Name="LAnual"   PropertyName="SelectedValue" />
               <asp:ControlParameter ControlID="ListMese" Name="ListMese"   PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr >
        <td colspan="4" >
          
        </td>
    </tr>
    <tr >
        <td colspan="4" >
              
        </td>
    </tr>
    <tr >
        <td class="auto-style3" >
            <asp:SqlDataSource ID="DataFormIndicador" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                
                
                
                
                SelectCommand="SELECT Ind_Resultados.IdResultado, Ind_IndiUsers.IdUsuarioDG, Ind_Principal.IdIndicador, Ind_Principal.CodIndicador, Ind_Principal.NomIndicador, Ind_Resultados.IdMes, Ind_Resultados.Numerador, Ind_Resultados.Denominador, Ind_Resultados.Observaciones, Ind_Resultados.IdUsCargo, Ind_Resultados.FechaCarga, Ind_Principal.DefOperacional, Ind_Resultados.analisis, Ind_Resultados.estrategias, Ind_Resultados.Factibilidad, Ind_Resultados.Gravedad, Ind_Resultados.Actualizado FROM Ind_Principal INNER JOIN Ind_Resultados ON Ind_Principal.IdIndicador = Ind_Resultados.IdIndicador INNER JOIN Ind_Meses ON Ind_Resultados.IdMes = Ind_Meses.IdMes INNER JOIN Ind_IndiUsers ON Ind_Principal.IdIndicador = Ind_IndiUsers.IdIndicador WHERE (Ind_Resultados.IdResultado = @IdResultado)" 
                
                
                UpdateCommand="UPDATE Ind_Resultados SET Numerador = @Numerador, Denominador = @Denominador, analisis = @analisis, estrategias = @estrategias, IdUsCargo = @IdUsCargo, FechaCarga = GETDATE(), Factibilidad = @Factibilidad, Gravedad = @Gravedad, Actualizado = 1 WHERE (IdResultado = @IdResultado)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridIndicadores" Name="IdResultado" 
                        PropertyName="SelectedValue" DefaultValue="" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Numerador" />
                    <asp:Parameter Name="Denominador" />
                    <asp:Parameter Name="analisis" />
                    <asp:Parameter Name="estrategias" />
                    <asp:Parameter Name="IdResultado" />
                    <asp:Parameter Name="IdUsCargo" />
                    <asp:Parameter Name="Factibilidad" />
                    <asp:Parameter Name="Gravedad" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
        <td style="width: 25%" >
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT * FROM [Aud_HMLGCASV4]"></asp:SqlDataSource>
        </td>
        <td class="auto-style2" >
                <asp:Label ID="LabelMsg" runat="server" ></asp:Label>
        </td>
        <td style="width: 25%" >
                <asp:TextBox ID="LabelIdResIndicador" runat="server" Visible="false"></asp:TextBox>
        </td>
    </tr>
    
</table>
        </asp:Panel>
    <asp:Panel ID="PanelUPDATE" runat="server">
        <table style="border: 2px solid #71BDF9; " class="auto-style22">
                        
                            <tr>
                                <td rowspan="2" 
                                    style="border: 1px solid #CCCCCC; vertical-align: top;" class="auto-style18">
                                    <strong>Indicador<br />
                                    <br />
                                    <asp:Label ID="LblIdResultado" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LabelIdResIndicado" runat="server"></asp:Label>
                                    <asp:Label ID="LabelNomIndicador" runat="server"></asp:Label>
                                    </strong>
                                </td>
                                <td rowspan="2" 
                                    style="border: 1px solid #CCCCCC; vertical-align: top;" class="auto-style20">
                                    <strong>Definición Operacional</strong><br />
                                    <br />
                                    <asp:Label ID="LabelDefOperacional" runat="server" style="font-size: 11pt" ></asp:Label>
                                </td>
                                <td style="border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; border-top: 1px solid #CCCCCC; border-bottom: 2px solid #808080; text-align: right; vertical-align: middle;" class="auto-style23">
                                    <strong><span class="style1">N</span></strong>
                                    <asp:TextBox ID="TextNumerador" runat="server" Height="30px" MaxLength="12" 
                                        style="font-weight: 700; font-size: (tamaño 10.)" 
                                   Width="178px" Font-Size="16pt" 
                                        ForeColor="Red" CssClass="auto-style7">0</asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="TextNumerador_FilteredTextBoxExtender" 
                                        runat="server" BehaviorID="TextNumerador_FilteredTextBoxExtender" 
                                        FilterType="Numbers" TargetControlID="TextNumerador" ValidChars="12" />
                                </td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; border-top: 2px solid #808080; border-bottom: 1px solid #CCCCCC; text-align: right; vertical-align: top;" class="auto-style19">
                                    <span class="style1"><strong>D</strong></span>
                                    <asp:TextBox ID="TextDenominador" runat="server" Height="30px" MaxLength="12" 
                                        style="font-weight: 700; font-size: (tamaño 10.)" 
                                         Width="174px" Font-Size="16pt" 
                                        ForeColor="Red" CssClass="auto-style7">0</asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                                        runat="server" BehaviorID="TTextDenominador_FilteredTextBoxExtender" 
                                        FilterType="Numbers" TargetControlID="TextDenominador" ValidChars="12" />
                                    <br />
                                    <strong><span class="style1">RESULTADO </span>
                                    <asp:Label ID="TextResul" runat="server" CssClass="auto-style17"></asp:Label>
                                    </strong>
                                </td>
                            </tr>
                        
                        
                        <tr>
                        <td style="vertical-align: top" class="auto-style24">
                            Factibilidad de Intervencion:<asp:DropDownList ID="ListFactibilidad" 
                                runat="server" CausesValidation="True">
                                <asp:ListItem Value="0">Seleccione una..</asp:ListItem>
                                <asp:ListItem Value="1">1. Factible solo a largo plazo</asp:ListItem>
                                <asp:ListItem Value="2">2. Factible a mediano o largo plazo</asp:ListItem>
                                <asp:ListItem Value="3">3. Factible a corto plazo</asp:ListItem>
                                <asp:ListItem Value="4">4. Muy factible a corto plazo</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                            <td style="vertical-align: top" class="auto-style25">
                                Gravedad del efecto:
                                <asp:DropDownList ID="ListGravedad" runat="server">
                                    <asp:ListItem Value="0">Seleccione uno...</asp:ListItem>
                                    <asp:ListItem Value="1">1. POCO GRAVE</asp:ListItem>
                                    <asp:ListItem Value="2">2. MODERADAMENTE GRAVE</asp:ListItem>
                                    <asp:ListItem Value="3">3. GRAVE</asp:ListItem>
                                    <asp:ListItem Value="4">4. MUY GRAVE</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: center; vertical-align: bottom;" class="auto-style38" rowspan="2">
                                   <strong><span class="style1">MAPA DE CALOR </span>  </strong>
                                   <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl="~/Images/VERDE_Ind.png" Visible="false" Width="80px" />
                                   <asp:Image ID="Image2" runat="server" Height="40px" ImageUrl="~/Images/AMARILLO_Ind.png" Visible="false" Width="80px" />
                                   <asp:Image ID="Image3" runat="server" Height="40px" ImageUrl="~/Images/NARANJA_Ind.png" Visible="false" Width="80px" />
                                   <asp:Image ID="Image4" runat="server" Height="40px" ImageUrl="~/Images/ROJO_Ind.png" Visible="false" Width="80px" />
                                   <br />
                            </td></tr>
                            <tr>
                                <td style="vertical-align: top" class="auto-style10" rowspan="3">
                                    Estrategias:<br />
                                    <asp:TextBox ID="TxtEstrategias" runat="server" Height="200px" 
                                        style="font-size: 8pt"  TextMode="MultiLine" 
                                        Width="99%"></asp:TextBox>
                                </td>
                                <td style="vertical-align: top" class="auto-style11" rowspan="3">
                                    Análisis:</span><br />
                                    <asp:TextBox ID="TxtAnalisis" runat="server" Height="200px" 
                                        style="font-size: 8pt"  TextMode="MultiLine" 
                                        Width="99%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style27" style="text-align: center; vertical-align: bottom;" valign="top">
                                    <asp:Image ID="Image66" runat="server" ImageUrl="~/Images/Mapa.JPG" Height="200px" Width="300px" />

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style40" style="text-align: center; vertical-align: bottom;">
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; text-align: left; font-size: 9pt; background-color: #CCCCCC;" 
                                    colspan="2" class="auto-style29">
                                    Fecha Grabación:
                                    <asp:Label ID="LabelFechaGrabacion" runat="server" style="font-size: 8pt" 
                                        Text='<%# Eval("FechaCarga") %>'></asp:Label>
                                </td>
                                <td style="text-align: center; vertical-align: bottom;" class="auto-style30">
                                    <asp:Button ID="Btncalres" runat="server" CssClass="auto-style39" Height="36px" Text="Calcula Resultado Y Mapa de Calor" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" 
                                    style="border: 1px solid #C0C0C0; vertical-align: top; " class="auto-style31">
                                    <asp:Button ID="BtnGuardar" runat="server" CommandName="Update" style="font-weight: 700" Text="Guardar" UseSubmitBehavior="False" Visible="FALSE" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="BtnCancelar" runat="server" CausesValidation="False" onclick="BtnCancelar_Click" style="font-weight: 700" Text="Cancelar" />
                                    &nbsp;<asp:SqlDataSource ID="Dataupdate" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
                                </td>
                                <td style="text-align: center; vertical-align: bottom;" class="auto-style32">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top" colspan="2" class="auto-style29">
                                    <asp:Label ID="LblImagen" runat="server"></asp:Label>
                                    <asp:SqlDataSource ID="tabla" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Ind_Resultado3.Item AS MES, Ind_Resultado3.IdAno AS Año, Ind_Resultado3.[1] AS ENE, Ind_Resultado3.[2] AS FEB, Ind_Resultado3.[3] AS MAR, Ind_Resultado3.[4] AS ABR, Ind_Resultado3.[5] AS MAY, Ind_Resultado3.[6] AS JUN, Ind_Resultado3.S1 AS ISem, Ind_Resultado3.[7] AS JUL, Ind_Resultado3.[8] AS AGO, Ind_Resultado3.[9] AS SEP, Ind_Resultado3.[10] AS OCT, Ind_Resultado3.[11] AS NOV, Ind_Resultado3.[12] AS DIC, Ind_Resultado3.S2 AS IISem, Ind_Resultado3.Anual AS AÑO FROM Ind_Resultado3 INNER JOIN Ind_Principal ON Ind_Resultado3.IdIndicador = Ind_Principal.IdIndicador WHERE (Ind_Resultado3.IdIndicador = @INDI) AND (Ind_Resultado3.IdItem &lt; 4) AND (Ind_Resultado3.IdAno &gt; YEAR(GETDATE()) - 3)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="LabelIdResIndicador" Name="INDI" PropertyName="Text" />
                                      
                                    </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="text-align: center; vertical-align: bottom;" class="auto-style30">
                                    </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="vertical-align: top" class="auto-style12">

                                    <strong><span class="style1">HISTORICO DEL INDICADOR</span>  </strong>
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="tabla" Font-Names="Tahoma" Font-Size="13px" BackColor="#99CCFF" BorderColor="#3366CC" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CssClass="auto-style15"   >
                                        <Columns>
                                            <asp:BoundField DataField="MES" HeaderText="MES" SortExpression="MES" />
                                            <asp:BoundField DataField="Año" HeaderText="Año" SortExpression="Año" />
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
                                            <asp:BoundField DataField="AÑO1" HeaderText="AÑO" SortExpression="AÑO1" />
                                        </Columns>
                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                        <RowStyle BackColor="White" ForeColor="#003399" />
                                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                        <SortedDescendingHeaderStyle BackColor="#002876" />
                                          <AlternatingRowStyle BackColor="#99ccff" />
                                    </asp:GridView>
                                </td>

                                <td class="auto-style35">


                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top" class="auto-style36">
                                    <asp:Panel ID="PanelMsg" runat="server">
                                    </asp:Panel>
                                </td>
                                <td style="vertical-align: top; text-align: right;" class="auto-style37">
                                    &nbsp;</td>
                                <td style="text-align: center; vertical-align: bottom;" class="auto-style16">
                                    &nbsp;</td>
                            </tr>
                    </table>


    </asp:Panel>


</asp:Content>

