<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="CargarIndicadores.aspx.vb" Inherits="Indicadores_Proyecto_CargarIndicadores" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
           
    .style1
    {
        width: 100%;
    }
           
</style>

    <style type="text/css">
        .style1
        {
            font-size: 16pt;
        }
        .style2
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma;" >
    <tr >
        <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');" 
                >
            Cargar Indicadores</td>
    </tr>

    <tr >
        <td style="width: 25%" >
            Mes:
            <asp:DropDownList ID="ListMeses" runat="server" AutoPostBack="True" 
                DataSourceID="DataListMeses" DataTextField="NomMes" DataValueField="IdMes">
            </asp:DropDownList>
            <asp:SqlDataSource ID="DataListMeses" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                
                
                SelectCommand="SELECT IdMes, CASE WHEN Mes = 1 THEN 'Enero' WHEN Mes = 2 THEN 'Febrero' WHEN Mes = 3 THEN 'Marzo' WHEN Mes = 4 THEN 'Abril' WHEN Mes = 5 THEN 'Mayo' WHEN Mes = 6 THEN 'Junio' WHEN Mes = 7 THEN 'Julio' WHEN Mes = 8 THEN 'Agosto' WHEN Mes = 9 THEN 'Septiembre' WHEN Mes = 10 THEN 'Octubre' WHEN Mes = 11 THEN 'Noviembre' WHEN Mes = 12 THEN 'Diciembre' END + ' de ' + CONVERT (nvarchar(4), Ano) AS NomMes FROM Ind_Meses ORDER BY Ano DESC, Mes DESC"></asp:SqlDataSource>
        </td>
        <td colspan="2" >
            <asp:DropDownList ID="ListIndicadores" runat="server" AutoPostBack="True" 
                DataSourceID="DataListindicadores" DataTextField="NomIndicador" 
                DataValueField="IdIndicador" Width="80%" Visible="False">
            </asp:DropDownList>
            <asp:SqlDataSource ID="DataListindicadores" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                
                
                
                
                SelectCommand="SELECT Ind_Principal.IdIndicador, Ind_Principal.CodIndicador, Ind_Principal.NomIndicador FROM Ind_Principal INNER JOIN Ind_Resultados ON Ind_Principal.IdIndicador = Ind_Resultados.IdIndicador INNER JOIN Ind_Meses ON Ind_Resultados.IdMes = Ind_Meses.IdMes INNER JOIN Ind_IndiUsers ON Ind_Principal.IdIndicador = Ind_IndiUsers.IdIndicador WHERE (Ind_IndiUsers.IdUsuarioDG = @IdUsuario) AND (Ind_Resultados.IdMes = @IdMes)" 
                ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                        PropertyName="SelectedValue" />
                    <asp:Parameter DefaultValue="1110" Name="IdUsuario" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataConsultas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
            </asp:SqlDataSource>
        </td>
        <td style="width: 25%; text-align: right;" >
            <asp:Button ID="BtnGrabar" runat="server" 
                style="font-weight: 700; font-size: 12pt" Text="Guardar" Visible="False" />
            <asp:Label ID="lblIdUsuario" runat="server" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr >
        <td colspan="4" 
            style="font-weight: bold; font-size: 15pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');" >
            <asp:Label ID="LblSubtitulo" runat="server" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr >
        <td colspan="4" >
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:GridView ID="GridIndicadores" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="IdResultado" DataSourceID="DataGridindicadores" 
                AllowSorting="True" style="text-align: center">
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <Columns>
                    <asp:BoundField DataField="CodIndicador" HeaderText="Codigo" 
                        SortExpression="CodIndicador" >
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NomIndicador" HeaderText="Nombre Indicador" 
                        SortExpression="NomIndicador" >
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FechaCarga" HeaderText="Fecha Actualización" 
                        SortExpression="FechaCarga" >
                    <ItemStyle Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Dato">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Numerador") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <table class="style2">
                                <tr>
                                    <td style="border: 1px solid #0066CC; text-align: center;">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Numerador") %>' 
                                            ToolTip="Numerador"></asp:Label>
                                        <hr />
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Denominador") %>' 
                                            ToolTip="Denominador"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("UrlEstado") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("UrlEstado") %>' 
                                ToolTip='<%# Eval("TxtEstado") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Edit.png" 
                        SelectText="Ver" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DataGridindicadores" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                
                
                
                
                SelectCommand="SELECT Ind_Resultados.IdResultado, Ind_Principal.IdIndicador, Ind_Principal.CodIndicador, Ind_Principal.NomIndicador, CASE WHEN Ind_Resultados.Actualizado = 1 THEN '~/Images/Ok.png' ELSE '~/Images/Wait.png' END AS UrlEstado, Ind_Resultados.FechaCarga, Ind_Resultados.Numerador, Ind_Resultados.Denominador, CASE WHEN Ind_Resultados.Actualizado = 1 THEN 'Cargado' ELSE 'Pendiente' END AS TxtEstado FROM Ind_Principal INNER JOIN Ind_Resultados ON Ind_Principal.IdIndicador = Ind_Resultados.IdIndicador INNER JOIN Ind_Meses ON Ind_Resultados.IdMes = Ind_Meses.IdMes INNER JOIN Ind_IndiUsers ON Ind_Principal.IdIndicador = Ind_IndiUsers.IdIndicador WHERE (Ind_IndiUsers.IdUsuarioDG = @IdUsuario) AND (Ind_Resultados.IdMes = @IdMes) ORDER BY Ind_Principal.CodIndicador">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="lblIdUsuario" DefaultValue="1110" 
                        Name="IdUsuario" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr >
        <td colspan="4" >
            <asp:FormView ID="FormIndicador" runat="server" 
                DataSourceID="DataFormIndicador" DefaultMode="Edit" 
                DataKeyNames="IdResultado">
                <EditItemTemplate>
                    <table style="border: 2px solid #71BDF9; width: 1050px; height: 100px;">
                        
                            <tr>
                                <td rowspan="2" 
                                    style="border: 1px solid #CCCCCC; width: 45%; vertical-align: top;">
                                    <asp:Label ID="LblIdResultado" runat="server" Text='<%# Eval("IdResultado") %>' 
                                        Visible="False"></asp:Label>
                                    <asp:Label ID="LabelIdResIndicador" runat="server" 
                                        Text='<%# Eval("IdResultado") %>'></asp:Label>
                                    <asp:Label ID="LabelNomIndicador" runat="server" 
                                        Text='<%# Eval("NomIndicador") %>'></asp:Label>
                                </td>
                                <td rowspan="2" 
                                    style="border: 1px solid #CCCCCC; width: 45%; vertical-align: top;">
                                    <asp:Label ID="LabelDefOperacional" runat="server" style="font-size: 8pt" 
                                        Text='<%# Eval("DefOperacional") %>'></asp:Label>
                                </td>
                                <td style="border-style: solid; border-width: 1px 1px 2px 1px; border-color: #CCCCCC #CCCCCC #808080 #CCCCCC; width: 10%; text-align: right; vertical-align: middle;">
                                    <strong><span class="style1">N</span></strong>
                                    <asp:TextBox ID="TextNumerador" runat="server" Height="30px" MaxLength="3" 
                                        style="font-weight: 700; font-size: (tamaño 14.)" 
                                        Text='<%# Bind("Numerador") %>' Width="50px" Font-Size="16pt" 
                                        ForeColor="Red"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="TextNumerador_FilteredTextBoxExtender" 
                                        runat="server" BehaviorID="TextNumerador_FilteredTextBoxExtender" 
                                        FilterType="Numbers" TargetControlID="TextNumerador" ValidChars="12" />
                                </td>
                            </tr>
                            <tr>
                                <td style="border-style: solid; border-width: 2px 1px 1px 1px; border-color: #808080 #CCCCCC #CCCCCC #CCCCCC; width: 10%; text-align: right; vertical-align: top;">
                                    <span class="style1"><strong>D</strong></span>
                                    <asp:TextBox ID="TextDenominador" runat="server" Height="30px" MaxLength="3" 
                                        style="font-weight: 700; font-size: (tamaño 14.)" 
                                        Text='<%# Bind("Denominador") %>' Width="50px" Font-Size="16pt" 
                                        ForeColor="Red"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="TextDenominador_FilteredTextBoxExtender" 
                                        runat="server" BehaviorID="TextNumerador_FilteredTextBoxExtender" 
                                        FilterType="Numbers" TargetControlID="TextDenominador" ValidChars="12" />
                                </td>
                            </tr>
                        
                        
                        <tr>
                        <td style="vertical-align: top">
                            Factibilidad de Intervencion:<asp:DropDownList ID="ListFactibilidad" 
                                runat="server" SelectedValue='<%# Bind("Factibilidad") %>'>
                                <asp:ListItem Value="0">Seleccione una..</asp:ListItem>
                                <asp:ListItem Value="1">1. Factible solo a largo plazo</asp:ListItem>
                                <asp:ListItem Value="2">2. Factible a mediano o largo plazo</asp:ListItem>
                                <asp:ListItem Value="3">3. Factible a corto plazo</asp:ListItem>
                                <asp:ListItem Value="4">4. Muy factible a corto plazo</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                            <td style="vertical-align: top">
                                Gravedad del efecto:
                                <asp:DropDownList ID="ListGravedad" runat="server" 
                                    SelectedValue='<%# Bind("Gravedad") %>'>
                                    <asp:ListItem Value="0">Seleccione uno...</asp:ListItem>
                                    <asp:ListItem Value="1">1. POCO GRAVE</asp:ListItem>
                                    <asp:ListItem Value="2">2. MODERADAMENTE GRAVE</asp:ListItem>
                                    <asp:ListItem Value="3">3. GRAVE</asp:ListItem>
                                    <asp:ListItem Value="4">4. MUY GRAVE</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: center; vertical-align: bottom;">
                                &nbsp;</td></tr>
                            <tr>
                                <td style="vertical-align: top">
                                    Estrategias:<br />
                                    <asp:TextBox ID="TxtEstrategias" runat="server" Height="200px" 
                                        style="font-size: 8pt" Text='<%# Bind("estrategias") %>' TextMode="MultiLine" 
                                        Width="99%"></asp:TextBox>
                                </td>
                                <td style="vertical-align: top">
                                    Análisis:</span><br />
                                    <asp:TextBox ID="TxtAnalisis" runat="server" Height="200px" 
                                        style="font-size: 8pt" Text='<%# Bind("analisis") %>' TextMode="MultiLine" 
                                        Width="99%"></asp:TextBox>
                                </td>
                                <td style="text-align: center; vertical-align: bottom;">
                                    <asp:Image ID="ImageActualizado" runat="server" ImageUrl="~/Images/OkSave.png" 
                                        Visible='<%# Eval("Actualizado") %>' />
                                    <br />
                                    <br />
                                    <asp:Button ID="BtnGrabar" runat="server" CommandName="Update" 
                                        style="font-weight: 700" Text="Guardar" />
                                    <asp:Button ID="BtnCancelar" runat="server" CausesValidation="False" 
                                        onclick="BtnCancelar_Click" style="font-weight: 700" Text="Cancelar" />
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; text-align: left; font-size: 9pt; background-color: #CCCCCC;" 
                                    colspan="2">
                                    Fecha Grabación:
                                    <asp:Label ID="LabelFechaGrabacion" runat="server" style="font-size: 8pt" 
                                        Text='<%# Eval("FechaCarga") %>'></asp:Label>
                                </td>
                                <td style="text-align: center; vertical-align: bottom;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" 
                                    style="border: 1px solid #C0C0C0; vertical-align: top; text-align: right;">
                                    <font size="2" style="font-size: 8pt">Adjuntar imagen:</font>
                                    <asp:FileUpload ID="FileUpload2" runat="server" />
                                    &nbsp;<font size="2" style="font-size: 8pt; text-align: right">Observaciones del 
                                    archivo:</font>
                                    <asp:TextBox ID="TxtObsArchivo" runat="server" MaxLength="100" Width="300px"></asp:TextBox>
                                    &nbsp;
                                </td>
                                <td style="text-align: center; vertical-align: bottom;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top">
                                    <asp:Label ID="LblImagen" runat="server"></asp:Label>
                                </td>
                                <td style="vertical-align: top; text-align: right;">
                                    <asp:Button ID="BtnSubirArchivoEquipo" runat="server" 
                                        onclick="BtnSubirArchivoEquipo_Click" Text="Adjuntar Imagen" />
                                </td>
                                <td style="text-align: center; vertical-align: bottom;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="vertical-align: top">
                                    <asp:DataList ID="ListFotos" runat="server" BorderColor="#3366CC" 
                                        BorderStyle="Solid" BorderWidth="1px" DataKeyField="IdFotoAdj" 
                                        DataSourceID="DataListFotos" RepeatColumns="3" RepeatDirection="Horizontal" 
                                        Width="100%" CaptionAlign="Left" onitemcommand="ListFotos_ItemCommand" 
                                        style="text-align: right">
                                        <AlternatingItemStyle BorderColor="#3399FF" BorderStyle="Solid" 
                                            BorderWidth="1px" />
                                        <HeaderStyle BackColor="#5CACE9" ForeColor="White" HorizontalAlign="Left" />
                                        <HeaderTemplate>
                                            <strong style="text-align: left">IMAGENES ADJUNTAS</strong>&nbsp;
                                        </HeaderTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="300px" />
                                        <ItemTemplate>
                                            &nbsp;<asp:Label ID="ObservacionesLabel" runat="server" style="font-size: 10pt" 
                                                Text='<%# Eval("Observaciones") %>' />
                                            <br />
                                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                                ImageUrl='<%# Eval("urlImagen") %>' onclick="ImageButton1_Click" 
                                                Width="300px" CommandName="VerImagen" />
                                            <br />
                                            <asp:Label ID="IdFotoAdjLabel" runat="server" ForeColor="Gray" 
                                                style="font-size: 8pt" Text='<%# Eval("IdFotoAdj") %>' />
                                            &nbsp;
                                            <asp:Label ID="FechaInsercionLabel" runat="server" ForeColor="#999999" 
                                                style="font-size: 8pt" Text='<%# Eval("FechaInsercion") %>' />
                                            &nbsp;&nbsp;
                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="EliminarFoto" 
                                                ImageUrl="~/Images/Delete.png" ToolTip="Eliminar Archivo" />
                                            <hr />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:SqlDataSource ID="DataListFotos" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                                        SelectCommand="SELECT IdFotoAdj, IdResultado, urlImagen, Observaciones, FechaInsercion FROM Ind_FotosAdj WHERE (IdResultado = @IdResultado)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="LblIdResultado" Name="IdResultado" 
                                                PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="text-align: center; vertical-align: bottom;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top">
                                    &nbsp;</td>
                                <td style="vertical-align: top; text-align: right;">
                                    &nbsp;</td>
                                <td style="text-align: center; vertical-align: bottom;">
                                    &nbsp;</td>
                            </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </td>
    </tr>
    <tr >
        <td colspan="4" >
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <ajaxToolkit:ModalPopupExtender ID="BtnMostrar_ModalPopupExtender" runat="server"
                 BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True"
                    TargetControlID="BtnMostrar" PopupControlID="PanelModal">
                </ajaxToolkit:ModalPopupExtender>
                           <asp:Panel ID="PanelModal" runat="server">
                               <asp:Panel ID="PanelMsg" runat="server" 
    BackColor="White" BorderColor="#999999" 
                               BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" 
                               Width="500px" 
    ScrollBars="Vertical">
                                   <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/IconoInfo.png" />
                                   <br />
                                   <asp:Label ID="LabelMsg" runat="server" style="font-size: 14pt"></asp:Label>
                                   
                                   
                               </asp:Panel>
                               <asp:Image ID="Image3" runat="server" Visible="False" /><br />
                               <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                </asp:Panel>
        </td>
    </tr>
    <tr >
        <td style="width: 25%" >
            <asp:SqlDataSource ID="DataFormIndicador" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                
                
                
                
                SelectCommand="SELECT Ind_Resultados.IdResultado, Ind_IndiUsers.IdUsuarioDG, Ind_Principal.IdIndicador, Ind_Principal.CodIndicador, Ind_Principal.NomIndicador, Ind_Resultados.IdMes, Ind_Resultados.Numerador, Ind_Resultados.Denominador, Ind_Resultados.Observaciones, Ind_Resultados.IdUsCargo, Ind_Resultados.FechaCarga, Ind_Principal.DefOperacional, Ind_Resultados.analisis, Ind_Resultados.estrategias, Ind_Resultados.Factibilidad, Ind_Resultados.Gravedad, Ind_Resultados.Actualizado FROM Ind_Principal INNER JOIN Ind_Resultados ON Ind_Principal.IdIndicador = Ind_Resultados.IdIndicador INNER JOIN Ind_Meses ON Ind_Resultados.IdMes = Ind_Meses.IdMes INNER JOIN Ind_IndiUsers ON Ind_Principal.IdIndicador = Ind_IndiUsers.IdIndicador WHERE (Ind_Resultados.IdResultado = @IdResultado)" 
                
                
                UpdateCommand="UPDATE Ind_Resultados SET Numerador = @Numerador, Denominador = @Denominador, analisis = @analisis, estrategias = @estrategias, IdUsCargo = @IdUsCargo, FechaCarga = GETDATE(), Factibilidad = @Factibilidad, Gravedad = @Gravedad, Actualizado = 1 WHERE (IdResultado = @IdResultado)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridIndicadores" Name="IdResultado" 
                        PropertyName="SelectedValue" DefaultValue="" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Numerador" />
                    <asp:Parameter Name="Denominador" />
                    <asp:Parameter Name="analisis" />
                    <asp:Parameter Name="estrategias" />
                    <asp:Parameter Name="IdResultado" />
                    <asp:Parameter Name="IdUsCargo" />
                    <asp:Parameter Name="Factibilidad" />
                    <asp:Parameter Name="Gravedad" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
        <td style="width: 25%" >
                &nbsp;</td>
        <td style="width: 25%" >
                &nbsp;</td>
        <td style="width: 25%" >
                &nbsp;</td>
    </tr>
    
</table>
</asp:Content>

