<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" Codefile="EtiquetasLote.aspx.vb" Inherits="EtiquetasLote" %>
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
           
    .auto-style1 {
        text-align: left;
        width: 30%;
        height: 31px;
    }
           
    .auto-style2 {
        width: 130px;
        height: 28px;
    }
    .auto-style3 {
        width: 75px;
        height: 28px;
    }
    .auto-style4 {
        height: 28px;
    }
    .auto-style7 {
        width: 75px;
        text-align: center;
        color: #FFFFFF;
        font-size: large;
    }
    .auto-style8 {
        width: 130px;
        text-align: center;
        color: #FFFFFF;
        font-size: large;
    }
           
    .auto-style10 {
        color: #FFFFFF;
        text-align: center;
        font-size: large;
    }
           
    .auto-style11 {
        text-align: center;
    }
           
    .auto-style12 {
        height: 31px;
    }
    .auto-style13 {
        width: 41%;
        height: 31px;
    }
           
    .auto-style14 {
        width: 25%;
    }
           
    .auto-style15 {
        width: 41%;
    }
           
    .auto-style16 {
        color: #FFFFFF;
        text-align: center;
        font-size: large;
        width: 879px;
    }
    .auto-style18 {
        width: 879px;
    }
           
    .auto-style19 {
        color: #FF0000;
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
                  
    <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4">Imprimir Etiquetas por Lote</td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style12" >
                &nbsp; Selecione Día:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> &nbsp;
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style1" >
                
                &nbsp;</td>
                <td style="font-size: 9pt; text-align: center;" class="auto-style13" >
        &nbsp;
        <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" /></td>
            
        </tr>
        <tr >
            <td colspan="2" 
                style="text-align: right; font-size: 8pt;" >
                &nbsp;</td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                <asp:Label ID="LabelInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"  DataKeyNames="Sol_QX"
                    AllowSorting="True" Width="100%" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION" DataMember="DefaultView" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                       
                        <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                        
                        <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" SortExpression="Prioridad"  >
                        <HeaderStyle Font-Size="XX-Small" />
                        <ItemStyle Font-Size="XX-Small" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" />
                        <asp:BoundField DataField="Sitio" HeaderText="Sitio" SortExpression="Sitio" />
                        <asp:BoundField DataField="Fech_Sol" HeaderText="Fech_Sol" SortExpression="Fech_Sol" />
                        <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                        
                            <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor"   >
                        <HeaderStyle Font-Size="Small" />
                        <ItemStyle Font-Size="Small" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                       
                       
                        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
                         <asp:ImageField DataImageUrlField="Semaforo"  HeaderText="Semaforo">
                           <ControlStyle Width="100%" />
                        </asp:ImageField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Prioridad, Ingreso, Documento, Paciente, Sitio, Fech_Sol, Solicitud, Entidad, Usuario, CASE WHEN Estado = 3 THEN '~/Images/Verdecry.png' WHEN Estado = 1 THEN '~/Images/Amarillocry.png' WHEN Estado = 2 THEN '~/Images/Rojocry.png' WHEN Estado = 0 THEN '~/Images/Azulcry.png' WHEN Estado = 4 THEN '~/Images/Negrocry.png' WHEN Estado = 5 THEN '~/Images/Griscry.png' END AS Semaforo, Observaciones, Sol_QX, CONVERT (VARCHAR, CONVERT (VARCHAR, CAST(Valor AS MONEY), 1)) AS Valor FROM Cryc_SolComfa WHERE (CONVERT (char(10), Fech_Sol, 103) = @ini) AND (Sitio &lt;&gt; 'Cons_Ext') ORDER BY Prioridad DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="ini" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlHH" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT * FROM [Imprime_Lote]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" ></asp:Label>
                <asp:Label ID="Label333" runat="server" Text="Ing. Diego A."></asp:Label>
                </td>
        </tr>
                    <tr>
                        <td style="width: 25%">
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style14">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td class="auto-style15">
                            &nbsp;</td>
                    </tr>
    </table>

            </asp:Panel>




        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
