
Partial Class kingHowitworks
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT - Distribution Method"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Title = "پخش و ارسال فیلم به فستیوال های بین المللی"
                Page.MetaDescription = "ارسال و پخش فیلم کوتاه و بلند به جشنواره ها و فستیوال های فیلم خارجی و بین المللی"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال خبر و تبلغات در درگاه فیلم ایران" + "</span>"
            End If
        Else
            Title = "پخش و ارسال فیلم به فستیوال های بین المللی"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "شیوه پخش درگاه فیلم ایران" + "</span>"
            Page.MetaDescription = "ارسال و پخش فیلم کوتاه و بلند به جشنواره ها و فستیوال های فیلم خارجی و بین المللی"
        End If
        ''''''''''''' کامنت
        KingComments.Section = 1
        KingComments.IDPOST = -1
        '''''''''''''
    End Sub
End Class
