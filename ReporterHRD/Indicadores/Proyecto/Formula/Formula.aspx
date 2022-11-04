<%@ Page Title="Edición Datos de indicador" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Formula.aspx.vb" Inherits="Indicadores_Proyecto_Admins_AsocIndiUsers" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 96%;
        }
        .auto-style2 {
            width: 701px;
        }
        .auto-style3 {
            width: 100%;
            height: 208px;
        }
        .auto-style31 {
            text-align: left;
        }
        .auto-style33 {
            text-align: center;
            font-size: large;
            color: #FFFFFF;
            height: 24px;
        }
        .auto-style38 {
            width: 15%;
        }
        .auto-style40 {
            height: 23px;
            text-align: center;
        }
        .auto-style41 {
            text-align: center;
            height: 27px;
        }
        .auto-style42 {
            width: 100%;
        }
        .auto-style43 {
            height: 23px;
        }
        .auto-style44 {
            height: 23px;
            width: 121px;
        }
        .auto-style46 {
            height: 37px;
        }
        .auto-style49 {
            width: 121px;
        }
        .auto-style50 {
            text-align: right;
        }
        .auto-style52 {
            height: 23px;
            text-align: center;
            width: 118px;
        }
        .auto-style53 {
            color: #000000;
            background-color: #FFFFFF;
        }
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                            Width="100%">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel5" ToolTip="Mantenimientos y Soportes" ID="TabPanel5"><HeaderTemplate> 
&nbsp;Crear Años
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table class="auto-style42"><tr><td colspan="6" class="auto-style46">&nbsp;</td></tr><tr><td class="auto-style44">Años Creados</td><td class="auto-style43">
                                    <asp:Label ID="Anual2" runat="server" ></asp:Label>
                                    </td><td class="auto-style43"></td><td class="auto-style43"></td><td class="auto-style43"></td><td class="auto-style43"></td></tr><tr><td class="auto-style49">Año a crear : </td><td><strong>
                                    <asp:Label ID="Anual" runat="server" CssClass="auto-style48"></asp:Label>
                                    </strong></td><td>&nbsp;</td><td>&nbsp;</td>
<td>&nbsp;</td><td>&nbsp;</td></tr><tr><td class="auto-style49">
                                    <asp:SqlDataSource ID="DataInsert" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
                                    </td><td class="auto-style50">
                                    <asp:Button ID="BtnCrear" runat="server" Text="Crear Año" />
                                    </td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></table>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>



<ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel80" ID="TabPanel80"><HeaderTemplate>
    Formula
    </HeaderTemplate>
    

    
<ContentTemplate>
    <table style="width: 100%; font-family: tahoma;" ><tr ><td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('https://localhost:44353/Images/Fondo01.jpg');" 
                >Tabla Indicadores (Edición - Creación)</td></tr><tr ><td style="width: 25%" >&nbsp;</td><td style="width: 25%" >&nbsp;</td><td style="width: 25%" >&nbsp;</td><td class="auto-style38" ><asp:SqlDataSource ID="DataConsultas" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                                        
                    ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>" 
                    InsertCommand="INSERT INTO Ind_IndiUsers(IdIndicador, IdUsuarioDG) VALUES (1, 2)"></asp:SqlDataSource>
            </td></tr><tr ><td colspan="4" class="auto-style3" ><asp:Panel ID="Panel1" runat="server">
                
                <asp:GridView ID="GridIndicadores" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="IdIndicador" DataSourceID="DataGridindicadores" AllowSorting="True" style="text-align: center" Width="100%">
            <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="IdIndicador" HeaderText="Id" 
                        SortExpression="IdIndicador" InsertVisible="False" ReadOnly="True" >
                <ItemStyle Font-Size="8pt" ForeColor="#999999" />
                </asp:BoundField>
                <asp:BoundField DataField="CodIndicador" HeaderText="Codigo" 
                        SortExpression="CodIndicador" >
                <ItemStyle HorizontalAlign="Left" Font-Bold="True" Font-Italic="False" 
                                Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="IdSedeAsig" HeaderText="Sede" 
                                SortExpression="IdSedeAsig" />
                <asp:TemplateField HeaderText="Principal" SortExpression="Principal"><ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("UrlPrincipal") %>' 
                                        ToolTip='<%# Eval("txtPrincipal") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="IndPadre" HeaderText="Padre" 
                                SortExpression="IndPadre">
                <ItemStyle Font-Size="9pt" />
                </asp:BoundField>
                <asp:BoundField DataField="NomIndicador" HeaderText="Nombre" 
                                SortExpression="NomIndicador">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Tipo_Formula" HeaderText="Formula" 
                                SortExpression="Tipo_Formula">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            </asp:GridView>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:SqlDataSource ID="DataGridindicadores" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                        
                        SelectCommand="SELECT Ind_Principal.IdIndicador, CASE WHEN Ind_Principal.IdSedeAsig = 0 THEN Ind_Principal.CodIndicador ELSE Ind_Principal.CodIndicador + '.' + CONVERT (char(1) , Ind_Principal.IdSedeAsig) END AS CodIndicador, Ind_Principal.NomIndicador, Ind_Principal.Principal, Ind_Principal.IdPadre, Ind_Principal.DefOperacional, Ind_Principal.IdNivelDesagregacion, Ind_Principal.Actualizado, CASE WHEN Ind_Principal.IdPadre = 1 THEN '-' ELSE Ind_Principal_1.CodIndicador END AS IndPadre, CASE WHEN Ind_Principal.Principal = 1 THEN '~/Images/Head.png' ELSE '~/Images/Nada.png' END AS UrlPrincipal, CASE WHEN Ind_Principal.Principal = 1 THEN 'Principal' ELSE '' END AS txtPrincipal, Ind_Principal.IdSedeAsig, CASE WHEN Ind_Principal.Tipo_Formula = 1 THEN 'N/D' WHEN Ind_Principal.Tipo_Formula = 2 THEN 'N/D x 100' WHEN Ind_Principal.Tipo_Formula = 3 THEN 'N/D x 1000' WHEN Ind_Principal.Tipo_Formula = 4 THEN 'N/D x 100000' WHEN Ind_Principal.Tipo_Formula = 5 THEN 'N = N' else '--' end AS Tipo_Formula FROM Ind_Principal INNER JOIN Ind_Principal AS Ind_Principal_1 ON Ind_Principal.IdPadre = Ind_Principal_1.IdIndicador WHERE (Ind_Principal.IdIndicador &gt; 1) ORDER BY CodIndicador, Ind_Principal.IdSedeAsig"></asp:SqlDataSource>
            

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br /><br /></asp:Panel>
            </td></tr><tr ><td colspan="4" class="auto-style31" ><asp:Panel ID="PanelFormula" runat="server"><asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:SqlDataSource ID="DataGridindicadores0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                        
