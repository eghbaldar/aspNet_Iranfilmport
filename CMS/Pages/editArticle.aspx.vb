﻿Imports System.Data
Imports System.IO

Partial Class CMS_Pages_editArticle
    Inherits System.Web.UI.Page

    'Shared PrePhotoPath As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'PrePhotoPath = ""
        Select Case Request.QueryString("type")
            Case "list"
                divList.Visible = True
                divFestival.Visible = False
            Case "article"
                divList.Visible = False
                divFestival.Visible = True
                If (Not IsPostBack) And (Request.QueryString("id") <> "") Then loaddata()
            Case "complete"
                Page.RegisterStartupScript("OpenPages", "<script type='text/javascript'>window.open('EditPost','_self');window.open('../../cms/pages/sitemap');</script>")
            Case Else
                divList.Visible = True
                divFestival.Visible = False
        End Select

        Dim _FileBrowser As CKFinder.FileBrowser = New CKFinder.FileBrowser()
        _FileBrowser.BasePath = "../../files/ckfinder"
        _FileBrowser.SetupCKEditor(txtText)

        linkPost.HRef = "~/" & Request.QueryString("id")

    End Sub

    Sub loaddata()
        Dim DL As New DLL_CMS
        Dim Dset As New DataSet
        Panel.Enabled = True
        ''''''''''''''''''''''''''
        Dset = DL.PreUpdateArticle(Val(Request.QueryString("id")))
        ''''''''''''''''''''''''''
        cmd_category.SelectedValue = Dset.Tables(0).Rows(0)("catecode").ToString
        cmd_short_feature.SelectedValue = Dset.Tables(0).Rows(0)("short_feature").ToString
        cmd_type.SelectedValue = Dset.Tables(0).Rows(0)("type").ToString
        txtTitle.Text = Dset.Tables(0).Rows(0)("title").ToString
        txtText.Text = Dset.Tables(0).Rows(0)("text").ToString
        txtLid.Value = Dset.Tables(0).Rows(0)("lid").ToString
        txtAuthors.Text = Dset.Tables(0).Rows(0)("authors").ToString
        txtReference.Text = Dset.Tables(0).Rows(0)("reference").ToString
        txtTitleEn.Text = Dset.Tables(0).Rows(0)("titleEn").ToString
        'Dim dtFull As String() = Dset.Tables(0).Rows(0)("date_time").ToString.Split(" ")
        'txtDate.Text = dtFull(0)
        'Dim t As String() = dtFull(1).Split(":")
        'txtHH.Text = t(0)
        'txtMM.Text = t(1)
        'txtSS.Text = t(2)

        Dim dtFill As DateTime = Convert.ToDateTime(Dset.Tables(0).Rows(0)("date_time").ToString)
        txtDate.Text = dtFill.Date
        txtHH.Text = dtFill.ToString("HH")
        txtMM.Text = dtFill.ToString("mm")
        txtSS.Text = dtFill.ToString("ss")

        imgPhoto.ImageUrl = "~\files\uploadFiles\article\" + Dset.Tables(0).Rows(0)("photo")
        'PrePhotoPath = Dset.Tables(0).Rows(0)("photo").ToString.Trim

        'Dset.Tables(0).Rows(0)("film").ToString
        Dim tags() As String = Dset.Tables(0).Rows(0)("tags").ToString().Split("-")
        For i As Byte = 0 To tags.Length - 1
            listTags.Items.Add(tags(i).Trim.Replace("ي", "ی"))
        Next

        If Convert.ToBoolean(Dset.Tables(0).Rows(0)("visible").ToString) Then
            cmdVisible.Items(0).Selected = True
        Else
            cmdVisible.Items(1).Selected = True
        End If

        lblNumberVistors.Text = DL.GetCountPostVistor(Val(Request.QueryString("id")))

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        Dim DL As New DLL_CMS

        If FilePhoto.PostedFile.ContentLength > 110000 And Not (chkPhoto.Checked) Then
            lblNotify.Text = "حجم فایل عکس شما بیش از 110 کیلوبایت است"
            Exit Sub
        End If

        Dim FN As String
        If FilePhoto.HasFile Then
            FN = DateTime.Now.Ticks.ToString & "-" & txtTags.Text.Trim.Replace("-", "_").Replace(" ", "").Replace("_", "-").Replace("ي", "ی") & "-" & Path.GetExtension(FilePhoto.FileName)
            FilePhoto.SaveAs(MapPath("~/files/UploadFiles/article/" + FN))
            imgPhoto.ImageUrl = "~/files/uploadFiles/article/" + FN
        Else
            'FN = PrePhotoPath.Replace("ي", "ی")
            FN = Path.GetFileName(imgPhoto.ImageUrl).Replace("ي", "ی")
        End If

        '''''''''''''''''''''''''''''''''''''
        Dim VisibleStatus As Boolean
        If cmdVisible.Items(0).Selected Then
            VisibleStatus = True
        Else
            VisibleStatus = False
        End If

        Dim DT As String = Convert.ToDateTime(txtDate.Text).ToShortDateString & " " & txtHH.Text & ":" & txtMM.Text & ":" & txtSS.Text
        DL.UpdateArticle(Val(cmd_category.SelectedValue), _
                         Val(cmd_type.SelectedValue), _
                         Val(cmd_short_feature.SelectedValue), _
                          convertNumFatoEn(txtTitle.Text.Trim), _
                          convertNumFatoEn(txtText.Text.Trim), _
                          convertNumFatoEn(txtLid.Value.Trim), _
                          txtAuthors.Text.Trim, _
                          txtReference.Text.Trim, _
                         FN, _
                         txtTags.Text.Replace("ي", "ی"), _
                         VisibleStatus, _
                         Val(Request.QueryString("id")), _
                         Convert.ToDateTime(DT), _
                         txtTitleEn.Text.Trim)

        GV.DataBind()
        'Response.Redirect("EditPost")
        Response.Redirect("EditPost?type=complete")

    End Sub

    Public Sub delete(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim dl As New DLL_CMS
        dl.DeleteArticle(Val(e.CommandArgument.ToString))
        GV.DataBind()
        GV_Future.DataBind()
    End Sub

    Public Function convertNumFatoEn(ByVal T As String) As String
        Return T.Replace("۰", "0").Replace("۱", "1").Replace("۲", "2").Replace("۳", "3").Replace("۴", "4").Replace("۵", "5").Replace("۶", "6").Replace("۷", "7").Replace("۸", "8").Replace("۹", "9").Replace("٫", "/")
    End Function

    Protected Sub btnList_Click(sender As Object, e As System.EventArgs) Handles btnList.Click
        Response.Redirect("EditPost?type=list")
    End Sub

    Shared S As String = Nothing
    Dim btn As New Button

    Protected Sub btnPreTag_Click(sender As Object, e As System.EventArgs) Handles btnPreTag.Click
        If txtPreTag.Text.Trim.Length > 0 Then
            listTags.Items.Add(txtPreTag.Text.Trim.Replace(" ", "_"))
            txtPreTag.Text = ""
        End If        
    End Sub

    Protected Sub deletelist_Click(sender As Object, e As System.EventArgs) Handles deletelist.Click
        listTags.Items.RemoveAt(listTags.SelectedIndex)
    End Sub

    Protected Sub btnGoTags_Click(sender As Object, e As System.EventArgs) Handles btnGoTags.Click
        S = Nothing
        If listTags.Items.Count > 0 Then
            For i As Byte = 0 To listTags.Items.Count - 1
                S = S & listTags.Items(i).Text.Trim.Replace(" ", "_") + " - "
            Next
            txtTags.Text = S.Substring(0, S.Length - 2)
        End If
    End Sub

    Protected Sub CalDate_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalDate.SelectionChanged
        txtDate.Text = CalDate.SelectedDate
    End Sub


    Public Function getDate(_date As Object) As String
        Return ShamsiDate.Miladi2Shamsi(_date.ToString, ShamsiDate.ShowType.LongDate) & "<br/>" & Convert.ToDateTime(_date).TimeOfDay.ToString
    End Function

    Protected Sub btnSearchCodePost_Click(sender As Object, e As System.EventArgs) Handles btnSearchCodePost.Click
        If txtCodePost.Text.Trim <> "" Then
            Response.Redirect("~/cms/pages/EditPost?type=article&id=" + txtCodePost.Text.Trim)
        End If
    End Sub

    Public Function GetTextType(code As Object) As String
        Select Case Val(code)
            Case "1"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid green;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>مقالات تالیفی</div>"
            Case "2"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid green;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>مقالات ترجمه</div>"
            Case "3"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid green;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>شناخت جشنواره ها</div>"
            Case "4"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid green;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>اخبار درگاه فیلم ایران</div>"
            Case "5"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid green;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>اخبار داخلی</div>"
            Case "6"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid green;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>اخبار بین المللی</div>"
            Case "7"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid green;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>فراخوان های ایرانی</div>"
            Case "8"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid green;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>یادداشت ها</div>"
        End Select
    End Function
    Public Function GetTextShortFeature(code As Object) As String
        Select Case Val(code)
            Case "1"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid red;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>کوتاه</div>"
            Case "2"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid red;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>بلند</div>"
            Case "3"
                Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid red;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>هر دو</div>"
        End Select
    End Function

    Public Function GetTextCategory(CateCode As Object) As String
        Dim ds As New DLL_CMS
        Return "<div style='padding:4px;font-size:9px;font-family:tahoma;border:1px solid red;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>" + ds.GetCategory(Val(CateCode)) + "</div>"
    End Function

    Protected Sub tag_1_Click(sender As Object, e As System.EventArgs) Handles tag_1.Click
        listTags.Items.Add(tag_1.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_2_Click(sender As Object, e As System.EventArgs) Handles tag_2.Click
        listTags.Items.Add(tag_2.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_3_Click(sender As Object, e As System.EventArgs) Handles tag_3.Click
        listTags.Items.Add(tag_3.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_4_Click(sender As Object, e As System.EventArgs) Handles tag_4.Click
        listTags.Items.Add(tag_4.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_5_Click(sender As Object, e As System.EventArgs) Handles tag_5.Click
        listTags.Items.Add(tag_5.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_6_Click(sender As Object, e As System.EventArgs) Handles tag_6.Click
        listTags.Items.Add(tag_6.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_7_Click(sender As Object, e As System.EventArgs) Handles tag_7.Click
        listTags.Items.Add(tag_7.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_8_Click(sender As Object, e As System.EventArgs) Handles tag_8.Click
        listTags.Items.Add(tag_8.Text.Trim.Replace(" ", "_"))
    End Sub

    Protected Sub btnOneWord_Click(sender As Object, e As System.EventArgs) Handles btnOneWord.Click
        Response.Redirect("EditPost?word=" & txtOneWord.Text.Trim)
    End Sub

End Class
