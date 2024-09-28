
Partial Class kingCostInquiry
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT POSTER SUBTITLE Cost Inquiry"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT POSTER SUBTITLE Cost Inquiry" + "</span>"
            Else
                Title = "استعلام هزینه طراحی پوستر و زیرنویس فیلم"
                Page.MetaDescription = "طراحی پوستر فیلم کوتاه - طراحی پوستر فیلم سینمایی - زیرنویس حک شده فیلم - ترجمه زیرنویس - اس آر تی "
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال فیلم و فیلمنامه به درگاه فیلم ایران" + "</span>"
            End If
        Else
            Title = "استعلام هزینه طراحی پوستر و زیرنویس فیلم"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "استعلام هزینه طراحی پوستر و زیرنویس فیلم" + "</span>"
            Page.MetaDescription = "طراحی پوستر فیلم کوتاه - طراحی پوستر فیلم سینمایی - زیرنویس حک شده فیلم - ترجمه زیرنویس - اس آر تی "
        End If
    End Sub
End Class
