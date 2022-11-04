<%@ Page Title="VozIp" Language="vb" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="TempVoIPED.aspx.vb" Inherits="TempVoIPED" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>
<script runat="server">


</script>


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
        .auto-style8 {
            font-size: x-large;
            color: #FF0000;
        }
        .auto-style9 {
            font-size: x-large;
            color: #FFFFFF;
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


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [id], [EXTENSION], [UBICACION], [DEPENDENCIA],[VISIBLE] FROM [EXTENSION ]  ORDER BY [DEPENDENCIA], [UBICACION]">
          
        </asp:SqlDataSource>
        <div class="auto-style7">
     
           
            <asp:Button ID="Button4" runat="server" Text="Crear" />
     
           
            <br />
            <asp:Panel ID="Panel3" runat="server">

                     <asp:Label ID="Label8" runat="server" Text="Crear Nueva"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Extensión"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox3" runat="server" Width="75px"></asp:TextBox>
            &nbsp;<asp:Label ID="Label4" runat="server" Text="Ubicación"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="Label5" runat="server" Text="Dependencia"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Value="ADMINISTRATIVO">ADMINISTRATIVO</asp:ListItem>
                   <asp:ListItem>ARCHIVO CENTRAL</asp:ListItem>
                <asp:ListItem>ALMACEN</asp:ListItem>
                   <asp:ListItem>CAJA URGENCIAS</asp:ListItem>
              
                <asp:ListItem>CONSULTA EXTERNA</asp:ListItem>
              
                  <asp:ListItem>FARMACIA PRINCIPAL</asp:ListItem>
              
                  <asp:ListItem Value="HOSPITALIZACION">HOSPITALIZACION</asp:ListItem>
                <asp:ListItem>HRD</asp:ListItem>
                <asp:ListItem>OBSERVACION URGENCIAS</asp:ListItem>
                <asp:ListItem>RX-IMAGINOLOGIA</asp:ListItem>
                <asp:ListItem>SALA CIRUGIA</asp:ListItem>
                <asp:ListItem>SALAS DE PARTO</asp:ListItem>
                <asp:ListItem>SISTEMAS</asp:ListItem>
               <asp:ListItem>URGENCIAS</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;Visible&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="1">Si</asp:ListItem>
                <asp:ListItem Value="0">No</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:Button ID="Button2" runat="server" Text="Crear" OnClick="Button2_Click" />
            <br />

            </asp:Panel>
            <br />
       
            <asp:SqlDataSource ID="DataH0" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
            <br />
             <asp:Panel ID="Panel2" runat="server">
                <br />
                <asp:Label ID="Label7" runat="server" Text="Cambiar Datos"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Id"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox7" runat="server" ReadOnly="True" Width="55px"></asp:TextBox>
            &nbsp;&nbsp;<asp:Label ID="Label10" runat="server" Text="Extención "></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" Width="80px"></asp:TextBox>
            &nbsp;<asp:Label ID="Label11" runat="server" Text="Ubicación"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox5" runat="server" Width="149px"></asp:TextBox>
            &nbsp;<asp:Label ID="Label12" runat="server" Text="Dependencia"></asp:Label>
            &nbsp;<asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem >ADMINISTRATIVO</asp:ListItem>
                   <asp:ListItem>ARCHIVO CENTRAL</asp:ListItem>
                <asp:ListItem>ALMACEN</asp:ListItem>
                   <asp:ListItem>CAJA URGENCIAS</asp:ListItem>
              
                <asp:ListItem>CONSULTA EXTERNA</asp:ListItem>
              
                  <asp:ListItem>FARMACIA PRINCIPAL</asp:ListItem>
              
                  <asp:ListItem >HOSPITALIZACION</asp:ListItem>
                <asp:ListItem>HRD</asp:ListItem>
                <asp:ListItem>OBSERVACION URGENCIAS</asp:ListItem>
                <asp:ListItem>RX-IMAGINOLOGIA</asp:ListItem>
                <asp:ListItem>SALA CIRUGIA</asp:ListItem>
                <asp:ListItem>SALAS DE PARTO</asp:ListItem>
                <asp:ListItem>SISTEMAS</asp:ListItem>
               <asp:ListItem>URGENCIAS</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:Label ID="Label13" runat="server" Text="Visible"></asp:Label>
            &nbsp;<asp:DropDownList ID="DropDownList4" runat="server">
                <asp:ListItem Value="1">Si</asp:ListItem>
                <asp:ListItem Value="0">No</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:Button ID="Button3" runat="server" Text="Actualizar" />
            <br />
                <br />

                        <asp:Label ID="Label6" runat="server" Text="Cambiar Num"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Actual"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
            &nbsp;<asp:Label ID="Label2" runat="server" Text="Nueva"></asp:Label>
                 &nbsp;&nbsp;  
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Actualizar" />
                 <br />
                 <br />
                 <br />
                 <strong>
                 <asp:Label ID="Label14" runat="server" CssClass="auto-style8" Text="Eliminar"></asp:Label>
                 </strong>&nbsp;&nbsp;&nbsp;<asp:Label ID="Label15" runat="server" Text="Id" CssClass="auto-style8"></asp:Label>&nbsp;<strong><asp:TextBox ID="TextBox8" runat="server" BackColor="Red" CssClass="auto-style9" Font-Size="Large" ForeColor="Black" Height="31px" ReadOnly="True" Width="55px"></asp:TextBox>
                 </strong>
                 <asp:Label ID="Label16" runat="server" CssClass="auto-style8" Text="Extención "></asp:Label>
                 <strong>
                 <asp:TextBox ID="TextBox9" runat="server" BackColor="Red" CssClass="auto-style9" Font-Size="Large" ForeColor="Black" Height="28px" ReadOnly="True" Width="80px"></asp:TextBox>
                 </strong>&nbsp;
                 <asp:Button ID="Button5" runat="server" BackColor="Red" CssClass="auto-style8" ForeColor="White" Height="44px" Text="Eliminar" Width="107px" />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
            <br />
            </asp:Panel>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" DataKeyNames="Id">
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                    <asp:BoundField DataField="EXTENSION" HeaderText="EXTENSION" SortExpression="EXTENSION" />
                    <asp:BoundField DataField="UBICACION" HeaderText="UBICACION" SortExpression="UBICACION" />
                    <asp:BoundField DataField="DEPENDENCIA" HeaderText="DEPENDENCIA" SortExpression="DEPENDENCIA" />
                    <asp:BoundField DataField="VISIBLE" HeaderText="VISIBLE" SortExpression="VISIBLE" />
                </Columns>
            </asp:GridView>
            <br />
           
            <br />
            <br />
        </div>
    </asp:Panel>

</asp:Content>
