
Partial Class kingTeam
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FILM PORT TEAM ADN MANAGEMENT"
                Page.MetaDescription = "IRAN FILM PORT, alimohammad eghbaldar, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT TEAM" + "</span>"
            Else
                Title = "تیم و مدیریت درگاه فیلم ایران"
                Page.MetaDescription = "درگاه فیلم ایران - علیمحمد اقبالدار - شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
                lblTopTitle.Text = "<span>" + "تیم و مدیریت شرکت" + "</span>"
            End If
        Else
            Title = "تیم و مدیریت درگاه فیلم ایران"
            lblTopTitle.Text = "<span>" + "تیم و مدیریت شرکت" + "</span>"
            Page.MetaDescription = "درگاه فیلم ایران - علیمحمد اقبالدار -  شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
        End If
    End Sub
End Class
