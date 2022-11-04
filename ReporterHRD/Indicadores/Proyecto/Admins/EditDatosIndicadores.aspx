<%@ Page Title="Edición Datos de indicador" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="EditDatosIndicadores.aspx.vb" Inherits="Indicadores_Proyecto_Admins_AsocIndiUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../../Images/Fondo01.jpg');" 
                >
                Tabla Indicadores (Edición - Creación)</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Enabled="False" 
                    RepeatDirection="Horizontal" Visible="False">
                    <asp:ListItem Selected="True" Value="0">Por Indicador</asp:ListItem>
                    <asp:ListItem Value="1">Por Usuario</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                                    <asp:SqlDataSource ID="DataConsultas" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                                        
                    ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>" 
                    InsertCommand="INSERT INTO Ind_IndiUsers(IdIndicador, IdUsuarioDG) VALUES (1, 2)">
                                    </asp:SqlDataSource>
                                </td>
        </tr>
        <tr >
            <td style="width: 100%" colspan="4" >
                <asp:Panel ID="Panel1" runat="server">
                    <asp:GridView ID="GridIndicadores" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="IdIndicador" DataSourceID="DataGridindicadores" 
                AllowSorting="True" style="text-align: center" Width="100%">
                        <AlternatingRowStyle BackColor="#F0F0F0" />
                        <Columns>
                            <asp:BoundField DataField="IdIndicador" HeaderText="Id" 
                        SortExpression="IdIndicador" InsertVisible="False" ReadOnly="True" >
                            <ItemStyle Font-Size="8pt" ForeColor="#999999" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CodIndicador" HeaderText="Codigo" 
                        SortExpression="CodIndicador" >
                            <ItemStyle HorizontalAlign="Left" Font-Bold="True" Font-Italic="False" 
                                Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IdSedeAsig" HeaderText="Sede" 
                                SortExpression="IdSedeAsig" />
                            <asp:TemplateField HeaderText="Principal" SortExpression="Principal">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("UrlPrincipal") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("UrlPrincipal") %>' 
                                        ToolTip='<%# Eval("txtPrincipal") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="IndPadre" HeaderText="Padre" 
                                SortExpression="IndPadre">
                            <ItemStyle Font-Size="9pt" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NomIndicador" HeaderText="Nombre" 
                                SortExpression="NomIndicador">
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DataGridindicadores" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                        
                        SelectCommand="SELECT Ind_Principal.IdIndicador, CASE WHEN Ind_Principal.IdSedeAsig = 0 THEN Ind_Principal.CodIndicador ELSE Ind_Principal.CodIndicador + '.' + CONVERT (char(1) , Ind_Principal.IdSedeAsig) END AS CodIndicador, Ind_Principal.NomIndicador, Ind_Principal.Principal, Ind_Principal.IdPadre, Ind_Principal.DefOperacional, Ind_Principal.IdNivelDesagregacion, Ind_Principal.Actualizado, CASE WHEN Ind_Principal.IdPadre = 1 THEN '-' ELSE Ind_Principal_1.CodIndicador END AS IndPadre, CASE WHEN Ind_Principal.Principal = 1 THEN '~/Images/Head.png' ELSE '~/Images/Nada.png' END AS UrlPrincipal, CASE WHEN Ind_Principal.Principal = 1 THEN 'Principal' ELSE '' END AS txtPrincipal, Ind_Principal.IdSedeAsig FROM Ind_Principal INNER JOIN Ind_Principal AS Ind_Principal_1 ON Ind_Principal.IdPadre = Ind_Principal_1.IdIndicador WHERE (Ind_Principal.IdIndicador &gt; 1) ORDER BY CodIndicador, Ind_Principal.IdSedeAsig">
                    </asp:SqlDataSource>
                    <asp:FormView ID="FormIndicadores" runat="server" BorderColor="#5FAFEC" 
                        BorderStyle="Solid" BorderWidth="2px" DataKeyNames="IdIndicador" 
                        DataSourceID="DataFormIndicadores" DefaultMode="Edit" Visible="False" 
                        Width="100%">
                        <EditItemTemplate>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 15%">
                                        Id:</td>
                                    <td style="width: 35%">
                                        <asp:Label ID="IdIndicadorLabel1" runat="server" style="font-weight: 700" 
                                            Text='<%# Eval("IdIndicador") %>' />
                                    </td>
                                    <td style="width: 15%">
                                        <asp:Label ID="LblIdPadre" runat="server" Text='<%# Eval("IdPadre") %>' 
                                            Visible="False"></asp:Label>
                                    </td>
                                    <td style="width: 35%">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 15%">
                                        Código:</td>
                                    <td style="width: 35%">
                                        <asp:TextBox ID="CodIndicadorTextBox" runat="server" MaxLength="10" 
                                            Text='<%# Bind("CodIndicador") %>' />
                                    </td>
                                    <td style="width: 15%">
                                        <asp:CheckBox ID="PrincipalCheckBox" runat="server" 
                                            Checked='<%# Bind("Principal") %>' Text="Principal" />
                                    </td>
                                    <td style="width: 35%">
                                        Sede:
                                        <asp:DropDownList ID="ListSedes" runat="server" 
                                            SelectedValue='<%# Bind("IdSedeAsig") %>'>
                                            <asp:ListItem Value="0">Todas</asp:ListItem>
                                            <asp:ListItem Value="1">Duitama</asp:ListItem>
                                            <asp:ListItem Value="2">Santa Rosa de Viterbo</asp:ListItem>
                                            <asp:ListItem Value="3">Sativa Sur</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%">
                                        Nombre:</td>
                                    <td colspan="3">
                                        <asp:TextBox ID="NomIndicadorTextBox" runat="server" MaxLength="1000" 
                                            Text='<%# Bind("NomIndicador") %>' Width="99%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%">
                                        Def. Operacional:
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="DefOperacionalTextBox" runat="server" MaxLength="1000" 
                                            Text='<%# Bind("DefOperacional") %>' Width="99%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%">
                                        Indicador Padre:</td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="ListPadre" runat="server" 
                                            DataSourceID="DataListIndPadres" DataTextField="Nombre" 
                                            DataValueField="IdIndicador" SelectedValue='<%# Bind("IdPadre") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DataListIndPadres" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                                            
                                            SelectCommand="SELECT IdIndicador, CodIndicador + N' - ' + NomIndicador AS Nombre FROM Ind_Principal WHERE (Principal = 1) OR (IdIndicador = @IdPadreAsignado) ORDER BY CodIndicador">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="LblIdPadre" Name="IdPadreAsignado" 
                                                    PropertyName="Text" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%">
                                        &nbsp;</td>
                                    <td colspan="3">
                                        <asp:TextBox ID="IdNivelDesagregacionTextBox" runat="server" 
                                            Text='<%# Bind("IdNivelDesagregacion") %>' Visible="False" />
                                    </td>
                                </tr>
                            </table>
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Actualizar" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </EditItemTemplate>
                        <HeaderStyle BackColor="#5EAEEB" Font-Bold="True" Font-Size="14pt" 
                            ForeColor="White" />
                        <HeaderTemplate>
                            EDICION DE DATOS DE INDICADOR
                        </HeaderTemplate>
                        <InsertItemTemplate>
                            CodIndicador:
                            <asp:TextBox ID="CodIndicadorTextBox" runat="server" 
                                Text='<%# Bind("CodIndicador") %>' />
                            <br />
                            NomIndicador:
                            <asp:TextBox ID="NomIndicadorTextBox" runat="server" 
                                Text='<%# Bind("NomIndicador") %>' />
                            <br />
                            Principal:
                            <asp:CheckBox ID="PrincipalCheckBox" runat="server" 
                                Checked='<%# Bind("Principal") %>' />
                            <br />
                            IdPadre:
                            <asp:TextBox ID="IdPadreTextBox" runat="server" Text='<%# Bind("IdPadre") %>' />
                            <br />
                            DefOperacional:
                            <asp:TextBox ID="DefOperacionalTextBox" runat="server" 
                                Text='<%# Bind("DefOperacional") %>' />
                            <br />
                            IdNivelDesagregacion:
                            <asp:TextBox ID="IdNivelDesagregacionTextBox" runat="server" 
                                Text='<%# Bind("IdNivelDesagregacion") %>' />
                            <br />
                            Actualizado:
                            <asp:CheckBox ID="ActualizadoCheckBox" runat="server" 
                                Checked='<%# Bind("Actualizado") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insertar" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            IdIndicador:
                            <asp:Label ID="IdIndicadorLabel" runat="server" 
                                Text='<%# Eval("IdIndicador") %>' />
                            <br />
                            CodIndicador:
                            <asp:Label ID="CodIndicadorLabel" runat="server" 
                                Text='<%# Bind("CodIndicador") %>' />
                            <br />
                            NomIndicador:
                            <asp:Label ID="NomIndicadorLabel" runat="server" 
                                Text='<%# Bind("NomIndicador") %>' />
                            <br />
                            Principal:
                            <asp:CheckBox ID="PrincipalCheckBox" runat="server" 
                                Checked='<%# Bind("Principal") %>' Enabled="false" />
                            <br />
                            IdPadre:
                            <asp:Label ID="IdPadreLabel" runat="server" Text='<%# Bind("IdPadre") %>' />
                            <br />
                            DefOperacional:
                            <asp:Label ID="DefOperacionalLabel" runat="server" 
                                Text='<%# Bind("DefOperacional") %>' />
                            <br />
                            IdNivelDesagregacion:
                            <asp:Label ID="IdNivelDesagregacionLabel" runat="server" 
                                Text='<%# Bind("IdNivelDesagregacion") %>' />
                            <br />
                            Actualizado:
                            <asp:CheckBox ID="ActualizadoCheckBox" runat="server" 
                                Checked='<%# Bind("Actualizado") %>' Enabled="false" />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Editar" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="DataFormIndicadores" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                        SelectCommand="SELECT IdIndicador, CodIndicador, NomIndicador, Principal, IdPadre, DefOperacional, IdNivelDesagregacion, Actualizado, IdSedeAsig FROM Ind_Principal WHERE (IdIndicador = @IdIndicador)" 
                        
                        UpdateCommand="UPDATE Ind_Principal SET CodIndicador = @CodIndicador, NomIndicador = @NomIndicador, Principal = @Principal, IdPadre = @IdPadre, DefOperacional = @DefOperacional, IdNivelDesagregacion = @IdNivelDesagregacion, Actualizado = @Actualizado, IdSedeAsig = @IdSedeAsig WHERE (IdIndicador = @IdIndicador)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridIndicadores" Name="IdIndicador" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CodIndicador" />
                            <asp:Parameter Name="NomIndicador" />
                            <asp:Parameter Name="Principal" />
                            <asp:Parameter Name="IdPadre" />
                            <asp:Parameter Name="DefOperacional" />
                            <asp:Parameter Name="IdNivelDesagregacion" />
                            <asp:Parameter Name="Actualizado" />
                            <asp:Parameter Name="IdIndicador" />
                            <asp:Parameter Name="IdSedeAsig" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                </asp:Panel>
            </td>
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
</asp:Content>

