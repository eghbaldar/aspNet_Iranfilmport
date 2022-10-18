
Partial Class testimonial
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "Filmmakers' Testimonials"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "Filmmakers' Testimonials" + "</span>"
            Else
                Title = "تصدیق‌نامه‌های فیلمسازان ما"
                Page.MetaDescription = "درگاه فیلم ایران - شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "درباره‌ی درگاه فیلم ایران" + "</span>"
            End If
        Else
            Title = "تصدیق‌نامه‌های فیلمسازان ما"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "تصدیق‌نامه‌های فیلمسازان ما" + "</span>"
            Page.MetaDescription = "درگاه فیلم ایران - شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
        End If


    End Sub

End Class
