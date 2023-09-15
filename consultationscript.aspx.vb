
Partial Class consultation
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.MetaDescription = "مشاوره فیلمنامه کوتاه - مشاوره فیلمنامه بلند - بازنویسی فیلمنامه کوتاه - بازنویسی فیلمنامه بلند - ایده پردازی - نوشتن فیلمنامه کوتاه - نوشتن فیلمنامه بلند"
        Title = "مشاوره فیلمنامه و بازنویسی فیلمنامه"
        Try
            Dim ds As New DLL_CMS
            lbl.Text = ds.ShowScriptConsultation.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
        Catch ex As Exception
        End Try
        ''''''''''''' کامنت
        comment.Section = 4
        comment.IDPOST = -1
    End Sub
End Class
