<%@ Page Title="Suministro a Paciente por Almacén" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="SuminPacienteAlmacen.aspx.vb" Inherits="PaginaBase" %>

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

    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
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
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" 
                >Suministro a Paciente por Almacén</td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
                Facturas&nbsp;&nbsp;
                Fecha Inicial:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> &nbsp;
                Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
            </td>
            <td style="width: 30%; text-align: right;" >
                
                Almacén:&nbsp;<asp:DropDownList ID="ListAlmacenes" runat="server" 
                    DataSourceID="DataListAlmacenes" DataTextField="NomAlmacen" 
                    DataValueField="IdAlmacen" Width="70%" AppendDataBoundItems="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataListAlmacenes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                    
                    
                    
                    
                    
                    
                    
                    SelectCommand="SELECT DISTINCT INNALMACE.IALCODIGO + N' - ' + INNALMACE.IALNOMBRE AS NomAlmacen, INNALMACE.OID AS IdAlmacen, INNALMACE.IALCODIGO FROM INNMSUMPA INNER JOIN INNCSUMPA ON INNMSUMPA.INNCSUMPA = INNCSUMPA.OID INNER JOIN INNALMACE ON INNCSUMPA.INNALMACE = INNALMACE.OID ORDER BY INNALMACE.IALCODIGO">
                </asp:SqlDataSource>
                
</td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
                <asp:Button ID="BtnExportar" runat="server" 
                    Text="Exportar a Excel" Enabled="False" />
        &nbsp;
        <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" /></td>
            
        </tr>
        <tr >
            <td colspan="2" 
                style="text-align: right; font-size: 8pt;" >
                <asp:RadioButtonList ID="ListTipoProducto" runat="server" 
                    RepeatDirection="Horizontal" AutoPostBack="True">
                    <asp:ListItem Value="1" Selected="True">Sumnistro</asp:ListItem>
                    <asp:ListItem Value="2">Medicamento</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                <asp:Label ID="LabelInfo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridView" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" 
                            SortExpression="Cantidad" DataFormatString="{0:N0}" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Right" Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                            SortExpression="Codigo" >
                        <ItemStyle HorizontalAlign="Center" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" 
                            SortExpression="Descripcion" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                    
                    
                    
                    
                    
                    
                    
                    
                    SelectCommand="SELECT SUM(INNMSUMPA.IDDCANTID) AS Cantidad, INNPRODUC.IPRCODIGO AS Codigo, INNPRODUC.IPRDESCOR AS Descripcion FROM INNCSUMPA INNER JOIN INNMSUMPA ON INNMSUMPA.INNCSUMPA = INNCSUMPA.OID INNER JOIN INNDOCUME ON INNCSUMPA.OID = INNDOCUME.OID INNER JOIN INNPRODUC ON INNMSUMPA.INNPRODUC = INNPRODUC.OID WHERE (INNDOCUME.IDESTADO = 1) AND (INNDOCUME.IDFECDOC BETWEEN @FechaInicial AND @FechaFinal) AND (INNCSUMPA.INNALMACE = @IdAlmacen) AND (INNPRODUC.IPRTIPPRO = @Tipo) GROUP BY INNMSUMPA.INNPRODUC, INNPRODUC.IPRDESCOR, INNPRODUC.IPRCODIGO ORDER BY Descripcion">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListAlmacenes" Name="IdAlmacen" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListTipoProducto" Name="Tipo" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
                    <tr>
                        <td style="width: 25%">
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
    </table>

            
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

