<%@ Page Title="Homologación de HCs" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="HomologarHCs.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


<%@ Register src="../MenuAdmins.ascx" tagname="MenuAdmins" tagprefix="uc2" %>


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
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                HOMOLOGACION DE HISTORIAS CLINICAS</td>
        </tr>
        <tr >
            <td style="border: 1px solid #C0C0C0; width: 25%; vertical-align: top; background-color: #F0F0F0;" >
                DI. Paciente Origen
                <asp:TextBox ID="TextPacOrigen" runat="server" MaxLength="20" 
                    style="font-size: medium" Width="100px"></asp:TextBox>
            </td>
            <td style="border: 1px solid #C0C0C0; width: 25%; vertical-align: top; background-color: #F0F0F0;" >
                DI. Paciente Destino
                <asp:TextBox ID="TextPacDestino" runat="server" MaxLength="20" 
                    style="font-size: medium" Width="100px"></asp:TextBox>
            </td>
            <td style="border: 1px solid #C0C0C0; width: 25%; text-align: center; vertical-align: top; background-color: #F0F0F0; text-align: center;" >
                <asp:Button ID="BtnConsultar" runat="server" Text="Consultar" />
            </td>
            <td style="border: 1px solid #C0C0C0; width: 25%; text-align: center; vertical-align: top; background-color: #F0F0F0;" >
                <asp:Button ID="BtnHomologar" runat="server" Text="Homologar" Enabled="False" />
            </td>
        </tr>
        <tr >
            <td style="vertical-align: top; text-align: center;" colspan="2" >
                <asp:Label ID="lblInfo" runat="server"></asp:Label>
            </td>
            <td style="width: 25%; text-align: center;" >
                <asp:Label ID="LabelExito" runat="server" ForeColor="#006600" 
                    style="font-weight: 700" Visible="False">Se homologo con éxito</asp:Label>
            </td>
            <td style="width: 25%; text-align: center;" >
                &nbsp;</td>
        </tr>
        <tr >
            <td style="vertical-align: top; width: 100%;" colspan="3" >
                <asp:GridView ID="GridFolios" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IdFolio,IdPaciente" DataSourceID="DataGridFolios" 
                    Width="100%">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="AINCONSEC" HeaderText="Ingreso" 
                            SortExpression="AINCONSEC" />
                        <asp:BoundField DataField="HCNUMFOL" HeaderText="N. Folio" 
                            SortExpression="HCNUMFOL" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                        <asp:BoundField DataField="HCFECFOL" HeaderText="Fecha Folio" 
                            SortExpression="HCFECFOL" />
                        <asp:BoundField DataField="PACNUMDOC" HeaderText="No. D.I. paciente" 
                            SortExpression="PACNUMDOC" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NomPaciente" HeaderText="Nombre Paciente" 
                            SortExpression="NomPaciente" ReadOnly="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridFolios" runat="server" 
                    ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica" 
                                       
                    SelectCommand="SELECT HCNFOLIO.OID AS IdFolio, ADNINGRESO.AINCONSEC, HCNFOLIO.HCNUMFOL, HCNFOLIO.HCFECFOL, GENPACIEN.PACNUMDOC, GENPACIEN.PACPRIAPE + N' ' + RTRIM(GENPACIEN.PACSEGAPE) + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS NomPaciente, CASE WHEN PACNUMDOC = @PacOrigen THEN 'O' ELSE 'D' END AS Tipo, GENPACIEN.OID AS IdPaciente FROM HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (GENPACIEN.PACNUMDOC = @PacOrigen) OR (GENPACIEN.PACNUMDOC = @pacDestino) ORDER BY HCNFOLIO.HCFECFOL" 
                    ProviderName="System.Data.SqlClient">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextPacOrigen" Name="PacOrigen" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextPacDestino" Name="pacDestino" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataUpdate" runat="server" 
                    ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;User ID=dghnet;Password=netdinamica" 
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [ACNDEPEN]">
                </asp:SqlDataSource>
            </td>
            <td style="width: 25%; text-align: justify; vertical-align: top; font-size: 10pt;" >
                               
                <asp:Label ID="LabelMsg1" runat="server" 
                    Text="Ya es posible realizar el proceso de Trasladar Codigos y Trasladar Nit en Dinámica Gerencial." 
                    Visible="False"></asp:Label>
                
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
    </table>

               </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

