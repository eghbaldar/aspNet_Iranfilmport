
Partial Class CMS_Pages_msgTOusers
    Inherits System.Web.UI.Page

    Protected Sub btnshow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnshow.Click
        Response.Redirect("msgTOusers.aspx?email=" + cmdEmail.SelectedValue)
    End Sub

    Protected Sub btnSendAll_Click(sender As Object, e As System.EventArgs) Handles btnSendAll.Click
        If txtLink.Text.Trim <> "" And txtSendAll.Text.Trim <> "" And txtSubject.Text.Trim <> "" Then
            Dim DLL As New DLL_CMS
            DLL.SendEmailForAllMembers(txtSendAll.Text.ToString.Trim, txtSubject.Text.Trim, txtLink.Text.Trim)
        End If        
    End Sub

End Class
