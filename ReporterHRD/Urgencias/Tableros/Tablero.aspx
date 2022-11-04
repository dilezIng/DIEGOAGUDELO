

<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Tablero.aspx.vb" Inherits="Tablero" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-family:Tahoma;
        }
        .auto-style2 {
            width: 172px;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            width: 172px;
            height: 23px;
            text-align: right;
        }
        .auto-style5 {
            width: 172px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%" >
                    
                        <asp:TabPanel runat="server" HeaderText="Pasillo" ToolTip="Tablero Urgencias" Width="100%" ID="TabPanel"><HeaderTemplate>
   Pasillo 
</HeaderTemplate>
<ContentTemplate>


    <table style="width: 100%;">
        <tr>
            <td style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" colspan="6" class="auto-style1" > *** Tablero Urgencias ***</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">
                <asp:Image ID="Image6" runat="server" Height="15px" ImageUrl="~/Images/Rojo.jpg" />
            </td>
            <td>06:00 Horas +</td>
            <td>&nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT CASE WHEN ABS(DATEDIFF(MI , (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE()))/60 &lt;=  2 THEN '~/Images/Verde.png' ELSE (CASE WHEN ABS(DATEDIFF(MI , (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) / 60 &lt;=  5 THEN '~/Images/Amarillo.png' ELSE '~/Images/Rojo.png' END) END AS Semaforo, ADNINGRESO.AINCONSEC AS Ingreso, ADNINGRESO.AINFECING AS Fech_Ingreso,HCNTRIAGE.HCTFECTRI AS Triage, HCNTRIAGE.HCNCLAURGTR AS Clasificacion, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, GEENENTADM.ENTNOMBRE AS Entidad,  GENDETCON.GDECODIGO AS Regimen , 
(SELECT GMENOMCOM FROM GENMEDICO WHERE (OID = (SELECT TOP (1) HCNFOLIO.GENMEDICO FROM HCNFOLIO INNER JOIN HCNDIAPAC ON HCNFOLIO.OID = HCNDIAPAC.HCNFOLIO WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.OID))) AS Medico, 
(SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID) AS Fech_1er_Folio, 
(SELECT GMENOMCOM FROM GENMEDICO AS GENMEDICO_1 WHERE (OID = (SELECT TOP (1) HCNFOLIO_4.GENMEDICOA FROM HCNFOLIO AS HCNFOLIO_4 INNER JOIN HCNDIAPAC AS HCNDIAPAC_4 ON HCNFOLIO_4.OID = HCNDIAPAC_4.HCNFOLIO WHERE (HCNFOLIO_4.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_4.OID DESC))) AS Ultimo_Medico, 
(SELECT GEEDESCRI FROM GENESPECI WHERE (OID = (SELECT TOP (1) ESPECIALIDADES FROM GENESPMED WHERE (MEDICOS = (SELECT TOP (1) HCNFOLIO_3.GENMEDICOA FROM HCNFOLIO AS HCNFOLIO_3 INNER JOIN HCNDIAPAC AS HCNDIAPAC_3 ON HCNFOLIO_3.OID = HCNDIAPAC_3.HCNFOLIO WHERE (HCNFOLIO_3.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_3.OID DESC))))) AS Especialidad,
(SELECT TOP (1) HCNFOLIO_2.HCNFECCONF FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNDIAPAC AS HCNDIAPAC_2 ON HCNFOLIO_2.OID = HCNDIAPAC_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC) AS Fech_Ultimo_folio, 
(SELECT DIANOMBRE FROM GENDIAGNO WHERE (OID = (SELECT TOP (1) GENDIAGNO FROM HCNDIAPAC AS HCNDIAPAC_1 WHERE (HCNFOLIO = HCNFOLIO_1.OID) ORDER BY OID DESC))) AS DX, 
(SELECT CASE WHEN HCNINDMED.HCITIPIND = 0 THEN 'Orden de Hospitalización' WHEN HCNINDMED.HCITIPIND = 1 THEN 'Observación URG' WHEN HCNINDMED.HCITIPIND = 2 THEN 'Cirugia' WHEN HCNINDMED.HCITIPIND = 3 THEN 'Remision' WHEN HCNINDMED.HCITIPIND = 5 THEN 'Orden de Salida' WHEN HCNINDMED.HCITIPIND = 7 THEN 'En Espera' ELSE ' ' END AS Tipo_Indicación FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC)) AS Tipo_Indicación, 
(SELECT CASE WHEN HCNINDMED.HCIDETIND IS NULL THEN 'Sin indicación' ELSE HCNINDMED.HCIDETIND END AS Indicación FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC)) AS Indicación,
ABS(DATEDIFF(mi, (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) / 1440 AS Días, 
ABS(DATEDIFF(MI, (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) / 60 % 24 AS Horas, 
ABS(DATEDIFF(MI, (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) % 60 AS Minutos 
,case when (select count(HCNREFER.oid) From HCNREFER Inner Join HCNFOLIO as hc On hc.OID = HCNREFER.HCNFOLIO where hc.ADNINGRESO = ADNINGRESO.OID) is null then 'No' else (select count(HCNREFER.oid) From HCNREFER Inner Join HCNFOLIO as hc On hc.OID = HCNREFER.HCNFOLIO where hc.ADNINGRESO = ADNINGRESO.OID) end 'Ref'
,case when (SELECT count(HCNINTERC_1.OID) FROM HCNINTERC AS HCNINTERC_1 INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID  WHERE (HCNINTERC_1.HCNINTERR IS NULL) AND (HCNINTERC_1.HCIREGSUS = 0) and  HC.ADNINGRESO = ADNINGRESO.OID)  is null then 'No' else (SELECT count(HCNINTERC_1.OID) FROM HCNINTERC AS HCNINTERC_1 INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID  WHERE (HCNINTERC_1.HCNINTERR IS NULL) AND (HCNINTERC_1.HCIREGSUS = 0) and  HC.ADNINGRESO = ADNINGRESO.OID)  end 'Interconsulta'
,(select count(HCNSOLEXA.oid)  FROM HCNSOLEXA  left JOIN LBNORDDET ON  HCNSOLEXA.OID =LBNORDDET.HCNSOLEXA1 INNER JOIN LBNEXAMEN ON LBNORDDET.LBNEXAMEN=LBNEXAMEN.OID left JOIN HCNRESEXA ON LBNORDDET.OID=HCNRESEXA.LBNORDDET where HCNRESEXA.HCRFECINT is null and HCNSOLEXA.ADNINGRESO = ADNINGRESO.OID) as 'Lab'
,(select count(HCNSOLEXA.OID) from HCNSOLEXA Inner Join GENSERIPS On GENSERIPS.OID = HCNSOLEXA.GENSERIPS where HCNSOLEXA.HCNRESEXA Is Null and HCNSOLEXA.ADNINGRESO = ADNINGRESO.OID and  GENSERIPS.GENARESER1 In ('27', '39', '100', '101', '102') ) as 'Imagenes'


FROM ADNINGRESO 
INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID 
INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID 
INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON ADNINGRESO.OID = HCNFOLIO_1.ADNINGRESO 
INNER JOIN HCNTIPHIS ON HCNFOLIO_1.HCNTIPHIS = HCNTIPHIS.OID  
INNER JOIN GENESPECI AS GENESPECI_1 ON HCNFOLIO_1.GENESPECI = GENESPECI_1.OID
INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID  
INNER JOIN HCNINDMED ON HCNFOLIO_1.HCNINDMED = HCNINDMED.OID AND HCNFOLIO_1.OID = HCNINDMED.HCNFOLIO 
INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON =GENDETCON.OID                  
WHERE (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINTIPING = 1) AND ADNINGRESO.ADNCENATE=1 AND (ADNINGRESO.AINESTADO = 0) AND (HCNFOLIO_1.HCNTIPHIS = 79) AND (ADNINGRESO.AINFECHOS IS NULL) AND (ABS(DATEDIFF(mi, ADNINGRESO.AINFECING, GETDATE())) / 1440 &lt; 3) AND ((SELECT TOP (1) ADENUMEGR FROM ADNEGRESO WHERE (ADNINGRESO = ADNINGRESO.OID)) IS NULL)  and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 5) and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 2) ORDER BY Fech_1er_Folio">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">
                <asp:Image ID="Image4" runat="server" Height="15px" ImageUrl="~/Images/Amarillo.jpg" />
            </td>
            <td>03:01 a 05:59 Horas </td>
            <td>&nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT CASE WHEN ABS(DATEDIFF(MI , (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE()))/60 &lt;=  2 THEN '~/Images/Verde.png' ELSE (CASE WHEN ABS(DATEDIFF(MI , (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) / 60 &lt;=  5 THEN '~/Images/Amarillo.png' ELSE '~/Images/Rojo.png' END) END AS Semaforo, ADNINGRESO.AINCONSEC AS Ingreso, ADNINGRESO.AINFECING AS Fech_Ingreso,HCNTRIAGE.HCTFECTRI AS Triage, HCNTRIAGE.HCNCLAURGTR AS Clasificacion, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, GEENENTADM.ENTNOMBRE AS Entidad,  GENDETCON.GDECODIGO AS Regimen , 
(SELECT GMENOMCOM FROM GENMEDICO WHERE (OID = (SELECT TOP (1) HCNFOLIO.GENMEDICO FROM HCNFOLIO INNER JOIN HCNDIAPAC ON HCNFOLIO.OID = HCNDIAPAC.HCNFOLIO WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.OID))) AS Medico, 
(SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID) AS Fech_1er_Folio, 
(SELECT GMENOMCOM FROM GENMEDICO AS GENMEDICO_1 WHERE (OID = (SELECT TOP (1) HCNFOLIO_4.GENMEDICOA FROM HCNFOLIO AS HCNFOLIO_4 INNER JOIN HCNDIAPAC AS HCNDIAPAC_4 ON HCNFOLIO_4.OID = HCNDIAPAC_4.HCNFOLIO WHERE (HCNFOLIO_4.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_4.OID DESC))) AS Ultimo_Medico, 
(SELECT GEEDESCRI FROM GENESPECI WHERE (OID = (SELECT TOP (1) ESPECIALIDADES FROM GENESPMED WHERE (MEDICOS = (SELECT TOP (1) HCNFOLIO_3.GENMEDICOA FROM HCNFOLIO AS HCNFOLIO_3 INNER JOIN HCNDIAPAC AS HCNDIAPAC_3 ON HCNFOLIO_3.OID = HCNDIAPAC_3.HCNFOLIO WHERE (HCNFOLIO_3.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_3.OID DESC))))) AS Especialidad,
(SELECT TOP (1) HCNFOLIO_2.HCNFECCONF FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNDIAPAC AS HCNDIAPAC_2 ON HCNFOLIO_2.OID = HCNDIAPAC_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC) AS Fech_Ultimo_folio, 
(SELECT DIANOMBRE FROM GENDIAGNO WHERE (OID = (SELECT TOP (1) GENDIAGNO FROM HCNDIAPAC AS HCNDIAPAC_1 WHERE (HCNFOLIO = HCNFOLIO_1.OID) ORDER BY OID DESC))) AS DX, 
(SELECT CASE WHEN HCNINDMED.HCITIPIND = 0 THEN 'Orden de Hospitalización' WHEN HCNINDMED.HCITIPIND = 1 THEN 'Observación URG' WHEN HCNINDMED.HCITIPIND = 2 THEN 'Cirugia' WHEN HCNINDMED.HCITIPIND = 3 THEN 'Remision' WHEN HCNINDMED.HCITIPIND = 5 THEN 'Orden de Salida' WHEN HCNINDMED.HCITIPIND = 7 THEN 'En Espera' ELSE ' ' END AS Tipo_Indicación FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC)) AS Tipo_Indicación, 
(SELECT CASE WHEN HCNINDMED.HCIDETIND IS NULL THEN 'Sin indicación' ELSE HCNINDMED.HCIDETIND END AS Indicación FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC)) AS Indicación,
ABS(DATEDIFF(mi, (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) / 1440 AS Días, 
ABS(DATEDIFF(MI, (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) / 60 % 24 AS Horas, 
ABS(DATEDIFF(MI, (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) % 60 AS Minutos 
,case when (select count(HCNREFER.oid) From HCNREFER Inner Join HCNFOLIO as hc On hc.OID = HCNREFER.HCNFOLIO where hc.ADNINGRESO = ADNINGRESO.OID) is null then 'No' else (select count(HCNREFER.oid) From HCNREFER Inner Join HCNFOLIO as hc On hc.OID = HCNREFER.HCNFOLIO where hc.ADNINGRESO = ADNINGRESO.OID) end 'Ref'
,case when (SELECT count(HCNINTERC_1.OID) FROM HCNINTERC AS HCNINTERC_1 INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID  WHERE (HCNINTERC_1.HCNINTERR IS NULL) AND (HCNINTERC_1.HCIREGSUS = 0) and  HC.ADNINGRESO = ADNINGRESO.OID)  is null then 'No' else (SELECT count(HCNINTERC_1.OID) FROM HCNINTERC AS HCNINTERC_1 INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID  WHERE (HCNINTERC_1.HCNINTERR IS NULL) AND (HCNINTERC_1.HCIREGSUS = 0) and  HC.ADNINGRESO = ADNINGRESO.OID)  end 'Interconsulta'
,(select count(HCNSOLEXA.oid)  FROM HCNSOLEXA  left JOIN LBNORDDET ON  HCNSOLEXA.OID =LBNORDDET.HCNSOLEXA1 INNER JOIN LBNEXAMEN ON LBNORDDET.LBNEXAMEN=LBNEXAMEN.OID left JOIN HCNRESEXA ON LBNORDDET.OID=HCNRESEXA.LBNORDDET where HCNRESEXA.HCRFECINT is null and HCNSOLEXA.ADNINGRESO = ADNINGRESO.OID) as 'Lab'
,(select count(HCNSOLEXA.OID) from HCNSOLEXA Inner Join GENSERIPS On GENSERIPS.OID = HCNSOLEXA.GENSERIPS where HCNSOLEXA.HCNRESEXA Is Null and HCNSOLEXA.ADNINGRESO = ADNINGRESO.OID and  GENSERIPS.GENARESER1 In ('27', '39', '100', '101', '102') ) as 'Imagenes'


FROM ADNINGRESO 
INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID 
INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID 
INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON ADNINGRESO.OID = HCNFOLIO_1.ADNINGRESO 
INNER JOIN HCNTIPHIS ON HCNFOLIO_1.HCNTIPHIS = HCNTIPHIS.OID  INNER JOIN GENESPECI AS GENESPECI_1 ON HCNFOLIO_1.GENESPECI = GENESPECI_1.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID  INNER JOIN HCNINDMED ON HCNFOLIO_1.HCNINDMED = HCNINDMED.OID AND HCNFOLIO_1.OID = HCNINDMED.HCNFOLIO INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON =GENDETCON.OID WHERE (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINTIPING = 1) AND (ADNINGRESO.AINESTADO = 0) AND (HCNFOLIO_1.HCNTIPHIS in (1,140)) AND (ADNINGRESO.AINFECHOS IS NULL) AND (ABS(DATEDIFF(mi, ADNINGRESO.AINFECING, GETDATE())) / 1440 &lt; 3) AND ((SELECT TOP (1) ADENUMEGR FROM ADNEGRESO WHERE (ADNINGRESO = ADNINGRESO.OID)) IS NULL)  and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 5) and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 2)  and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 1) and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 0) and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 3) ORDER BY Fech_1er_Folio">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
            <td class="auto-style4">
                <asp:Image ID="Image8" runat="server" Height="15px" ImageUrl="~/Images/Verde.jpg" />
            </td>
            <td class="auto-style3">00:00 a 3:00 Horas</td>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="6">Pacientes Pediatria que se Encuentran en Consultorios-Procedimientos(Pasillo)
                <asp:Label ID="LbPediatria" runat="server" CssClass="auto-style8"></asp:Label>
				<asp:Button ID="BtnExportar2" runat="server" Text="Exportar a Excel" style="height: 26px" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:GridView ID="GridViewPed" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="auto-style10" style="font-size: x-small">
                    <AlternatingRowStyle BackColor="#CCFFCC" />
                    <Columns>
                       <asp:ImageField DataImageUrlField="Semaforo"  HeaderText="Semaforo">
                           <ControlStyle Height="100%" Width="100%" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        
                        <asp:BoundField DataField="Triage" HeaderText="Triage" SortExpression="Triage" />
                        <asp:BoundField DataField="Clasificacion" HeaderText="Clas" SortExpression="Clasificacion" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                        <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                        <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                        <asp:BoundField DataField="Medico" HeaderText="Medico" ReadOnly="True" SortExpression="Medico" />
                        <asp:BoundField DataField="Fech_1er_Folio" HeaderText="Fech_1er_Folio" ReadOnly="True" SortExpression="Fech_1er_Folio" />
                        <asp:BoundField DataField="Ultimo_Medico" HeaderText="Ultimo_Medico" ReadOnly="True" SortExpression="Ultimo_Medico" />
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" ReadOnly="True" SortExpression="Especialidad" />
                        <asp:BoundField DataField="Fech_Ultimo_folio" HeaderText="Fech_Ultimo_folio" ReadOnly="True" SortExpression="Fech_Ultimo_folio" />
                        <asp:BoundField DataField="DX" HeaderText="DX" ReadOnly="True" SortExpression="DX" />
                        <asp:BoundField DataField="Tipo_Indicación" HeaderText="Tipo_Indicación" ReadOnly="True" SortExpression="Tipo_Indicación" />
                        <asp:BoundField DataField="Indicación" HeaderText="Indicación" ReadOnly="True" SortExpression="Indicación" />
<asp:BoundField DataField="Ref" HeaderText="Ref" ReadOnly="True" SortExpression="Ref" />                      
<asp:BoundField DataField="Interconsulta" HeaderText="Inter" ReadOnly="True" SortExpression="Interconsulta" />  
<asp:BoundField DataField="Lab" HeaderText="Lab" ReadOnly="True" SortExpression="Lab" /> 
<asp:BoundField DataField="Imagenes" HeaderText="ImgenDX" ReadOnly="True" SortExpression="Imagenes" />   
					  <asp:BoundField DataField="Días" HeaderText="Días" ReadOnly="True" SortExpression="Días" />
                        <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Hrs" />
                        <asp:BoundField DataField="Minutos" HeaderText="Min" ReadOnly="True" SortExpression="Min" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6">Pacientes Adultos que se Encuentran en Consultorios-Procedimientos(Pasillo)
                <asp:Label ID="LbAdulto" runat="server" CssClass="auto-style8"></asp:Label>
           <asp:Button ID="BtnExportar" runat="server" Text="Exportar a Excel" style="height: 26px" /> </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:GridView ID="GridViewAdul" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="auto-style10" DataSourceID="SqlDataSource3" style="font-size: x-small">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="Semaforo"  HeaderText="Semaforo">
                            <ControlStyle Height="100%" Width="100%" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                      
                        <asp:BoundField DataField="Triage" HeaderText="Triage" SortExpression="Triage" />
                        <asp:BoundField DataField="Clasificacion" HeaderText="Clas" SortExpression="Clasificacion" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                        <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                        <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                        <asp:BoundField DataField="Medico" HeaderText="Medico" ReadOnly="True" SortExpression="Medico" />
                        <asp:BoundField DataField="Fech_1er_Folio" HeaderText="Fech_1er_Folio" ReadOnly="True" SortExpression="Fech_1er_Folio" />
                        <asp:BoundField DataField="Ultimo_Medico" HeaderText="Ultimo_Medico" ReadOnly="True" SortExpression="Ultimo_Medico" />
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" ReadOnly="True" SortExpression="Especialidad" />
                        <asp:BoundField DataField="Fech_Ultimo_folio" HeaderText="Fech_Ultimo_folio" ReadOnly="True" SortExpression="Fech_Ultimo_folio" />
                        <asp:BoundField DataField="DX" HeaderText="DX" ReadOnly="True" SortExpression="DX" />
                        <asp:BoundField DataField="Tipo_Indicación" HeaderText="Tipo_Indicación" ReadOnly="True" SortExpression="Tipo_Indicación" />
                        <asp:BoundField DataField="Indicación" HeaderText="Indicación" ReadOnly="True" SortExpression="Indicación" />
<asp:BoundField DataField="Ref" HeaderText="Ref" ReadOnly="True" SortExpression="Ref" />                      
<asp:BoundField DataField="Interconsulta" HeaderText="Inter" ReadOnly="True" SortExpression="Interconsulta" />  
<asp:BoundField DataField="Lab" HeaderText="Lab" ReadOnly="True" SortExpression="Lab" /> 
<asp:BoundField DataField="Imagenes" HeaderText="ImgenDX" ReadOnly="True" SortExpression="Imagenes" />                         
					   <asp:BoundField DataField="Días" HeaderText="Días" ReadOnly="True" SortExpression="Días" />
                        <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Hrs" />
                        <asp:BoundField DataField="Minutos" HeaderText="Min" ReadOnly="True" SortExpression="Min" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>


        <asp:Label ID="Label1" runat="server" Text="Ing Diego A." Font-Size="XX-Small"></asp:Label>
        </asp:Panel>
</ContentTemplate>
</asp:TabPanel>
<asp:TabPanel runat="server" HeaderText="Remisi&#243;n y Hospitalizaci&#243;n" ToolTip="Tablero Urgencias" ID="TabPanel1" idth="100%"><HeaderTemplate>
 Remisión y Hospitalización 
</HeaderTemplate>
<ContentTemplate>
     <asp:Panel ID="PanelHR" runat="server">


         <table style="width: 100%;">
             <tr>
                 <td colspan="8">Pacientes Adultos que se Encuentran en Consultorios-Procedimientos Pendientes por Salir de Urgencias
                     <asp:Label ID="LbAdulto0" runat="server" CssClass="auto-style8"></asp:Label>
                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT CASE WHEN ABS(DATEDIFF(MI , (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE()))/60 &lt;=  2 THEN '~/Images/Verde.png' ELSE (CASE WHEN ABS(DATEDIFF(MI , (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) / 60 &lt;=  5 THEN '~/Images/Amarillo.png' ELSE '~/Images/Rojo.png' END) END AS Semaforo, ADNINGRESO.AINCONSEC AS Ingreso, ADNINGRESO.AINFECING AS Fech_Ingreso,HCNTRIAGE.HCTFECTRI AS Triage, HCNTRIAGE.HCNCLAURGTR AS Clasificacion, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, GEENENTADM.ENTNOMBRE AS Entidad,  GENDETCON.GDECODIGO AS Regimen , 
(SELECT GMENOMCOM FROM GENMEDICO WHERE (OID = (SELECT TOP (1) HCNFOLIO.GENMEDICO FROM HCNFOLIO INNER JOIN HCNDIAPAC ON HCNFOLIO.OID = HCNDIAPAC.HCNFOLIO WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.OID))) AS Medico, 
(SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID) AS Fech_1er_Folio, 
(SELECT GMENOMCOM FROM GENMEDICO AS GENMEDICO_1 WHERE (OID = (SELECT TOP (1) HCNFOLIO_4.GENMEDICOA FROM HCNFOLIO AS HCNFOLIO_4 INNER JOIN HCNDIAPAC AS HCNDIAPAC_4 ON HCNFOLIO_4.OID = HCNDIAPAC_4.HCNFOLIO WHERE (HCNFOLIO_4.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_4.OID DESC))) AS Ultimo_Medico, 
(SELECT GEEDESCRI FROM GENESPECI WHERE (OID = (SELECT TOP (1) ESPECIALIDADES FROM GENESPMED WHERE (MEDICOS = (SELECT TOP (1) HCNFOLIO_3.GENMEDICOA FROM HCNFOLIO AS HCNFOLIO_3 INNER JOIN HCNDIAPAC AS HCNDIAPAC_3 ON HCNFOLIO_3.OID = HCNDIAPAC_3.HCNFOLIO WHERE (HCNFOLIO_3.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_3.OID DESC))))) AS Especialidad,
(SELECT TOP (1) HCNFOLIO_2.HCNFECCONF FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNDIAPAC AS HCNDIAPAC_2 ON HCNFOLIO_2.OID = HCNDIAPAC_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC) AS Fech_Ultimo_folio, 
(SELECT DIANOMBRE FROM GENDIAGNO WHERE (OID = (SELECT TOP (1) GENDIAGNO FROM HCNDIAPAC AS HCNDIAPAC_1 WHERE (HCNFOLIO = HCNFOLIO_1.OID) ORDER BY OID DESC))) AS DX, 
(SELECT CASE WHEN HCNINDMED.HCITIPIND = 0 THEN 'Orden de Hospitalización' WHEN HCNINDMED.HCITIPIND = 1 THEN 'Observación URG' WHEN HCNINDMED.HCITIPIND = 2 THEN 'Cirugia' WHEN HCNINDMED.HCITIPIND = 3 THEN 'Remision' WHEN HCNINDMED.HCITIPIND = 5 THEN 'Orden de Salida' WHEN HCNINDMED.HCITIPIND = 7 THEN 'En Espera' ELSE ' ' END AS Tipo_Indicación FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC)) AS Tipo_Indicación, 
(SELECT CASE WHEN HCNINDMED.HCIDETIND IS NULL THEN 'Sin indicación' ELSE HCNINDMED.HCIDETIND END AS Indicación FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC)) AS Indicación,
ABS(DATEDIFF(mi, (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) / 1440 AS Días, 
ABS(DATEDIFF(MI, (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) / 60 % 24 AS Horas, 
ABS(DATEDIFF(MI, (SELECT TOP (1) HCNFOLIO_5.HCFECFOL FROM HCNFOLIO AS HCNFOLIO_5 INNER JOIN HCNDIAPAC AS HCNDIAPAC_5 ON HCNFOLIO_5.OID = HCNDIAPAC_5.HCNFOLIO WHERE (HCNFOLIO_5.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_5.OID), GETDATE())) % 60 AS Minutos 
,case when (select count(HCNREFER.oid) From HCNREFER Inner Join HCNFOLIO as hc On hc.OID = HCNREFER.HCNFOLIO where hc.ADNINGRESO = ADNINGRESO.OID) is null then 'No' else (select count(HCNREFER.oid) From HCNREFER Inner Join HCNFOLIO as hc On hc.OID = HCNREFER.HCNFOLIO where hc.ADNINGRESO = ADNINGRESO.OID) end 'Ref'
,case when (SELECT count(HCNINTERC_1.OID) FROM HCNINTERC AS HCNINTERC_1 INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID  WHERE (HCNINTERC_1.HCNINTERR IS NULL) AND (HCNINTERC_1.HCIREGSUS = 0) and  HC.ADNINGRESO = ADNINGRESO.OID)  is null then 'No' else (SELECT count(HCNINTERC_1.OID) FROM HCNINTERC AS HCNINTERC_1 INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID  WHERE (HCNINTERC_1.HCNINTERR IS NULL) AND (HCNINTERC_1.HCIREGSUS = 0) and  HC.ADNINGRESO = ADNINGRESO.OID)  end 'Interconsulta'
,(select count(HCNSOLEXA.oid)  FROM HCNSOLEXA  left JOIN LBNORDDET ON  HCNSOLEXA.OID =LBNORDDET.HCNSOLEXA1 INNER JOIN LBNEXAMEN ON LBNORDDET.LBNEXAMEN=LBNEXAMEN.OID left JOIN HCNRESEXA ON LBNORDDET.OID=HCNRESEXA.LBNORDDET where HCNRESEXA.HCRFECINT is null and HCNSOLEXA.ADNINGRESO = ADNINGRESO.OID) as 'Lab'
,(select count(HCNSOLEXA.OID) from HCNSOLEXA Inner Join GENSERIPS On GENSERIPS.OID = HCNSOLEXA.GENSERIPS where HCNSOLEXA.HCNRESEXA Is Null and HCNSOLEXA.ADNINGRESO = ADNINGRESO.OID and  GENSERIPS.GENARESER1 In ('27', '39', '100', '101', '102') ) as 'Imagenes'

FROM ADNINGRESO 
INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID 
INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID 
INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON ADNINGRESO.OID = HCNFOLIO_1.ADNINGRESO 
INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON =GENDETCON.OID  
INNER JOIN HCNTIPHIS ON HCNFOLIO_1.HCNTIPHIS = HCNTIPHIS.OID  INNER JOIN GENESPECI AS GENESPECI_1 ON HCNFOLIO_1.GENESPECI = GENESPECI_1.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID  INNER JOIN HCNINDMED ON HCNFOLIO_1.HCNINDMED = HCNINDMED.OID AND HCNFOLIO_1.OID = HCNINDMED.HCNFOLIO 
                    WHERE (ADNINGRESO.AINURGCON = 0) AND  ADNINGRESO.ADNCENATE=1 AND (ADNINGRESO.AINTIPING = 1) AND (ADNINGRESO.AINESTADO = 0) AND (HCNFOLIO_1.HCNTIPHIS in (1,140)) AND (ADNINGRESO.AINFECHOS IS NULL) AND 
                    (ABS(DATEDIFF(mi, ADNINGRESO.AINFECING, GETDATE())) / 1440 &lt; 3) AND ((SELECT TOP (1) ADENUMEGR FROM ADNEGRESO WHERE (ADNINGRESO = ADNINGRESO.OID)) IS NULL) 
                    and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 5)
                    and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 2)  
                    and ((SELECT HCNINDMED.HCITIPIND FROM HCNINDMED WHERE (OID)= (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))&lt;&gt; 7) 
                    ORDER BY Fech_1er_Folio">
					
					</asp:SqlDataSource>
                 </td>
             </tr>
             <tr>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td class="auto-style5"><asp:Image ID="Image9" runat="server" Height="15px" ImageUrl="~/Images/Rojo.jpg" />
                 </td>
                 <td>06:00 Horas +</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
             </tr>
             <tr>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td class="auto-style5"><asp:Image ID="Image10" runat="server" Height="15px" ImageUrl="~/Images/Amarillo.jpg" />
                 </td>
                 <td>03:01 a 05:59 Horas</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
             </tr>
             <tr>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td class="auto-style4">
                     <asp:Image ID="Image11" runat="server" Height="15px" ImageUrl="~/Images/Verde.jpg" />
                 </td>
                 <td class="auto-style3">00:00 a 3:00 Horas</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
             </tr>
             <tr>
                 <td colspan="8">
                     <asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CssClass="auto-style10" style="font-size: x-small">
                    <AlternatingRowStyle BackColor="#FFFFCC" />
                    <Columns>
                       <asp:ImageField DataImageUrlField="Semaforo"  HeaderText="Semaforo">
                           <ControlStyle Height="100%" Width="100%" />
                        </asp:ImageField> 
                             <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                             <asp:BoundField DataField="Fech_Ingreso" HeaderText="Fech_Ingreso" SortExpression="Fech_Ingreso" />
                             <asp:BoundField DataField="Triage" HeaderText="Triage" SortExpression="Triage" />
                             <asp:BoundField DataField="Clasificacion" HeaderText="Clas" SortExpression="Clasificacion" />
                             <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                             <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                             <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                             <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                             <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                             <asp:BoundField DataField="Medico" HeaderText="Medico" ReadOnly="True" SortExpression="Medico" />
                             <asp:BoundField DataField="Fech_1er_Folio" HeaderText="Fech_1er_Folio" ReadOnly="True" SortExpression="Fech_1er_Folio" />
                             <asp:BoundField DataField="Ultimo_Medico" HeaderText="Ultimo_Medico" ReadOnly="True" SortExpression="Ultimo_Medico" />
                             <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" ReadOnly="True" SortExpression="Especialidad" />
                             <asp:BoundField DataField="Fech_Ultimo_folio" HeaderText="Fech_Ultimo_folio" ReadOnly="True" SortExpression="Fech_Ultimo_folio" />
                             <asp:BoundField DataField="DX" HeaderText="DX" ReadOnly="True" SortExpression="DX" />
                             <asp:BoundField DataField="Tipo_Indicación" HeaderText="Tipo_Indicación" ReadOnly="True" SortExpression="Tipo_Indicación" />
                             <asp:BoundField DataField="Indicación" HeaderText="Indicación" ReadOnly="True" SortExpression="Indicación" />
<asp:BoundField DataField="Ref" HeaderText="Ref" ReadOnly="True" SortExpression="Ref" />                      
<asp:BoundField DataField="Interconsulta" HeaderText="Inter" ReadOnly="True" SortExpression="Interconsulta" />  
<asp:BoundField DataField="Lab" HeaderText="Lab" ReadOnly="True" SortExpression="Lab" /> 
<asp:BoundField DataField="Imagenes" HeaderText="ImgenDX" ReadOnly="True" SortExpression="Imagenes" />                              
							<asp:BoundField DataField="Días" HeaderText="Días" ReadOnly="True" SortExpression="Días" />
                             <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Horas" />
                             <asp:BoundField DataField="Minutos" HeaderText="Min" ReadOnly="True" SortExpression="Minutos" />
                         </Columns>
                     </asp:GridView>
                 </td>
             </tr>
         </table>





     <asp:Label ID="Label2" runat="server" Text="Ing Diego A." Font-Size="XX-Small"></asp:Label>
        </asp:Panel> 
</ContentTemplate>
</asp:TabPanel>
    </asp:TabContainer>

</asp:Content>
