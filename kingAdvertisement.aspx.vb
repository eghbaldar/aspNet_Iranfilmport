
Partial Class kingAdvertisement
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Advertisement"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Title = "ارسال خبر و تبلغات در درگاه فیلم ایران"
                Page.MetaDescription = "درگاه فیلم ایران - شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال خبر و تبلغات در درگاه فیلم ایران" + "</span>"
            End If
        Else
            Title = "ارسال خبر و تبلغات در درگاه فیلم ایران"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال خبر و تبلغات در درگاه فیلم ایران" + "</span>"
            Page.MetaDescription = "درگاه فیلم ایران - شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
        End If
        Try
            Dim ds As New DLL_CMS
            lbl.Text = ds.ShowAdvertise.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
        Catch ex As Exception
        End Try
    End Sub
End Class
