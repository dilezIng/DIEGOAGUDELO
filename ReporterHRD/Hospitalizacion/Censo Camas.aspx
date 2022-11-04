<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="~/Hospitalizacion/Censo Camas.aspx.vb" Inherits="Hospitalizacion_Censo_Camas" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
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
        font-weight: bold;
        font-size: 20pt;
        text-align: center;
    }
           
    .auto-style2 {
        width: 32%;
    }
           
    .auto-style3 {
    }
    .auto-style4 {
        width: 5%;
    }
           
    .auto-style5 {
        width: 17%;
        font-size: xx-small;
    }
           
    .auto-style7 {
        width: 34%;
        text-align: left;
    }
    .auto-style8 {
        text-align: left;
    }
           
    .auto-style9 {
        width: 32%;
        font-size: xx-small;
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
                </ContentTemplate>
    </asp:UpdatePanel>
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="5" class="auto-style1" >CENSO CAMAS </td>

        </tr>

        <tr >
            
            <td  
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
                
                Grupo de Camas Inicio:<asp:SqlDataSource ID="SqlDataGrupos0" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT N'( ' +[HSUCODIGO] +' ) '+[HSUNOMBRE] as HGRCODIGO, [OID] FROM [HPNSUBGRU]">
                </asp:SqlDataSource>
               
              
            </td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; " class="auto-style8" colspan="2" >

                <asp:DropDownList ID="gp1" runat="server" DataSourceID="SqlDataGrupos0" DataTextField="HGRCODIGO" DataValueField="OID" AutoPostBack="True" Height="16px" style="text-align: left; margin-left: 0px">
                   
                </asp:DropDownList>

            </td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style3" colspan="2" rowspan="2" >
              
                Pacientes :<asp:Label ID="LabelPacientes" runat="server" Text="Label"></asp:Label>
&nbsp;</td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
       
        <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" style="height: 26px" /></td>
            
        </tr>
        <tr >
            <td 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
              
                <asp:SqlDataSource ID="SqlDataGrupos" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT N'( ' +[HSUCODIGO] +' ) '+[HSUNOMBRE] as HGRCODIGO, [OID] FROM [HPNSUBGRU]">
                </asp:SqlDataSource>

                Grupo de Camas Fin:</td>
            <td 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; " class="auto-style7"  >
                
                <asp:DropDownList ID="gp2" runat="server" DataSourceID="SqlDataGrupos" DataTextField="HGRCODIGO" DataValueField="OID" AutoPostBack="True" Height="18px">
                   
                </asp:DropDownList>
                
            </td>
          
        </tr>
        <tr >
            <td colspan="3" 
                style="text-align: right; font-size: 8pt;" >
                &nbsp;</td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                
                &nbsp;</td>
        </tr>
        <tr >
            <td colspan="5" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridEstancia" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                         <asp:BoundField DataField="Cama" HeaderText="Cama" 
                            SortExpression="Cama" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Documento" HeaderText="Documento" 
                            SortExpression="Documento" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                            SortExpression="Nombre" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Edad" HeaderText="Edad" 
                            SortExpression="Edad" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" 
                            SortExpression="Ingreso" >
                        </asp:BoundField>

                         <asp:BoundField DataField="Fech_Ingreso" HeaderText="Fech_Ingreso" 
                            SortExpression="Fech_Ingreso" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Hospitalizacion" HeaderText="Hospitalizacion" 
                            SortExpression="Hospitalizacion" >
                        </asp:BoundField>
                         <asp:BoundField DataField="D_Ingr" HeaderText="D_Ingr" ReadOnly="True" SortExpression="D_Ingr" />
                         <asp:BoundField DataField="D_Hosp" HeaderText="D_Hosp" ReadOnly="True" SortExpression="D_Hosp" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />  <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" /> 
                        <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                         <asp:BoundField DataField="Diagnostico" HeaderText="Diagnostico" ReadOnly="True" SortExpression="Diagnostico" />
                         <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" ReadOnly="True" SortExpression="Especialidad" />
                   <asp:BoundField DataField="Municipio" HeaderText="Municipio" ReadOnly="True" SortExpression="Municipio" />
                         
                        </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridEstancia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
 SelectCommand="SELECT DISTINCT B.HCACODIGO AS Cama, D.PACNUMDOC AS Documento, RTRIM(D.PACPRIAPE) + ' ' + RTRIM(D.PACSEGAPE) + ' ' + RTRIM(D.PACPRINOM) + ' ' + RTRIM(D.PACSEGNOM) AS Nombre, DATEDIFF(year, D.GPAFECNAC, GETDATE()) AS Edad, C.AINCONSEC AS Ingreso, C.AINFECING AS Fech_Ingreso, C.AINFECHOS AS Hospitalizacion, ABS(DATEDIFF(D, C.AINFECING, GETDATE())) AS D_Ingr, ABS(DATEDIFF(D, C.AINFECHOS, GETDATE())) AS D_Hosp, GENDETCON.GDENOMBRE AS Entidad, GENDETCON.GDECODIGO AS Regimen, (SELECT TOP (1) G.DIANOMBRE FROM HCNFOLIO AS H INNER JOIN HCNDIAPAC AS HC ON H.OID = HC.HCNFOLIO INNER JOIN GENDIAGNO AS G ON HC.GENDIAGNO = G.OID INNER JOIN HCNTIPHIS ON H.HCNTIPHIS = HCNTIPHIS.OID WHERE (H.ADNINGRESO = C.OID) AND (H.HCNTIPHIS = 3) AND (HC.HCPDIAPRIN = 1) ORDER BY H.OID DESC) AS Diagnostico, (SELECT TOP (1) GENESPECI.GEEDESCRI FROM GENESPECI INNER JOIN GENESPMED ON GENESPECI.OID = GENESPMED.ESPECIALIDADES INNER JOIN HCNFOLIO AS H ON GENESPMED.MEDICOS = H.GENMEDICOA INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID WHERE (H.ADNINGRESO = C.OID) AND (H.HCNTIPHIS = 3) ORDER BY GENESPECI.GEEDESCRI DESC) AS Especialidad, (SELECT MUNNOMMUN FROM GENMUNICI WHERE (OID = D.DGNMUNICIPIO)) AS Municipio FROM HPNESTANC AS A INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID INNER JOIN ADNINGRESO AS C ON A.ADNINGRES = C.OID INNER JOIN GENPACIEN AS D ON C.GENPACIEN = D.OID INNER JOIN HCNFOLIO ON D.OID = HCNFOLIO.GENPACIEN INNER JOIN GENMEDICO ON GENMEDICO.OID = HCNFOLIO.GENMEDICOA INNER JOIN HCNTIPHIS AS HCNTIPHIS_1 ON HCNFOLIO.HCNTIPHIS = HCNTIPHIS_1.OID INNER JOIN GENESPECI AS GENESPECI_1 ON HCNFOLIO.GENESPECI = GENESPECI_1.OID INNER JOIN HPNSUBGRU AS E ON B.HPNSUBGRU = E.OID INNER JOIN GENDETCON ON GENDETCON.OID = C.GENDETCON WHERE (E.OID &gt;= @gp1) AND (ABS(DATEDIFF(HOUR, C.AINFECING, GETDATE())) &gt;= 0) AND (ABS(DATEDIFF(HOUR, C.AINFECHOS, GETDATE())) &gt;= 0) AND (A.HESFECSAL IS NULL) AND (E.OID &lt;= @gp2)"
                    
                    
                    
                    ><SelectParameters>
                    
                        <asp:ControlParameter ControlID="gp1" Name="gp1" PropertyName="SelectedValue" DefaultValue="" />
                            <asp:ControlParameter ControlID="gp2" Name="gp2" PropertyName="SelectedValue" DefaultValue="" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
                    <tr>
                        <td class="auto-style9">
                          
                            Ing Diego A.</td>
                        <td class="auto-style5" colspan="2">
                            &nbsp;</td>
                        <td class="auto-style4">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
    </table>

            

</asp:Content>


