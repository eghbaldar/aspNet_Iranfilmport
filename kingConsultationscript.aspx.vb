
Partial Class kingConsultationscript
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Consultation Script"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Page.MetaDescription = "مشاوره فیلمنامه کوتاه - مشاوره فیلمنامه بلند - بازنویسی فیلمنامه کوتاه - بازنویسی فیلمنامه بلند - ایده پردازی - نوشتن فیلمنامه کوتاه - نوشتن فیلمنامه بلند"
                Title = "مشاوره فیلمنامه و بازنویسی فیلمنامه"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "مشاوره فیلمنامه و بازنویسی فیلمنامه" + "</span>"
            End If
        Else
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "مشاوره فیلمنامه و بازنویسی فیلمنامه" + "</span>"
            Page.MetaDescription = "مشاوره فیلمنامه کوتاه - مشاوره فیلمنامه بلند - بازنویسی فیلمنامه کوتاه - بازنویسی فیلمنامه بلند - ایده پردازی - نوشتن فیلمنامه کوتاه - نوشتن فیلمنامه بلند"
            Title = "مشاوره فیلمنامه و بازنویسی فیلمنامه"
        End If
        Try
            Dim ds As New DLL_CMS
            lbl.Text = ds.ShowScriptConsultation.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
        Catch ex As Exception
        End Try
        ''''''''''''' کامنت
        KingComments.Section = 4
        KingComments.IDPOST = -1
    End Sub
End Class
