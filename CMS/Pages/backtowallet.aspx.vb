
Partial Class CMS_Pages_wallet
    Inherits System.Web.UI.Page

    Dim DLLd As New DLL_Dashboard
    Dim Email As New Email

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        lblPrePrice.Text = Val(Request.QueryString("price")).ToString("N0") + " تومان"
        lblCurrent.Text = String.Format("مقدار پول کاربر در کیف خود: مبلغ {0} تومان", Val(DLLd.getWallet(Request.QueryString("email"))).ToString("N0"))
    End Sub

    Protected Sub btnBackPrice_Click(sender As Object, e As System.EventArgs) Handles btnBackPrice.Click
        Dim DLL As New DLL_CMS
        DLL.UpdateWalletValueInProfileCreator(Request.QueryString("email"), Val(txtNewPrice.Text))
        lblCurrent.Text += "<br/>" + String.Format("مقدار پول کاربر در کیف خود: مبلغ {0} تومان", Val(DLLd.getWallet(Request.QueryString("email"))).ToString("N0"))
        txtNewPrice.Text = ""
        Email.SendMail(Request.QueryString("email"), String.Format("مقداری مالی {0} به حساب کیف پولی شما برگشت داده شده است. شما میتوانید از لینک زیر به کیف پولی خود دسترسی داشته باشید.", txtNewPrice.Text), "برگشت مالی", "http://iranfilmport.com/dashboard/user/me/wallet")
    End Sub

End Class
