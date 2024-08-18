
Imports System.Data

Partial Class kingPosts
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        setTages()
        'If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
        '    If Request.QueryString("lang").Trim.ToLower = "en" Then
        '        Title = "IRAN FLLM PORT Consultation Script"
        '        Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
        '        lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
        '    Else
        '        Page.MetaDescription = "مشاوره فیلمنامه کوتاه - مشاوره فیلمنامه بلند - بازنویسی فیلمنامه کوتاه - بازنویسی فیلمنامه بلند - ایده پردازی - نوشتن فیلمنامه کوتاه - نوشتن فیلمنامه بلند"
        '        Title = "مشاوره فیلمنامه و بازنویسی فیلمنامه"
        '        lblTopTitle.Text = "<span style='font-family:Titr;'>" + "مشاوره فیلمنامه و بازنویسی فیلمنامه" + "</span>"
        '    End If
        'Else
        '    lblTopTitle.Text = "<span style='font-family:Titr;'>" + "مشاوره فیلمنامه و بازنویسی فیلمنامه" + "</span>"
        '    Page.MetaDescription = "مشاوره فیلمنامه کوتاه - مشاوره فیلمنامه بلند - بازنویسی فیلمنامه کوتاه - بازنویسی فیلمنامه بلند - ایده پردازی - نوشتن فیلمنامه کوتاه - نوشتن فیلمنامه بلند"
        '    Title = "مشاوره فیلمنامه و بازنویسی فیلمنامه"
        'End If
        'Try
        '    Dim ds As New DLL_CMS
        '    lbl.Text = ds.ShowScriptConsultation.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
        'Catch ex As Exception
        'End Try
    End Sub

    Public Function getDate(ByVal e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
    End Function
    Private Sub setTages()
        Dim DL As New DLL
        MetaKeywords = ",مقاله، مقالات، مقاله پخش فیلم، آموزش پخش فیلم، مقالات تالیفی پخش، مقالات ترجمه پخش فیلم، یادداشت ، فراخوان های ایرانی، اخبار سینمایی، اخبار فیلم کوتاه"
        MetaDescription = "مقالات تحلیلی، نقدها و اخبار فیلم کوتاه را در درگاه فیلم ایران دنبال کنید"
        Title = "نقد ، تحلیل و اخبار فیلم کوتاه - درگاه فیلم ایران"
        '''''''''''''''''''''''''''''''''''''''''''''''''' dinamically metag
        Dim Dset As New DataSet
        Dim DLCMS As New DLL_CMS
        Dset = DLCMS.PreUpdateArticle(Val(RouteData.Values("id")))

        Dim keywords As HtmlMeta = New HtmlMeta()
        Dim metaTag As New HtmlMeta()
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:type")
        metaTag.Content = "article"
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:title")
        metaTag.Content = "اخبار ، نقد و تحلیل فیلم کوتاه"
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:description")
        metaTag.Content = "مقالات تحلیلی، نقدها و اخبار فیلم کوتاه را در درگاه فیلم ایران دنبال کنید"
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:url")
        metaTag.Content = "http://iranfilmport.com/اخبار-نقد-تحلیل-فیلم-کوتاه"
        pc.Controls.Add(metaTag)
    End Sub
    Public Function getLink(ByVal id As Object, ByVal title As Object) As String
        Dim DL As New DLL
        Dim T As String = DL.GetClearString(title.ToString())
        If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
        If T.Length > 50 Then
            Return String.Format("~/{0}/{1}", id.ToString, T.Substring(0, 50))
        Else
            Return String.Format("~/{0}/{1}", id.ToString, T)
        End If
    End Function

End Class
