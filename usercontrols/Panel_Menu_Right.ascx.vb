
Partial Class usercontrols_Panel_Menu_Right
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim Dl As New DLL_Panel
        lblCustomerName.Text = Dl.GetNameCustomer(Convert.ToInt64(Page.RouteData.Values("id")))
        lblCustomerVisitCounter.Text = Dl.GetVisitCounterCustomer(Convert.ToInt64(Page.RouteData.Values("id")))
        lblCustomerPhone.Text = Dl.GetPhoneCustomer(Convert.ToInt64(Page.RouteData.Values("id")))
        Installment()
    End Sub

    Protected Sub btnMnuHome_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btnMnuHome.Click
        Response.Redirect("~/panel/client/" & Page.RouteData.Values("id"))
    End Sub

    Protected Sub btnMnuExit_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btnMnuExit.Click
        Session("PanelClient") = ""
        Response.Redirect("~/panel")
    End Sub

    Protected Sub btnMnuMoney_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btnMnuMoney.Click
        Response.Redirect("~/panel/money/" & Page.RouteData.Values("id"))
    End Sub

    Private Sub Installment()

        Dim DL As New DLL_Panel
        Dim LeftDays As Integer = DL.GetLastLeftDaysOfInstallment(Convert.ToInt64(Page.RouteData.Values("id")))
        If LeftDays < 0 Then
            PnlWarningInstallment.Visible = True
            If Math.Abs(LeftDays) > 0 And Math.Abs(LeftDays) < 10 Then
                lblWarningInstallments.Text = String.Format("{0} روز از موعد سر رسید قسط تان گذشته است. خواهشمندیم توجه فرمائید، پس از 10 روز مهلت تعیین شده، سامانه شما محدود خواهد شد.", "<span class='RedCircle'>" & Math.Abs(LeftDays) & "</span>")
            ElseIf Math.Abs(LeftDays) > 10 Then
                lblWarningInstallments.Text = String.Format("{0} روز از موعد سر رسید قسط تان گذاشته است و از آنجایی که سامانه اختصاصی پس از 10 روز مهلت جهت پرداخت قسط، خودبخود غیر فعال خواهد شد، امکان دسترسی شما به سامانه محدود شده است. جهت فعال شدن سامانه با واحد مالی شرکت تماس حاصل فرمائید.", "<span class='RedCircle'>" & Math.Abs(LeftDays) & "</span>")
            End If

        End If
    End Sub

End Class
