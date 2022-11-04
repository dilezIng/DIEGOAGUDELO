<%@ Page Title="Crear Plan de Inducción" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Crear.aspx.vb" Inherits="Crear" %>



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
           
    .auto-style46 {
        height: 23px;
    }
           
    .auto-style47 {
        width: 900px;
    }
    .auto-style48 {
        text-align: center;
        font-size: x-large;
        color: #FFFFFF;
    }
           
    .auto-style49 {
        font-size: x-large;
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
  
            <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style49"></asp:Label>
            </strong>

            <asp:Panel ID="PanelCREARCAPACITACION" runat="server">
        <table class="auto-style42">
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
               <td bgcolor="#7EC5FD" class="auto-style48" colspan="4"><strong>CREAR PLAN DE INDUCCION</strong></td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style44">
                    <asp:Label ID="Label2" runat="server" Text="Seleccione empleado: "></asp:Label><asp:DropDownList ID="Listempleados" runat="server" DataSourceID="Empleadoacapacitar" DataTextField="Nombre" DataValueField="Docu" Width="358px" AutoPostBack="True" Height="18px"    >
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="auto-style44">
                    <asp:SqlDataSource ID="Empleadoacapacitar" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT CASE WHEN Id IS NULL THEN 'EMPTY' ELSE Id END AS Docu, Nombre1 + ' ' + Nombre2 + ' ' + Apellido1 + ' ' + Apellido2 AS Nombre FROM EMPLEADO WHERE ((SELECT TOP (1) Empleado FROM CAPACITACION WHERE (Empleado = EMPLEADO.Id)) IS NULL)"></asp:SqlDataSource>
                </td>
                <td class="auto-style44">
                    <asp:SqlDataSource ID="VISUALCAPACITA" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT TEMAS.Nombre_Tema AS Tema, INSTRUCTOR.Nombre_Instructor AS Instructor, INSTRUCTOR.Cargo, NIVELES.Nombre_Nivel AS Nivel, CASE WHEN TEMAS.Evaluación = 0 THEN 'No Evaluar' ELSE 'Evaluar' END AS Evaluación FROM TEMAS INNER JOIN AREA_NIVEL ON TEMAS.Id_Area_Nivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN PUESTO ON AREA_NIVEL.Id_Area_Nivel = PUESTO.Id_Areanivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id INNER JOIN AREAS ON AREA_NIVEL.Id_Area = AREAS.Id INNER JOIN INSTRUCTOR ON TEMAS.Id_Instructor = INSTRUCTOR.Id WHERE (PUESTO.Puestos = (SELECT Puesto FROM EMPLEADO WHERE (Id = @empleado))) AND (TEMAS.Obligatorio = 1) ORDER BY Tema">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Listempleados" Name="empleado" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="4">
 
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style47">Se va a crear el siguiente plan de Inducción<br /> <strong>Documento: </strong>
                                <asp:Label ID="LabelDocu" runat="server" ></asp:Label>
                                <strong>&nbsp;Nombre Empleado: </strong>
                                <asp:Label ID="Labelnom" runat="server" ></asp:Label>
                                &nbsp;&nbsp; <strong>
                                <br />
                                Observaciones: </strong>
                                <asp:Label ID="LabelObser" runat="server"> </asp:Label>
                                <br />
                                <strong>Cargo: </strong>
                                <asp:Label ID="LabelCargo" runat="server" ></asp:Label>
                                <br /> 
                                <br />
                                                                <asp:Button ID="btNCREARPLANCAPACITACIONES" runat="server" Text="Crear" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style47">
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="VISUALCAPACITA" ForeColor="#333333" GridLines="None" Width="886px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Tema" HeaderText="Tema" SortExpression="Tema" />
                                        <asp:BoundField DataField="Instructor" HeaderText="Instructor" SortExpression="Instructor" />
                                        <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
                                        <asp:BoundField DataField="Nivel" HeaderText="Nivel" SortExpression="Nivel" />
                                        <asp:BoundField DataField="Evaluación" HeaderText="Evaluación" ReadOnly="True" SortExpression="Evaluación" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                              
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        
        </table>
        
    </asp:Panel>

            <asp:Panel ID="PanelLiderA" runat="server">

                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style46"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataMember="DefaultView" DataSourceID="SqlDataLider" EnableTheming="True" ForeColor="#333333" GridLines="None" RowHeaderColumn="ID" Width="893px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                                    <asp:BoundField DataField="Nombres" HeaderText="Nombres" ReadOnly="True" SortExpression="Nombres" />
                                    <asp:BoundField DataField="Cargo" HeaderText="Cargo" ReadOnly="True" SortExpression="Cargo" />
                                    <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
                                    <asp:BoundField DataField="Lider_de_Area" HeaderText="Lider_de_Area" SortExpression="Lider_de_Area" />
                                    <asp:BoundField DataField="Cod" HeaderText="Cod" SortExpression="Cod" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            Asignar Jefe de Area a la inducción<br />
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LiderareaSQL" DataTextField="Lider" DataValueField="Usuario">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="LiderareaSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT Nombre_Instructor + ' -' + Cargo AS Lider, [User] as Usuario FROM INSTRUCTOR WHERE Cargo NOT LIKE '%Lider de Area%' ORDER BY Nombre_Instructor"></asp:SqlDataSource>
                            <asp:Button ID="BtnLider" runat="server" Text="Asignar Lider" />
                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
                        
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="SqlDataLider" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT TOP (1) CAPACITACION.Id AS ID, EMPLEADO.Documento, EMPLEADO.Nombre1 + ' ' + EMPLEADO.Nombre2 + ' ' + EMPLEADO.Apellido1 + ' ' + EMPLEADO.Apellido2 AS Nombres, (SELECT CARGOS.Nombre_Cargo + ' (' + NIVELES.Nombre_Nivel + ')' AS Expr1 FROM CARGOS INNER JOIN PUESTO ON CARGOS.Id = PUESTO.Id_Cargo INNER JOIN AREA_NIVEL ON PUESTO.Id_Areanivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id WHERE (PUESTO.Puestos = EMPLEADO.Puesto)) AS Cargo, EMPLEADO.Observaciones, INSTRUCTOR.Nombre_Instructor AS Lider_de_Area, CAPACITACION.Instructor AS Cod FROM EMPLEADO INNER JOIN CAPACITACION ON EMPLEADO.Id = CAPACITACION.Empleado INNER JOIN INSTRUCTOR ON CAPACITACION.Instructor = INSTRUCTOR.[User] INNER JOIN TEMAS ON CAPACITACION.Tema = TEMAS.ID WHERE (TEMAS.Nombre_Tema LIKE 'Entrenamiento en el area de desempeño') ORDER BY ID DESC"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataLider0" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT TOP (1) CAPACITACION.Id AS ID FROM EMPLEADO INNER JOIN CAPACITACION ON EMPLEADO.Id = CAPACITACION.Empleado INNER JOIN INSTRUCTOR ON CAPACITACION.Instructor = INSTRUCTOR.[User] INNER JOIN TEMAS ON CAPACITACION.Tema = TEMAS.ID WHERE (TEMAS.Nombre_Tema LIKE 'Entrenamiento en el area de desempeño') ORDER BY ID DESC"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>




            </asp:Panel>

            
          

             </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>