
Partial Class kingNamad
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Truth Sign"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Page.MetaDescription = "اعطای نماد اعتماد و بهره مندی از امکانات ارسال و پخش فیلم و فیلمنامه به فستیوال های بین المللی فیلم کوتاه و بلند"
                Title = "نماد اعتماد درگاه فیلم ایران چیست؟"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "نماد اعتماد درگاه فیلم ایران چیست؟" + "</span>"
            End If
        Else
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "نماد اعتماد درگاه فیلم ایران چیست؟" + "</span>"
            Page.MetaDescription = "اعطای نماد اعتماد و بهره مندی از امکانات ارسال و پخش فیلم و فیلمنامه به فستیوال های بین المللی فیلم کوتاه و بلند"
            Title = "نماد اعتماد درگاه فیلم ایران چیست؟"
        End If
    End Sub
End Class
