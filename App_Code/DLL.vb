﻿Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Drawing

Public Class DLL

    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString)
    Dim sqlconnDesktop As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DesktopConnectionString").ConnectionString)

    Public Function GetClearString(ByVal text As String) As String
        Return text.Replace(" ", "-").Replace("»", "").Replace("«", "").Replace("‌", "-").Replace("ي", "ی").Replace("?", "").Replace("؟", "").Replace("!", "").Replace("معرفی", "").Replace("-بود-", "-").Replace("شدند", "").Replace(")", "").Replace("(", "").Replace("}", "").Replace("{", "").Replace("[", "").Replace("]", "").Replace("_", "").Replace("،", "").Replace("؛", "").Replace(".", "").Replace(":", "").Replace("""", "-").Replace("/", "").Replace("|", "").Replace("\", "-").Replace("-و-", "-").Replace("-در-", "-").Replace("-را-", "-").Replace("-با-", "-").Replace("-به-", "-").Replace("-آن-", "-").Replace("-این-", "-").Replace("-گردید-", "-").Replace("-شد-", "-").Replace("-های-", "-").Replace("--", "-").Replace("--", "").Replace("+", "-").Replace("---", "-")
    End Function

    Public Function convertNumFatoEn(ByVal T As String) As String
        Return T.Replace("0", "۰").Replace("1", "۱").Replace("2", "۲").Replace("3", "۳").Replace("4", "۴").Replace("5", "۵").Replace("6", "۶").Replace("7", "۷").Replace("8", "۸").Replace("9", "۹").Replace("/", "٫")
    End Function

    Public Function convertNumEntoFa(ByVal T As String) As String
        Return T.Replace("0", "۰").Replace("1", "۱").Replace("2", "۲").Replace("3", "۳").Replace("4", "۴").Replace("5", "۵").Replace("6", "۶").Replace("7", "۷").Replace("8", "۸").Replace("9", "۹").Replace("/", "٫")
    End Function

    Public Function BlogSearch(ByVal value As String) As DataTable
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_searchBlog '" + value.Replace("ي", "ی") + "'", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0)
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub InsertStatistical(ByVal IP As String, URL As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_statistical '" + IP + "','" + URL + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub IncreaseViwerArticle(ByVal id As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_increaseViewerArticle " + id.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function InsertContact(ByVal Name As String, ByVal Phone As String, ByVal Category As Integer, ByVal Text As String, ByVal Subject As String, ByVal Email As String) As Integer
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_InsertContact '" + Name + "','" + Phone + "'," + Category.ToString + ",'" + Text + "','" + Subject + "','" + Email + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetTitleBlog(ByVal ID As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [title] from tbl_articles where id=" + ID, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetImageBlog(ByVal ID As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [photo] from tbl_articles where id=" + ID, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetLidBlog(ByVal ID As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [lid] from tbl_articles where id=" + ID, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetTagsBlog(ByVal ID As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [tags] from tbl_articles where id=" + ID, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertComment(sections As Byte, ID_post As Long, ID_Parent As Long, text As String, name As String, email As String, ADMIN As Boolean, flag As Byte) As Integer
        Try
            Dim DLCMS As New DLL_CMS
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("insert into tbl_Comment (sections,id_post,id_parent,text,name,email,admin,flag) values (" + sections.ToString + "," + ID_post.ToString + "," + ID_Parent.ToString + ",N'" + text + "','" + name + "','" + email + "','" + ADMIN.ToString + "','" + flag.ToString + "')", sqlconn)
            DLCMS.UpdateMakeReadCommentByPostId(ID_post, 0)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertSendInformation(name As String, num As String, how As String, link As String) As Integer
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("insert into [tbl_SendInformation] (name,num,how,link) values (N'" + name + "',N'" + num + "','" + how + "','" + link + "')", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function FestivalALL() As DataTable
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec sp_FestivalALL", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0)
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function FestivalSearch(oc As String,level As String,genre As String,sf As String,t As String ) As DataTable
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            'Dim sqlcom As New SqlCommand("exec dbo.sp_SearchFestival 1,1,'','1',''", sqlconn)
            Dim sqlcom As New SqlCommand("exec dbo.sp_SearchFestival '" + oc + "','" + level + "','" + genre + "','" + sf + "','" + t + "'", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0)
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub FestivalCounter(ByVal FesivalID As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_festivals set counter=counter+1 where id=" + FesivalID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function PostALL() As DataTable
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("SELECT * FROM [tbl_articles] WHERE [visible] = 1 ORDER BY [id] DESC", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0)
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function FestivalPost(t As String) As DataTable
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            'Dim sqlcom As New SqlCommand("exec dbo.sp_SearchFestival 1,1,'','1',''", sqlconn)
            Dim sqlcom As New SqlCommand("exec dbo.[sp_SearchPost] '" + t + "'", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0)
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function IsEnablePost(PostCode As Long) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select count(*) from tbl_articles where date_time <= getdate() and visible=1 and id=" + PostCode.ToString, sqlconn)
            If Val(sqlcom.ExecuteScalar) = 1 Then
                Return False 'پست موجود است و یا فعال است
            Else
                Return True ' پست موجود نیست و یا فعال نیست
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertTemporaryForms(value As String) As Long
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("insert into tbl_temporaryFroms (value) OUTPUT Inserted.ID values (N'" & convertNumFatoEn(value) & "')", sqlconn)
            'Dim sqlda As New SqlDataAdapter(sqlcom)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function Navigation(id As Long, which As Byte) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec [sp_PostNavigation] " & id.ToString & "," & which.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetStatusModalOnAllPage() As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("SELECT [ModalOnAllPage] FROM [tbl_setting]", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetTempContractInformation(contractnumber As String) As DataTable
        Try
            If sqlconnDesktop.State = ConnectionState.Open Then sqlconnDesktop.Close()
            sqlconnDesktop.Open()
            Dim sqlcom As New SqlCommand("SELECT * FROM [tbTempContracts] where contractnumber='" & contractnumber.ToString() + "'", sqlconnDesktop)
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

    Public Function IncreaseVisitAdvertModal(IdAdvert As Long) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update [tbl_ModalAdvertisement] set visit=visit+1  where id=" + IdAdvert.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertNewsletter(email As String) As Long
        Try

            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()

            Dim sqlcom1 As New SqlCommand("select count(*) from tbl_newsletter where email=@Email", sqlconn)
            sqlcom1.Parameters.AddWithValue("@Email", email)
            If sqlcom1.ExecuteScalar() <> 0 Then
                Return 0
            End If

            Dim sqlcom2 As New SqlCommand("INSERT INTO tbl_newsletter (email) VALUES (@Email)", sqlconn)
            sqlcom2.Parameters.AddWithValue("@Email", email)
            sqlcom2.ExecuteScalar()
            Return 1


            sqlconn.Close()

        Catch ex As Exception
            ' Handle exceptions if necessary
        Finally
            sqlconn.Close()
        End Try
    End Function

	Public Function InsertEmployment(ByVal Name As String, ByVal Phone As String, ByVal Category As Integer, ByVal CV As String, ByVal Email As String) As Integer
		Try
			If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
			sqlconn.Open()
			Dim sqlcom As New SqlCommand("insert into tbl_employment (Name,Phone,Category,Resume,Email) values ('" + Name + "','" + Phone + "'," + Category.ToString + ",'" + CV + "','" + Email + "')", sqlconn)
			Return sqlcom.ExecuteNonQuery()
			sqlconn.Close()
		Catch ex As Exception
		Finally
			sqlconn.Close()
		End Try
	End Function
End Class
