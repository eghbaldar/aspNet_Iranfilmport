
Partial Class kingService_mediamaking
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Media Making"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Page.MetaDescription = "رسانه سازی و مدیریت اینستاگرام و فیسبوک فیلم های کوتاه و بلند و شناخته شدن فیلم و کارگردان آن در محیط های مجازی"
                Title = "رسانه سازی پخش و ارسال فیلم"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "رسانه سازی فیلم" + "</span>"
            End If
        Else
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "رسانه سازی فیلم" + "</span>"
            Page.MetaDescription = "رسانه سازی و مدیریت اینستاگرام و فیسبوک فیلم های کوتاه و بلند و شناخته شدن فیلم و کارگردان آن در محیط های مجازی"
            Title = "رسانه سازی پخش و ارسال فیلم"
        End If
        ''''''''''''' کامنت
        KingComments.Section = 5
        KingComments.IDPOST = -1
    End Sub
End Class
