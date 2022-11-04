<%@ Page Title="VozIp" Language="vb" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="TempVoIP.aspx.vb" Inherits="TempVoIP" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 1065px;
            text-align: center;
        }
        .auto-style4 {
            height: 23px;
            width: 760px;
        }
        .auto-style7 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Panel ID="Panel1" runat="server">

        <table style="font-family: tahoma;" class="auto-style4" >
        <tr >
            <td style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" class="auto-style2">
                VOZ IP HRD 
                    
                    </td>
        </tr></table>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EXTENSION], [UBICACION], [DEPENDENCIA] FROM [EXTENSION ] WHERE ([VISIBLE] = @VISIBLE) ORDER BY [DEPENDENCIA], [UBICACION]">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="VISIBLE" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="auto-style7">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <Columns>
                    <asp:BoundField DataField="EXTENSION" HeaderText="EXTENSION" SortExpression="EXTENSION" />
                    <asp:BoundField DataField="UBICACION" HeaderText="UBICACION" SortExpression="UBICACION" />
                    <asp:BoundField DataField="DEPENDENCIA" HeaderText="DEPENDENCIA" SortExpression="DEPENDENCIA" />
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>

</asp:Content>
