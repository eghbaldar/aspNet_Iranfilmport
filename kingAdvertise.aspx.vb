
Partial Class kingAdvertise
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT - Advertisement"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Advertisement" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(False)
                Catch ex As Exception
                End Try
            Else
                Title = "ارسال خبر و تعرفه تبلیغات درگاه فیلم ایران"
                Page.MetaDescription = "انتشار خبر سینمایی و فیلمنامه و تبلیغات در درگاه فیلم ایران "
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال خبر و تعرفه تبلیغات درگاه فیلم ایران" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
                Catch ex As Exception
                End Try
            End If
        Else
            Title = "ارسال خبر و تعرفه تبلیغات درگاه فیلم ایران"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال خبر و تعرفه تبلیغات درگاه فیلم ایران" + "</span>"
            Page.MetaDescription = "انتشار خبر سینمایی و فیلمنامه و تبلیغات در درگاه فیلم ایران "
            Try
                Dim ds As New DLL_CMS
                lbl.Text = ds.ShowAdvertise.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
            Catch ex As Exception
            End Try
        End If
    End Sub
End Class
