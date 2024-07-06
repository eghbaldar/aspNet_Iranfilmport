
Partial Class usercontrols_KingRelatedPost
    Inherits System.Web.UI.UserControl

    Private Sub usercontrols_KingRelatedPost_Load(sender As Object, e As EventArgs) Handles Me.Load
        HiddenFieldPostId.Value = Page.RouteData.Values("id")
    End Sub

End Class
