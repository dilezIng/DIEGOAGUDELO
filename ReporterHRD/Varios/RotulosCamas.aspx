<%@ Page Title="Generar Rotulos" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="RotulosCamas.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


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
    



        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
       <ProgressTemplate>
             <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 15000px; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1500px;
                     position: absolute; text-align: center;">
                     <uc1:Cargando ID="Cargando2" runat="server" /></div>
                            </asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>        
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

                </ContentTemplate>
    </asp:UpdatePanel>
    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="3" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                
                GENERAR ROTULOS PARA ESTANCIA DE PACIENTE</td>
        </tr>

        <tr >
            <td style="border: 1px solid #999999; width: 50%; font-size: 8pt; background-color: #F0F0F0;" >
                <strong>Ingreso Por</strong>:
                <asp:RadioButtonList ID="ListTipoIngreso" runat="server" RepeatLayout="Flow" 
                    AutoPostBack="True" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">Urgencias</asp:ListItem>
                    <asp:ListItem Value="10">Cirugia Ambulatoria</asp:ListItem>
                    <asp:ListItem Value="2">Nacido en Hospital</asp:ListItem>
                    <asp:ListItem Value="99">Todos</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 25%; font-size: 8pt; text-align: center;" >
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </td>
            <td style="width: 25%" >
                <asp:Timer ID="Timer1" runat="server" Interval="600000">
                </asp:Timer>
                <asp:Button ID="Button1" runat="server" Text="Actualizar Ingresos" />
            </td>
        </tr>

        <tr >
            <td style="width: 25%" colspan="3" >
                <asp:GridView ID="GridIngresos" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="OID,AINURGCON" 
                    DataSourceID="DataGridIngresos" AllowPaging="True" PageSize="100">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="NumIngreso" HeaderText="Ingreso" 
                            SortExpression="NumIngreso" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AINFECING" HeaderText="Fecha Ingreso" 
                            SortExpression="AINFECING" >
                        <ItemStyle Font-Size="9pt" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TipoDocPac" HeaderText="D.I." ReadOnly="True" 
                            SortExpression="TipoDocPac" />
                        <asp:BoundField DataField="NumDocPaciente" HeaderText="No. Doc" 
                            SortExpression="NumDocPaciente" />
                        <asp:BoundField DataField="NomPaciente" HeaderText="Paciente" ReadOnly="True" 
                            SortExpression="NomPaciente" />
                        <asp:TemplateField HeaderText="Ingreso Por:" SortExpression="AINURGCON">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AINURGCON") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("AINURGCON") %>' 
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LabelIngPor" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Size="9pt" />
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" >
                        <ItemStyle Font-Size="9pt" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridIngresos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT TOP (10000) ADNINGRESO.OID, ADNINGRESO.AINCONSEC AS NumIngreso, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, ADNINGRESO.AINFECING, ADNINGRESO.AINURGCON, GENPACIEN.PACNUMDOC AS NumDocPaciente, ADNINGRESO.AINESTADO FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) AND (ADNINGRESO.AINESTADO = 0) ORDER BY ADNINGRESO.AINFECING DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListTipoIngreso" Name="ClaseIngreso" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True" PopupControlID="Panel1" 
                    TargetControlID="BtnMostrar">
                </asp:ModalPopupExtender>
            </td>
        </tr>
        
        <tr>
            <td colspan="3">
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="modalPopup" 
                    Height="600px" ScrollBars="Vertical" Width="900px">
                    <table style="width: 100%; font-family: tahoma;">
                        <tr>
                            <td style="width: 90%">
                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                                    Font-Size="8pt" Height="533px" InteractiveDeviceInfos="(Colección)" 
                                    ShowBackButton="False" ShowCredentialPrompts="False" 
                                    ShowDocumentMapButton="False" ShowFindControls="False" 
                                    ShowPageNavigationControls="False" ShowParameterPrompts="False" 
                                    ShowPrintButton="False" ShowPromptAreaButton="False" ShowRefreshButton="False" 
                                    ShowZoomControl="False" WaitMessageFont-Names="Verdana" 
                                    WaitMessageFont-Size="14pt" Width="100%">
                                    <LocalReport ReportPath="Varios\Informes\RotuloCama.rdlc">
                                        <DataSources>
                                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                                        </DataSources>
                                    </LocalReport>
                                </rsweb:ReportViewer>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                    TypeName="InfUrgenciasTableAdapters.RotuloCamaIngresoTableAdapter">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GridIngresos" Name="IdIngreso" 
                                            PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                            <td style="width: 10%; text-align: center;">
                                <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
            </td>
        </tr>
    </table>

<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

