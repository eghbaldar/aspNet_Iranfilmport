Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Drawing

Public Class DLL_Panel


    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DesktopConnectionString").ConnectionString)
    Dim sqlconn_Site As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString)

    Public Function Version() As String
        Try
            If sqlconn_Site.State = ConnectionState.Open Then sqlconn_Site.Close()
            sqlconn_Site.Open()
            Dim sqlcom As New SqlCommand("select [version] from [tbl_setting]", sqlconn_Site)
            Return sqlcom.ExecuteScalar.ToString
            sqlconn_Site.Close()
        Catch ex As Exception
        Finally
            sqlconn_Site.Close()
        End Try
    End Function

    Public Sub Update_version(ByVal version As String)
        Try
            If sqlconn_Site.State = ConnectionState.Open Then sqlconn_Site.Close()
            sqlconn_Site.Open()
            Dim sqlcom As New SqlCommand("UPDATE tbl_setting set version='" & version.ToString & "'", sqlconn_Site)
            sqlcom.ExecuteNonQuery()
            sqlconn_Site.Close()
        Catch ex As Exception
        Finally
            sqlconn_Site.Close()
        End Try
    End Sub

    Public Function GetValid(ByVal username As String, ByVal password As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [id] from tbCustomers where username='" + username + "' and password='" + password + "'", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetNumberOfNotChecked(ByVal IdFilms As Long) As Integer
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select count(*) from tbSubmission where ChangeAccept=1 and valid=1 and id_film=" & IdFilms.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub UpdateSubmissionAfterNotifiedFestival(ByVal idFilm As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("UPDATE tbSubmission set ChangeAccept=0 where [id_film]=" & idFilm.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub UpdateSubmissionAfterCheckingReceipt(ByVal IdSubmission As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("UPDATE tbSubmission set receipt=3 where id=" & IdSubmission.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub UpdateVisitCounter(ByVal customerid As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbCustomers set [visitCounter]=[visitCounter]+1 where id=" + customerid.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function GetNameCustomer(ByVal customerid As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [name] from tbCustomers where id=" + customerid.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetVisitCounterCustomer(ByVal customerid As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [visitcounter] from tbCustomers where id=" + customerid.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetPhoneCustomer(ByVal customerid As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [phone] from tbCustomers where id=" + customerid.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetLastLeftDaysOfInstallment(customerID As Long) As Integer
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select top 1 DATEDIFF(day,getdate(),[date]) from [dbo].[tbInstallment] where contractnum=(select [contractNumber] from [dbo].[tbContracts] where [customerid]=" & customerID.ToString & ") order by [date] asc", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetLevelByFilm(IdFilm As Long, Level As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec spPanel_LevelSubmissionsStatistic " & IdFilm.ToString & "," & "'" & Level & "'", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetLevelFilm(L As String, idFilm As Long) As String

        Try
            Dim Da As New SqlDataAdapter
            Dim reader As SqlDataReader

            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [level],count(*) 'count' from [dbo].[tbSubmission] where id_film=" & idFilm.ToString & " and [level] is not null and [level] <> '' group by [level]", sqlconn)


            Da.SelectCommand = sqlcom
            reader = sqlcom.ExecuteReader
            While reader.Read()
                Select Case reader("level").ToString.Trim
                    Case L
                        Return reader("count")
                    Case L
                        Return reader("count")
                    Case L
                        Return reader("count")
                    Case L
                        Return reader("count")
                    Case L
                        Return reader("count")
                End Select
            End While
            Return sqlcom.ExecuteScalar
            sqlconn.Close()

        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try

    End Function

    Public Function GetStrategy(ByVal idFilm As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [strategy] from tbfilms where id=" + idFilm.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetLeftoverSubmissionOfLimitedFilm(ByVal idFilm As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select (Cast((select sum(festivalcount) from [dbo].[tbContracts]  where filmid=" & idFilm.ToString & ") as varchar)) - ((select count(*) from [dbo].[tbSubmission] where id_film=" & idFilm.ToString & "))", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetOneYearOrTwoYear(ByVal idFilm As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select Cast(( (select DATEDIFF ( d , (select max(contractDate) from [dbo].[tbContracts] where filmid=" & idFilm.ToString & ") , (select max(contractDateEnd) from [dbo].[tbContracts] where filmid=" & idFilm.ToString & ")))) as varchar)", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetLeftoverYearOfUnlimitedFilm(dayofyears As String, ByVal idFilm As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select " & dayofyears & " - Cast((select DATEDIFF (d ,(select top 1 [date_of_entryData] from [dbo].[tbSubmission] where id_film=" & idFilm.ToString & " order by id asc),getdate())) as bigint)", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetMethod(ByVal idFilm As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [method] from tbfilms where id=" & idFilm.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try

    End Function

    Public Function GetAllCountSubmitted(ByVal idFilm As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select count(*) from [dbo].[tbSubmission] where id_film=" & idFilm.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try

    End Function
    Public Function GetProfessional(ByVal idFilm As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("Select count(*) from tbContracts where type=1 And filmid=" & idFilm.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try

    End Function

    Public Function GetAllCountFestival(ByVal idFilm As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select sum(festivalcount) from [dbo].[tbContracts] where filmid=" & idFilm.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try

    End Function

    Public Sub InsertCommentClient(ByVal id_client As Long, sections As Byte, id_submission As Long, text As String)
        Try
            If sqlconn_Site.State = ConnectionState.Open Then sqlconn_Site.Close()
            sqlconn_Site.Open()
            Dim sqlcom As New SqlCommand("exec dbo.[sp_InsertCommentClient] " + id_client.ToString + "," _
            + sections.ToString + "," + id_submission.ToString + ",'" + text + "'", sqlconn_Site)
            sqlcom.ExecuteNonQuery()
            sqlconn_Site.Close()
        Catch ex As Exception
        Finally
            sqlconn_Site.Close()
        End Try
    End Sub

    Public Sub InsertCommentClientResponse(ByVal id_client As Long, id_parent As Long, text As String,
                                           flag As Byte, read As Byte)
        Try
            If sqlconn_Site.State = ConnectionState.Open Then sqlconn_Site.Close()
            sqlconn_Site.Open()
            Dim sqlcom As New SqlCommand("exec dbo.[sp_InsertCommentClientResponse] " + id_client.ToString + "," _
            + id_parent.ToString + ",'" + text + "'," + flag.ToString + "," + read.ToString, sqlconn_Site)
            sqlcom.ExecuteNonQuery()
            sqlconn_Site.Close()
        Catch ex As Exception
        Finally
            sqlconn_Site.Close()
        End Try
    End Sub

    Public Sub DeleteCommentClient(ByVal id_comment As Long)
        Try
            If sqlconn_Site.State = ConnectionState.Open Then sqlconn_Site.Close()
            sqlconn_Site.Open()
            Dim sqlcom As New SqlCommand("exec dbo.[sp_DeleteCommentClient] " + id_comment.ToString, sqlconn_Site)
            sqlcom.ExecuteNonQuery()
            sqlconn_Site.Close()
        Catch ex As Exception
        Finally
            sqlconn_Site.Close()
        End Try
    End Sub

    Public Sub DeleteCommentClientEach(ByVal id_comment As Long)
        Try
            If sqlconn_Site.State = ConnectionState.Open Then sqlconn_Site.Close()
            sqlconn_Site.Open()
            Dim sqlcom As New SqlCommand("delete from [tbl_Comment_clients] where id=" + id_comment.ToString, sqlconn_Site)
            sqlcom.ExecuteNonQuery()
            sqlconn_Site.Close()
        Catch ex As Exception
        Finally
            sqlconn_Site.Close()
        End Try
    End Sub

    Public Function GetStatusOfClientComments(ByVal id_comment As Long) As String
        Try
            If sqlconn_Site.State = ConnectionState.Open Then sqlconn_Site.Close()
            sqlconn_Site.Open()
            Dim sqlcom As New SqlCommand("Select count(*) from [tbl_Comment_clients] where id=" + id_comment.ToString +
                                         " And id_parent=0 And flag=1 ", sqlconn_Site)
            Return sqlcom.ExecuteScalar
            sqlconn_Site.Close()
        Catch ex As Exception
        Finally
            sqlconn_Site.Close()
        End Try

    End Function

    Public Function GetFilmFestival(ByVal id_submission As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select (select [film] from [dbo].[tbFilms] where id=S.id_film) + '<br/>' + [festival]  'filmfestival' from tbSubmission S where id=" + id_submission.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try

    End Function

    Public Sub UpdateCommentClient(ByVal id As Long, which As Boolean, readflag As Byte)
        Try
            If sqlconn_Site.State = ConnectionState.Open Then sqlconn_Site.Close()
            sqlconn_Site.Open()
            Dim sqlcom As New SqlCommand("exec [sp_UpdateCommentClient] " & id.ToString & "," & which.ToString & "," & readflag.ToString, sqlconn_Site)
            sqlcom.ExecuteNonQuery()
            sqlconn_Site.Close()
        Catch ex As Exception
        Finally
            sqlconn_Site.Close()
        End Try
    End Sub

    Public Function GetUnreadComment(ByVal idClient As Long) As String
        Try
            If sqlconn_Site.State = ConnectionState.Open Then sqlconn_Site.Close()
            sqlconn_Site.Open()
            Dim sqlcom As New SqlCommand("select count(*) from tbl_Comment_clients where id_parent=0 and [flag]=2 and [read]=0 and Id_client=" + idClient.ToString, sqlconn_Site)
            Return sqlcom.ExecuteScalar
            sqlconn_Site.Close()
        Catch ex As Exception
        Finally
            sqlconn_Site.Close()
        End Try

    End Function

    Public Function GetEmailClient(ByVal idClient As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("Select [email] from [dbo].[tbCustomers] where email<>'' and id =" & idClient.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try

    End Function

    Public Function UpdateEmailClient(ByVal idClient As Long, email As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update [dbo].[tbCustomers] set [email]='" & email & "' where id =" & idClient.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try

    End Function

End Class
