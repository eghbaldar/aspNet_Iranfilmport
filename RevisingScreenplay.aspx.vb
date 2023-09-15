
Partial Class RevisingScreenplay
    Inherits System.Web.UI.Page

    Private Sub RevisingScreenplay_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MetaDescription = "نگارش فیلمنامه های کوتاه و بلند و بازنویسی فیلمنامه و مشاوره کارشناسی پخش و ارسال بین المللی فیلم کوتاه و بلند به جشنواره های فیلم خارجی"
        Title = "نگارش و بازنویسی فیلمنامه های کوتاه و بلند"
        Try
            Dim ds As New DLL_CMS
            lbl.Text = ds.ShowScriptConsultation.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
        Catch ex As Exception
        End Try
        ''''''''''''' کامنت
        comment.Section = 4
        comment.IDPOST = -1
    End Sub
End Class
