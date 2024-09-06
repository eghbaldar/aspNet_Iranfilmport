
Imports System.Data

Partial Class kingcategories
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT - Search"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Search" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(False)
                Catch ex As Exception
                End Try
            Else
                Title = "جستجو مقالات تبلیغات درگاه فیلم ایران"
                Page.MetaDescription = "جستجو مقالات تبلیغات درگاه فیلم ایران"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "دسته: " + RouteData.Values("title").ToString().Replace("-", " ") + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
                Catch ex As Exception
                End Try
            End If
        Else
            Title = "جستجو مقالات تبلیغات درگاه فیلم ایران"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "دسته: " + RouteData.Values("title").Replace("-", " ") + "</span>"
            Page.MetaDescription = "جستجو مقالات تبلیغات درگاه فیلم ایران"
        End If
        setTages()
    End Sub

    Public Function getDate(ByVal e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
    End Function

    Private Sub setTages()
        Dim DL As New DLL
        Page.Title = DL.GetClearString(RouteData.Values("title")).Replace("-", " ") + " | درگاه فیلم کوتاه ایران"
        MetaDescription = DL.GetClearString(RouteData.Values("title")).Replace("-", " ") + " - طبقه بندی مقالات و موضوعات پخش و ارسال فیلم و نقد و تحلیل فیلم"
        '''''''''''''''''''''''''''''''''''''''''''''''''' dinamically metag
        Dim Dset As New DataSet
        Dim DLCMS As New DLL_CMS
        Dset = DLCMS.PreUpdateArticle(Val(RouteData.Values("id")))

        Dim keywords As HtmlMeta = New HtmlMeta()
        Dim metaTag As New HtmlMeta()
        'metaTag.Attributes.Add("property", "og:image")
        'metaTag.Content = "http:\\iranfilmport.com\files\uploadFiles\article\" + Dset.Tables(0).Rows(0)("photo")
        'pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:type")
        metaTag.Content = "article"
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:title")
        metaTag.Content = Dset.Tables(0).Rows(0)("title").ToString
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:description")
        metaTag.Content = Server.HtmlDecode(Regex.Replace(Dset.Tables(0).Rows(0)("lid").ToString, "<.*?>", String.Empty))
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:url")
        metaTag.Content = "http://iranfilmport.com/" + RouteData.Values("id").ToString + "/" + DL.GetTitleBlog(Val(RouteData.Values("id"))).Replace(" ", "-") + ".html"
        pc.Controls.Add(metaTag)
    End Sub

    Public Function getShortLink(ByVal e As Object) As String
        Return String.Format("{1}{0}", "<a style='color:blue;' href=" + "http://iranfilmport.com/" + RouteData.Values("id").ToString + ">" + "iranfilmport.com/" + RouteData.Values("id").ToString + "</a>", "لینک کوتاه و استاندارد: ")
    End Function

    Public Function getTelegram(ByVal e As Object) As String
        Return "https://telegram.me/share/url?url=" + "iranfilmport.com/blog/article/id/" + RouteData.Values("id").ToString
    End Function
    Public Function getTw(ByVal e As Object) As String
        Return "https://twitter.com/intent/tweet?url=" + "iranfilmport.com/blog/article/id/" + RouteData.Values("id").ToString
    End Function
    Public Function getFB(ByVal e As Object) As String
        Return "https://www.facebook.com/sharer/sharer.php?u=" + "iranfilmport.com/blog/article/id/" + RouteData.Values("id").ToString
    End Function

    Public Function getLink(ByVal id As Object, ByVal title As Object) As String
        Dim T As String = title.ToString().Replace(" ", "-").Replace("»", "").Replace("«", "").Replace("ي", "ی").Replace("?", "").Replace("؟", "").Replace("!", "").Replace("معرفی", "").Replace("-بود-", "-").Replace("شدند", "").Replace(")", "").Replace("(", "").Replace("}", "").Replace("{", "").Replace("[", "").Replace("]", "").Replace("_", "").Replace("،", "").Replace("؛", "").Replace(".", "").Replace(":", "").Replace("""", "-").Replace("/", "").Replace("|", "").Replace("\", "-").Replace("-و-", "-").Replace("-در-", "-").Replace("-را-", "-").Replace("-با-", "-").Replace("-به-", "-").Replace("-آن-", "-").Replace("-این-", "-").Replace("-گردید-", "-").Replace("-شد-", "-").Replace("-های-", "-").Replace("--", "-").Replace("--", "")
        If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
        If T.Length > 50 Then
            Return String.Format("~/{0}/{1}", id.ToString, T.Substring(0, 50))
        Else
            Return String.Format("~/{0}/{1}", id.ToString, T)
        End If
    End Function

End Class
