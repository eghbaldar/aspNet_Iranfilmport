
Partial Class Management_Pages_Default2
    Inherits System.Web.UI.Page

    Public Sub GoDelete(ByVal sender As Object, ByVal e As CommandEventArgs)

        Membership.DeleteUser(e.CommandArgument)
        DG.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت کاربران"
    End Sub

    Protected Sub CreateUserWizard1_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.CreatedUser
        DG.DataBind()
    End Sub
End Class
