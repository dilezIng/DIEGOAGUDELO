<%@ Page Title="Desconfirmar Epicrisis" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="DescoEpicri.aspx.vb" Inherits="Update_DescoEpicri" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Width="100%">
<ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel80" 
                        ToolTip="" ID="TabPanel80"><HeaderTemplate>Desconfirmar Epicrisis</HeaderTemplate>
    
<ContentTemplate><table style="width: 100%; font-family: tahoma;"><tr><td colspan="2" 
                                        style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">DESCONFIRMAR EPICRISIS</td></tr><tr><td style="border: 1px solid #C0C0C0; width: 30%; vertical-align: top; font-family: tahoma; font-size: 12pt; background-color: #F0F0F0;">No. <asp:TextBox ID="TxtNumEpicri" runat="server" AutoCompleteType="Disabled" 
                                            MaxLength="7" style="font-size: 14pt" Width="114px"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Consultar Epicrisis" /><br /><asp:RadioButtonList ID="ListTipoConsulta" runat="server" 
                                            RepeatDirection="Horizontal" style="font-size: 9pt"><asp:ListItem Selected="True" Value="0">Por Número de Epicrisis</asp:ListItem><asp:ListItem Value="1">Por Número de Ingreso</asp:ListItem></asp:RadioButtonList></td><td style="width: 70%"><asp:Label ID="LabelDatEpicri" runat="server" 
                                            style="font-family: Tahoma; font-size: 12pt"></asp:Label></td></tr><tr><td style="width: 30%; text-align: center;"><asp:Button ID="BtnDesconformar" runat="server" 
                                            style="font-weight: 700; color: #FF0000" Text="Desconfirmar Epicrisis" 
                                            Visible="False" /><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica" 
                                            ProviderName="System.Data.SqlClient"></asp:SqlDataSource></td><td style="width: 70%"><asp:Label ID="LabelNumEpicrisis" runat="server" Visible="False"></asp:Label></td></tr></table></ContentTemplate>
    
