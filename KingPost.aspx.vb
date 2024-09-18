
Imports System.Data

Partial Class KingPost
    Inherits System.Web.UI.Page

    Dim DL As New DLL

    Private Sub Default3_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' اگر ادمین لاگین کرده بود و کوئری استرینگ ادمین (به انگلیسی) ارسال شده بود میتواند ببیند
        ' اگر ادمین قصد داشت ببیند کوئری استرینگ یوزر (به انگلیسی) ارسال شده بود صفحه کدر شده و باید پسورد که همان کد خبر است وارد کند
        ' اگر تاریخ پست نرسیده بود کاربر عادی نمیتواند ببند
        If (Not (String.IsNullOrEmpty(Request.QueryString("preview")))) Then
            Select Case Request.QueryString("preview").ToLower
                Case "admin"
                    If Not GetEditPermission() Then
                        If DL.IsEnablePost(RouteData.Values("id")) Then Response.Redirect("~/عدم-دسترسی")
                    End If
                Case "user"
                    If DL.IsEnablePost(RouteData.Values("id")) Then
                        Dim jsCode As String = "$('body').css('filter', 'blur(10px)');setTimeout(function(){checkUserPreview('" + RouteData.Values("id") + "')},2000);;"
                        ClientScript.RegisterStartupScript(Me.GetType(), "checkUserPreview()", jsCode, True)
                    End If
                Case Else
                    If DL.IsEnablePost(RouteData.Values("id")) Then Response.Redirect("~/عدم-دسترسی")
            End Select
            If Not (Request.QueryString("preview").ToLower = "admin") Then
                'بررسی وجود و یا فعال بدون پست                
            End If
        Else
            If DL.IsEnablePost(RouteData.Values("id")) Then Response.Redirect("~/عدم-دسترسی")
        End If
        ''''''''''''
        Title = DL.GetTitleBlog(RouteData.Values("id"))
        Try
            ''''''''''' آیا از URL بدون عنوان استفاده کرده است؟
            If String.IsNullOrWhiteSpace(RouteData.Values("title")) Then
                Response.Redirect("~/" + RouteData.Values("id") + "/" + DL.GetClearString(DL.GetTitleBlog(Val(RouteData.Values("id")))))
            End If
            ' '''''''''''
            DL.IncreaseViwerArticle(Val(RouteData.Values("id")))
            setTages()
            'comment
            KingComments.Section = 0
            KingComments.IDPOST = Val(RouteData.Values("id"))
            '''''''''''''
        Catch ex As Exception
        End Try

    End Sub
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

    Public Function GetEditPermission() As Boolean
        If HttpContext.Current.User.Identity.Name <> "ifp2021" Then
            Return False
        Else
            Return True
        End If
    End Function
    Public Function getTotalComment() As String
        Return KingComments.TotalComments
    End Function
    Public Function getCategory(id As Object)
        Return DL.Navigation(id, 3)
    End Function
    Public Function getShortLink(ByVal e As Object) As String
        Return String.Format("{2}{1}{0}", "<a style='color:#DFC912;' href=" + "http://iranfilmport.com/" + RouteData.Values("id").ToString + ">" + "iranfilmport.com/" + RouteData.Values("id").ToString + "</a>", "لینک کوتاه و استاندارد: ", "<svg class='ml-1' xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-link' viewBox='0 0 16 16'> <path d='M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9q-.13 0-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z'/> <path d='M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4 4 0 0 1-.82 1H12a3 3 0 1 0 0-6z'/> </svg>")
    End Function
    Public Function getDate(ByVal e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
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
