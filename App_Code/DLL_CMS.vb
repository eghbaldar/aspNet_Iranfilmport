Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class DLL_CMS

    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString)

    Public Function GetAllFilesOfArticles() As String()
        Try
            Dim Astr() As String

            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [photo] from tbl_articles", sqlconn)

            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)

            ReDim Astr(ds.Tables(0).Rows.Count)

            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Astr(i) = ds.Tables(0).Rows(i).Item(0).ToString
            Next

            Return Astr

            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetStatusOfRegsiter() As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [StatusOfRegister] from tbl_setting", sqlconn)
            Return Convert.ToBoolean(sqlcom.ExecuteScalar)
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    'Public Function GetLastIDPost() As String
    '    Try
    '        If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
    '        sqlconn.Open()
    '        Dim sqlcom As New SqlCommand("select top 1 [id] from tbl_articles order by [date_time] desc", sqlconn)
    '        Return sqlcom.ExecuteScalar.ToString.Trim
    '        sqlconn.Close()
    '    Catch ex As Exception
    '    Finally
    '        sqlconn.Close()
    '    End Try
    'End Function

    Public Function InsertFestival(ByVal Level As Integer _
           , ByVal genre As String _
           , ByVal short_feature As Integer _
           , ByVal title_en As String _
           , ByVal title_fa As String _
           , ByVal address As String _
           , ByVal country_code As Integer _
           , ByVal date_start_takePlace As Date _
           , ByVal date_end_takePlace As Date _
           , ByVal web As String _
           , ByVal detail As String _
           , ByVal attribute As String _
           , ByVal logo As String _
           , ByVal date_notification As Date _           
           , ByVal premiere As Integer _
           , ByVal premiere_text As String _
           , ByVal date_opening As Date _
           , ByVal date_completion As Date _
           , ByVal rules As String _
           , ByVal platform As Integer _
           , ByVal submitWay As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_InsertFestival " + Level.ToString + "," + "'" + genre.ToString + "'," + short_feature.ToString + "," + "'" + title_en.ToString + "'," + "'" + title_fa.ToString + "'," + "'" + address.ToString + "'," + country_code.ToString + ",'" + date_start_takePlace.ToString + "','" + date_end_takePlace.ToString + "'," + "'" + web.ToString + "'," + "'" + detail.ToString + "'," + "'" + attribute.ToString + "'," + "'" + logo.ToString + "','" + date_notification.ToString + "'," + premiere.ToString + ",'" + premiere_text.ToString + "','" + date_opening.ToString + "','" + date_completion.ToString + "','" + rules.ToString + "'," + platform.ToString + ",'" + submitWay.ToString + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub InsertSlider(ByVal photo As String, ByVal text As String, ByVal subtext As String, ByVal link As String, textEn As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_InsertSlider '" + photo + "',N'" + text + _
                                         "',N'" + subtext + "','" + link + "','" + textEn + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function PreUpdateFest(ByVal id As Long) As DataSet        
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select * from tbl_festivals where id=" & id.ToString, sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function EachValueOfGenreFestival(ByVal id As Long) As DataSet
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select * from dbo.StringSplit ((select [genre] from dbo.tbl_festivals where id=" & id.ToString & "),',')", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub UpdateFestival(ByVal id As Long, _
             ByVal Level As Integer _
           , ByVal genre As String _
           , ByVal short_feature As Integer _
           , ByVal title_en As String _
           , ByVal title_fa As String _
           , ByVal address As String _
           , ByVal country_code As Integer _
           , ByVal date_start_takePlace As Date _
           , ByVal date_end_takePlace As Date _
           , ByVal web As String _
           , ByVal detail As String _
           , ByVal attribute As String _
           , ByVal logo As String _
           , ByVal date_notification As Date _
           , ByVal premiere As Integer _
           , ByVal premiere_text As String _
           , ByVal date_opening As Date _
           , ByVal date_completion As Date _
           , ByVal rules As String _
           , ByVal platform As Integer _
           , ByVal submitWay As String _
           , ByVal EnableDisbale As Byte)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_updateFestival " + id.ToString + "," + Level.ToString + "," + "'" + genre.ToString + "'," + short_feature.ToString + "," + "'" + title_en.ToString + "'," + "'" + title_fa.ToString + "'," + "'" + address.ToString + "'," + country_code.ToString + ",'" + date_start_takePlace.ToString + "','" + date_end_takePlace.ToString + "'," + "'" + web.ToString + "'," + "'" + detail.ToString + "'," + "'" + attribute.ToString + "'," + "'" + logo.ToString + "','" + date_notification.ToString + "'," + premiere.ToString + ",'" + premiere_text.ToString + "','" + date_opening.ToString + "','" + date_completion.ToString + "','" + rules.ToString + "'," + platform.ToString + ",'" + submitWay.ToString + "'," + EnableDisbale.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub InsertCatArticle(ByVal name As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_insertCatArticle '" + name + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub InsertArticle(ByVal CateCode As Long, ByVal type As Integer, ByVal short_feature As Byte, ByVal title As String, ByVal text As String _
                             , ByVal lid As String, ByVal Authors As String, ByVal reference As String, ByVal photo As String, ByVal film As String _
                             , ByVal tags As String, ByVal admin_code As Byte, ByVal visit As Long, date_time As DateTime, titleEn As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_InsertArticle " + CateCode.ToString + "," + type.ToString + "," + short_feature.ToString + ",'" + title + "','" + text + "','" + lid + "','" + Authors + "','" + reference + "',N'" + photo + "','" + film + "','" + tags + "'," + "'True'," + admin_code.ToString + "," + visit.ToString + ",'" + date_time.ToString + "','" + titleEn + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function PreUpdateArticle(ByVal id As Long) As DataSet
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select * from tbl_articles where id=" & id.ToString, sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub UpdateArticle(ByVal CateCode As Long, ByVal type As Integer, ByVal short_feature As Byte, ByVal title As String, ByVal text As String _
                             , ByVal lid As String, ByVal Authors As String, ByVal reference As String, ByVal photo As String,
                              ByVal tags As String, ByVal visble As Byte, ByVal id As Long, date_time As DateTime, titleEn As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_updateArticle " + id.ToString + "," +
                                         CateCode.ToString + "," + type.ToString + "," + short_feature.ToString + ",'" + title +
                                         "','" + text + "','" + lid + "','" + Authors + "','" + reference + "',N'" + photo + "','" +
                                         tags + "'," + "'" + visble.ToString + "','" + date_time + "','" + titleEn + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function PreUpdateSlider(ByVal id As Long) As DataSet
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select * from tbl_slider where id=" & id.ToString, sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub UpdateSlider(ByVal photo As String, ByVal text As String, _
                            ByVal subtext As String, ByVal link As String, ByVal id As Long, visible As Boolean, textEn As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_UpdateSlider '" + photo.ToString + "',N'" _
                                         + text.ToString + "',N'" + subtext.ToString + "','" + link + "'," + id.ToString + _
                                         "," + visible.ToString + ",'" + textEn + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub UpdateStatusProfileCreator(ByVal email As String, ByVal status As Byte)
        Try
            'status=0 رد
            'status=1 تائید
            'status=2 محروم
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_ProfileCreator set statususer='" + status.ToString + "' where email='" + email + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub UpdateStatusProjectPhotos(ByVal id As Long, ByVal status As Byte)
        Try
            'status=0 رد
            'status=1 تائید
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_Projects_photos set status='" + status.ToString + "' where id='" + id.ToString + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub UpdateProjectTruth(ByVal id As Long, ByVal status As Byte)
        Try
            'status=0 رد
            'status=1 تائید
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_Projects set truth='" + status.ToString + "' where id='" + id.ToString + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub UpdateStatusProject(ByVal id As Long, ByVal status As Byte)
        Try
            'status=0 رد
            'status=1 تائید
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_Projects set status='" + status.ToString + "' where id='" + id.ToString + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try

    End Sub

    Public Sub InsertMessage(ByVal email As String, ByVal subject As String, ByVal text As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_insert_message '" + email + "','" + subject + "','" + text + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub InsertSubmission(ByVal projectID As Long, ByVal festivalname As String, ByVal festivalID As Long, ByVal detail As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_insertSubmission " + projectID.ToString + ",'" + festivalname + "'," + festivalID.ToString + ",'" + detail + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub
    '
    Public Sub UpdateSubmission(ByVal projectID As Long, ByVal status_send As Byte, ByVal status_accolade As Byte, ByVal detail As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_update_submissionStatus " + status_send.ToString + "," + status_accolade.ToString + ",'" + detail + "'," + projectID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function ShowEachSubmission(ByVal id As Long) As DataSet
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select * from tbl_submission where projectid=" & id.ToString, sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub DeleteSubmission(ByVal ID As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_delete_submission " + ID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    'Public Sub InsertInvoice(ByVal email As String, ByVal subject As String, ByVal detail As String, ByVal price As String, ByVal discount As String, ByVal type As Byte)
    '    Try
    '        If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
    '        sqlconn.Open()
    '        Dim sqlcom As New SqlCommand("exec dbo.sp_insert_invoice '" + email + "','" + subject + "','" + detail + "','" + price + "','" + discount + "'," + type.ToString, sqlconn)
    '        sqlcom.ExecuteNonQuery()
    '        sqlconn.Close()
    '    Catch ex As Exception
    '    Finally
    '        sqlconn.Close()
    '    End Try
    'End Sub

    Public Sub DeleteInvoice(ByVal ID As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_delete_invoice " + ID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub DeleteArticle(ByVal ID As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_delete_article " + ID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub DeleteProfile(ByVal email As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_delete_Profile '" + email + "'", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub UpdateResume(ByVal TEXT As String, FaEn As Boolean)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String
            Select Case FaEn
                Case True
                    input = "update tbl_Pages set resume='" + TEXT + "'"
                Case False
                    input = "update tbl_Pages set resumeEn='" + TEXT + "'"
            End Select
            Dim sqlcom As New SqlCommand(input, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function ShowResume(FaEn As Boolean) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String
            Select Case FaEn
                Case True
                    input = "select [resume] from tbl_Pages"
                Case False
                    input = "select [resumeEn] from tbl_Pages"
            End Select
            Dim sqlcom As New SqlCommand(input, sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0).Rows(0)(0).ToString.Replace("ي", "ی")
            sqlconn.Close()

        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function ShowResumeEach(id As Long, FaEn As Boolean) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String
            Select Case FaEn
                Case True
                    input = "select [fa] from tbl_accolades where id=" + id.ToString
                Case False
                    input = "select [en] from tbl_accolades where id=" + id.ToString
            End Select
            Dim sqlcom As New SqlCommand(input, sqlconn)
            Return sqlcom.ExecuteScalar.ToString.Replace("ي", "ی")
            sqlconn.Close()

        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub UpdateAdvertise(ByVal TEXT As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String = "update tbl_Pages set advertise='" + TEXT + "'"
            Dim sqlcom As New SqlCommand(input, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub UpdateParticipationPlan(ByVal TEXT As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String = "update tbl_Pages set participationplan='" + TEXT + "'"
            Dim sqlcom As New SqlCommand(input, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function ShowParticipationPlan() As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String = "select [participationplan] from tbl_Pages"
            Dim sqlcom As New SqlCommand(input, sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0).Rows(0)(0).ToString.Replace("ي", "ی")
            sqlconn.Close()

        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function ShowAdvertise() As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String = "select [advertise] from tbl_Pages"
            Dim sqlcom As New SqlCommand(input, sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0).Rows(0)(0).ToString.Replace("ي", "ی")
            sqlconn.Close()

        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub InsertFestivalSection(ByVal FestivalID As Integer, ByVal Section As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("insert into tbl_FestivalSections (festivalId,section) values (" + FestivalID.ToString + ",'" + Section + "')", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub InsertFestivalDead(ByVal FestivalID As Integer, ByVal deadline As Date, sectionID As Long, fee As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("insert into tbl_festivalDeadline (festivalId,deadline,sectionId,fee) values (" _
                                         + FestivalID.ToString + ",'" + deadline.ToShortDateString + "'," + sectionID.ToString + ",'" + fee + "')", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function UpdateEnableDisableComment(ED As Boolean, ID As Long) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_Comment set flag='" + ED.ToString + "' where id=" + ID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateReadEnableDisableComment(ED As Boolean, ID As Long) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_Comment set [read]='" + ED.ToString + "' where id=" + ID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function DeleteComment(ID As Long) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("delete from tbl_Comment where id=" + ID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateReadEnableDisableContact(ED As Boolean, ID As Long) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update [tbl_Contact] set [read]='" + ED.ToString + "' where id=" + ID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function getTextComment(id As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select text from tbl_Comment where id=" + id.ToString, sqlconn)
            Return sqlcom.ExecuteScalar()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    ''' <summary>
    ''' توضیحات
    ''' </summary>
    ''' <param name="id"></param>
    ''' <param name="SendStatus">2: sent / 3: deny</param>
    ''' <param name="AccoladesStatus">0: not send / 2: in considering of festival</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function UpdateSend_or_Deny(id As Long, SendStatus As Byte, AccoladesStatus As Byte) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_invoice set send_date=getdate(), accolades_status='" + AccoladesStatus.ToString + "',send_status='" + SendStatus.ToString + "' where id=" + id.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateAccolades(id As Long, AccoladesStatus As Byte) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_invoice set accolades_status='" + AccoladesStatus.ToString + "' where id=" + id.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub DeleteFestival(ByVal FestivalID As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec [sp_delete_festivals] " + FestivalID.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function UpdateWalletValueInProfileCreator(email As String, Price As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_ProfileCreator set wallet=cast(wallet as bigint)+" + Price.ToString + " where email='" + email + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function SendEmailForAllMembers(Text As String, SUBJECT As String, LINK As String)
        Dim Email As New Email
        Dim rd As SqlDataReader
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [email] from tbl_ProfileCreator", sqlconn)
            rd = sqlcom.ExecuteReader()
            While rd.Read
                Email.SendMail(rd("email"), Text, SUBJECT, LINK)
            End While
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertPosterOfCustomer(nameofpage As String, photo As String, namefa As String, nameen As String, directorFa As String, directorEn As String, text As String, trailerAparat As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("insert into tbl_PosterOfCustomer (nameofpage,photo,namefa,nameen,directorFa,directorEn,text,trailerAparat) values ('" + nameofpage + "','" + photo + "',N'" + namefa + "','" + nameen + "',N'" + directorFa + "','" + directorEn + "',N'" + text + "','" + trailerAparat + "') ", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdatePosterOfCustomer(nameofpage As String, photo As String, namefa As String, nameen As String, directorFa As String, directorEn As String, text As String, trailerAparat As String, id As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_PosterOfCustomer set nameofpage='" + nameofpage + "',photo='" + photo + "',namefa=N'" + namefa + "',nameen='" + nameen + "',directorFa=N'" + directorFa + "',directorEn='" + directorEn + "',text=N'" + text + "',trailerAparat='" + trailerAparat + "' where id=" + id.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function SelectPosterOfCustomer(id As Long) As DataTable
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select * from tbl_PosterOfCustomer where id=" + id.ToString, sqlconn)
            Dim sqlda As New SqlDataAdapter
            Dim dt As New DataTable
            sqlda.SelectCommand = sqlcom
            sqlda.Fill(dt)
            Return dt
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function DeletePosterOfCustomer(id As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("delete from tbl_PosterOfCustomer where id=" + id.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub UpdateDeadline(ByVal deadline As String, ByVal fee As String, ByVal id As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_festivalDeadline set deadline='" + deadline + "' , fee='" + fee + "' where id=" + id.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function GetCategory(Code As Integer) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [name] from tbl_articleCategory where id=" + Code.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateTypeOfPostersFilms(type As Byte, id As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update [tbl_PosterOfCustomer] set type=" + type.ToString + " where id=" + id.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetTypeOfPostersFilms(id As Integer) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [type] from tbl_PosterOfCustomer where id=" + id.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function ShowAbout(FaEn As Boolean) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String
            Select Case FaEn
                Case True
                    input = "select [aboutFa] from tbl_Pages"
                Case False
                    input = "select [aboutEn] from tbl_Pages"
            End Select
            Dim sqlcom As New SqlCommand(input, sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0).Rows(0)(0).ToString.Replace("ي", "ی")
            sqlconn.Close()

        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Sub UpdateAbout(ByVal TEXT As String, FaEn As Boolean)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String
            Select Case FaEn
                Case True
                    input = "update tbl_Pages set aboutFa='" + TEXT + "'"
                Case False
                    input = "update tbl_Pages set aboutEn='" + TEXT + "'"
            End Select
            Dim sqlcom As New SqlCommand(input, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Sub UpdateAPK(ByVal apkName As String, Staff_OR_Client As Boolean)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim input As String
            Select Case Staff_OR_Client
                Case True
                    input = "update tbl_setting set [apkStaff]='" + apkName + "'"
                Case False
                    input = "update tbl_setting set [apkClients]='" + apkName + "'"
            End Select
            Dim sqlcom As New SqlCommand(input, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Public Function GetCountPostVistor(id As Integer) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [visit] from tbl_articles where id=" + id.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertAccolade(id_film As Long, fa As String, en As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("insert into tbl_accolades (id_film,fa,en) values (" + id_film.ToString + ",N'" + fa + "','" + en + "') ", sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateAccolade(fa As String, en As String, id As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_accolades set fa= N'" + fa + "', en='" + en + "' where id=" + id.ToString, sqlconn)
            sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetEachResumeEnFa(id As Integer, type As Boolean) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand
            sqlcom.Connection = sqlconn
            Select Case type
                Case True
                    sqlcom.CommandText = "select [fa] from [tbl_accolades] where id=" + id.ToString
                Case False
                    sqlcom.CommandText = "select [en] from [tbl_accolades] where id=" + id.ToString
            End Select
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

End Class