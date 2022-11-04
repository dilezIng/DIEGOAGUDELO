<%@ Page Title="Administrador de Equipos HRD" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="PaginaBase.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="Categorias.ascx" tagname="Categorias" tagprefix="uc1" %>
<%@ Register src="CaracteristicasEquipos.ascx" tagname="CaracteristicasEquipos" tagprefix="uc2" %>
<%@ Register src="HojaVida.ascx" tagname="HojaVida" tagprefix="uc3" %>

<%@ Register src="PuntosTrabajo.ascx" tagname="PuntosTrabajo" tagprefix="uc4" %>

<%@ Register src="MarcasEquipos.ascx" tagname="MarcasEquipos" tagprefix="uc5" %>
<%@ Register src="TipoEquipos.ascx" tagname="TipoEquipos" tagprefix="uc6" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%--<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');" 
                >

                EQUIPOS DE COMPUTO<%--<asp:TextBox ID="TextUsEntrego" runat="server" Width="95%"></asp:TextBox>
                            <ajaxToolkit:AutoCompleteExtender ID="TextUsEntrego_AutoCompleteExtender" 
                                runat="server" ServiceMethod="BusqUsuario" 
                    TargetControlID="TextUsEntrego">
                            </ajaxToolkit:AutoCompleteExtender>--%>
                        </td>
        </tr>
        <tr >
            <td colspan="5" >
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Width="100%">
                    <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                        <HeaderTemplate>
                            
 Hoja de Vida
 
                        
</HeaderTemplate>
                        
                    




                        
<ContentTemplate>
                            
                            
 

                            
                            <uc3:HojaVida ID="HojaVida1" runat="server" />



                            

                            
                            
                            




 

 
 



                            

                            
                            
</ContentTemplate>
                        
                    




                        
</asp:TabPanel>
                    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            
 Categorias
 
 
                            
                         
</HeaderTemplate>
                          
                          




                        
<ContentTemplate>
                              
                              
 

                              
                              <uc2:CaracteristicasEquipos ID="CaracteristicasEquipos1" runat="server" />
                              

                              
                           
                              
 

 
 
                              

                              
                           
</ContentTemplate>
                        
                     




                        
</asp:TabPanel>
                    <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                        <HeaderTemplate>
                            

                            
 

 Punto de Trabajo

 
 

                            
                        
</HeaderTemplate>
                        
                        




                        
<ContentTemplate>
    
<uc4:PuntosTrabajo ID="PuntosTrabajo1" runat="server" >
    
</uc4:PuntosTrabajo>
    
</ContentTemplate>
                        
                    




                        
</asp:TabPanel>
                    <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
                        <HeaderTemplate>
                            
 Marcas
 
                        
</HeaderTemplate>
                        
                        




                        
<ContentTemplate>
    
<uc5:MarcasEquipos ID="MarcasEquipos1" runat="server" >
    
</uc5:MarcasEquipos>
    
</ContentTemplate>
                        
                    




                        
</asp:TabPanel>


                    


                    <asp:TabPanel ID="TabPanel5" runat="server"  HeaderText="TabPanel5">
                        <HeaderTemplate>
                            
 Tipo Equipos
 
                        
</HeaderTemplate>
                        
                        




                        
<ContentTemplate>
    
<uc6:TipoEquipos ID="TipoEquipos" runat="server" >
</uc6:TipoEquipos>
    
</ContentTemplate>
                        
                    




                        
</asp:TabPanel>



                    


                </asp:TabContainer>
            </td>
        </tr>
        <tr >
            <td style="width: 25%" >
                </td>
            <td style="width: 25%" >
                </td>
            <td style="width: 25%" >
                </td>
            <td style="width: 25%" >
                </td>
        </tr>
    </table>
</asp:Content>

