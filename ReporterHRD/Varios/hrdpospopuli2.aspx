<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Hrdpospopuli2.aspx.vb" Inherits="Varios_Default" %>
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
        text-align: left;
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
               
    .auto-style15 {
        text-align: center;
        width: 338px;
    }
               
    .auto-style16 {
        width: 100%;
    }
               
    .auto-style17 {
        height: 37px;
    }
               
    .auto-style18 {
        text-align: center;
        height: 174px;
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
                Pos Populi HRD
                    
                    </td>
        </tr></table>
      
 
    <asp:Panel ID="Panel_Buscar" runat="server" HorizontalAlign="NotSet">


      

        <table class="auto-style16">
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
                <td colspan="4">
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


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT CODIGO AS Codigo_Cups, SECCION AS Seccion, CAPITULO AS Capitulo, GRUPOCONC AS Grupo, SUBGRUPOCONC AS Subgrupo, CATEGORIA AS Categoria, CODIGO2 AS Codigo_Cup, DESCRIPCION2 AS Descripcion_Cup FROM Aud_POSPOPULIHRD WHERE (CODIGO = @TextBox1)">
            <SelectParameters>
             
            <asp:ControlParameter ControlID="LblIdUser2" Name="TextBox1" PropertyName="Text"  />

      </SelectParameters>
        </asp:SqlDataSource>



      

                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>



      

                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" background-image: url('../../Images/Fondo04.jpg'); color: #FFFFFF>
                    


                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                    


 <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"  BackImageUrl="~/Images/Fondo03.jpg">
            <Columns>
          
                <asp:BoundField DataField="Alerta_PBS" HeaderText="Alerta_PBS" SortExpression="Alerta_PBS" />
                <asp:BoundField DataField="alerta_Cups" HeaderText="alerta_Cups" SortExpression="alerta_Cups" />
                <asp:BoundField DataField="Alerta2" HeaderText="Alerta2" SortExpression="Alerta2" />
                <asp:BoundField DataField="Alerta3" HeaderText="Alerta3" SortExpression="Alerta3" />
                <asp:BoundField DataField="Alerta4" HeaderText="Alerta4" SortExpression="Alerta4" />
                <asp:BoundField DataField="Alerta5" HeaderText="Alerta5" SortExpression="Alerta5" />
                <asp:BoundField DataField="Alerta6" HeaderText="Alerta6" SortExpression="Alerta6" />
                <asp:BoundField DataField="Alerta7" HeaderText="Alerta7" SortExpression="Alerta7" />
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT ALERTAPBS AS Alerta_PBS, ALERTACUPS AS alerta_Cups, ALERTA2 AS Alerta2, ALERTA3 AS Alerta3, ALERTA4 AS Alerta4, ALERTA5 AS Alerta5, ALERTA6 AS Alerta6, ALERTA7 AS Alerta7 FROM Aud_POSPOPULIHRD WHERE (CODIGO = @TextBox3)">
            <SelectParameters>
             
            <asp:ControlParameter ControlID="LblIdUser2" Name="TextBox3" PropertyName="Text"  />
      </SelectParameters>
        </asp:SqlDataSource>

                </td>
            </tr>

             <tr>
                <td colspan="3">
                              <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  BackImageUrl="~/Images/Fondo03.jpg">
            <Columns>
               
                <asp:BoundField DataField="Codigo_Soat_Hom" HeaderText="Codigo_Soat_Hom" SortExpression="Codigo_Soat_Hom" />
                <asp:BoundField DataField="Descripcion_Soat_Hom" HeaderText="Descripcion_Soat_Hom" SortExpression="Descripcion_Soat_Hom" />
             
                
                               
            </Columns>
        </asp:GridView></td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                 <td>&nbsp;</td>
                 <td colspan="2">&nbsp;</td>
                 <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BackImageUrl="~/Images/Fondo04.jpg" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="Codigo_Soat_Hom" HeaderText="Codigo_Soat_Hom" SortExpression="Codigo_Soat_Hom" />
                            <asp:BoundField DataField="Descripcion_Soat_Hom" HeaderText="Descripcion_Soat_Hom" SortExpression="Descripcion_Soat_Hom" />
                            <asp:BoundField DataField="Ob" HeaderText="Ob" SortExpression="Ob" />
                            <asp:BoundField DataField="_Grupo_Puntos" HeaderText="_Grupo_Puntos" SortExpression="_Grupo_Puntos" />
                            <asp:BoundField DataField="Grupo_Soat" HeaderText="Grupo_Soat" SortExpression="Grupo_Soat" />
                            <asp:BoundField DataField="Especialidad_soat" HeaderText="Especialidad_soat" SortExpression="Especialidad_soat" />
                            <asp:BoundField DataField="Puntos" HeaderText="Puntos" SortExpression="Puntos" />
                            <asp:BoundField DataField="Calcular" HeaderText="Calcular" SortExpression="Calcular" />
                            <asp:BoundField DataField="Años_MLV" HeaderText="Años_MLV" SortExpression="Años_MLV" />
                            <asp:BoundField DataField="Val_Pleno" HeaderText="Val_Pleno," SortExpression="Val_Pleno," />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="3">       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  BackImageUrl="~/Images/Fondo04.jpg">
            <Columns>
               
                <asp:BoundField DataField="Codigo_Soat_Hom" HeaderText="Codigo_Soat_Hom" SortExpression="Codigo_Soat_Hom" />
                <asp:BoundField DataField="Descripcion_Soat_Hom" HeaderText="Descripcion_Soat_Hom" SortExpression="Descripcion_Soat_Hom" />
                <asp:BoundField DataField="Ob" HeaderText="Ob" SortExpression="Ob" />
                <asp:BoundField DataField="_Grupo_Puntos" HeaderText="_Grupo_Puntos" SortExpression="_Grupo_Puntos" />
                <asp:BoundField DataField="Grupo_Soat" HeaderText="Grupo_Soat" SortExpression="Grupo_Soat" />
                <asp:BoundField DataField="Especialidad_soat" HeaderText="Especialidad_soat" SortExpression="Especialidad_soat" />
           
                
                               
            </Columns>
        </asp:GridView></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" class="auto-style17">
              


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT CODIGOSOAT AS Codigo_Soat_Hom, DESCRIPCIONSOAT AS Descripcion_Soat_Hom, OBSERVACION AS Ob, GRUPOQUIRURPUNTOS AS _Grupo_Puntos, GRUPO AS Grupo_Soat, ESPECIALIDAD1 AS Especialidad_soat, PUNTOSACALCULAR AS Puntos, OBSDEPC AS Calcular, TIPODETARIFA AS Años_MLV, CAST(ROUND(VALORASOATPLENO, 0, 0) AS INT) AS Val_Pleno, CAST(ROUND(VALORASOATPLENO, 0, 0) AS INT) AS Val_Diario FROM Aud_POSPOPULIHRD WHERE (CODIGO = @TextBox2)">
            <SelectParameters>
             
            <asp:ControlParameter ControlID="LblIdUser2" Name="TextBox2" PropertyName="Text"  />
      </SelectParameters>
        </asp:SqlDataSource>

                </td>
            </tr>
            
            <tr>
                <td class="auto-style15" colspan="2">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/Mipres.jpg" NavigateUrl="https://mipres.sispro.gov.co/MIPRESNOPBS/Login.aspx?ReturnUrl=%2fmipresnopbs" Target="_new" >HyperLink</asp:HyperLink>
                </td>
                <td class="auto-style14" colspan="2"> <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Images/Pospopuli.jpg" NavigateUrl="https://pospopuli.minsalud.gov.co/PospopuliWeb/paginas/home.aspx#search1" Target="_new">HyperLink</asp:HyperLink></td>
            </tr>
        </table>
                
 

    </asp:Panel>



    </asp:Content>