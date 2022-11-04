<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Inf_Indicador.aspx.vb" Inherits="Indicadores_Proyecto_CargarIndicadores" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>





<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>





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
           
    </style>

    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            margin-left: 82px;
        }
        .auto-style3 {
            width: 615px;
        }
        .auto-style4 {
            height: 23px;
            width: 615px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma;" >
    <tr >
        <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');" 
                >
            Informes Indicadores</td>
    </tr>

    <tr >
        <td style="width: 25%" >
            &nbsp;</td>
        <td colspan="2" >
            <asp:SqlDataSource ID="DataConsultas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
            </asp:SqlDataSource>
        </td>
        <td style="width: 25%; text-align: right;" >
            <asp:Label ID="lblIdUsuario" runat="server" Visible="False"></asp:Label>
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
            <asp:GridView ID="GridIndicadores" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="IdIndicador" DataSourceID="DataGridindicadores" 
                AllowSorting="True" style="text-align: center">
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
                
                
                
                
                
                SelectCommand="SELECT distinct Ind_Principal.IdIndicador
      ,Ind_Principal.CodIndicador
      ,Ind_Principal.NomIndicador
 
    ,case when Ind_Principal.IdPadre =1 then 'Padre' else LTRIM(RTRIM(Ind_Principal.CodIndicador)) end as Jerarquia

  FROM Ind_Principal
 INNER JOIN Ind_IndiUsers ON Ind_Principal.IdIndicador = Ind_IndiUsers.IdIndicador
 WHERE (Ind_IndiUsers.IdUsuarioDG = @IdUsuario)  ORDER BY Ind_Principal.idIndicador">
               <SelectParameters>
                    <asp:ControlParameter ControlID="lblIdUsuario" DefaultValue="1110" 
                        Name="IdUsuario" PropertyName="Text" />
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
    <tr >
        <td colspan="4" >
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="522px" InteractiveDeviceInfos="(Colección)" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="983px">
                <localreport reportpath="App_Code\indicadores.rdlc">
                    <datasources>
                        <rsweb:ReportDataSource DataSourceId="DataGridindicadores" Name="DataSet1" />
                    </datasources>
                </localreport>
            </rsweb:ReportViewer>
        </td>
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
            <asp:Panel ID="PanelInf" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style3">
                            
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" CssClass="auto-style2" Text="Regresar" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style4">
                            <asp:Label ID="Lbidindi" runat="server" Text="Label"></asp:Label>   INDICADOR
                        </td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style3">
                          
                            
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

            </asp:Panel>
        </td>
    </tr>
    
</table>
</asp:Content>

