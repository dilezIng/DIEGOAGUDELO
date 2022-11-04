<%@ Page Title="Resolución 014" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Res014.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


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
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');">
            <td colspan="4" 
                >Resolución 014</td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style="border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
                
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
                <td style="width: 25%; font-size: 9pt; text-align: center;" >
                <asp:Button ID="BtnExportar" runat="server" 
                    Text="Exportar a Excel Facturado" />
					<asp:Button ID="BtnExportar2" runat="server" 
                    Text="Exportar a Excel Recaudo" />
        &nbsp;
        <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" /></td>
            <td style="width: 25%; text-align: right;" >
                
            </td>
        </tr>
        <tr >
            <td colspan="2" 
                
                <asp:Label ID="LabelFechaFinTraslado" runat="server" Visible="False"></asp:Label></td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                <asp:Label ID="LabelInfo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="2" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridView" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="NIT" HeaderText="NIT" SortExpression="NIT" ReadOnly="True" />
 <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" ReadOnly="True" />
 <asp:BoundField DataField="N" HeaderText="N" SortExpression="N" ReadOnly="True" />
 <asp:BoundField DataField="reg" HeaderText="reg" SortExpression="reg" ReadOnly="True" />
 <asp:BoundField DataField="Total Facturado" HeaderText="Total Facturado" SortExpression="Total Facturado" ReadOnly="True" />

                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                    
                    
                    
                    SelectCommand="SELECT GENTERCER.TERNUMDOC AS NIT, GENTERCER.TERNOMCOM AS Nombre, (case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='CON' THEN 1 else   case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='SUB' THEN 2    else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='EMP' THEN 3 else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='ESS' THEN 4  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='PPN' or SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='VIN' THEN 5  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='PIC' THEN 6 else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='MUN' THEN 6  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='SES' THEN 7  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='ARP' or  SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='ARL' THEN 8  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='AAT' THEN 9 END end end end end end end end end end )as N,SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) as 'reg',sum(CRNCXC.CRNVALOR) As 'Total Facturado'   FROM CRNRADFACC INNER JOIN CRNRADFACD ON CRNRADFACC.OID =CRNRADFACD.CRNRADFACC INNER JOIN  CRNDOCUME ON CRNRADFACC.OID = CRNDOCUME.OID INNER JOIN SLNFACTUR on CRNRADFACD.SLNFACTUR= SLNFACTUR.OID INNER JOIN CRNCXC ON  SLNFACTUR.SFANUMFAC=CRNCXC.CXCDOCUME INNER JOIN GENTERCER ON CRNCXC.GENTERCER = GENTERCER.OID INNER join CRNCXCC on CRNCXC.OID=CRNCXCC.CRNCXC  INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON=GENDETCON.OID   WHERE ( CRNDOCUME.CDFECDOC BETWEEN @p0 AND @p1+ ' 23:59:00') and SLNFACTUR.SFADOCANU = 0   and SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) not in ( 'PAR','IPP','FID')   group by (case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='CON' THEN 1 else   case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='SUB' THEN 2    else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='EMP' THEN 3 else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='ESS' THEN 4  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='PPN' or SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='VIN' THEN 5  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='PIC' THEN 6 else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='MUN' THEN 6  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='SES' THEN 7  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='ARP' or  SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='ARL' THEN 8  else case when SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) ='AAT' THEN 9 END end end end end end end end end end ), GENTERCER.TERNUMDOC  ,GENTERCER.TERNOMCOM,GENTERCER.OID,GENDETCON.GDECODIGO  ORDER BY  GENTERCER.TERNUMDOC  ,SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 )">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0"  PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1"   PropertyName="Text" />
                      
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </td>
			
        
            <td colspan="2" style="font-size: 9pt" align="top" >
                
                <asp:GridView ID="GridView2" runat="server" DataSourceID="DataGridView2" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                         <asp:BoundField DataField="NIT" HeaderText="NIT" SortExpression="NIT" ReadOnly="True" />
 <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" ReadOnly="True" />
 <asp:BoundField DataField="N" HeaderText="N" SortExpression="N" ReadOnly="True" />
 <asp:BoundField DataField="Codigo Concepto" HeaderText="Codigo Concepto" SortExpression="Codigo Concepto" ReadOnly="True" />
 <asp:BoundField DataField="Codigo Concepto" HeaderText="Codigo Concepto" SortExpression="Codigo Concepto" ReadOnly="True" />
 <asp:BoundField DataField="Total Recaudo" HeaderText="Total Recaudo" SortExpression="Total Recaudo" ReadOnly="True" />


                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridView2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                    
                    
                    
                    SelectCommand="SELECT GENTERCER.TERNUMDOC AS NIT,
GENTERCER.TERNOMCOM AS Nombre,
case when TSNCONCEPT.TCOCODIGO= '100' then 2 when TSNCONCEPT.TCOCODIGO= '101' then 2 when TSNCONCEPT.TCOCODIGO= '201' then 1 when TSNCONCEPT.TCOCODIGO= '202' then 2 when TSNCONCEPT.TCOCODIGO= '204' then 3 when TSNCONCEPT.TCOCODIGO= '207' then 4 
   when TSNCONCEPT.TCOCODIGO= '208' then 5 when TSNCONCEPT.TCOCODIGO= '211' then 9 when TSNCONCEPT.TCOCODIGO= '213' then 6 when TSNCONCEPT.TCOCODIGO= '205' then 7 when TSNCONCEPT.TCOCODIGO= '209' then 8 when TSNCONCEPT.TCOCODIGO= '210' then 9
   end as N
 
   ,TSNCONCEPT.TCOCODIGO AS 'Codigo Concepto'
  ,TSNCONCEPT.TCONOMBRE AS 'Codigo Concepto'
	   ,SUM(TSNMRECIB.TRECVALOR) As 'Total Recaudo'
  FROM TSNMRECIB
inner join GENTERCER on TSNMRECIB.GENTERCER=GENTERCER.oid
inner join TSNCRECIB on TSNMRECIB.TSNCRECIB=TSNCRECIB.OID
inner join TSNCONCEPT on TSNMRECIB.TSNCONREC=TSNCONCEPT.OID
where  (TSNCRECIB.TRECFECCON BETWEEN @p0  AND @p1+' 23:59:00' ) 
   and GENTERCER.TERTIPPER=1 AND ((TSNCONCEPT.OID BETWEEN 142 AND 152) OR (TSNCONCEPT.OID=96) OR (TSNCONCEPT.OID=100))
   and TSNCONCEPT.TCOCODIGO not in (203)
group by GENTERCER.TERNUMDOC ,GENTERCER.TERNOMCOM , TSNCONCEPT.TCOCODIGO,TSNCONCEPT.TCONOMBRE
  order by GENTERCER.TERNUMDOC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0"  PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1"   PropertyName="Text" />
                      
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

