
Partial Class CMS_sendmsg
    Inherits System.Web.UI.UserControl

    Dim Email As New Email

    Protected Sub btnsend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsend.Click
        Dim dl As New DLL_CMS
        If txtsubject.Text <> "" And txttext.Text <> "" Then
            dl.InsertMessage(Request.QueryString("email"), txtsubject.Text.Trim, txttext.Text.Trim)
            Email.SendMail(Request.QueryString("email"), txttext.Text, txtsubject.Text, "")
            txtsubject.Text = ""
            txttext.Text = ""
            dg.DataBind()
        End If        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblemail.Text = Request.QueryString("email")
    End Sub
End Class
