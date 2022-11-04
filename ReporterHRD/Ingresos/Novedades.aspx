<%@ Page Title="Novedades de Ingresos de Pacientes" ValidateRequest="false" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Novedades.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
           
    </style>


    <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    </ContentTemplate>
                    
    </asp:UpdatePanel>

                        <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                
                NOVEDADES DE INGRESOS</td>
        </tr>
        <tr >
            <td style="width: 50%; font-size: 9pt; text-align: right;" colspan="2" >
                Buscar por:
                
                <ajaxToolkit:TextBoxWatermarkExtender ID="TextBusqueda_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="TextBusqueda" 
                    WatermarkText="Escriba aqui..." />
                <asp:RadioButtonList ID="ListTipoBusqueda" runat="server" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="0" Selected="True">Ingreso</asp:ListItem>
                    <asp:ListItem Value="1">Numero de Documento</asp:ListItem>
                </asp:RadioButtonList>
                &nbsp;
                <asp:TextBox ID="TextBusqueda" runat="server" MaxLength="15" 
                    style="font-weight: 700; font-size: 14pt;" Width="150px"></asp:TextBox>
            </td>
            <td style="width: 25%; text-align: right;" >
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
            </td>
            <td style="width: 25%; text-align: right;" >
                <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" 
                    style="font-weight: 700" />
            </td>
        </tr>
        
        <tr >
            <td style="width: 100%; font-size: 10pt;" colspan="4" >
                <asp:GridView ID="GridIngresos" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="OID,AINURGCON,AINESTADO" DataSourceID="DataGridIngresos" 
                    Visible="False" Width="100%">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="AINCONSEC" HeaderText="Ingreso" 
                            SortExpression="AINCONSEC">
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Ingreso por">
                            <ItemTemplate>
                                <asp:Label ID="LabelIngPor" runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado" SortExpression="AINESTADO">
                            <ItemTemplate>
                                <asp:Label ID="LabelEstado" runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AINESTADO") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AINFECING" HeaderText="Fecha Ingreso" 
                            SortExpression="AINFECING" />
                        <asp:BoundField DataField="TipoDocPac" HeaderText="T.D." ReadOnly="True" 
                            SortExpression="TipoDocPac" />
                        <asp:BoundField DataField="PACNUMDOC" HeaderText="No. D.I." 
                            SortExpression="PACNUMDOC" />
                        <asp:BoundField DataField="PACPRINOM" HeaderText="Primer Nombre" 
                            SortExpression="PACPRINOM" />
                        <asp:BoundField DataField="PACSEGNOM" HeaderText="Segundo Nombre" 
                            SortExpression="PACSEGNOM" />
                        <asp:BoundField DataField="PACPRIAPE" HeaderText="Primer Apellido" 
                            SortExpression="PACPRIAPE" />
                        <asp:BoundField DataField="PACSEGAPE" HeaderText="Segundo Apellido" 
                            SortExpression="PACSEGAPE" />
                        <asp:CommandField SelectText="Ver Novedades" ShowSelectButton="True" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:TemplateField HeaderText="Cant">
                            <ItemTemplate>
                                <asp:Label ID="labelCantNovs" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <SelectedRowStyle BackColor="#FFB9DC" Font-Bold="True" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridIngresos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    
                    SelectCommand="SELECT ADNINGRESO.OID, ADNINGRESO.AINCONSEC, ADNINGRESO.AINFECING, ADNINGRESO.AINESTADO, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC, GENPACIEN.PACPRINOM, GENPACIEN.PACSEGNOM, GENPACIEN.PACPRIAPE, GENPACIEN.PACSEGAPE, ADNINGRESO.AINURGCON FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (GENPACIEN.PACNUMDOC = N'123')">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr >
            <td style="width: 50%; font-size: 9pt; text-align: right;" colspan="2" >
                &nbsp;</td>
            <td style="width: 25%; text-align: right;" >
                &nbsp;</td>
            <td style="width: 25%; text-align: right;" >
                                <asp:Button ID="BtnNuevaNovedad" runat="server" 
                    Text="Agregar Novedad al Ingreso " Visible="False" />
            </td>
        </tr>
        <tr >
            <td style="width: 100%; font-size: 10pt;" colspan="4" >
                <asp:DataList ID="ListNovedades" runat="server" DataKeyField="IdNovedad" 
                    DataSourceID="DataListNovedades" Width="100%" ShowFooter="False" 
                    ShowHeader="False" BorderColor="#CCCCCC" BorderStyle="Solid" 
                    BorderWidth="1px">
                    <AlternatingItemStyle BackColor="#F0F0F0" BorderColor="#009999" 
                        BorderStyle="Solid" BorderWidth="1px" />
                    <ItemTemplate>
                        <table style="width: 100%; background-color: #FFFFCC; border-bottom-style: double; border-bottom-width: 3px; border-bottom-color: #808080; border-top-style: double; border-top-width: 5px;">
                            <tr>
                                <td colspan="4">
                                    <asp:Label ID="LabelTitulo" runat="server" 
                                        style="font-weight: 700; font-size: 20pt; color: #0066CC" 
                                        Text='<%# Eval("Titulo") %>'></asp:Label>
                                    &nbsp;<asp:Label ID="IdNovedadLabel" runat="server" style="font-size: 7pt" 
                                        Text='<%# Eval("IdNovedad") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%">
                                    <asp:Label ID="FechaInsercionLabel" runat="server" 
                                        Text='<%# Eval("FechaInsercion") %>' />
                                </td>
                                <td style="width: 25%">
                                    <asp:Label ID="LabelNomUs" runat="server"></asp:Label>
                                </td>
                                <td style="width: 25%">
                                    <asp:Label ID="IdUsInsertoLabel" runat="server" 
                                        Text='<%# Eval("IdUsInserto") %>' Visible="False" />
                                </td>
                                <td style="width: 25%">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:Label ID="NovedadLabel" runat="server" Text='<%# Eval("Novedad") %>' />
                        
                        <asp:DataList ID="ListArchivos1" runat="server" BorderColor="#CCCCCC" 
                            BorderStyle="Solid" BorderWidth="1px" DataKeyField="IdArchivo" 
                            DataSourceID="DataListArchivos1" RepeatDirection="Horizontal" 
                            style="text-align: center; font-size: 7pt;">
                            <AlternatingItemStyle BorderStyle="Solid" BorderWidth="1px" />
                            <HeaderTemplate>
                                Archivos Adjuntos
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink4" runat="server" 
                                    ImageUrl="~/Images/IconoArchivo.jpg" NavigateUrl='<%# Eval("UrlArchivo") %>' 
                                    Target="_blank">HyperLink</asp:HyperLink>
                                <br />
                                <asp:Label ID="NomArchivoLabel" runat="server" 
                                    Text='<%# Eval("NomArchivo") %>' />
                                <br />
                                <asp:Label ID="FechaInsercionLabel0" runat="server" 
                                    Text='<%# Eval("FechaInsercion") %>' style="font-size: 6pt" />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="DataListArchivos1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>" 
                            SelectCommand="SELECT IdNovedad, NomArchivo, UrlArchivo, FechaInsercion, IdArchivo FROM Ing_Archivos WHERE (IdNovedad = @IdNovedad)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="IdNovedadLabel" Name="IdNovedad" 
                                    PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <asp:SqlDataSource ID="DataListNovedades" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                    
                    SelectCommand="SELECT IdNovedad, IdIngresoDGH, Novedad, FechaInsercion, IdUsInserto, Titulo FROM Ing_Novedades WHERE (IdIngresoDGH = @IdIngreso)" 
                    
                    
                    ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridIngresos" Name="IdIngreso" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr >
            <td style="width: 100%; font-size: 10pt;" colspan="4" >
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <ajaxToolkit:modalpopupextender ID="BtnMostrar_ModalPopupExtender" runat="server"
                 BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True"
                    TargetControlID="BtnMostrar" PopupControlID="PanelModal">
               
               </ajaxToolkit:ModalPopupExtender>
                <br />
                <asp:Panel ID="PanelModal" runat="server" BackColor="White" Width="1000px" 
                    GroupingText="Agregar Novedad">
                    Titulo:<asp:TextBox ID="TextTitulo" runat="server" MaxLength="100" Width="90%"></asp:TextBox>
