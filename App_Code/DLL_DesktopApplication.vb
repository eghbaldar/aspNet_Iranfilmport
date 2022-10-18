Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Drawing
Public Class DLL_DesktopApplication

    Dim sqlconnDesktop As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DesktopConnectionString").ConnectionString)

    Public Function GetAllCalendar() As DataTable
        Try
            If sqlconnDesktop.State = ConnectionState.Open Then sqlconnDesktop.Close()
            sqlconnDesktop.Open()
            Dim sqlcom As New SqlCommand("select * from dbo.tbCalendar", sqlconnDesktop)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0)
            sqlconnDesktop.Close()
        Catch ex As Exception
        Finally
            sqlconnDesktop.Close()
        End Try
    End Function

    Public Function InsertCalendar(ByVal idUser As Byte, datetime As Date, note As String) As Boolean
        Try
            If sqlconnDesktop.State = ConnectionState.Open Then sqlconnDesktop.Close()
            sqlconnDesktop.Open()
            Dim sqlcom As New SqlCommand("insert into dbo.tbCalendar (idUser,date,note) values (" +
                                         idUser.ToString + ",'" + datetime + "','" + note + "')", sqlconnDesktop)
            sqlcom.ExecuteNonQuery()
            sqlconnDesktop.Close()
            Return True
        Catch ex As Exception
            Return False
        Finally
            sqlconnDesktop.Close()
        End Try
    End Function

    Public Function DeleteCalendar(id As Long) As Boolean
        Try
            If sqlconnDesktop.State = ConnectionState.Open Then sqlconnDesktop.Close()
            sqlconnDesktop.Open()
            Dim sqlcom As New SqlCommand("delete from dbo.tbCalendar where id=" & id.ToString, sqlconnDesktop)
            sqlcom.ExecuteScalar()
            sqlconnDesktop.Close()
            Return True
        Catch ex As Exception
            Return False
        Finally
            sqlconnDesktop.Close()
        End Try
    End Function

    Public Function UpdateCalendar(id As Long, idUser As Byte, datetime As String, note As String) As Boolean
        Try
            If sqlconnDesktop.State = ConnectionState.Open Then sqlconnDesktop.Close()
            sqlconnDesktop.Open()
            Dim sqlcom As New SqlCommand("update dbo.tbCalendar set idUser=" & idUser.ToString &
                                         ",date='" & datetime & "',note='" & note & "' where id=" & id.ToString, sqlconnDesktop)
            sqlcom.ExecuteScalar()
            sqlconnDesktop.Close()
            Return True
        Catch ex As Exception
            Return False
        Finally
            sqlconnDesktop.Close()
        End Try
    End Function

End Class
