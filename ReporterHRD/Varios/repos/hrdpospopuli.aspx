<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Hrdpospopuli.aspx.vb" Inherits="Varios_Default" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>


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
               
    .auto-style4 {
        width: 100%;
        height: 62px;
    }
               
    .auto-style6 {
        height: 37px;
        text-align: right;
    }
               
    .auto-style8 {
        width: 123px;
    }
    .auto-style10 {
        height: 23px;
    }
    .auto-style12 {
        width: 71px;
    }
               
    .auto-style13 {
        height: 23px;
        text-align: right;
    }
               
    .auto-style14 {
        text-align: center;
    }
               
    </style>

    <asp:ScriptManager ID="ScriptManager1" 
                    runat="server">
                </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 100%; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1000px;
                     position: absolute; text-align: center;">
                     <uc1:Cargando ID="Cargando2" runat="server" /></div>
                            </asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>

 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           </ContentTemplate>
    </asp:UpdatePanel>

    <table style="font-family: tahoma;" class="auto-style4" >
        <tr >
            <td style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" class="auto-style6">
                Pos Populi HRD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/Pospopuli.jpg" NavigateUrl="https://pospopuli.minsalud.gov.co/PospopuliWeb/paginas/home.aspx#search1" Target="_new" >HyperLink</asp:HyperLink>
                    </td>
        </tr></table>
      
 
    <asp:Panel ID="Panel_Buscar" runat="server" HorizontalAlign="NotSet">


      

        <table style="width: 100%;">
            <tr>
                <td class="auto-style13" colspan="2">Buscar Codigo Cups:</td>
                <td class="auto-style10">
                   
                    <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" Columns="2" Width="90%"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" ServiceMethod="BusqUsuario" TargetControlID="TextBox1">
                    </asp:AutoCompleteExtender>
                   
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style12">
                   

                     <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" />

                </td>
                <td>
                    <asp:Label ID="LblIdUser" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LblIdUser2" runat="server" style="font-weight: 700; color:white"></asp:Label>
                </td>
            </tr>
        </table>

    </asp:Panel>

    <asp:Panel ID="Panel_RESULTADO" runat="server">
        <table style="width: 60%;">
            <tr>
                <td colspan="3">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"   BackImageUrl="~/Images/Fondo02.jpg">
            <Columns>
                <asp:BoundField DataField="Codigo_Cups" HeaderText="Codigo_Cups" SortExpression="Codigo_Cups" />
                <asp:BoundField DataField="Seccion" HeaderText="Seccion" SortExpression="Seccion" />
                <asp:BoundField DataField="Capitulo" HeaderText="Capitulo" SortExpression="Capitulo" />
                <asp:BoundField DataField="Grupo" HeaderText="Grupo" SortExpression="Grupo" />
                <asp:BoundField DataField="Subgrupo" HeaderText="Subgrupo" SortExpression="Subgrupo" />
                <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                <asp:BoundField DataField="Codigo_Cup" HeaderText="Codigo_Cup" SortExpression="Codigo_Cup" />
                <asp:BoundField DataField="Descripcion_Cup" HeaderText="Descripcion_Cup" SortExpression="Descripcion_Cup" />
                
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT CODIGO AS Codigo_Cups, SECCION AS Seccion, CAPITULO AS Capitulo, GRUPOCONC AS Grupo, SUBGRUPOCONC AS Subgrupo, CATEGORIACONC AS Categoria, CODIGO2 AS Codigo_Cup, DESCRIPCION2 AS Descripcion_Cup from [Aud_HMLGCASV4] WHERE (CODIGO1 = @TextBox1)">
            <SelectParameters>
             
            <asp:ControlParameter ControlID="LblIdUser2" Name="TextBox1" PropertyName="Text"  />

      </SelectParameters>
        </asp:SqlDataSource>



      

                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" background-image: url('../../Images/Fondo04.jpg'); color: #FFFFFF>
                    
 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  BackImageUrl="~/Images/Fondo04.jpg">
            <Columns>
               
                <asp:BoundField DataField="Codigo_Soat_Hom" HeaderText="Codigo_Soat_Hom" SortExpression="Codigo_Soat_Hom" />
                <asp:BoundField DataField="Descripcion_Soat_Hom" HeaderText="Descripcion_Soat_Hom" SortExpression="Descripcion_Soat_Hom" />
                <asp:BoundField DataField="Ob" HeaderText="Ob" SortExpression="Ob" />
                <asp:BoundField DataField="_Grupo_Puntos" HeaderText="_Grupo_Puntos" SortExpression="_Grupo_Puntos" />
                <asp:BoundField DataField="Grupo_Soat" HeaderText="Grupo_Soat" SortExpression="Grupo_Soat" />
                <asp:BoundField DataField="Especialidad_soat" HeaderText="Especialidad_soat" SortExpression="Especialidad_soat" />
                <asp:BoundField DataField="Puntos" HeaderText="Puntos" SortExpression="Puntos" />
                <asp:BoundField DataField="Calcular" HeaderText="Calcular" SortExpression="Calcular" />
                
                               
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT CODIGOSOAT AS Codigo_Soat_Hom, DESCRIPCIONSOAT AS Descripcion_Soat_Hom, OBSERVACION AS Ob, GRUPOQX AS _Grupo_Puntos, GRUPO AS Grupo_Soat, ESPECIALIDAD1 AS Especialidad_soat, PUNTOSCALCULAR AS Puntos, OBSPUNTOSCALCULAR AS Calcular FROM [Aud_HMLGCASV4] WHERE (CODIGO1 = @TextBox2)">
            <SelectParameters>
             
            <asp:ControlParameter ControlID="LblIdUser2" Name="TextBox2" PropertyName="Text"  />
      </SelectParameters>
        </asp:SqlDataSource>

                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    


 <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"  BackImageUrl="~/Images/Fondo03.jpg">
            <Columns>
          
                <asp:BoundField DataField="Alerta_PBS" HeaderText="Alerta_PBS" SortExpression="Alerta_PBS" />
                <asp:BoundField DataField="alerta_Cups" HeaderText="alerta_Cups" SortExpression="alerta_Cups" />
                <asp:BoundField DataField="Alerta_2" HeaderText="Alerta_2" SortExpression="Alerta_2" />
                <asp:BoundField DataField="Alerta_3" HeaderText="Alerta_3" SortExpression="Alerta_3" />
                <asp:BoundField DataField="Alerta_4" HeaderText="Alerta_4" SortExpression="Alerta_4" />
                <asp:BoundField DataField="Alerta_5" HeaderText="Alerta_5" SortExpression="Alerta_5" />
                <asp:BoundField DataField="Alerta_6" HeaderText="Alerta_6" SortExpression="Alerta_6" />
                <asp:BoundField DataField="Alerta_7" HeaderText="Alerta_7" SortExpression="Alerta_7" />
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT ALERTAPBS AS Alerta_PBS, ALERTA_CUPS AS alerta_Cups, ALERTA2 AS Alerta_2, ALERTA3 AS Alerta_3, ALERTA4 AS Alerta_4, ALERTA5 AS Alerta_5, ALERTA6 AS Alerta_6, ALERTA7 AS Alerta_7 FROM [Aud_HMLGCASV4] WHERE (CODIGO1 = @TextBox3)">
            <SelectParameters>
             
            <asp:ControlParameter ControlID="LblIdUser2" Name="TextBox3" PropertyName="Text"  />
      </SelectParameters>
        </asp:SqlDataSource>

                </td>
            </tr>

             <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td colspan="3" class="auto-style14">
                    &nbsp;</td>
            </tr>
        </table>
                
 

    </asp:Panel>



    </asp:Content>