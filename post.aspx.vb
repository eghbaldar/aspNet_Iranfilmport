Imports System.Data

Partial Class post
    Inherits System.Web.UI.Page

    Dim DL As New DLL

    Public Function getPostImage() As String
        Dim ds As New DLL
        Return String.Format("http://iranfilmport.com/files/uploadfiles/article/{0}", ds.GetImageBlog(RouteData.Values("id"))).Trim
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim DL As New DLL

        'بررسی وجود و یا فعال بدون پست
        If DL.IsEnablePost(RouteData.Values("id")) Then Response.Redirect("~/عدم-دسترسی")

        lblGetPostTitle.Text = DL.GetTitleBlog(RouteData.Values("id"))
        Title = DL.GetTitleBlog(RouteData.Values("id"))
        Try
            ''''''''''' آیا از URL بدون عنوان استفاده کرده است؟
            If String.IsNullOrWhiteSpace(RouteData.Values("title")) Then
                Response.Redirect("~/" + RouteData.Values("id") + "/" + DL.GetClearString(DL.GetTitleBlog(Val(RouteData.Values("id")))))
            End If
            ' '''''''''''
            DL.IncreaseViwerArticle(Val(RouteData.Values("id")))
            setTages()
            ''''''''''''' کامنت
            comment.Section = 0
            comment.IDPOST = Val(RouteData.Values("id"))
            '''''''''''''
        Catch ex As Exception
        End Try

    End Sub

    Public Function getDate(ByVal e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
    End Function

    Private Sub setTages()
        Dim DL As New DLL
        'MetaKeywords = DL.GetTagsBlog("id").Replace("-", ",") + "," + DL.GetTitleBlog(Val(RouteData.Values("id"))).Replace(" ", ",") + ",مقاله، مقالات، مقاله پخش فیلم، آموزش پخش فیلم، مقالات تالیفی پخش، مقالات ترجمه پخش فیلم، یادداشت ، فراخوان های ایرانی، اخبار سینمایی، اخبار فیلم کوتاه"
        MetaKeywords = ","
        MetaDescription = Server.HtmlDecode(Regex.Replace(DL.GetLidBlog(Val(RouteData.Values("id"))), "<.*?>", String.Empty)).Replace("»", "").Replace("«", "").Replace("ي", "ی")
        Title = DL.GetTitleBlog(Val(RouteData.Values("id"))).Replace("»", "").Replace("«", "").Replace("ي", "ی")
        '''''''''''''''''''''''''''''''''''''''''''''''''' dinamically metag
        Dim Dset As New DataSet
        Dim DLCMS As New DLL_CMS
        Dset = DLCMS.PreUpdateArticle(Val(RouteData.Values("id")))

        Dim keywords As HtmlMeta = New HtmlMeta()
        Dim metaTag As New HtmlMeta()
        metaTag.Attributes.Add("property", "og:image")
        metaTag.Content = "http://iranfilmport.com/files/uploadFiles/article/" + Dset.Tables(0).Rows(0)("photo")
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:type")
        metaTag.Content = "article"
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:title")
        metaTag.Content = Dset.Tables(0).Rows(0)("title").ToString.Replace("»", "").Replace("«", "").Replace("ي", "ی")
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:description")
        metaTag.Content = Server.HtmlDecode(Regex.Replace(Dset.Tables(0).Rows(0)("lid").ToString, "<.*?>", String.Empty)).Replace("»", "").Replace("«", "").Replace("ي", "ی")
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:url")
        metaTag.Content = getLink(RouteData.Values("id").ToString, DL.GetTitleBlog(Val(RouteData.Values("id"))))
        pc.Controls.Add(metaTag)
        ''''''''''''''' Robots
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("name", "robots")
        metaTag.Content = "index, follow"
        pc.Controls.Add(metaTag)
        ''''''''''''''' Generator
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("name", "generator")
        metaTag.Content = "iranfilmport.com"
        pc.Controls.Add(metaTag)
    End Sub

    Public Function getLink(ByVal id As Object, ByVal title As Object) As String
        Dim T As String = title.ToString().Replace(" ", "-").Replace("»", "").Replace("«", "").Replace("ي", "ی").Replace("?", "").Replace("؟", "").Replace("!", "").Replace("معرفی", "").Replace("-بود-", "-").Replace("شدند", "").Replace(")", "").Replace("(", "").Replace("}", "").Replace("{", "").Replace("[", "").Replace("]", "").Replace("_", "").Replace("،", "").Replace("؛", "").Replace(".", "").Replace(":", "").Replace("""", "-").Replace("/", "").Replace("|", "").Replace("\", "-").Replace("-و-", "-").Replace("-در-", "-").Replace("-را-", "-").Replace("-با-", "-").Replace("-به-", "-").Replace("-آن-", "-").Replace("-این-", "-").Replace("-گردید-", "-").Replace("-شد-", "-").Replace("-های-", "-").Replace("--", "-").Replace("--", "")
        If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
        If T.Length > 50 Then
            Return String.Format("http://iranfilmport.com/{0}/{1}", id.ToString, T.Substring(0, 50))
        Else
            Return String.Format("http://iranfilmport.com/{0}/{1}", id.ToString, T)
        End If
    End Function

    Public Function getShortLink(ByVal e As Object) As String
        Return String.Format("{1}{0}", "<a style='color:blue;' href=" + "http://iranfilmport.com/" + RouteData.Values("id").ToString + ">" + "iranfilmport.com/" + RouteData.Values("id").ToString + "</a>", "لینک کوتاه و استاندارد: ")
    End Function

    Public Function getTelegram(ByVal id As Object, title As Object) As String
        Return "https://telegram.me/share/url?url=" + "iranfilmport.com/" + id.ToString + "/" + DL.GetClearString(title.ToString())
    End Function
    Public Function getTw(ByVal id As Object, title As Object) As String
        Return "https://twitter.com/intent/tweet?url=" + "iranfilmport.com/" + id.ToString + "/" + DL.GetClearString(title.ToString())
    End Function
    Public Function getFB(ByVal id As Object, title As Object) As String
        Return "https://www.facebook.com/sharer/sharer.php?u=" + "iranfilmport.com/" + id.ToString + "/" + DL.GetClearString(title.ToString())
    End Function

End Class
