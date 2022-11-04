<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Registro.aspx.vb" Inherits="Registro" UICulture="ES-co"%>

<%@ Register src="../../Recursos/Cargando.ascx" tagname="cargando" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        
        .MaskedEditError

        {
         background-color: #FF8080;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <asp:Label ID="LblProgress" runat="server">
                                <div style="top: 0px; height: 100%; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1000px;
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
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');" 
                >
                Registro y Control de Programación de Cirugia Ambulatoria</td>
        </tr>
        <tr >
            <td style="width: 25%; text-align: center;" >
                <asp:Button ID="Button2" runat="server" Text="Nuevo Registro" />
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Panel ID="PanelNuevoRegistro" runat="server" BorderColor="#999999" 
                    BorderStyle="Solid" BorderWidth="1px">
                    <table style="width: 100%">
                        <tr>
                            <td colspan="3" 
                                style="border: 1px solid #CCCCCC; width: 75%; background-color: #F0F0F0;">
                                Buscar:&nbsp;<asp:TextBox ID="TextBoxBusqPac" runat="server" Width="75%"></asp:TextBox>
                                <ajaxToolkit:AutoCompleteExtender ID="TextBoxBusqPac_AutoCompleteExtender" 
                                    runat="server" BehaviorID="TextBox1_AutoCompleteExtender" 
                                    DelimiterCharacters="" ServicePath="" 
                                    TargetControlID="TextBoxBusqPac" ServiceMethod="BusqPaciente">
                                </ajaxToolkit:AutoCompleteExtender>
                                &nbsp;<asp:Button ID="ButtonSelecPac" runat="server" Text="Seleccionar" 
                                    CausesValidation="False" />
                            </td>
                            <td style="border: 1px solid #CCCCCC; width: 25%; font-size: 9pt; font-weight: bold; text-align: center;">
                                NUEVO SEGUIMIENTO
                                <asp:Label ID="LabelId" runat="server" Font-Bold="False" Font-Size="7pt"></asp:Label>
                                <asp:Label ID="LabelIdDG" runat="server" Font-Bold="False" Font-Size="7pt"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%; text-align: right;">
                                Primer Apellido:
                                <asp:TextBox ID="TextBoxPrimApel" runat="server" Font-Bold="True" 
                                    MaxLength="30" Width="100px"></asp:TextBox>
                            </td>
                            <td style="width: 25%; text-align: right;">
                                Segundo Apellido:
                                <asp:TextBox ID="TextBoxSegApel" runat="server" Font-Bold="True" 
                                    MaxLength="30" Width="100px"></asp:TextBox>
                            </td>
                            <td style="width: 25%; text-align: right;">
                                Primer Nombre:
                                <asp:TextBox ID="TextBoxPrimNom" runat="server" Font-Bold="True" 
                                    MaxLength="30" Width="100px"></asp:TextBox>
                            </td>
                            <td style="width: 25%; text-align: right;">
                                Segundo Nombre:
                                <asp:TextBox ID="TextBoxSegNombre" runat="server" Font-Bold="True" 
                                    MaxLength="30" Width="100px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%; text-align: right;">
                                No. Identificación
                                <asp:TextBox ID="TextBoxNumDoc" runat="server" Font-Bold="True" MaxLength="30" 
                                    Width="100px"></asp:TextBox>
                            </td>
                            <td style="width: 25%; text-align: right;">
                                Fecha Nacimiento:
                                <asp:TextBox ID="TextBoxFechaNac" runat="server" Font-Bold="True" 
                                    MaxLength="30" Width="100px"></asp:TextBox>
                            </td>
                            <td style="width: 25%; text-align: right;">
                                Edad:
                                <asp:Label ID="LabelEdad" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 25%; text-align: right;">
                                <%--Entidad:<asp:DropDownList ID="ListEntidadPersona" runat="server" 
                                    DataSourceID="DataEntidadPersona" DataTextField="NomEntidad" 
                                    DataValueField="IdEntidad" Enabled="False" Width="75%">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="DataEntidadPersona" runat="server" 
                                    ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                                    ProviderName="System.Data.SqlClient" 
                                    SelectCommand="SELECT GDECODIGO + N' ' + GDENOMBRE AS NomEntidad, OID AS IdEntidad FROM GENDETCON ORDER BY GDECODIGO">
                                </asp:SqlDataSource>--%>
                                Entidad:<asp:Label ID="LabelIdEntPersona" runat="server" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxEntidad" runat="server" Font-Bold="True" 
                                    MaxLength="100" Width="170px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%; text-align: right;">
                                Municipio Reside:<asp:Label ID="LabelIdMunResPersona" runat="server" 
                                    Visible="False"></asp:Label>
                                <asp:TextBox ID="TextBoxMunicpioReside" runat="server" Font-Bold="True" MaxLength="30" 
                                    Width="120px"></asp:TextBox></td>
                            <td style="width: 25%; text-align: right;">
                                Tel. Principal:
                                <asp:TextBox ID="TextBoxTelPrinicpal" runat="server" Font-Bold="True" 
                                    MaxLength="30" Width="120px"></asp:TextBox>
                            </td>
                            <td style="width: 25%">
                                &nbsp;</td>
                            <td style="border: 1px solid #CCCCCC; width: 25%; background-color: #F0F0F0; text-align: center;">
                                <asp:Button ID="ButtonCrearControlQx" runat="server" 
                                    Text="Crear Segumiento Qx" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%; text-align: right;">
                                &nbsp;</td>
                            <td style="width: 50%; text-align: left; font-size: 8pt;" colspan="2">
                                <asp:GridView ID="GridHistorico" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="IdPersona,IdDGProced" DataSourceID="DataGridHistorico">
                                    <Columns>
                                        <asp:BoundField DataField="FechaCreacionControlQx" 
                                            HeaderText="FechaCreacionControlQx" SortExpression="FechaCreacionControlQx" />
                                        <asp:BoundField DataField="FechaDiagnostico" HeaderText="FechaDiagnostico" 
                                            SortExpression="FechaDiagnostico" />
                                        <asp:TemplateField HeaderText="Proc Principal">
                                            <ItemTemplate>
                                                <asp:Label ID="LabelNomProced" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DataGridHistorico" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                                    SelectCommand="SELECT Qx_ControlAmbulatoria.IdPersona, Qx_ControlAmbulatoria.FechaCreacionControlQx, Qx_ControlAmbulatoria.FechaDiagnostico, Qx_ProcedsPacs.IdDGProced FROM Qx_ControlAmbulatoria INNER JOIN Qx_ProcedsPacs ON Qx_ControlAmbulatoria.IdControlQx = Qx_ProcedsPacs.IdQxControlAmbulatoria WHERE (Qx_ControlAmbulatoria.IdPersona = @IdPersona) AND (Qx_ProcedsPacs.Principal = 1)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="LabelId" Name="IdPersona" 
                                            PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td style="width: 25%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 25%; text-align: right;">
                                &nbsp;</td>
                            <td style="width: 25%; text-align: right;">
                                &nbsp;</td>
                            <td style="width: 25%">
                                &nbsp;</td>
                            <td style="width: 25%; ">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" 
                                style="text-align: left; background-image: url('../../Images/Fondo02.jpg'); font-weight: bold; color: #FFFFFF;">
                                Datos de la Cirugia</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: right;">
                                Procedimiento:
                                <asp:TextBox ID="TextBoxBusqProceds" runat="server" Width="75%"></asp:TextBox>
                                <ajaxToolkit:AutoCompleteExtender ID="TextBoxBusqProceds_AutoCompleteExtender" 
                                    runat="server" BehaviorID="TextBoxBusqProceds_AutoCompleteExtender" 
                                    DelimiterCharacters="" ServiceMethod="BusqCirugia" ServicePath="" 
                                    TargetControlID="TextBoxBusqProceds">
                                </ajaxToolkit:AutoCompleteExtender>
                            </td>
                            <td style="border: 1px solid #CCCCCC; width: 25%; background-color: #F0F0F0; text-align: center;">
                                <asp:Button ID="ButtonAgregarProced" runat="server" 
                                    Text="Agregar Procedimiento " />
                            </td>
                            <td style="width: 25%; text-align: center;">
                            <asp:Label ID="LabelCantProceds" runat="server" Font-Bold="False" 
                                    Font-Size="12pt" style="font-weight: 700; color: #339933"></asp:Label>
                                <asp:Label ID="LabelIdQxProced" runat="server" Font-Bold="False" 
                                    Font-Size="7pt" Visible="False"></asp:Label>
                                <asp:Label ID="LabelIdQxControl" runat="server" Font-Bold="False" 
                                    Font-Size="7pt" Visible="False"></asp:Label>
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" 
                                style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0">
                                <asp:Label ID="LabelProcedsPersona" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%; text-align: left;">
                                Tiempo Quirúrgico:
                                <asp:TextBox ID="TextBoxTiempoQx" runat="server" Font-Bold="True" MaxLength="4" 
                                    Width="30px"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="TextBoxTiempoQx_MaskedEditExtender" 
                                    runat="server" Mask="9.9" MaskType="Number" TargetControlID="TextBoxTiempoQx" />
                                </td>
                                <td style="width: 25%; text-align: right;">
                                Fecha Diagnostico:
                                <asp:TextBox ID="TextBoxFechaDiag" runat="server" Font-Bold="False" 
                                    MaxLength="10" Width="80px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="TextBoxFechaDiag_CalendarExtender" 
                                    runat="server" PopupButtonID="BtnCalDiagno" 
                                    TargetControlID="TextBoxFechaDiag" />
                                <ajaxToolkit:MaskedEditExtender ID="TextBoxFechaDiag_MaskedEditExtender" 
                                    runat="server" AutoComplete="False" ClearTextOnInvalid="True" 
                                    ErrorTooltipCssClass="Fecha no valida" ErrorTooltipEnabled="True" 
                                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxFechaDiag" 
                                    UserDateFormat="DayMonthYear" />
                                <asp:ImageButton ID="BtnCalDiagno" runat="server" 
                                    ImageUrl="~/Images/BtnCalendar.png" />
                            </td>
                            <td style="text-align: right;" colspan="2">
                                Fecha Valoración de Anestesia:
                                <asp:TextBox ID="TextBoxFechaAnestesia" runat="server" Font-Bold="False" MaxLength="10" 
                                    Width="80px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                                    PopupButtonID="BtnCalAnestesia" TargetControlID="TextBoxFechaAnestesia" />
                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" 
                                    AutoComplete="False" ClearTextOnInvalid="True" 
                                    ErrorTooltipCssClass="Fecha no valida" ErrorTooltipEnabled="True" 
                                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxFechaAnestesia" 
                                    UserDateFormat="DayMonthYear" />
                                <asp:ImageButton ID="BtnCalAnestesia" runat="server" 
                                    ImageUrl="~/Images/BtnCalendar.png" />
                                </td>
                        </tr>
                        <tr>
                        <td style="text-align: right;" colspan="2">
                                Fecha de Solicitud de Programación:
                                <asp:TextBox ID="TextBoxFecSolProg" runat="server" Font-Bold="False" MaxLength="10" 
                                    Width="80px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" 
                                    PopupButtonID="BtnCalSolProg" TargetControlID="TextBoxFecSolProg" />
                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" 
                                    AutoComplete="False" ClearTextOnInvalid="True" 
                                    ErrorTooltipCssClass="Fecha no valida" ErrorTooltipEnabled="True" 
                                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxFecSolProg" 
                                    UserDateFormat="DayMonthYear" />
                                <asp:ImageButton ID="BtnCalSolProg" runat="server" 
                                    ImageUrl="~/Images/BtnCalendar.png" />
                                </td>
                            <td style="text-align: right;" colspan="2">
                                Fecha Elegida por Usuario:
                                <asp:TextBox ID="TextBoxFechaEleUsuario" runat="server" Font-Bold="False" MaxLength="10" 
                                    Width="80px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" 
                                    PopupButtonID="BtnCalCirProgUsuario" TargetControlID="TextBoxFechaEleUsuario" />
                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" runat="server" 
                                    AutoComplete="False" ClearTextOnInvalid="True" 
                                    ErrorTooltipCssClass="Fecha no valida" ErrorTooltipEnabled="True" 
                                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxFechaEleUsuario" 
                                    UserDateFormat="DayMonthYear" />
                                <asp:ImageButton ID="BtnCalCirProgUsuario" runat="server" 
                                    ImageUrl="~/Images/BtnCalendar.png" />
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: right;">
                                &nbsp;</td>
                            <td colspan="2" style="text-align: right;">
                                Fecha Cirugia Programada Real:
                                <asp:TextBox ID="TextBoxFechaRealCirugia" runat="server" Font-Bold="False" MaxLength="10" 
                                    Width="80px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" 
                                    PopupButtonID="BtnCalCirugiaReal" TargetControlID="TextBoxFechaRealCirugia" />
                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" runat="server" 
                                    AutoComplete="False" ClearTextOnInvalid="True" 
                                    ErrorTooltipCssClass="Fecha no valida" ErrorTooltipEnabled="True" 
                                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxFechaRealCirugia" 
                                    UserDateFormat="DayMonthYear" />
                                <asp:ImageButton ID="BtnCalCirugiaReal" runat="server" 
                                    ImageUrl="~/Images/BtnCalendar.png" /></td>
                        
                        </tr>
                        <tr>
                            <td style="text-align: right;" colspan="2">
                                Médico Cirujano:
                                <asp:TextBox ID="TextBoxBusqMedico" runat="server" Width="75%"></asp:TextBox>
                                <ajaxToolkit:AutoCompleteExtender ID="TextBoxBusqMedico_AutoCompleteExtender" 
                                    runat="server" BehaviorID="TextBoxBusqMedico_AutoCompleteExtender" 
                                    DelimiterCharacters="" ServiceMethod="BusqMedico" ServicePath="" 
                                    TargetControlID="TextBoxBusqMedico">
                                </ajaxToolkit:AutoCompleteExtender>
                            </td>
                            <td style="border: 1px solid #CCCCCC; width: 25%; text-align: center; background-color: #F0F0F0;">
                                <asp:Button ID="ButtonSelecMedico" runat="server" 
                                    Text="Seleccionar Médico" />
                            </td>
                            <td style="width: 25%; text-align: center;">
                                <asp:Label ID="LabelIdMedico" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%; text-align: right;">
                                Observaciones:</td>
                            <td style="width: 75%; text-align: left;" colspan="3">
                                <asp:TextBox ID="TextBoxObservaciones" runat="server" Font-Bold="True" 
                                    Height="60px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%; text-align: right;">
                                &nbsp;</td>
                            <td style="width: 25%; text-align: right;">
                                &nbsp;</td>
                            <td style="width: 25%; text-align: right;">
                                &nbsp;</td>
                            <td style="border: 1px solid #CCCCCC; width: 25%; text-align: center; background-color: #F0F0F0;">
                                <asp:Button ID="ButtonGuardarControlQx" runat="server" 
                                    Text="Guardar Segumiento Qx" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 25%">
                <asp:Button ID="Button1" runat="server" Text="Button" />
            </td>
            <td style="width: 25%">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="width: 25%">
                &nbsp;</td>
            <td style="width: 25%">
                &nbsp;</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT OID, PACNUMDOC, PACPRINOM, PACSEGNOM, PACPRIAPE, PACSEGAPE FROM GENPACIEN WHERE (PACNUMDOC = N'123456')">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataBridge" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
                </asp:SqlDataSource>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                <table class="style1">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
    </table>

    
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
    
</asp:Content>

