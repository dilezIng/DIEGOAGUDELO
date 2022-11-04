<%@ Page Title="PACIENTES UCI" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="PACIENTESUCI.aspx.vb" Inherits="Actividad" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  

    <style type="text/css">
        .auto-style1 {
            width: 200px;
        }
        .auto-style2 {
            width: 231px;
        }
        .auto-style3 {
            width: 100%;
        }
    .auto-style4 {
        text-align: center;
    }
    </style>
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Label ID="Label1" runat="server"></asp:Label>
<asp:Panel ID="Panelmantenimiento" runat="server" Width="1334px">

    <table class="auto-style3">
        <tr>
            <td colspan="3" class="auto-style4"><strong>CONTROL PACIENTES UCI</strong></td>
        </tr>
        <tr>
            <td class="auto-style1">
                



            </td>
            <td class="auto-style2">
              

            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="BLOQUEAR" />  
		
				   <asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
				   <asp:Button ID="Button2" runat="server" Text="DESBLOQUEAR" />  
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="  SELECT GENPACIEN.PACNUMDOC as Documento,GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, HPNDEFCAM.HCACODIGO AS CAMA,  CASE WHEN GENPACIEN.GPAHCBLOQ=1 THEN 'BLOQUEADO' WHEN GENPACIEN.GPAHCBLOQ=0 THEN 'SIN BLOQUEAR' END AS ESTADO  FROM   GENPACIEN  INNER JOIN ADNINGRESO ON GENPACIEN.oid = ADNINGRESO.GENPACIEN   INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES   INNER JOIN HPNDEFCAM  On HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID   WHERE (HPNDEFCAM.HPNSUBGRU  IN (3,20)) AND HPNESTANC.HESTIPOES=1 AND HPNESTANC.HESFECSAL IS NULL">
                    <SelectParameters>
                       
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" Width="80%" AutoGenerateColumns="False">
                    <Columns>
					
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                        <asp:BoundField DataField="CAMA" HeaderText="CAMA" ReadOnly="True" SortExpression="CAMA" />
						<asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
						
                        
						
                       
					
                        
                    </Columns>
                </asp:GridView>
                <br />
            </td>
        </tr>
    </table>                           


</asp:Panel>




</asp:Content>
