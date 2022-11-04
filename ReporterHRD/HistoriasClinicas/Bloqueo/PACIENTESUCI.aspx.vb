Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Web

Public Class Actividad
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

       

    End Sub


    Protected Sub BtnExportar_Click(sender As Object, e As System.EventArgs) Handles BtnExportar.Click

        GridView1.AllowPaging = False
        GridView1.DataBind()

        Try


            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            GridView1.EnableViewState = False
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(GridView1)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=PACIENTES_UCI.xls")
            Response.Charset = "UTF-8"

            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
            'Try
        Catch ex As Exception

    End Try
        GridView1.AllowPaging = True



    End Sub

Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

         SqlDataSource1.UpdateCommand = "UPDATE GENPACIEN SET GENPACIEN.GPAHCBLOQ=1 FROM   GENPACIEN  INNER JOIN ADNINGRESO ON GENPACIEN.oid = ADNINGRESO.GENPACIEN   INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES   INNER JOIN HPNDEFCAM  On HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID   WHERE (HPNDEFCAM.HPNSUBGRU IN (3,20)) AND HPNESTANC.HESTIPOES=1 AND HPNESTANC.HESFECSAL IS NULL" 
        SqlDataSource1.Update()
       
  ' Response.AddHeader("REFRESH", "1;PACIENTESUCI.aspx")      
 
    End Sub
	
	Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

         SqlDataSource1.UpdateCommand = "UPDATE GENPACIEN SET GENPACIEN.GPAHCBLOQ=0 FROM   GENPACIEN  INNER JOIN ADNINGRESO ON GENPACIEN.oid = ADNINGRESO.GENPACIEN   INNER JOIN HPNESTANC ON ADNINGRESO.OID=HPNESTANC.ADNINGRES   INNER JOIN HPNDEFCAM  On HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID   WHERE (HPNDEFCAM.HPNSUBGRU IN (3,20)) AND HPNESTANC.HESTIPOES=1 AND HPNESTANC.HESFECSAL IS NULL" 
        SqlDataSource1.Update()
       
  ' Response.AddHeader("REFRESH", "1;PACIENTESUCI.aspx")      
 
    End Sub

End Class