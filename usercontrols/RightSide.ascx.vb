
Partial Class usercontrols_Left
    Inherits System.Web.UI.UserControl

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
