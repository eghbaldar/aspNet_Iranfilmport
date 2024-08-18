
Partial Class kingFestivalABC
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT International Film Festivals"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Page.MetaDescription = "فستیوال، فستیوال فیلم ، فیلم کوتاه، دسته بندی فستیوال ها، جشنواره های فیلم، جشنواره ، فیلم کوتاه، ارسال فیلم به فستیوال ها، پخش فیلم به فستیوال ها، طبقه بندی جشنواره های خارجی"
                Title = "فستیوال های فیلم کوتاه و بلند"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "فستیوال های فیلم کوتاه و بلند" + "</span>"
            End If
        Else
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "فستیوال های فیلم کوتاه و بلند" + "</span>"
            Page.MetaDescription = "فستیوال، فستیوال فیلم ، فیلم کوتاه، دسته بندی فستیوال ها، جشنواره های فیلم، جشنواره ، فیلم کوتاه، ارسال فیلم به فستیوال ها، پخش فیلم به فستیوال ها، طبقه بندی جشنواره های خارجی"
            Title = "فستیوال های فیلم کوتاه و بلند"
        End If
    End Sub
End Class
