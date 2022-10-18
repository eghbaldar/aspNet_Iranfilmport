
Partial Class usercontrols_Navigation
    Inherits System.Web.UI.UserControl

    Private Sub usercontrols_Navigation_Load(sender As Object, e As EventArgs) Handles Me.Load

        Try
            Dim _DLL As New DLL
            Dim _ID As Long = Val(Page.RouteData.Values("id").ToString)
            Dim Home_fa = "<a href='" & Page.ResolveUrl("~/") & "' target='_blank' class='link'>خانه</a>"
            Dim Middle_fa = "<a href='" & Page.ResolveUrl("~/نقد-تحلیل-اخبار-فیلم-کوتاه") & "' target='_blank' class='link'>اخبار</a>"
            Dim firstSection = "<a href='" & Page.ResolveUrl("~/tag/") & _DLL.Navigation(_ID, 1).Replace(" ", "_") & "' target='_blank' class='link'>" & _DLL.Navigation(_ID, 1) & "</span>" & "</a>"
            Dim secondSection = "<a href='" & Page.ResolveUrl("~/") & String.Format("{0}/{1}/دسته-محتوایی", _DLL.Navigation(_ID, 4), _DLL.Navigation(_ID, 2)).Replace(" ", "-") & "' target='_blank' class='link'>" & _DLL.Navigation(_ID, 2) & "</span>" & "</a>"
            Dim thirdSection = "<a href='" & Page.ResolveUrl("~/") & String.Format("{0}/{1}/دسته-اصلی", _DLL.Navigation(_ID, 5), _DLL.Navigation(_ID, 3)).Replace(" ", "-") & "' target='_blank' class='link'>" & _DLL.Navigation(_ID, 3) & "</span>" & "</a>"

            litNavigation.Text =
                Home_fa _
                + "<span class='textSign'>" & " > " & "</span>" _
                + Middle_fa.Replace("ي", "ی") _
                + "<span class='textSign'>" & " > " & "</span>" _
                + firstSection.Replace("ي", "ی") _
                + "<span class='textSign'>" & " > " & "</span>" _
                + thirdSection.Replace("ي", "ی") _
                + "<span class='textSign'>" & " > " & "</span>" _
                + secondSection.Replace("ي", "ی")

        Catch ex As Exception
        End Try

    End Sub

End Class