&nbsp;<asp:Label ID="LabelIdNovedad" runat="server"></asp:Label>
                    <br />
                    Usuario Registra:
                    <asp:Label ID="LabelUsRegistra" runat="server"></asp:Label>
                    &nbsp;<hr />&nbsp;<FTB:FreeTextBox ID="TextoNuevaNovedad" runat="server" 
                        ButtonSet="Office2003" EnableHtmlMode="False" Language="es-ES" 
                        toolbarlayout="FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline;JustifyLeft,JustifyRight,JustifyCenter,JustifyFull,BulletedList,NumberedListCut,Copy,Paste,Delete;Undo,Redo;InsertTable" 
                        Width="100%">
                    </FTB:FreeTextBox>
                    <br />
                    <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                    &nbsp;&nbsp;<asp:Button ID="BtnGrabarNovedad" runat="server" Text="Guardar Novedad" />
&nbsp;
                    <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
                    <asp:Button ID="BtnAdjuntarArchivo" runat="server" Text="Adjuntar Archivo" />
                    <asp:Label ID="LabelAdjArchivos" runat="server"></asp:Label>
                    <br />
                    <asp:DataList ID="ListArchivos" runat="server" DataKeyField="IdArchivo" 
                        DataSourceID="DataListArchivos" style="text-align: center" 
                        RepeatDirection="Horizontal">
                        <AlternatingItemStyle BorderStyle="Solid" BorderWidth="1px" />
                        <HeaderTemplate>
                            Archivos Adjuntos
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink3" runat="server" 
                                ImageUrl="~/Images/IconoArchivo.jpg" NavigateUrl='<%# Eval("UrlArchivo") %>'></asp:HyperLink>
                          <br />
                            <asp:Label ID="NomArchivoLabel" runat="server" 
                                Text='<%# Eval("NomArchivo") %>' style="font-size: 7pt" />
                            <br />
                            <asp:Label ID="FechaInsercionLabel" runat="server" 
                                Text='<%# Eval("FechaInsercion") %>' style="font-size: 6pt" />
                            
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="DataListArchivos" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>" 
                        SelectCommand="SELECT IdNovedad, NomArchivo, UrlArchivo, FechaInsercion, IdArchivo FROM Ing_Archivos WHERE (IdNovedad = @IdNovedad)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="LabelIdNovedad" Name="IdNovedad" 
                                PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
                <br />
                <br />
            </td>
        </tr>
        <tr >
            <td style="width: 25%" >
                <asp:SqlDataSource ID="DataConsultas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>">
                </asp:SqlDataSource>
            </td>
            <td style="width: 25%" >
                <asp:TextBox ID="TextBox2" runat="server"  
                    Visible="False"></asp:TextBox>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
        <tr >
            <td colspan="4" >
                &nbsp;</td>
        </tr>
    </table>

                        <%--</ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnAdjuntarArchivo" EventName="Click" />
                    </Triggers>
    </asp:UpdatePanel>--%>
</asp:Content>

