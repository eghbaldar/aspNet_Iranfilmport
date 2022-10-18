
Partial Class CMS_Pages_contact
    Inherits System.Web.UI.Page

    Dim DL_CMS As New DLL_CMS

    Public Sub show(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim dl As New DLL_CMS
        lblText.Text = e.CommandArgument.ToString
    End Sub

    Public Sub SetReadEnable(sender As Object, e As CommandEventArgs)
        DL_CMS.UpdateReadEnableDisableContact(True, Val(e.CommandArgument.ToString))
        gv.DataBind()
    End Sub
    Public Sub SetReadDsiable(sender As Object, e As CommandEventArgs)
        DL_CMS.UpdateReadEnableDisableContact(False, Val(e.CommandArgument.ToString))
        gv.DataBind()
    End Sub

End Class
