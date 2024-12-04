
Partial Class kignServices
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Side-Servives"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
				lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
			Else
                Page.MetaDescription = "ساخت زیرنویس و طراحی پوستر و دی سی پی فیلم های کوتاه و بلند داستانی و مستند و انیمیشن و تجربی"
				Title = "سرویس‌های جانبی درگاه فیلم ایران"
				lblTopTitle.Text = "<span style='font-family:Titr;'>" + "سرویس‌های جانبی درگاه فیلم ایران" + "</span>"
			End If
        Else
			lblTopTitle.Text = "<span style='font-family:Titr;'>" + "سرویس‌های جانبی درگاه فیلم ایران" + "</span>"
			Page.MetaDescription = "ساخت زیرنویس و طراحی پوستر و دی سی پی فیلم های کوتاه و بلند داستانی و مستند و انیمیشن و تجربی"
			Title = "سرویس‌های جانبی درگاه فیلم ایران"
		End If
		''''''''''''' کامنت
		KingComments.Section = 6
        KingComments.IDPOST = -1
    End Sub
End Class
