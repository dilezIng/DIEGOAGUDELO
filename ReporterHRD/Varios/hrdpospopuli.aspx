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
               
    .auto-style16 {
        width: 100%;
    }
               
    .auto-style17 {
        width: 50px;
         height: 23px;
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
                <td class="auto-style8"></td>
                <td class="auto-style12">
                   

                     <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" />

                </td>
                <td>
                    <asp:Label ID="LblIdUser" runat="server" style="font-weight: 700; color: white"  ></asp:Label>
               
                    <asp:Label ID="LblIdUser2" runat="server" style="font-weight: 700; color:red" ></asp:Label>
                </td>
            </tr>
        </table>
        
    </asp:Panel>

    <table style="width: 100%;">
        <tr>
            <td>



    <asp:Panel ID="Panel_RESULTADO" runat="server">
        
       

        <asp:Table ID="Table1" runat="server" BorderColor="Black" Height="60px" Width="990px"  BorderStyle="Solid" BorderWidth="2px" GridLines="Both" Font-Names="Tahoma" HorizontalAlign="Left" >
            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Center" ColumnSpan="4" >  <asp:Label ID="LbPospopuli" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
            <asp:TableRow runat="server"   >   
                <asp:TableCell  runat="server" HorizontalAlign="Center" ColumnSpan="4" >  </asp:TableCell> 
             </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell  Text="Sección">  </asp:TableCell>
                <asp:TableCell >    <asp:Label ID="A1" runat="server" ></asp:Label> </asp:TableCell>
                <asp:TableCell Text="Plan Beneficios" >    </asp:TableCell> 
                <asp:TableCell > <asp:Label ID="a2" runat="server">  </asp:Label> </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell Text="Capitulo">  </asp:TableCell>
                <asp:TableCell > <asp:Label ID="B1" runat="server" ></asp:Label> </asp:TableCell>
                <asp:TableCell Width="120px" BackColor="#d3eabd" >Alerta Cups 6 D</asp:TableCell> 
                <asp:TableCell BackColor="#d3eabd" ><asp:Label ID="B2" runat="server" ></asp:Label></asp:TableCell> 
            </asp:TableRow>
        
            <asp:TableRow runat="server">
                <asp:TableCell Text="Grupo"></asp:TableCell>
                <asp:TableCell > <asp:Label ID="C1" runat="server" ></asp:Label> </asp:TableCell>
                <asp:TableCell BackColor="#d3eabd"> Alerta 2</asp:TableCell> 
                <asp:TableCell BackColor="#d3eabd"> <asp:Label ID="C2" runat="server"  > </asp:Label></asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow runat="server">
                    <asp:TableCell Text="SubGrupo"> </asp:TableCell>
                    <asp:TableCell>  <asp:Label ID="D1" runat="server" ></asp:Label> </asp:TableCell>
                    <asp:TableCell BackColor="#d3eabd">Alerta 3</asp:TableCell> 
                    <asp:TableCell BackColor="#d3eabd"> <asp:Label ID="D2" runat="server" ></asp:Label></asp:TableCell> 
            </asp:TableRow>

                <asp:TableRow runat="server">  
                    <asp:TableCell Text="Categoría"> </asp:TableCell>
                    <asp:TableCell>  <asp:Label ID="E1" runat="server" ></asp:Label> </asp:TableCell>
                    <asp:TableCell BackColor="#d3eabd">Alerta 4</asp:TableCell> 
                    <asp:TableCell BackColor="#d3eabd">  <asp:Label ID="E2" runat="server" ></asp:Label> </asp:TableCell>
                </asp:TableRow>
               
            <asp:TableRow runat="server">  
                    <asp:TableCell runat="server">Código CUPS</asp:TableCell>
                   <asp:TableCell runat="server"> <asp:Label ID="F1" runat="server" ></asp:Label> </asp:TableCell>
                    <asp:TableCell runat="server" BackColor="#d3eabd">Alerta 5</asp:TableCell>
                   <asp:TableCell runat="server" BackColor="#d3eabd">  <asp:Label ID="F2" runat="server" ></asp:Label> </asp:TableCell>
               </asp:TableRow> 
            
            <asp:TableRow runat="server">  
                    <asp:TableCell Text="Descripción">  </asp:TableCell> 
                    <asp:TableCell>  <asp:Label ID="G1" runat="server" ></asp:Label> </asp:TableCell>
                    <asp:TableCell BackColor="#d3eabd">Alerta 6</asp:TableCell> 
                    <asp:TableCell BackColor="#d3eabd"> <asp:Label ID="G2" runat="server" ></asp:Label></asp:TableCell> 
            </asp:TableRow>   

        <asp:TableRow runat="server">  
                <asp:TableCell Text="Lo hace HRD">    </asp:TableCell> 
                <asp:TableCell>  <asp:Label ID="H1" runat="server" ></asp:Label> </asp:TableCell>
                <asp:TableCell BackColor="#d3eabd">Alerta 7</asp:TableCell> 
                <asp:TableCell BackColor="#d3eabd"> <asp:Label ID="H2" runat="server" ></asp:Label></asp:TableCell> 

        </asp:TableRow>  
            <asp:TableRow runat="server">  
                <asp:TableCell Text="Especialidad">   </asp:TableCell> 
                <asp:TableCell>  <asp:Label ID="I1" runat="server" ></asp:Label> </asp:TableCell>
           <asp:TableCell ColumnSpan="2"  BackColor="White" ></asp:TableCell>  
        </asp:TableRow>

            <asp:TableRow runat="server"> 
                <asp:TableCell Text="DGH">   </asp:TableCell>
                <asp:TableCell> <asp:Label ID="J1" runat="server" ></asp:Label></asp:TableCell>
             <asp:TableCell ColumnSpan="2"  BackColor="White"  ></asp:TableCell> 
            </asp:TableRow>

            <asp:TableRow runat="server">
                <asp:TableCell Width="100px" Text="Código SOAT">  </asp:TableCell>
                <asp:TableCell> <asp:Label ID="K1" runat="server" ></asp:Label> </asp:TableCell>
                <asp:TableCell ColumnSpan="2"  BackColor="White" ></asp:TableCell> 
            </asp:TableRow>
              <asp:TableRow runat="server">
                <asp:TableCell Width="150px" Text="Descripción SOAT">  </asp:TableCell>
                <asp:TableCell> <asp:Label ID="L1" runat="server" ></asp:Label> </asp:TableCell>
                <asp:TableCell ColumnSpan="2"  BackColor="White" ></asp:TableCell> 
            </asp:TableRow>
        </asp:Table>
                         </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>

                <asp:Panel ID="Panel_USER" runat="server">
        <asp:Table ID="Table2" runat="server" BorderColor="Black"  Width="50%"  BorderStyle="Solid" BorderWidth="2px" GridLines="Both" BackColor="#ffff99" Font-Names="Tahoma" HorizontalAlign="Left" >
            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Observacion Grupos" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="USER1" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>

            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Grupo Qx" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="USER2" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Grupos SOAT" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="USER3" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Especialidad Soat" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="USER4" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Puntos" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="USER5" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
        <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Obs Grupos Qx" Width="150px" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="USER6" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
             <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Center" Text="VALIDADORES" Width="150px"  ColumnSpan="2">  </asp:TableCell> 
               
             </asp:TableRow>
            
             <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Sexo" Width="150px" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="Label1" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow> <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Ambito" Width="150px" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="Label2" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow> <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Estancia" Width="150px" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="Label3" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow> <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Cobertura" Width="150px" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="Label4" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow> <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Duplicado" Width="150px" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="Label5" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow> <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Vida" Width="150px" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="Label6" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow> <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="CIE_10 Relacionados" Width="150px" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="Label7" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
          </asp:Table>
                    </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>

                 <asp:Panel ID="Panel_aud" runat="server">

              <asp:Table ID="Table3" runat="server" BorderColor="Black"  Width="50%"  BorderStyle="Solid" BorderWidth="2px" GridLines="Both" BackColor="#ff6666" Font-Names="Tahoma" HorizontalAlign="Left" >
            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Tarifa Calculada" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="AU1" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>

            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Codigo Soat" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="AU2" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Descripción SOAT" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="AU3" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
            
            <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Grupos Qx o F.Conv" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="AU4" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
        <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Grupo Soat" Width="150px" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="AU5" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
                     <asp:TableRow runat="server"   >  
                <asp:TableCell  runat="server" HorizontalAlign="Left" Text="Especialidad Soat" >  </asp:TableCell> 
                 <asp:TableCell  runat="server" HorizontalAlign="Center" >  <asp:Label ID="AU6" runat="server"  ></asp:Label> </asp:TableCell> 
             </asp:TableRow>
          </asp:Table>

    </asp:Panel>
            </td>
        </tr>
    </table>
       

    <table>
        <tr>
            <td colspan="2" class="auto-style17">
                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/Mipres.jpg" NavigateUrl="https://mipres.sispro.gov.co/MIPRESNOPBS/Login.aspx?ReturnUrl=%2fmipresnopbs" Target="_new" >HyperLink</asp:HyperLink>
            </td>
            <td colspan="2">
                <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Images/Pospopuli.jpg" NavigateUrl="https://pospopuli.minsalud.gov.co/PospopuliWeb/paginas/home.aspx#search1" Target="_new" >HyperLink</asp:HyperLink>
            </td>
            <td colspan="2">
                <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Images/FormatoContingencia.jpg" NavigateUrl="http://20.20.20.180/Docs/FormatoContingencia.pdf" Target="_new" >HyperLink</asp:HyperLink>
            </td>
         </tr>
    </table> 
    </asp:Content>