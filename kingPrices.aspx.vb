
Partial Class kingPrices
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Film Distribution Cost"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Title = "تعرفه و هزینه پخش فیلم"
                Page.MetaDescription = "هزینه و قیمت ارسال فیلم کوتاه و بلند به فستیوال ها و جشنواره های بین المللی و خارجی"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "محاسبه هزینه پخش فیلم" + "</span>"
            End If
        Else
            Title = "تعرفه و هزینه پخش فیلم"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "محاسبه هزینه پخش فیلم" + "</span>"
            Page.MetaDescription = "هزینه و قیمت ارسال فیلم کوتاه و بلند به فستیوال ها و جشنواره های بین المللی و خارجی"
        End If
        ''''''''''''' کامنت
        KingComments.Section = 3
        KingComments.IDPOST = -1
    End Sub
End Class
