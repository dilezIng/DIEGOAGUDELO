<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Soat.aspx.vb" Inherits="Varios_Default" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

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
            <td style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');" class="auto-style6">
                Pos Populi HRD
                    
                    </td>
        </tr></table>
      
 
    <asp:Panel ID="Panel_Buscar" runat="server" HorizontalAlign="NotSet">


      

        <table class="auto-style16">
            <tr>
                <td class="auto-style13" colspan="2">Buscar Codigo SOAT:</td>
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
                    <asp:Label ID="LblIdUser2" runat="server" style="font-weight: 700; color:#FF0000"></asp:Label>
                </td>
            </tr>
        </table>

    </asp:Panel>

    <asp:Panel ID="Panel_RESULTADO" runat="server">
        <table style="width: 60%;">
            <tr>
                <td colspan="4">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True"  >
            <Columns>
                <asp:BoundField DataField="Cod_Soat" HeaderText="Cod_Soat" 
                    SortExpression="Cod_Soat" />
                <asp:BoundField DataField="Des_Soat" HeaderText="Des_Soat" 
                    SortExpression="Des_Soat" />
                <asp:BoundField DataField="Grupo_Soat" HeaderText="Grupo_Soat" 
                    SortExpression="Grupo_Soat" />
                <asp:BoundField DataField="Grupo_QX" HeaderText="Grupo_QX" 
                    SortExpression="Grupo_QX" />
                <asp:BoundField DataField="obs" HeaderText="obs" SortExpression="obs" />
                <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" 
                    SortExpression="Especialidad" />
                <asp:BoundField DataField="Cod_Cup" HeaderText="Cod_Cup" 
                    SortExpression="Cod_Cup" />
                <asp:BoundField DataField="Des_Cup" HeaderText="Des_Cup" 
                    SortExpression="Des_Cup" />
                
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                        SelectCommand="SELECT Aud_HMLGCASV4.CODIGOSOAT AS Cod_Soat, Aud_HOMOLOGADOR.DESCRIPCIONSOAT AS Des_Soat, Aud_HOMOLOGADOR.GRUPO AS Grupo_Soat, Aud_HOMOLOGADOR.GRUPOQUIRURFACTOR AS Grupo_QX, Aud_HOMOLOGADOR.OBS AS obs, Aud_HOMOLOGADOR.ESPECIALIDAD AS Especialidad, Aud_HMLGCASV4.CODIGO AS Cod_Cup, Aud_HMLGCASV4.DESCRIPCION AS Des_Cup FROM Aud_HMLGCASV4 INNER JOIN Aud_HOMOLOGADOR ON Aud_HMLGCASV4.CODIGOSOAT = Aud_HOMOLOGADOR.CODIGO WHERE (Aud_HMLGCASV4.CODIGOSOAT = @LblIdUser)">
   
                     <SelectParameters>
             
            <asp:ControlParameter ControlID="LblIdUser" Name="LblIdUser" PropertyName="Text"  />
      </SelectParameters>
        </asp:SqlDataSource>


      

                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">       &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" class="auto-style17">
              


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT CODIGOSOAT AS Codigo_Soat_Hom, DESCRIPCIONSOAT AS Descripcion_Soat_Hom, OBSERVACION AS Ob, GRUPOQX AS _Grupo_Puntos, GRUPO AS Grupo_Soat, ESPECIALIDAD1 AS Especialidad_soat, 
                         PUNTOSCALCULAR AS Puntos, OBSPUNTOSCALCULAR AS Calcular, AÑOSMLV AS Años_MLV, CAST(ROUND(VALSOATPLENO, 0, 0) AS INT) AS Val_Pleno, VALORSMLVDIARIO AS Val_Diario FROM  Aud_HMLGCASV4   where (CODIGO1 = @TextBox2)">
            <SelectParameters>
             
            <asp:ControlParameter ControlID="LblIdUser2" Name="TextBox2" PropertyName="Text"  />
      </SelectParameters>
        </asp:SqlDataSource>

                </td>
            </tr>
          
            <tr>
                <td class="auto-style14" colspan="4">&nbsp;</td>
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