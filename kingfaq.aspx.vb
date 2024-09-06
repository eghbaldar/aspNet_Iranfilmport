
Partial Class kingfaq
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT FAQ"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Page.MetaDescription = "مشاوره فیلمنامه کوتاه - مشاوره فیلمنامه بلند - بازنویسی فیلمنامه کوتاه - بازنویسی فیلمنامه بلند - ایده پردازی - نرم افزار تدوین فیلم کوتاه - آموزش نرم افزار زیرنویس فیلم "
                Title = "آموزش و سوالات پر تکرار نرم افزارهای سینمایی و تدوین فیلم"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "آموزش و سوالات پر تکرار نرم افزارهای سینمایی و تدوین فیلم" + "</span>"
            End If
        Else
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "آموزش و سوالات پر تکرار نرم افزارهای سینمایی و تدوین فیلم" + "</span>"
            Page.MetaDescription = "مشاوره فیلمنامه کوتاه - مشاوره فیلمنامه بلند - بازنویسی فیلمنامه کوتاه - بازنویسی فیلمنامه بلند - ایده پردازی - نرم افزار تدوین فیلم کوتاه - آموزش نرم افزار زیرنویس فیلم "
            Title = "آموزش و سوالات پر تکرار نرم افزارهای سینمایی و تدوین فیلم"
        End If
    End Sub
End Class
