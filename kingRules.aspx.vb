
Partial Class kingRules
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Rules"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Page.MetaDescription = "قوانین و مقررات پخش فیلم، قوانین پخش فیلم، قوانین ارسال فیلم ، مقررات ارسال فیلم، مقررات پخش فیلم، دستورالعمل پخش فیلم، دستورالعمل ارسال فیلم، راهنمای ارسال فیلم، راهنمای پخش فیلم"
                Title = "قوانین و مقررات درگاه فیلم ایران"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "قوانین و مقررات درگاه فیلم ایران" + "</span>"
            End If
        Else
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "قوانین و مقررات درگاه فیلم ایران" + "</span>"
            Page.MetaDescription = "قوانین و مقررات پخش فیلم، قوانین پخش فیلم، قوانین ارسال فیلم ، مقررات ارسال فیلم، مقررات پخش فیلم، دستورالعمل پخش فیلم، دستورالعمل ارسال فیلم، راهنمای ارسال فیلم، راهنمای پخش فیلم"
            Title = "قوانین و مقررات درگاه فیلم ایران"
        End If
        ''''''''''''' کامنت
        KingComments.Section = 2
        KingComments.IDPOST = -1
    End Sub
End Class
