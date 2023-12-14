
Imports System.IO

Partial Class CMS_Pages_testimonials
    Inherits System.Web.UI.Page

    Private Sub btnInsert_Click(sender As Object, e As EventArgs) Handles btnInsert.Click

        Try
            If txtFilmmaker_Insert.Text.Trim <> "" And FileInsert.FileName.Trim <> "" Then
                Dim DLL As New DLL_CMS

                Dim RB As Byte
                If rbPic.Checked Then RB = 0
                If rbVoice.Checked Then RB = 1

                Dim FN As String = Guid.NewGuid.ToString & Path.GetExtension(FileInsert.FileName)
                DLL.InsertTestimonial(txtFilmmaker_Insert.Text.Trim, FN, RB)
                FileInsert.SaveAs(MapPath("~/files/UploadFiles/testimonials/" + FN))
                GV.DataBind()
                NotifyInsert.Text = "تصدیقنامه اضافه شد. بررسی کنید."
            Else
                NotifyInsert.Text = "تمامی فیلد ها را پر کنید."
            End If
        Catch ex As Exception
            NotifyInsert.Text = "خطایی رخ داده است"
        End Try

    End Sub

End Class
