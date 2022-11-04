<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Eps_Porcentaje.aspx.vb" Inherits="Eps_Porcentaje" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
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
           
    .auto-style1 {
        font-weight: bold;
        font-size: 20pt;
        color: #ABD3F2;
        text-align: center;
    }
           
    .auto-style2 {
        width: 32%;
    }
           
</style>

    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
                </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                </ContentTemplate>
    </asp:UpdatePanel>
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF;">
            <td colspan="4" class="auto-style1" >Porcentaje por EPS atencion en Urgencias&nbsp; <asp:Label ID="LabelFolio" runat="server" ></asp:Label></td>

        </tr>

        <tr >
            
            <td  
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
                
                Fecha Inicial:&nbsp;<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> &nbsp;
               
              
            </td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
 Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>

            </td>
            <td  style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; style="width: 30%; text-align: right;" >
                
                Total Eps en el mes :
                <asp:Label ID="Labeltmes" runat="server" ></asp:Label>
            </td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
       
        <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" style="height: 26px" /></td>
            
        </tr>
        <tr >
            <td colspan="2" 
                style="text-align: right; font-size: 8pt;" >
                &nbsp;</td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataEpsmes" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="ENTIDAD" HeaderText="ENTIDAD" SortExpression="ENTIDAD" />
                        <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD" SortExpression="CANTIDAD" ReadOnly="True" />
                        <asp:BoundField DataField="PORCENTAJE" HeaderText="PORCENTAJE" SortExpression="PORCENTAJE" ReadOnly="True" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataEpsmes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT GEENENTADM_1.ENTNOMBRE AS ENTIDAD, COUNT(*) AS CANTIDAD, CONVERT (DECIMAL(16 , 2), CONVERT (DECIMAL(16 , 4), COUNT(*) * 100) / CONVERT (DECIMAL(16 , 4), (SELECT COUNT(*) AS RESGISTROS FROM ADNINGRESO INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID WHERE (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:59')))) AS PORCENTAJE FROM ADNINGRESO AS ADNINGRESO_1 INNER JOIN GEENENTADM AS GEENENTADM_1 ON ADNINGRESO_1.EntidadAdministradora = GEENENTADM_1.OID WHERE (ADNINGRESO_1.AINURGCON = 0) AND (ADNINGRESO_1.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:59') GROUP BY GEENENTADM_1.ENTNOMBRE ORDER BY CANTIDAD DESC"
                    
                    
                    
                    ><SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" 
                            PropertyName="Text" />
                        
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" 
                            PropertyName="Text" />
                        
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
                    <tr>
                        <td class="auto-style2">
                          
                        </td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
    </table>

            

</asp:Content>


