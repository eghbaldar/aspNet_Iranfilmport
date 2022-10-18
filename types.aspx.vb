Imports System.Data

Partial Class post
    Inherits System.Web.UI.Page

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        setTages()
    End Sub

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
