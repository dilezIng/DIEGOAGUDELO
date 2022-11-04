Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic


Public Class FunBasicas

    Public Function NomMeses(ByVal NumMes As Integer) As String

        If NumMes = 1 Then Return "Enero"
        If NumMes = 2 Then Return "Febrero"
        If NumMes = 3 Then Return "Marzo"
        If NumMes = 4 Then Return "Abril"
        If NumMes = 5 Then Return "Mayo"
        If NumMes = 6 Then Return "Junio"
        If NumMes = 7 Then Return "Julio"
        If NumMes = 8 Then Return "Agosto"
        If NumMes = 9 Then Return "Septiembre"
        If NumMes = 10 Then Return "Octubre"
        If NumMes = 11 Then Return "Noviembre"
        If NumMes = 12 Then Return "Diciembre"

        Return "Inválido"
    End Function

    Public Function IngresoPor(ByVal IdIngresoPor As Integer) As String

        Dim NomIngresoPor As String

        If IdIngresoPor = 0 Then
            NomIngresoPor = "Urgencias"
        ElseIf IdIngresoPor = 1 Then
            NomIngresoPor = "Consulta Externa"
        ElseIf IdIngresoPor = 2 Then
            NomIngresoPor = "Nacido Hospital"
        ElseIf IdIngresoPor = 3 Then
            NomIngresoPor = "Remitido"
        ElseIf IdIngresoPor = 4 Then
            NomIngresoPor = "Hospitalización de Urgencias"
        ElseIf IdIngresoPor = 5 Then
            NomIngresoPor = "Hospitalización"
        ElseIf IdIngresoPor = 6 Then
            NomIngresoPor = "Imágenes"
        ElseIf IdIngresoPor = 7 Then
            NomIngresoPor = "Laboratorio"
        ElseIf IdIngresoPor = 8 Then
            NomIngresoPor = "Urgencia Ginecológica"
        ElseIf IdIngresoPor = 9 Then
            NomIngresoPor = "Quirófano"
        ElseIf IdIngresoPor = 10 Then
            NomIngresoPor = "Cirugía Ambulatoria"
        ElseIf IdIngresoPor = 11 Then
            NomIngresoPor = "Cirugía Programada"
        ElseIf IdIngresoPor = 12 Then
            NomIngresoPor = "Uci Neonatal"
        ElseIf IdIngresoPor = 13 Then
            NomIngresoPor = "Uci Adulto"
        Else
            NomIngresoPor = "Sin Definir Ingreso Por"
        End If

        Return NomIngresoPor

    End Function

    Public Function EstadosRadicacion(ByVal IdEstado As Integer) As String

        Dim NomEstado As String

        If IdEstado = 0 Then
            NomEstado = "Registrado"
        ElseIf IdEstado = -1 Then
            NomEstado = "No Registrado"
        ElseIf IdEstado = 1 Then
            NomEstado = "Confirmado"
        ElseIf IdEstado = 2 Then
            NomEstado = "Radicado Entidad"
        ElseIf IdEstado = 3 Then
            NomEstado = "Anulado"
        Else
            NomEstado = "-"
        End If

        Return NomEstado

    End Function



    Public Function ConexionesBDs(ByVal CodBD As Integer) As String

        If CodBD = 2 Then
            Return "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica"
        ElseIf CodBD = 3 Then
            Return "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES03;Persist Security Info=True;User ID=dghnet;Password=netdinamica"
        ElseIf CodBD = 97 Then
            Return "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES97;Persist Security Info=True;User ID=dghnet;Password=netdinamica"
        ElseIf CodBD = 99 Then
            Return "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES99;Persist Security Info=True;User ID=dghnet;Password=netdinamica"
        Else
            Return "Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES99;Persist Security Info=True;User ID=dghnet;Password=netdinamica"
        End If

    End Function


    Public Function TipoDocGen(ByVal IdTipo As String) As String

        If IdTipo = 1 Then
            Return "Cédula de Ciudadania"
        ElseIf IdTipo = 2 Then
            Return "Cedula de Extranjeria"
        ElseIf IdTipo = 3 Then
            Return "Tarjeta de Identidad"
        ElseIf IdTipo = 4 Then
            Return "Registro Civil"
        ElseIf IdTipo = 5 Then
            Return "Pasaporte"
        ElseIf IdTipo = 6 Then
            Return "Adulto sin identificación"
        ElseIf IdTipo = 7 Then
            Return "Menor sin identificación"
        ElseIf IdTipo = 8 Then
            Return "Numero Unico de Identificación"
        ElseIf IdTipo = 9 Then
            Return "Salvoconducto"
        ElseIf IdTipo = 10 Then
            Return "Certificado Nacido Vivo"
        ElseIf IdTipo = 11 Then
            Return "Carnet Diplomático"
        ElseIf IdTipo = 12 Then
            Return "Permiso Especial de Permanencia"
		ElseIf IdTipo = 14 Then
            Return "Permiso Proteccion Temporal"
		 ElseIf IdTipo = 15 Then
            Return "Documento Identificacion Extranjero"	
        ElseIf IdTipo = 23 Then
            Return "NIT"
 Else
            Return "Ninguno"
       
        End If

    End Function


    Public Function EstadoIngreso(ByVal IdEstadoIng As Integer) As String

        If IdEstadoIng = 0 Then
            Return "Registrado"
        ElseIf IdEstadoIng = 1 Then
            Return "Facturado"
        ElseIf IdEstadoIng = 2 Then
            Return "Anulado"
        ElseIf IdEstadoIng = 3 Then
            Return "Bloqueado"
        ElseIf IdEstadoIng = 4 Then
            Return "Cerrado"
        Else
            Return "Ninguno"
        End If

    End Function

    Public Function IdUsuarioDgh(ByVal GuidUsuario As String) As String

        Dim Conexion As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=d:\ReporterHRD\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True")
        Dim StrConsulta As String
        Dim ObjAdapter As New SqlDataAdapter

        StrConsulta = "SELECT  IdUsDgh  FROM  aspnet_Users  WHERE  UserId = '" & GuidUsuario & "'"

        Dim Consulta As New SqlCommand(StrConsulta, Conexion)

        ObjAdapter.SelectCommand = Consulta

        Conexion.Open()

        Dim objDS As New DataSet
        ObjAdapter.Fill(objDS, "Registros")

        Dim Lista As List(Of String) = New List(Of String)

        Conexion.Close()

        If objDS.Tables(0).Rows.Count > 0 Then
            Return objDS.Tables(0).Rows(0).Item(0).ToString
        Else
            Return "0"
        End If


        'Return objDS.Tables(0).Rows(0).Item(0).ToString

    End Function
End Class
