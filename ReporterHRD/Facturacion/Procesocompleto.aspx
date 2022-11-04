<%@ Page Title="555" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Procesocompleto.aspx.vb" Inherits="Procesocompleto" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/EnEspera.ascx" tagname="Cargando" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<head>
  <script language="javascript">

      function ShowModalPopup() {
          $find("Panel1_ModalPopupExtender").show();
      }

      function HideModalPopup() {
          $find("Panel1_ModalPopupExtender").hide();
      }

</script>

 

</head>
     
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
    <asp:Panel ID="Panel1" runat="server">
        444



    </asp:Panel>

</asp:Content>