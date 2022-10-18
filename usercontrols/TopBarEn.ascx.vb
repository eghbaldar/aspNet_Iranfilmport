
Partial Class usercontrols_TopBar
    Inherits System.Web.UI.UserControl

    Protected Sub btnFa_Click(sender As Object, e As System.EventArgs) Handles btnFa.Click
        Response.Redirect(HttpContext.Current.Request.RawUrl.Replace("?lang=en", ""))
    End Sub

End Class
