<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeBehind="Manual.aspx.vb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">

        <script language="javascript" type="text/javascript">

function AbrePdf () {

    hidden = open('~/Mantenimiento/Manual.pdf','NewWindow','top=0,left=0,width=800,height=600,status=no,resizable=no,scrollbars=yes');

}

</script>


        <em src="~/Mantenimiento/Manual.pdf" type="application/pdf" width="100%" height="600px" />

       <iframe src="http://docs.google.com/gview?url=http://example.com/mypdf.pdf&embedded=true"
  style="width:718px; height:700px;" frameborder="0"></iframe>

    </asp:Panel>

            


</asp:Content>
