
Partial Class Management_Admin_CMS
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'If Not My.User.IsAuthenticated Then
        '    If Not My.User.IsInRole("ADMIN") Then
        '        Server.Transfer("~/عدم-دسترسی")
        '    End If
        'End If

        If HttpContext.Current.User.Identity.Name <> "ifp2021" Then
            Response.Redirect("~/عدم-دسترسی")
        End If


        lblDate.Text = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate) & " - " & DateTime.Now.ToString("hh:mm:ss")

    End Sub

End Class