</ajaxToolkit:TabPanel>

                    
                    
                    <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel5" 
                        ToolTip="Mantenimientos y Soportes" ID="TabPanel5"><HeaderTemplate>Homologar Plan de Beneficios de Ingreso y Folios</HeaderTemplate>
                        
                        <ContentTemplate><table style="width: 100%; font-family: tahoma;"><tr><td colspan="2" 
                                        style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">HOMOLOGAR PLAN DE BENEFICIOS DE INGRESO Y FOLIOS</td></tr><tr><td style="border: 1px solid #C0C0C0; width: 30%; vertical-align: top; font-family: tahoma; font-size: 12pt; background-color: #F0F0F0;">Ingreso No.: <asp:TextBox ID="TxtNumIngreso" runat="server" AutoCompleteType="Disabled" 
                                            MaxLength="7" style="font-size: 14pt" Width="114px"></asp:TextBox><asp:Button ID="BtnIngreso" runat="server" Text="Consultar" /><asp:Label ID="LblIdEnt" runat="server" style="font-size: 6pt"></asp:Label><br /><asp:Button ID="BtnHomologarEntidad" runat="server" 
                                            style="font-weight: 700; color: #FF0000" 
                                            Text="Homologar Entidad en Ingreso y Folios" Visible="False" /></td><td style="width: 70%"><asp:GridView ID="GridPaciente" runat="server" AutoGenerateColumns="False" 
                                            DataKeyNames="GENDETCON" DataSourceID="DataGridPaciente" 
                                            EmptyDataText="Número de Ingreso no Válido" Visible="False"><Columns><asp:BoundField DataField="GENDETCON" HeaderText="GENDETCON" 
                                                    SortExpression="GENDETCON" Visible="False" /><asp:BoundField DataField="PACNUMDOC" HeaderText="D.I. Paciente" 
                                                    SortExpression="PACNUMDOC" /><asp:BoundField DataField="GPANOMCOM" HeaderText="Paciente" 
                                                    SortExpression="GPANOMCOM" /><asp:BoundField DataField="GDENOMBRE" HeaderText="Entidad Paciente" 
                                                    SortExpression="GDENOMBRE" /><asp:BoundField DataField="GDECODIGO" HeaderText="Cod. Entidad" 
                                                    SortExpression="GDECODIGO" /><asp:BoundField DataField="AINCONSEC" HeaderText="Ingreso" 
                                                    SortExpression="AINCONSEC" /><asp:BoundField DataField="AINFECING" HeaderText="Fecha Ingreso" 
                                                    SortExpression="AINFECING" /></Columns><EmptyDataRowStyle Font-Bold="True" ForeColor="#CC0000" /></asp:GridView><asp:SqlDataSource ID="DataGridPaciente" runat="server" 
                                            ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica" 
                                            ProviderName="System.Data.SqlClient" 
                                            SelectCommand="SELECT GENPACIEN.PACNUMDOC, GENDETCON.GDENOMBRE, GENDETCON.OID AS IdConPac, ADNINGRESO.AINFECING, ADNINGRESO.AINCONSEC, GENPACIEN.GPANOMCOM, GENDETCON.GDECODIGO, GENPACIEN.GENDETCON FROM GENPACIEN INNER JOIN ADNINGRESO ON GENPACIEN.OID = ADNINGRESO.GENPACIEN INNER JOIN GENDETCON ON GENPACIEN.GENDETCON = GENDETCON.OID WHERE (ADNINGRESO.AINCONSEC = @Ingreso)"><SelectParameters><asp:ControlParameter ControlID="TxtNumIngreso" Name="Ingreso" 
                                                    PropertyName="Text" /></SelectParameters></asp:SqlDataSource></td></tr><tr><td style="width: 30%; text-align: center;"><asp:Label ID="LabelOkEnt" runat="server" Font-Bold="True" ForeColor="#003300" 
                                            Text="SE HOMOLOGO ENTIDAD EN INGRESO Y FOLIOS CON EXITO!" Visible="False"></asp:Label></td><td style="text-align: center;"><asp:GridView ID="GridIngreso" runat="server" AutoGenerateColumns="False" 
                                            BorderColor="#0066FF" BorderStyle="Double" BorderWidth="1px" DataKeyNames="OID" 
                                            DataSourceID="DataGridIngreso"><Columns><asp:BoundField DataField="CodEntFolio" HeaderText="Cod." 
                                                    SortExpression="CodEntFolio" /><asp:BoundField DataField="EntidadIngreso" HeaderText="Entidad Ingreso" 
                                                    SortExpression="EntidadIngreso" /><asp:BoundField DataField="CodEntIngreso" HeaderText="Cod." 
                                                    SortExpression="CodEntIngreso" /><asp:BoundField DataField="EntidadFolio" HeaderText="Entidad Folio" 
                                                    SortExpression="EntidadFolio" /><asp:BoundField DataField="HCNUMFOL" HeaderText="No. Folio" 
                                                    SortExpression="HCNUMFOL" /></Columns></asp:GridView><asp:SqlDataSource ID="DataGridIngreso" runat="server" 
                                            ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica" 
                                            ProviderName="System.Data.SqlClient" 
                                            SelectCommand="SELECT GENDETCON_1.GDENOMBRE AS EntidadFolio, GENDETCON_2.GDENOMBRE AS EntidadIngreso, HCNFOLIO.HCNUMFOL, GENDETCON_2.GDECODIGO AS CodEntIngreso, GENDETCON_1.GDECODIGO AS CodEntFolio, HCNFOLIO.OID FROM ADNINGRESO INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN GENDETCON AS GENDETCON_1 ON HCNFOLIO.GENDETCON = GENDETCON_1.OID INNER JOIN GENDETCON AS GENDETCON_2 ON ADNINGRESO.GENDETCON = GENDETCON_2.OID WHERE (ADNINGRESO.AINCONSEC = @Ingreso)"><SelectParameters><asp:ControlParameter ControlID="TxtNumIngreso" Name="Ingreso" 
                                                    PropertyName="Text" /></SelectParameters></asp:SqlDataSource></td></tr></table></ContentTemplate>
                        
</ajaxToolkit:TabPanel>

                    
                    
                </asp:TabContainer>

</asp:Content>

