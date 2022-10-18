
Partial Class usercontrols_TopBar
    Inherits System.Web.UI.UserControl

    Protected Sub btnEn_Click(sender As Object, e As System.EventArgs) Handles btnEn.Click
        Response.Redirect(HttpContext.Current.Request.RawUrl & "?lang=en")
    End Sub

End Class
