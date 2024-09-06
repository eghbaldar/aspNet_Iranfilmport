
Partial Class kingExhibition
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Exhibition Short Film"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                MetaDescription = " دانلود فیلم های کوتاه خارجی - دانلود فیلم های کوتاه ایرانی - دانلود فیلم - دانلود فیلم کوتاه - دانلود فیلم‌کوتاه "
                Title = "دانلود و نمایش فیلم کوتاه | منتخبین درگاه فیلم ایران"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "مشاوره فیلمنامه و بازنویسی فیلمنامه""دانلود و نمایش فیلم کوتاه | منتخبین درگاه فیلم ایران" + "</span>"
            End If
        Else
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "دانلود و نمایش فیلم کوتاه | منتخبین درگاه فیلم ایران" + "</span>"
            MetaDescription = " دانلود فیلم های کوتاه خارجی - دانلود فیلم های کوتاه ایرانی - دانلود فیلم - دانلود فیلم کوتاه - دانلود فیلم‌کوتاه "
            Title = "دانلود و نمایش فیلم کوتاه | منتخبین درگاه فیلم ایران"
        End If
    End Sub
End Class
