
Partial Class advertise
    Inherits System.Web.UI.Page

    Private Sub advertise_Load(sender As Object, e As EventArgs) Handles Me.Load
        Title = "ارسال خبر و تعرفه تبلیغات درگاه فیلم ایران"
        Page.MetaDescription = "انتشار خبر سینمایی و فیلمنامه و تبلیغات در درگاه فیلم ایران "
        lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال خبر و تبلیغات درگاه فیلم ایران" + "</span>"
        Try
            Dim ds As New DLL_CMS
            lbl.Text = ds.ShowAdvertise.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
        Catch ex As Exception
        End Try
    End Sub
End Class
