<%@ Page Title="Administración Empleados" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Empleadocrear.aspx.vb" Inherits="Empleadocrear" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #000000;
        }
        .auto-style2 {
            color: #FFFFFF;
            text-align: center;
            font-size: x-large;
        }
        .auto-style8 {
            width: 178px;
            height: 27px;
        }
        .auto-style14 {
            width: 305px;
            height: 27px;
        }
        .auto-style15 {
            width: 195px;
            height: 21px;
        }
        .auto-style19 {
            width: 229px;
            height: 21px;
        }
        .auto-style21 {
            height: 21px;
            width: 229px;
            text-align: center;
        }
        .auto-style22 {
            width: 305px;
            text-align: center;
        }
        .auto-style23 {
            width: 178px;
            text-align: center;
        }
        .auto-style24 {
            width: 195px;
            text-align: center;
        }
        .auto-style25 {
            width: 229px;
            text-align: center;
        }
        .auto-style26 {
            height: 21px;
            width: 305px;
            text-align: center;
        }
        .auto-style27 {
            height: 21px;
            width: 178px;
            text-align: center;
        }
        .auto-style28 {
            height: 21px;
            width: 195px;
            text-align: center;
        }
        .auto-style29 {
            width: 178px;
            height: 21px;
        }
        .auto-style30 {
            width: 305px;
            height: 21px;
        }
        .auto-style31 {
            height: 21px;
            width: 229px;
            text-align: center;
            margin-left: 40px;
        }
        .auto-style32 {
            height: 27px;
        }
        .auto-style33 {
            height: 22px;
            width: 229px;
            text-align: left;
        }
        .auto-style34 {
            height: 22px;
            width: 195px;
            text-align: center;
        }
        .auto-style35 {
            height: 22px;
            width: 178px;
            text-align: center;
        }
        .auto-style36 {
            height: 20px;
            width: 229px;
            text-align: center;
        }
        .auto-style37 {
            height: 20px;
            width: 195px;
            text-align: center;
        }
        .auto-style38 {
            height: 20px;
            width: 178px;
            text-align: center;
        }
        .auto-style39 {
            height: 20px;
            width: 305px;
            text-align: center;
        }
        .auto-style40 {
            text-align: left;
        }
        .auto-style41 {
            color: #FF0000;
        }
        .auto-style42 {
            width: 100%;
            border: 1px solid #000000;
        }
        
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
           
    .auto-style45 {
        margin-bottom: 0px;
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
               <td bgcolor="#7EC5FD" class="auto-style2"><strong>ADMINISTRACION EMPLEADOS</strong></td>
            </tr>
        </table>
        <br />
        
        <asp:Table ID="Table1" runat="server" Width="157px" CssClass="auto-style45">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"> <asp:Button ID="CREAR" runat="server" Text="Crear Usuario" /> </asp:TableCell>
                <asp:TableCell runat="server"> <asp:Button ID="EDITAR" runat="server" Text="Editar Usuario" /> </asp:TableCell>
                <asp:TableCell runat="server"> <asp:Button ID="FINALIZADO" runat="server" Text="Finalizados"/> </asp:TableCell>
              
            </asp:TableRow>
            <asp:TableRow runat="server">
            </asp:TableRow>
            <asp:TableRow runat="server">
            </asp:TableRow>
        </asp:Table>


        <br />
       
                    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataEmpl" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                            <asp:BoundField DataField="Nombres" HeaderText="Nombres" ReadOnly="True" SortExpression="Nombres" />
                            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                          
                            <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                            <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" ReadOnly="True" />
                            <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
                            <asp:BoundField DataField="Lider_de_Area" HeaderText="Lider_de_Area" SortExpression="Lider_de_Area" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataEmpl" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT EMPLEADO.Documento, EMPLEADO.Nombre1 + ' ' + EMPLEADO.Nombre2 + ' ' + EMPLEADO.Apellido1 + ' ' + EMPLEADO.Apellido2 AS Nombres, EMPLEADO.Telefono, EMPLEADO.Correo, (SELECT CARGOS.Nombre_Cargo + ' (' + NIVELES.Nombre_Nivel + ')' AS Expr1 FROM CARGOS INNER JOIN PUESTO ON CARGOS.Id = PUESTO.Id_Cargo INNER JOIN AREA_NIVEL ON PUESTO.Id_Areanivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id WHERE (PUESTO.Puestos = EMPLEADO.Puesto)) AS Cargo, EMPLEADO.Observaciones, INSTRUCTOR.Nombre_Instructor AS Lider_de_Area FROM EMPLEADO INNER JOIN CAPACITACION ON EMPLEADO.Id = CAPACITACION.Empleado INNER JOIN INSTRUCTOR ON CAPACITACION.Instructor = INSTRUCTOR.[User] INNER JOIN TEMAS ON CAPACITACION.Tema = TEMAS.ID WHERE (TEMAS.Nombre_Tema LIKE 'Entrenamiento en el area de desempeño')"></asp:SqlDataSource>
                <
        <br />
    </asp:Panel>
    <asp:Panel ID="PanelCrea" runat="server">
    <table class="auto-style1">
       
        <tr>
            <td class="auto-style19" bgcolor="White">&nbsp;</td>
            <td class="auto-style15" bgcolor="White">
                &nbsp;</td>
            <td class="auto-style29" bgcolor="White">&nbsp;</td>
            <td class="auto-style30" bgcolor="White">&nbsp;</td>
        </tr>
      <tr>
            <td bgcolor="#7EC5FD" class="auto-style2" colspan="4"><strong>CREAR EMPLEADO</strong></td>
        </tr>
        <tr>
            <td class="auto-style19" bgcolor="White">&nbsp;</td>
            <td class="auto-style15" bgcolor="White">
                &nbsp;</td>
            <td class="auto-style29" bgcolor="White">&nbsp;</td>
            <td class="auto-style30" bgcolor="White">
                <asp:Label ID="Label1" runat="server" CssClass="auto-style41" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" bgcolor="White" colspan="2"><strong>&nbsp;&nbsp;&nbsp;&nbsp; Identificación:<asp:TextBox ID="doc" runat="server" Width="200px" Height="15px" CausesValidation="True"></asp:TextBox>
                <asp:Label ID="Labeldoc" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style8" bgcolor="White"></td>
            <td class="auto-style14" bgcolor="White"></td>
        </tr>
        <tr>
            <td class="auto-style21" bgcolor="White"><strong>1er Nombre<asp:Label ID="Labelnom1" runat="server" CssClass="auto-style41" ></asp:Label>
                </strong></td>
            <td class="auto-style28" bgcolor="White"><strong>2do Nombre<asp:Label ID="Labelnom2" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style27" bgcolor="White"><strong>1er Apellido<asp:Label ID="Labelap1" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style26" bgcolor="White"><strong>2do Apellido<asp:Label ID="Labelap2" runat="server" CssClass="auto-style41"></asp:Label> 
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style31" bgcolor="White">
                <asp:TextBox ID="nom1" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style28" bgcolor="White">
                <asp:TextBox ID="nom2" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style27" bgcolor="White">
                <asp:TextBox ID="ape1" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style26" bgcolor="White">
                <asp:TextBox ID="ape2" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style36" bgcolor="White"><strong>Telefono<asp:Label ID="Labeltel" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style37" bgcolor="White"><strong>Correo
                <asp:Label ID="Labelcorreo" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style38" bgcolor="White"><strong>Puesto
                <asp:Label ID="Labelpuesto" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style39" bgcolor="White">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21" bgcolor="White">
                <asp:TextBox ID="tel" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style28" bgcolor="White">
                <asp:TextBox ID="correo" runat="server" Height="15px" TextMode="Email" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style27" bgcolor="White">
                <asp:DropDownList ID="listpuest" runat="server" DataSourceID="SqlDataPuesto" DataTextField="Expr1" DataValueField="Id" Width="200px" >
                    <asp:ListItem>_</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style22" bgcolor="White">
                <asp:SqlDataSource ID="SqlDataPuesto" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT PUESTO.Puestos AS Id, CARGOS.Nombre_Cargo + ' (' + NIVELES.Nombre_Nivel + ')' AS Expr1 FROM CARGOS INNER JOIN PUESTO ON CARGOS.Id = PUESTO.Id_Cargo INNER JOIN AREA_NIVEL ON PUESTO.Id_Areanivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id ORDER BY CARGOS.Nombre_Cargo"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style33" bgcolor="White">
                <strong>&nbsp;&nbsp;&nbsp;&nbsp; Observaciones</strong></td>
            <td class="auto-style34" bgcolor="White"></td>
            <td class="auto-style35" bgcolor="White"></td>
            <td class="auto-style22" bgcolor="White" rowspan="2">
                <asp:Button ID="Button1" runat="server" Text="GRABAR" />
            </td>
        </tr>
        <tr>
            <td class="auto-style40" bgcolor="White" colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="observacion" runat="server" Height="48px" TextMode="MultiLine" Width="639px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style25" bgcolor="White">
                <asp:Button ID="BtnClose0" runat="server" Text="Cerrar" />
            </td>
            <td class="auto-style24" bgcolor="White">&nbsp;</td>
            <td class="auto-style23" bgcolor="White">&nbsp;</td>
            <td class="auto-style22" bgcolor="White">&nbsp;</td>
        </tr>
    </table>
        </asp:Panel>
    <asp:Panel ID="PanelEdita" runat="server">


    </asp:Panel>


    
    
            <asp:Panel ID="Edit_Empleado" runat="server">



                <table style="width: 100%;">
                    <tr>
                        <td colspan="3"bgcolor="#7EC5FD" class="auto-style2" ><strong>EDITAR EMPLEADO</strong></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Id" Width="100%">
                                <Columns>
                                    <asp:CommandField SelectText="Editar" ShowSelectButton="True" />
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                                    <asp:BoundField DataField="Cargo" HeaderText="Cargo" ReadOnly="True" SortExpression="Cargo" />
                                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                                    <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                                </Columns>
                            </asp:GridView>
                            <br />
                                                            <asp:Button ID="Button3" runat="server" Text="Cerrar" />
                              
                                
                            <asp:Panel ID="Editemple" runat="server"> 
                             <table   class="auto-style1">
       
        <tr>
            <td class="auto-style19" bgcolor="White">&nbsp;</td>
            <td class="auto-style15" bgcolor="White">
                &nbsp;</td>
            <td class="auto-style29" bgcolor="White">&nbsp;</td>
            <td class="auto-style30" bgcolor="White">&nbsp;</td>
        </tr>
      <tr>
            <td  class="auto-style2" colspan="4"><strong></strong></td>
        </tr>
        <tr>
            <td class="auto-style19" bgcolor="White">&nbsp;</td>
            <td class="auto-style15" bgcolor="White">
                &nbsp;</td>
            <td class="auto-style29" bgcolor="White">&nbsp;</td>
            <td class="auto-style30" bgcolor="White">
                <asp:Label ID="Label3" runat="server" CssClass="auto-style41" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" bgcolor="White" colspan="2"><strong>&nbsp;&nbsp;&nbsp;&nbsp; Identificación:<asp:TextBox ID="TextBox2" runat="server" Width="200px" Height="15px" CausesValidation="True"></asp:TextBox>
                <asp:Label ID="Label4" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style8" bgcolor="White"></td>
            <td class="auto-style14" bgcolor="White"></td>
        </tr>
        <tr>
            <td class="auto-style21" bgcolor="White"><strong>1er Nombre<asp:Label ID="Label5" runat="server" CssClass="auto-style41" ></asp:Label>
                </strong></td>
            <td class="auto-style28" bgcolor="White"><strong>2do Nombre<asp:Label ID="Label6" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style27" bgcolor="White"><strong>1er Apellido<asp:Label ID="Label7" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style26" bgcolor="White"><strong>2do Apellido<asp:Label ID="Label8" runat="server" CssClass="auto-style41"></asp:Label> 
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style31" bgcolor="White">
                <asp:TextBox ID="TextBox3" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style28" bgcolor="White">
                <asp:TextBox ID="TextBox4" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style27" bgcolor="White">
                <asp:TextBox ID="TextBox5" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style26" bgcolor="White">
                <asp:TextBox ID="TextBox6" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style36" bgcolor="White"><strong>Telefono<asp:Label ID="Label9" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style37" bgcolor="White"><strong>Correo
                <asp:Label ID="Label10" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style38" bgcolor="White"><strong>Puesto
                <asp:Label ID="Label11" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td class="auto-style39" bgcolor="White"></td>
        </tr>
        <tr>
            <td class="auto-style21" bgcolor="White">
                <asp:TextBox ID="TextBox7" runat="server" Height="15px" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style28" bgcolor="White">
                <asp:TextBox ID="TextBox8" runat="server" Height="15px" TextMode="Email" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style27" bgcolor="White">
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Expr1" DataValueField="Id" Width="200px" >
                    <asp:ListItem>_</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style22" bgcolor="White">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT PUESTO.Puestos AS Id, CARGOS.Nombre_Cargo + ' (' + NIVELES.Nombre_Nivel + ')' AS Expr1 FROM CARGOS INNER JOIN PUESTO ON CARGOS.Id = PUESTO.Id_Cargo INNER JOIN AREA_NIVEL ON PUESTO.Id_Areanivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id WHERE (PUESTO.Puestos = @pues) ORDER BY CARGOS.Nombre_Cargo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="textDropDownList3" Name="pues" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="textDropDownList2" runat="server" Visible="False"></asp:TextBox>
                &nbsp;<asp:TextBox ID="textDropDownList3" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style33" bgcolor="White">
                <strong>&nbsp;&nbsp;&nbsp;&nbsp; Observaciones</strong></td>
            <td class="auto-style34" bgcolor="White"></td>
            <td class="auto-style35" bgcolor="White"></td>
            <td class="auto-style22" bgcolor="White" rowspan="2">
                <asp:Button ID="Button2" runat="server" Text="GRABAR" />
            </td>
        </tr>
        <tr>
            <td class="auto-style40" bgcolor="White" colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox9" runat="server" Height="48px" TextMode="MultiLine" Width="639px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style25" bgcolor="White">
                &nbsp;</td>
            <td class="auto-style24" bgcolor="White">&nbsp;</td>
            <td class="auto-style23" bgcolor="White">&nbsp;</td>
            <td class="auto-style22" bgcolor="White">&nbsp;</td>
        </tr>
    </table>


</asp:Panel>  

                        </td>
                    </tr>
                </table>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT EMPLEADO.Id, EMPLEADO.Documento, EMPLEADO.Nombre1 + ' ' + EMPLEADO.Nombre2 + ' ' + EMPLEADO.Apellido1 + ' ' + EMPLEADO.Apellido2 AS Nombre, CARGOS.Nombre_Cargo + ' ' + NIVELES.Nombre_Nivel AS Cargo, EMPLEADO.Telefono, EMPLEADO.Correo FROM EMPLEADO INNER JOIN PUESTO ON EMPLEADO.Puesto = PUESTO.Puestos INNER JOIN CARGOS ON PUESTO.Id_Cargo = CARGOS.Id INNER JOIN AREA_NIVEL ON PUESTO.Id_Areanivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id"></asp:SqlDataSource>



                <asp:SqlDataSource ID="VISUALCAPACITA" runat="server" ConnectionString="<%$ ConnectionStrings:DbCapacitaConnectionString %>" SelectCommand="SELECT TEMAS.Nombre_Tema AS Tema, INSTRUCTOR.Nombre_Instructor AS Instructor, INSTRUCTOR.Cargo, NIVELES.Nombre_Nivel AS Nivel, CASE WHEN TEMAS.Evaluación = 0 THEN 'No Evaluar' ELSE 'Evaluar' END AS Evaluación FROM TEMAS INNER JOIN AREA_NIVEL ON TEMAS.Id_Area_Nivel = AREA_NIVEL.Id_Area_Nivel INNER JOIN PUESTO ON AREA_NIVEL.Id_Area_Nivel = PUESTO.Id_Areanivel INNER JOIN NIVELES ON AREA_NIVEL.Id_Nivel = NIVELES.Id INNER JOIN AREAS ON AREA_NIVEL.Id_Area = AREAS.Id INNER JOIN INSTRUCTOR ON TEMAS.Id_Instructor = INSTRUCTOR.Id WHERE (PUESTO.Puestos = (SELECT Puesto FROM EMPLEADO WHERE (Id = @empleado))) AND (TEMAS.Obligatorio = 1) ORDER BY Tema">
                    <SelectParameters>
                        <asp:Parameter Name="empleado" />
                    </SelectParameters>
                </asp:SqlDataSource>



            </asp:Panel>



             </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