SelectCommand="SELECT CASE WHEN Ind_Principal.IdSedeAsig = 0 THEN Ind_Principal.CodIndicador ELSE Ind_Principal.CodIndicador + '.' + CONVERT (char(1) , Ind_Principal.IdSedeAsig) END AS Cod_Indicador, NomIndicador AS Indicador, DefOperacional AS Definición, CASE WHEN Ind_Principal.Tipo_Formula = 1 THEN 'N/D' WHEN Ind_Principal.Tipo_Formula = 2 THEN 'N/D x 100' WHEN Ind_Principal.Tipo_Formula = 3 THEN 'N/D x 1000' WHEN Ind_Principal.Tipo_Formula = 4 THEN 'N/D x 100000' END AS Formula_Mes, CASE WHEN Ind_Principal.F1 = 0 THEN 'SumN(Semestre)/SumD(Semestre)' WHEN Ind_Principal.F1 = 1 THEN 'SumN(Semestre)/UltimoD(Semeste)' WHEN Ind_Principal.F1 = 2 THEN 'SumN(Semestre)' WHEN Ind_Principal.F1 = 3 THEN 'SumN(Semestre)/DEnero' END AS Semestre_1, CASE WHEN Ind_Principal.F2 = 0 THEN 'SumN(Semestre)/SumD(Semestre)' WHEN Ind_Principal.F2 = 1 THEN 'SumN(Semestre)/UltimoD(Semeste)' WHEN Ind_Principal.F2 = 2 THEN 'SumN(Semestre)' WHEN Ind_Principal.F2 = 3 THEN 'SumN(Semestre)/DEnero' END AS Semestre_2, CASE WHEN Ind_Principal.Fanual = 0 THEN 'SumN(Año)/SumD(Año)' WHEN Ind_Principal.Fanual = 1 THEN 'SumN(Año)/UltimoD(Año)' WHEN Ind_Principal.Fanual = 2 THEN 'SumN(Año)' WHEN Ind_Principal.Fanual = 3 THEN 'SumN(Semestre)/DEnero' END AS Formula_Anual, Meta FROM Ind_Principal WHERE (IdIndicador = @Texbox1) ORDER BY CodIndicador, IdSedeAsig"><SelectParameters>
                    
                    <asp:ControlParameter ControlID="TextBox1" Name="Texbox1" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br /><table class="auto-style1" frame="border"><tr><td rowspan="2" class="auto-style52" style="padding: inherit; border-style: solid; border-width: thin;"><strong><span class="auto-style53">Meta Estandar</span></strong></td><td colspan="4" class="auto-style41" style="padding: inherit; border-style: solid; border-width: thin;"><strong>Formulas</strong></td></tr><tr><td class="auto-style40" style="padding: inherit; border-style: solid; border-width: thin;"><strong>Mensual</strong></td><td class="auto-style40" style="padding: inherit; border-style: solid; border-width: thin;">
 <strong>Semestre 1</strong></td><td class="auto-style40" style="padding: inherit; border-style: solid; border-width: thin;"><strong>Semestre 2</strong></td><td class="auto-style40" style="padding: inherit; border-style: solid; border-width: thin;"><strong>Anual</strong></td></tr><tr><td class="auto-style52" style="padding: inherit; border-style: solid; border-width: thin;"><asp:TextBox ID="META1" runat="server" Width="55px"></asp:TextBox>
                </td><td class="auto-style40" style="padding: inherit; border-style: solid; border-width: thin;"><asp:DropDownList ID="Tipo_Formula" runat="server"><asp:ListItem Value="0">N/D</asp:ListItem>
                    <asp:ListItem Value="1">N/D x 100</asp:ListItem>
                    <asp:ListItem Value="2">N/D x 1000</asp:ListItem>
                    <asp:ListItem Value="3">N/D x 100000</asp:ListItem>
                    <asp:ListItem Value="4">N = N</asp:ListItem>
                    </asp:DropDownList>
                </td><td class="auto-style40" style="padding: inherit; border-style: solid; border-width: thin;"><asp:DropDownList ID="for1" runat="server"><asp:ListItem Value="0">SumN(Semestre)/SumD(Semestre)</asp:ListItem>
                    <asp:ListItem Value="1">SumN(Semestre)/UltimoD(Semestre)</asp:ListItem>
                    <asp:ListItem Value="2">SumN(Semestre)</asp:ListItem>
                    <asp:ListItem Value="3">SumN(Semestre)/DEnero</asp:ListItem>
                    </asp:DropDownList>
                </td><td class="auto-style40" style="padding: inherit; border-style: solid; border-width: thin;"><asp:DropDownList ID="For2" runat="server"><asp:ListItem Value="0">SumN(Semestre)/SumD(Semestre)</asp:ListItem>
                    <asp:ListItem Value="1">SumN(Semestre)/UltimoD(Semestre)</asp:ListItem>
                    <asp:ListItem Value="2">SumN(Semestre)</asp:ListItem>
                    <asp:ListItem Value="3">SumN(Semestre)/DEnero</asp:ListItem>
                    </asp:DropDownList>
                </td><td class="auto-style40" style="padding: inherit; border-style: solid; border-width: thin;"><asp:DropDownList ID="Fora" runat="server"><asp:ListItem Value="0">SumN(Año)/SumD(Año)</asp:ListItem>
                    <asp:ListItem Value="1">SumN(Año)/UltimoD(Año)</asp:ListItem>
                    <asp:ListItem Value="2">SumN(Año)</asp:ListItem>
                    <asp:ListItem Value="3">SumN(Año)/DEnero</asp:ListItem>
                    </asp:DropDownList>
                </td></tr>
                <caption>
                    
                    <tr>
                        <td class="auto-style33" colspan="5" style="padding: inherit; border-style: solid; border-width: thin;">
                            <asp:Button ID="Button1" runat="server" OnClick="Page_Load" Text="Guardar" />
                        </td>
                    </tr>
                </caption>
                </table><p></p><table style="width: 100%;"><tr><td class="auto-style2"><asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridindicadores0" AutoGenerateColumns="False" Width="1017px"><Columns>
            <asp:BoundField DataField="Cod_Indicador" HeaderText="Cod" ReadOnly="True" SortExpression="Cod_Indicador" />
            <asp:BoundField DataField="Indicador" HeaderText="Indicador" SortExpression="Indicador" />
            <asp:BoundField DataField="Definición" HeaderText="Definición" SortExpression="Definición" />
            <asp:BoundField DataField="Formula_Mes" HeaderText="Formula_Mes" SortExpression="Formula_Mes" ReadOnly="True" />
            <asp:BoundField DataField="Semestre_1" HeaderText="Semestre_1" SortExpression="Semestre_1" ReadOnly="True" />
            <asp:BoundField DataField="Semestre_2" HeaderText="Semestre_2" SortExpression="Semestre_2" ReadOnly="True" />
            <asp:BoundField DataField="Formula_Anual" HeaderText="Formula_Anual" ReadOnly="True" SortExpression="Formula_Anual" />
            <asp:BoundField DataField="Meta" HeaderText="Meta" SortExpression="Meta" />
            </Columns>
            <HeaderStyle HorizontalAlign="Center" />
            </asp:GridView>
            </td></tr></table></asp:Panel>
            

</ContentTemplate>

                
    
</ajaxToolkit:TabPanel>

                    
                </asp:TabContainer>

</asp:Content>
