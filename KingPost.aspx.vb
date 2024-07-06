
Partial Class Default3
    Inherits System.Web.UI.Page

    Dim DL As New DLL

    Private Sub Default3_Load(sender As Object, e As EventArgs) Handles Me.Load
        'comment
        KingComments.Section = 0
        KingComments.IDPOST = Val(RouteData.Values("id"))
    End Sub

    Public Function GetEditPermission() As Boolean
        If HttpContext.Current.User.Identity.Name <> "ifp2021" Then
            Return False
        Else
            Return True
        End If
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
