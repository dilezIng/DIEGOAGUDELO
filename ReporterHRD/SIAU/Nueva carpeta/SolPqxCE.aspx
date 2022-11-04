
<%@ Page Title="Solicitud Procedimiento Qx" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="SolPqxCE.aspx.vb" Inherits="PaginaBase" %>
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
    

    <asp:Panel ID="Panel1" runat="server">

                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" 
                >Solicitudes Procedimientos Quirurgicos Consulta Externa</td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style12" >
                &nbsp;
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
            <td class="auto-style1" >
                
                &lt;-- Fechas de Solicitudes</td>
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
                        <asp:BoundField DataField="SolQX" HeaderText="SolQX" SortExpression="SolQX" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" />
                        <asp:BoundField DataField="Sitio" HeaderText="Sitio" SortExpression="Sitio" />
                        <asp:BoundField DataField="Fech_Sol" HeaderText="Fech_Sol" SortExpression="Fech_Sol" />
                        <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" >
                        <HeaderStyle Font-Size="X-Small" />
                        <ItemStyle Font-Size="X-Small" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                       
                       
                        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
                         <asp:ImageField DataImageUrlField="Semaforo"  HeaderText="Semaforo">
                           <ControlStyle Width="100%" />
                        </asp:ImageField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Prioridad, Ingreso as SolQX, Documento, Paciente, Sitio, Fech_Sol, Solicitud, Entidad, Usuario, CASE WHEN Estado = 3 THEN '~/Images/Verdecry.png' WHEN Estado = 1 THEN '~/Images/Amarillocry.png' WHEN Estado = 2 THEN '~/Images/Rojocry.png' WHEN Estado = 0 THEN '~/Images/Azulcry.png' WHEN Estado = 4 THEN '~/Images/Negrocry.png' WHEN Estado = 5 THEN '~/Images/Griscry.png' END AS Semaforo, Observaciones, Sol_QX FROM Cryc_SolQX WHERE (Fech_Sol BETWEEN CONVERT (DATETIME, @ini, 103) AND CONVERT (DATETIME, @fin + ' 23:59:00', 103)) and Sitio='Cons_Ext' ORDER BY Prioridad DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="ini" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="fin" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <br />

                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
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


    <asp:Panel ID="Panel2" runat="server"  Height="112px" Width="1082px">


        <table style="width: 100%; "  border="1" >
            <tr bgcolor="#7AC2FC">
                <td class="auto-style8">Solicitud</td>
                <td class="auto-style7" colspan="2"><strong>Entidad</strong></td>
                <td class="auto-style10" colspan="2"><strong>Paciente</strong></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Labeli" runat="server" ></asp:Label>
                </td>
                <td class="auto-style3" colspan="2">
                    <asp:Label ID="Labele" runat="server" ></asp:Label>
                </td>
                <td class="auto-style4" colspan="2">
                    <asp:Label ID="Labelpac" runat="server" ></asp:Label>
                </td>
            </tr>
        </table>



        <table border="1" style="width: 100%; ">
            <tr>
                <td bgcolor="#7AC2FC" class="auto-style16"><strong>Procedimiento</strong></td>
                <td bgcolor="#7AC2FC" class="auto-style10" colspan="2"><strong>Estado</strong></td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Labelp" runat="server"></asp:Label>
                </td>
                <td class="auto-style11" colspan="2">
                    <asp:DropDownList ID="ListEstado" runat="server">
                        <asp:ListItem Value="1">En Tramite</asp:ListItem>
                        <asp:ListItem Value="2">No Autorizado</asp:ListItem>
                        <asp:ListItem Value="3">Autorizado</asp:ListItem>
                        <asp:ListItem Value="4">No Aplica</asp:ListItem>
                        <asp:ListItem Value="5">Ambulatorio</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Label3" runat="server" Text="Observaciones"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="856px"></asp:TextBox>
                </td>
                <td>
                    <asp:SqlDataSource ID="DataHis" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
                    <asp:Button ID="Button1" runat="server" Text="Guardar" />
                </td>
                <td class="auto-style11">&nbsp;</td>
            </tr>
        </table>

        <asp:Panel ID="Panel3" runat="server">

            <asp:Button ID="Button2" runat="server" Text="Regresar" BackColor="#7AC2FC" />

            <asp:DataList ID="DataList1" runat="server" BorderColor="#40568D" BorderWidth="1px" CellPadding="1" DataSourceID="SqlDataHist" GridLines="Both" Width="861px">
                <AlternatingItemStyle BackColor="#F0F0F0" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                <ItemTemplate>
                    <strong><span class="auto-style19">Estado: </span>
                    <asp:Label ID="EstadoLabel" runat="server" CssClass="auto-style19" Text='<%# Eval("Estado") %>' />
                    </strong>&nbsp;<strong>Fecha:</strong>&nbsp;<asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                    &nbsp;<strong>Solicitud:</strong>
                    <asp:Label ID="SolicitudLabel" runat="server" Text='<%# Eval("Solicitud") %>' />
                    &nbsp;<strong>Usuario:</strong>
                    <asp:Label ID="UsuarioLabel" runat="server" Text='<%# Eval("Usuario") %>' />
                    <br />
                    <strong>Observación: </strong>
                    <asp:Label ID="ObservaciónLabel" runat="server" Text='<%# Eval("Observación") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>


            <asp:SqlDataSource ID="SqlDataHist" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Date AS Fecha, Id_Sol_QX AS Solicitud, Realiza AS Usuario, Nota AS Observación, CASE WHEN Estado = 3 THEN 'Autorizado' WHEN Estado = 1 THEN 'En Tramite' WHEN Estado = 2 THEN 'No Autorizado' WHEN Estado = 0 THEN 'No Iniciado' WHEN Estado = 4 THEN 'No Aplica' WHEN Estado = 5 THEN 'Ambulatorio' END AS Estado FROM Cryc_SolQX_AUD WHERE (Id_Sol_QX = @Ingreso)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Ingreso" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>


        </asp:Panel>

    </asp:Panel>




              </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
