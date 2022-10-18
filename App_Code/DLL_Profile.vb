Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography

Public Class DLL_Profile

    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString)

    Public Function GetEmailByUsername(ByVal username As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select top 1 [email] from tbl_ProfileCreator where username='" + username + "'", sqlconn)
            Return sqlcom.ExecuteScalar
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetNameByUsername(ByVal username As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select top 1 [name]+' '+[lastname] from tbl_ProfileCreator where username='" + username + "'", sqlconn)
            Return sqlcom.ExecuteScalar
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function getStatus(ByVal username As String) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select top 1 [StatusUser] from tbl_ProfileCreator where username='" + username + "'", sqlconn)
            Select Case sqlcom.ExecuteScalar
                Case 1
                    Return True
                Case 3
                    Return True
                Case 0
                    Return False
                Case 4
                    Return False
            End Select
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetTypeProject(ByVal id As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [type] from tbl_Projects where id=" + id.ToString(), sqlconn)
            Return sqlcom.ExecuteScalar
        Finally
            sqlconn.Close()
        End Try
    End Function

    'Public Function ShowInformation(ByVal email As String) As DataSet
    '    'Try
    '    Dim sqlcom As New SqlCommand("select * from tbl_ProfileCreator where email='" & email.ToString & "'", sqlconn)
    '    Dim sqlda As New SqlDataAdapter(sqlcom)
    '    Dim ds As New DataSet
    '    sqlda.Fill(ds)
    '    Return ds
    '    sqlconn.Close()
    '    'Catch ex As Exception
    '    'End Try
    'End Function

End Class
