
Partial Class dashboard_services
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        Title = "داشبورد" + " | " + "سرویس ها"
    End Sub
End Class
