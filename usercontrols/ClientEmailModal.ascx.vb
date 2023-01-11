
Partial Class usercontrols_ClientEmailModal
    Inherits System.Web.UI.UserControl

    Private Sub btnUpdateEmail_Click(sender As Object, e As EventArgs) Handles btnUpdateEmail.Click
        If txtEmail.Text.Trim <> "" Then
            Dim Pnl As New DLL_Panel
            Pnl.UpdateEmailClient(Val(Page.RouteData.Values("id")), txtEmail.Text.Trim)
            Response.Redirect("~/panel/client/" & Page.RouteData.Values("id"))
        End If
    End Sub
End Class
