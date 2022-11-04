<%@ Page Title="Actividad" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Actividad.aspx.vb" Inherits="Actividad" %>

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
<asp:Panel ID="Panelmantenimiento" runat="server" Width="1334px">

    <table class="auto-style3">
        <tr>
            <td colspan="3" class="auto-style4"><strong>PACIENTES HC DE CONTROL PUERPERIO DE ALTO Y BAJO RIESGO</strong></td>
        </tr>
        <tr>
            <td class="auto-style1">Inicio
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                  <asp:MaskedEditExtender ID="TextBox1_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBox1" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                    TargetControlID="TextBox1">
                </asp:CalendarExtender>



            </td>
            <td class="auto-style2">Fin
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>


                    <asp:MaskedEditExtender ID="extBox2_MaskedEditExtender1" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBox2" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextBox2_CalendarExtender1" runat="server" 
                    TargetControlID="TextBox2">
                </asp:CalendarExtender>

            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Button" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT  ADNINGRESO.AINCONSEC AS 'Ingreso',
GENMEDICO.GMENOMCOM As 'Hace Nota',
GENUSUARIO.USUNOMBRE AS 'Usuario',
HCNFOLIO.HCFECFOl as 'Fecha Folio',
HCNFOLIO.HCNUMFOL as 'Folio',
GENPACIEN.PACNUMDOC as 'Documento',
GENPACIEN.PACPRINOM+' '+GENPACIEN.PACSEGNOM+' '+GENPACIEN.PACPRIAPE+' '+GENPACIEN.PACSEGAPE aS 'Paciente'
  
      , HCMHCSCAN.HCCM03N02 As 'Nota'

  FROM HCMHCSCAN
  inner join HCNFOLIO on  HCMHCSCAN.HCNFOLIO=hcnfolio.oid
  inner join adningreso on HCNFOLIO.adningreso=adningreso.oid
  inner join GENPACIEN on HCNFOLIO.GENPACIEN=GENPACIEN.OID
  inner join GENMEDICO on HCNFOLIO.GENMEDICO=GENMEDICO.OID
  inner join GENUSUARIO on GENMEDICO.GENUSUARIO=GENUSUARIO.OID
  where (  HCNFOLIO.HCFECFOL BETWEEN CONVERT(DATETIME, @res, 102) AND CONVERT(DATETIME, @res2+' 23:59:00', 102)) AND GENUSUARIO.USUNOMBRE LIKE 'CRY%'

  order by GENUSUARIO.USUNOMBRE desc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="res" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox2" Name="res2" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" Width="1286px" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="Hace Nota" HeaderText="Hace Nota" SortExpression="Hace Nota" />
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                        <asp:BoundField DataField="Fecha Folio" HeaderText="Fecha Folio" SortExpression="Fecha Folio" />
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente"  ItemStyle-Font-Size="Small" ReadOnly="True"/>
                        <asp:BoundField DataField="Nota" HeaderText="Nota" SortExpression="Nota" />
                    </Columns>
                </asp:GridView>
                <br />
            </td>
        </tr>
    </table>                           


</asp:Panel>




</asp:Content>
