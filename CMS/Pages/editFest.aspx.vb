﻿Imports System.Data
Imports System.IO

Partial Class CMS_Pages_editFest
    Inherits System.Web.UI.Page

    Shared PreLogoPath As String = ""

    Public Function getLink(ByVal title As Object) As String
        Dim DL As New DLL
        Dim T As String = DL.GetClearString(title.ToString())
        If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
        If T.Length > 50 Then
            Return T.Substring(0, 50)
        Else
            Return T
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Select Case Request.QueryString("type")
            Case "list"
                divList.Visible = True
                divFestival.Visible = False
                divDead.Visible = False
                divSection.Visible = False

                btnBacktoDeadline.Visible = False
                btnBacktoSection.Visible = False
                btnBacktoFest.Visible = False

            Case "fest"
                divList.Visible = False
                divFestival.Visible = True
                divDead.Visible = False
                divSection.Visible = False

                btnBacktoDeadline.Visible = True
                btnBacktoSection.Visible = True
                btnBacktoFest.Visible = False

            Case "section"
                divSection.Visible = True
                divDead.Visible = False
                divList.Visible = False
                divFestival.Visible = False

                btnBacktoDeadline.Visible = True
                btnBacktoSection.Visible = True
                btnBacktoFest.Visible = True

            Case "dead"
                divDead.Visible = True
                divList.Visible = False
                divFestival.Visible = False
                divSection.Visible = False

                btnBacktoDeadline.Visible = True
                btnBacktoSection.Visible = True
                btnBacktoFest.Visible = True

            Case Else
                divList.Visible = True
                divFestival.Visible = False
                divDead.Visible = False
                divSection.Visible = False

        End Select

        Dim DL As New DLL_CMS
        Dim Dset As New DataSet
        If Not IsPostBack Then
            If Request.QueryString("id") <> "" Then
                Panel.Enabled = True
                ''''''''''''''''''''''''''
                Dset = DL.PreUpdateFest(Val(Request.QueryString("id")))
                ''''''''''''''''''''''''''
                cmd_level.SelectedValue = Dset.Tables(0).Rows(0)("level")
                '''''''''''''''''''''''''''
                For i As Byte = 0 To DL.EachValueOfGenreFestival(Request.QueryString("id")).Tables(0).Rows.Count - 1
                    For j = 0 To 7
                        If cmd_genre.Items(j).Value = DL.EachValueOfGenreFestival(Request.QueryString("id")).Tables(0).Rows(i)(0).ToString Then
                            cmd_genre.Items(j).Selected = True
                        End If
                    Next
                Next
                ''''''''''''''''''''''''''
                cmd_shortfeature.SelectedValue = Dset.Tables(0).Rows(0)("short_feature")
                ''''''''''''''''''''''''''
                txtTitleEn.Text = Dset.Tables(0).Rows(0)("title_en")
                ''''''''''''''''''''''''''
                txtTitleFa.Text = Dset.Tables(0).Rows(0)("title_fa")
                ''''''''''''''''''''''''''
                txtAddress.Text = Dset.Tables(0).Rows(0)("address")
                ''''''''''''''''''''''''''
                cmd_country.SelectedValue = Dset.Tables(0).Rows(0)("country_code")
                ''''''''''''''''''''''''''
                txtCalStartTakePlace.Text = Dset.Tables(0).Rows(0)("date_start_takeplace")
                ''''''''''''''''''''''''''
                txtCalEndTakePlace.Text = Dset.Tables(0).Rows(0)("date_end_takeplace")
                ''''''''''''''''''''''''''
                txtWeb.Text = Dset.Tables(0).Rows(0)("web")
                ''''''''''''''''''''''''''
                txtDetail.Value = Dset.Tables(0).Rows(0)("detail")
                ''''''''''''''''''''''''''
                txtAttribute.Value = Dset.Tables(0).Rows(0)("attribute")
                ''''''''''''''''''''''''''
                imgLogo.ImageUrl = "~\files\uploadFiles\festival\" + Dset.Tables(0).Rows(0)("logo")
                PreLogoPath = Dset.Tables(0).Rows(0)("logo").ToString.Trim
                ''''''''''''''''''''''''''
                txtNotification.Text = Dset.Tables(0).Rows(0)("date_notification")
                ''''''''''''''''''''''''''
                cmd_premiere.SelectedValue = Dset.Tables(0).Rows(0)("premiere")
                ''''''''''''''''''''''''''
                TxtPremeire.Text = Dset.Tables(0).Rows(0)("premiere_text")
                ''''''''''''''''''''''''''
                txt_date_opening.Text = Dset.Tables(0).Rows(0)("date_opening")
                ''''''''''''''''''''''''''
                txt_date_completiondate.Text = Dset.Tables(0).Rows(0)("date_completion")
                ''''''''''''''''''''''''''
                txtRules.Value = Dset.Tables(0).Rows(0)("rules")
                ''''''''''''''''''''''''''
                cmdPlatform.SelectedValue = Dset.Tables(0).Rows(0)("platform")
                ''''''''''''''''''''''''''
                txtSubmitWay.Value = Dset.Tables(0).Rows(0)("submitway")
                ''''''''''''''''''''''''''
                rbEnableDisable.SelectedIndex = Math.Abs(Val(Dset.Tables(0).Rows(0)("flag")))
            End If
        End If
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim DL As New DLL_CMS
        '''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''
        If FileLogo.FileName.Trim = "" And PreLogoPath.ToString.Trim = "" Then
            lblNotify.Text = "لوگو را انتخاب کنید."
            Exit Sub
        End If
        '''''''''''''''''''''''''''''''''''''
        Dim genreStr As String = ""
        Try
            For i As Byte = 0 To cmd_genre.Items.Count - 1
                If cmd_genre.Items(i).Selected Then
                    genreStr = genreStr & "," & cmd_genre.Items(i).Value
                End If
            Next
            genreStr = genreStr.Trim.Substring(1, genreStr.Length - 1)
        Catch ex As Exception
        End Try
        Dim sfStr As String = ""
        Try
            For i As Byte = 0 To cmd_shortfeature.Items.Count - 1
                If cmd_shortfeature.Items(i).Selected Then
                    sfStr = sfStr & "," & cmd_shortfeature.Items(i).Value
                End If
            Next
            sfStr = sfStr.Trim.Substring(1, sfStr.Length - 1)
        Catch ex As Exception
        End Try
        ''''''''''''''''''''''''''''''''''
        If txtTitleEn.Text.Trim <> "" And txtTitleFa.Text.Trim <> "" And txtCalStartTakePlace.Text.Trim <> "" And txtCalEndTakePlace.Text <> "" And txtWeb.Text.Trim <> "" And txtDetail.Value.Trim <> "" And txtAttribute.Value.Trim <> "" And txt_date_completiondate.Text.Trim <> "" And txt_date_opening.Text.Trim <> "" And txtRules.Value.Trim <> "" And txtSubmitWay.Value.Trim <> "" Then

            Dim FN As String
            If FileLogo.FileName.Trim <> "" Then
                FN = Guid.NewGuid.ToString + Path.GetExtension(FileLogo.FileName.Trim)
                FileLogo.SaveAs(MapPath("~/files/UploadFiles/festival/" + FN))
            Else
                FN = PreLogoPath
            End If



            DL.UpdateFestival(Val(Request.QueryString("id").ToString), _
            Val(cmd_level.SelectedValue), _
            genreStr, _
            sfStr, _
            txtTitleEn.Text.Trim, txtTitleFa.Text.Trim, _
            txtAddress.Text.Trim, Val(cmd_country.SelectedValue), _
            Convert.ToDateTime(IIf(txtCalStartTakePlace.Text.Trim <> "", txtCalStartTakePlace.Text, CType(Nothing, DateTime))), _
            Convert.ToDateTime(IIf(txtCalEndTakePlace.Text.Trim <> "", txtCalEndTakePlace.Text, CType(Nothing, DateTime))), _
            txtWeb.Text.Trim, _
            convertNumFatoEn(txtDetail.Value.ToString), _
            convertNumFatoEn(txtAttribute.Value.ToString), _
            FN, _
            Convert.ToDateTime(IIf(txtNotification.Text.Trim <> "", txtNotification.Text, CType(Nothing, DateTime))), _
            Val(cmd_premiere.SelectedValue.ToString), _
            TxtPremeire.Text.Trim, _
            Convert.ToDateTime(IIf(txt_date_opening.Text.Trim <> "", txt_date_opening.Text, CType(Nothing, DateTime))), _
            Convert.ToDateTime(IIf(txt_date_completiondate.Text.Trim <> "", txt_date_completiondate.Text, CType(Nothing, DateTime))), _
            convertNumFatoEn(txtRules.Value.ToString), _
            Val(cmdPlatform.SelectedValue),
            convertNumFatoEn(txtSubmitWay.Value.ToString), _
            rbEnableDisable.SelectedItem.Value)

            lblNotify.Text = "فستیوال ویرایش شده است، بررسی کنید."
            GV.DataBind()
            Dim color As New Drawing.ColorConverter
            Panel.BackColor = color.ConvertFromString("#b8edc6")
            Panel.Enabled = False
            Response.Redirect("EditFestival")
        Else
            lblNotify.Text = "فیلد های کلیدی را پر کنید."
        End If

    End Sub

    Public Function convertNumFatoEn(ByVal T As String) As String
        Return T.Replace("۰", "0").Replace("۱", "1").Replace("۲", "2").Replace("۳", "3").Replace("۴", "4").Replace("۵", "5").Replace("۶", "6").Replace("۷", "7").Replace("۸", "8").Replace("۹", "9").Replace("٫", "/")
    End Function

    Protected Sub btnList_Click(sender As Object, e As System.EventArgs) Handles btnList.Click
        Response.Redirect("EditFestival?type=list")
    End Sub

    'Protected Sub btnFests_Click(sender As Object, e As System.EventArgs) Handles btnFests.Click
    '    Response.Redirect("editFest.aspx?type=fest")
    'End Sub

    'Protected Sub btnDeadline_Click(sender As Object, e As System.EventArgs) Handles btnDeadline.Click
    '    Response.Redirect("editFest.aspx?type=dead")
    'End Sub

    Protected Sub btnSection_Click(sender As Object, e As System.EventArgs) Handles btnSection.Click
        Dim dll As New DLL_CMS
        If txtSection.Text.Trim <> "" Then
            dll.InsertFestivalSection(Val(Request.QueryString("id")), txtSection.Text.Trim)
            txtSection.Text = ""
            dgSection.DataBind()
        End If
    End Sub

    Protected Sub btnDead_Click(sender As Object, e As System.EventArgs) Handles btnDead.Click
        Dim dll As New DLL_CMS

        'Response.Write(Calendar.SelectedDate.ToShortDateString)
        'Response.Write("</br>")
        'Response.Write(cmdSection.SelectedValue)
        'Response.Write("</br>")
        'Response.Write(txtFee.Text.Trim)

        If txtFee.Text.Trim <> "" And Calendar.SelectedDate <> Nothing And cmdSection.SelectedIndex <> -1 Then
            dll.InsertFestivalDead(Val(Request.QueryString("id")), _
                                   Calendar.SelectedDate.ToShortDateString, _
                                   cmdSection.SelectedValue, _
                                   txtFee.Text.Trim)
            txtFee.Text = ""
            dgFee.DataBind()
        End If
    End Sub

    Public Sub DeleteFestival(sender As Object, e As CommandEventArgs)
        Dim DLL As New DLL_CMS
        DLL.DeleteFestival(Val(e.CommandArgument.ToString))
        GV.DataBind()
    End Sub

    Protected Sub CalStartTakePlace_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalStartTakePlace.SelectionChanged
        txtCalStartTakePlace.Text = CalStartTakePlace.SelectedDate.Date.ToShortDateString
    End Sub

    Protected Sub CallEndTakePlace_SelectionChanged(sender As Object, e As System.EventArgs) Handles CallEndTakePlace.SelectionChanged
        txtCalEndTakePlace.Text = CallEndTakePlace.SelectedDate.Date.ToShortDateString
    End Sub

    Protected Sub CalNotification_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalNotification.SelectionChanged
        txtNotification.Text = CalNotification.SelectedDate.Date.ToShortDateString
    End Sub

    Protected Sub Cal_date_completiondate_SelectionChanged(sender As Object, e As System.EventArgs) Handles Cal_date_completiondate.SelectionChanged
        txt_date_completiondate.Text = Cal_date_completiondate.SelectedDate.Date.ToShortDateString
    End Sub

    Protected Sub Cal_date_opening_SelectionChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDatesEventArgs) Handles Cal_date_opening.SelectionChanged
        txt_date_opening.Text = Cal_date_opening.SelectedDate.Date.ToShortDateString
    End Sub

    Protected Sub btnBacktoFest_Click(sender As Object, e As System.EventArgs) Handles btnBacktoFest.Click
        Response.Redirect("~\cms\pages\EditFestival?id=" + Request.QueryString("id") + "&type=fest")
    End Sub

    Protected Sub btnBacktoDeadline_Click(sender As Object, e As System.EventArgs) Handles btnBacktoDeadline.Click
        Response.Redirect("~\cms\pages\EditFestival?id=" + Request.QueryString("id") + "&type=dead")
    End Sub

    Protected Sub btnBacktoSection_Click(sender As Object, e As System.EventArgs) Handles btnBacktoSection.Click
        Response.Redirect("~\cms\pages\EditFestival?id=" + Request.QueryString("id") + "&type=section")
    End Sub

    Public Sub Edit(sender As Object, e As CommandEventArgs)
        DivEdit.Visible = True
        Dim s() As String = e.CommandArgument.ToString.Split("|")

        lblDeadID.Text = s(0)
        CalcDeadEdit.FocusedDate = System.DateTime.Parse(Convert.ToDateTime(s(1)).Date)
        CalcDeadEdit.SelectedDate = System.DateTime.Parse(Convert.ToDateTime(s(1)).Date)
        txtEditFee.Text = s(2)
    End Sub

    Protected Sub btnUpdateDead_Click(sender As Object, e As System.EventArgs) Handles btnUpdateDead.Click
        Dim ds As New DLL_CMS
        ds.UpdateDeadline(CalcDeadEdit.SelectedDate, txtEditFee.Text, lblDeadID.Text)
        dgFee.DataBind()
        DivEdit.Visible = False
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        DgSearch.DataBind()
    End Sub
End Class
