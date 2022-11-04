<%@ Page Title="Modificar Plan de Inducción" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Modificar_Plan.aspx.vb" Inherits="Modificar_Plan" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
 
          .modalPopup
    {
        border: 3px solid black;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-left: 10px;
        }
        function ShowModalPopup() {

            $find("Panel1_ModalPopupExtender").show();
        }

        function HideModalPopup() {

            $find("Panel1_ModalPopupExtender").hide();
        }
 </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
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
           
    .auto-style47 {
        text-align: center;
        color: #FFFFFF;
    }
    .auto-style48 {
        width: 1075px;
        text-align: center;
        font-size: x-large;
        color: #FFFFFF;
    }
           
    .auto-style49 {
        width: 64px;
    }
    .auto-style50 {
        font-size: xx-small;
    }
           
</style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
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
  
               <asp:Panel ID="PanelInicio" runat="server">
        <br />
        <table class="auto-style42">
            <tr>
               <td bgcolor="#7EC5FD" class="auto-style48"><strong>MODIFICAR INDUCCIONES</strong></td>
            </tr>
        </table>
               <table align="center" cellspacing="1" class="auto-style42">
            <tr>
               <td bgcolor="#7EC5FD" class="auto-style47" colspan="4"><strong></strong></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridEvento" runat="server" AutoGenerateColumns="False" DataKeyNames="Idemple" DataSourceID="SqlDataEmpl">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                            <asp:BoundField DataField="Nombres" HeaderText="Nombres" ReadOnly="True" SortExpression="Nombres" />
                            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                            <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                            <asp:BoundField DataField="Cargo" HeaderText="Cargo" ReadOnly="True" SortExpression="Cargo" />
                            <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
                            <asp:BoundField DataField="Lider_de_Area" HeaderText="Lider_de_Area" SortExpression="Lider_de_Area" />
                            <asp:BoundField DataField="Idemple" HeaderText="Idemple" InsertVisible="False" ReadOnly="True" SortExpression="Idemple" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataEmpl" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT DISTINCT EMPLEADO.Documento, EMPLEADO.Nombre1 + ' ' + EMPLEADO.Nombre2 + ' ' + EMPLEADO.Apellido1 + ' ' + EMPLEADO.Apellido2 AS Nombres, EMPLEADO.Telefono, EMPLEADO.Correo, (SELECT CARGOS.Nombre_Cargo + ' (' + NIVELES.Nombre_Nivel + ')' AS Expr1 FROM CARGOS INNER JOIN PUESTO ON CARGOS.Id = PUESTO.Id_Cargo INNER JOIN AREA_NIVEL ON PUESTO.Id_Areanivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id WHERE (PUESTO.Puestos = EMPLEADO.Puesto)) AS Cargo, EMPLEADO.Observaciones, INSTRUCTOR.Nombre_Instructor AS Lider_de_Area, EMPLEADO.Id AS Idemple FROM EMPLEADO INNER JOIN CAPACITACION ON EMPLEADO.Id = CAPACITACION.Empleado INNER JOIN INSTRUCTOR ON CAPACITACION.Instructor = INSTRUCTOR.[User] INNER JOIN TEMAS ON CAPACITACION.Tema = TEMAS.ID WHERE (TEMAS.Nombre_Tema LIKE 'Entrenamiento en el area de desempeño')"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>
            
<asp:Panel ID="PanelModificar" runat="server">

    <asp:SqlDataSource ID="SQLActual" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT DISTINCT CAPACITACION.Id AS idE, TEMAS.Nombre_Tema AS Tema, INSTRUCTOR.Nombre_Instructor As Encargado, CASE WHEN CAPACITACION.Evalua = 1 THEN 'Si' WHEN CAPACITACION.Evalua = 0 THEN 'No' END AS Evaluar FROM CAPACITACION INNER JOIN EMPLEADO ON CAPACITACION.Empleado = EMPLEADO.Id INNER JOIN INSTRUCTOR ON CAPACITACION.Instructor = INSTRUCTOR.[User] INNER JOIN TEMAS ON CAPACITACION.Tema = TEMAS.ID WHERE (CAPACITACION.Empleado = @emple)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="emple" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SQLActual">
        <Columns>
            <asp:BoundField DataField="idE" HeaderText="idE" SortExpression="idE" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Tema" HeaderText="Tema" SortExpression="Tema" />
            <asp:BoundField DataField="Encargado" HeaderText="Encargado" SortExpression="Encargado" />
            <asp:BoundField DataField="Evaluar" HeaderText="Evaluar" SortExpression="Evaluar" ReadOnly="True" />
        </Columns>
        <PagerSettings FirstPageText="" LastPageText="" NextPageText="" />
    </asp:GridView>
    <br />
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SQLActual" Height="85px" DataKeyField="idE" Width="734px">
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style49">Id</td>
                    <td>Tema</td>
                    <td>Encargado</td>
                    <td>Evaluar</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style49">
                        <asp:Label ID="idELabel" runat="server" CssClass="auto-style50" Text='<%# Eval("idE") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TemaLabel" runat="server" Text='<%# Eval("Tema") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EncargadoLabel" runat="server" Text='<%# Eval("Encargado") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EvaluarLabel" runat="server" Text='<%# Eval("Evaluar") %>' />
                    </td>
                    <td>
                       
                    </td>
                </tr>
            </table>
           
            <br />
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:TextBox ID="TextBox1" runat="server" Visible="true"></asp:TextBox>



    <br />
    <br />

    jjjjjj
  

</asp:Panel>
             <asp:Panel ID="Panel1" runat="server">
                prueba

            </asp:Panel>
             </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>