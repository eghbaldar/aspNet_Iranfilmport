Imports System.IO

Partial Class CMS_Pages_addFest
    Inherits System.Web.UI.Page

    Protected Sub BtnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnInsert.Click
        Dim DLL As New DLL_CMS

        Dim genreStr As String = ""
        'Try
        For i As Byte = 0 To cmd_genre.Items.Count - 1
            If cmd_genre.Items(i).Selected Then
                genreStr = genreStr & "," & cmd_genre.Items(i).Value
            End If
        Next
        genreStr = genreStr.Trim.Substring(1, genreStr.Length - 1)
        'Catch ex As Exception
        'End Try
        Dim sfStr As String = ""
        'Try
        For i As Byte = 0 To cmd_shortfeature.Items.Count - 1
            If cmd_shortfeature.Items(i).Selected Then
                sfStr = sfStr & "," & cmd_shortfeature.Items(i).Value
            End If
        Next
        sfStr = sfStr.Trim.Substring(1, sfStr.Length - 1)
        'Catch ex As Exception
        'End Try

        If txtTitleEn.Text.Trim <> "" _
            And txtTitleFa.Text.Trim <> "" _
            And CalStartTakePlace.SelectedDate.ToShortDateString <> "" _
            And CalEndTakePlace.SelectedDate.ToShortDateString <> "" _
            And txtWeb.Text.Trim <> "" _
            And txtDetail.Value.Trim <> "" _
            And txtAttribute.Value.Trim <> "" _
            And FileLogo.FileName <> "" _
            And Cal_date_completiondate.SelectedDate.ToShortDateString() <> "" _
            And Cal_date_opening.SelectedDate.ToShortDateString() <> "" _
            And txtRules.Value.Trim <> "" _
            And txtSubmitWay.Value.Trim <> "" Then

            Dim FN As String = Guid.NewGuid.ToString + Path.GetExtension(FileLogo.FileName)

            DLL.InsertFestival(
            Val(cmd_level.SelectedValue),
            genreStr,
            sfStr,
            txtTitleEn.Text.Trim,
            txtTitleFa.Text.Trim,
            txtAddress.Text.Trim, Val(cmd_country.SelectedValue),
            Convert.ToDateTime(IIf(CalStartTakePlace.SelectedDate.ToShortDateString <> "", CalStartTakePlace.SelectedDate.ToShortDateString, CType(Nothing, DateTime))),
            Convert.ToDateTime(IIf(CalEndTakePlace.SelectedDate.ToShortDateString <> "", CalEndTakePlace.SelectedDate.ToShortDateString, CType(Nothing, DateTime))),
            txtWeb.Text.Trim,
            convertNumFatoEn(txtDetail.Value.ToString),
            convertNumFatoEn(txtAttribute.Value.ToString),
            FN,
            Convert.ToDateTime(IIf(CalNotification.SelectedDate.ToShortDateString <> "", CalNotification.SelectedDate.ToShortDateString, CType(Nothing, DateTime))),
            Val(cmd_premiere.SelectedValue.ToString),
            TxtPremeire.Text.Trim,
            Convert.ToDateTime(IIf(Cal_date_opening.SelectedDate.ToShortDateString() <> "", Cal_date_opening.SelectedDate.ToShortDateString(), CType(Nothing, DateTime))),
            Convert.ToDateTime(IIf(Cal_date_completiondate.SelectedDate.ToShortDateString() <> "", Cal_date_completiondate.SelectedDate.ToShortDateString(), CType(Nothing, DateTime))),
            convertNumFatoEn(txtRules.Value.ToString),
            Val(cmdPlatform.SelectedValue),
            convertNumFatoEn(txtSubmitWay.Value.ToString))

            FileLogo.SaveAs(MapPath("~/files/UploadFiles/festival/" + FN))

            lblNotify.Text = "فستیوال درج شده است، بررسی کنید."
            GV.DataBind()
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            Page.RegisterStartupScript("OpenPages", "<script type='text/javascript'>window.open('EditFestival','_self');window.open('../../cms/pages/sitemap');</script>")
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        Else
            lblNotify.Text = "تمامی فیلدها پر شود"
        End If

    End Sub

    Public Function convertNumFatoEn(ByVal T As String) As String
        Return T.Replace("۰", "0").Replace("۱", "1").Replace("۲", "2").Replace("۳", "3").Replace("۴", "4").Replace("۵", "5").Replace("۶", "6").Replace("۷", "7").Replace("۸", "8").Replace("۹", "9").Replace("٫", "/")
    End Function

    'Protected Sub CalStartTakePlace_SelectionChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDatesEventArgs) Handles CalStartTakePlace.SelectionChanged
    '    txtCalStartTakePlace.Text = CalStartTakePlace.SelectedDate.Date.ToShortDateString
    'End Sub
    'Protected Sub CalEndTakePlace_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalEndTakePlace.SelectionChanged
    '    txtCalEndTakePlace.Text = CalEndTakePlace.SelectedDate.Date.ToShortDateString
    'End Sub
    'Protected Sub CalNotification_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalNotification.SelectionChanged
    '    txtNotification.Text = CalNotification.SelectedDate.Date.ToShortDateString
    'End Sub
    'Protected Sub Cal_date_opening_SelectionChanged(sender As Object, e As System.EventArgs) Handles Cal_date_opening.SelectionChanged
    '    txt_date_opening.Text = Cal_date_opening.SelectedDate.Date.ToShortDateString
    'End Sub
    'Protected Sub Cal_date_completiondate_SelectionChanged(sender As Object, e As System.EventArgs) Handles Cal_date_completiondate.SelectionChanged
    '    txt_date_completiondate.Text = Cal_date_completiondate.SelectedDate.Date.ToShortDateString
    'End Sub

End Class
