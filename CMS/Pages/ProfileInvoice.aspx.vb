
Partial Class CMS_Pages_ProfileInvoice
    Inherits System.Web.UI.Page

    Dim DLL As New DLL_CMS
    Dim DLL_Email As New Email
    Dim DLLd As New DLL_Dashboard

    Public Sub ChangeAccolades(sender As Object, e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Select Case s(1)
            Case "0"
                DLL.UpdateAccolades(Val(s(0)), 0)
                dg.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "1"
                DLL.UpdateAccolades(Val(s(0)), 1)
                dg.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "2"
                DLL.UpdateAccolades(Val(s(0)), 2)
                dg.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "3"
                DLL.UpdateAccolades(Val(s(0)), 3)
                dg.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "4"
                DLL.UpdateAccolades(Val(s(0)), 4)
                dg.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "5"
                DLL.UpdateAccolades(Val(s(0)), 5)
                dg.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "6"
                DLL.UpdateAccolades(Val(s(0)), 6)
                dg.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "7"
                DLL.UpdateAccolades(Val(s(0)), 7)
                dg.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
        End Select

    End Sub

    Public Function SetAccoalde(ByVal e As Object) As String
        Select Case e.ToString
            Case 0
                Return "~\dashboard\assets\img\icon_deny.png"
            Case 1
                Return "~\dashboard\assets\img\icon_Disqualified.png"
            Case 2
                Return "~\dashboard\assets\img\icon_Undecided.png"
            Case 3
                Return "~\dashboard\assets\img\icon_Selected.png"
            Case 4
                Return "~\dashboard\assets\img\icon_NotSelected.png"
            Case 5
                Return "~\dashboard\assets\img\icon_Semi_Finalist.png"
            Case 6
                Return "~\dashboard\assets\img\icon_finlist.png"
            Case 7
                Return "~\dashboard\assets\img\icon_award.png"
        End Select
    End Function

    Public Sub GoSend(sender As Object, e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        DLL.UpdateSend_or_Deny(Val(s(0)), 2, 2)
        DLL_Email.SendMail(s(1), "فیلم شما با موفقیت و پس از تائید کارشناسان درگاه فیلم ایران به فستیوال مربوطه ارسال گردید، جهت مشاهده جزئییات این ارسال به لینک زیر مراجعه کنید", "فیلم شما ارسال شد", "http://iranfilmport.com/dashboard/user/me/submission")
        dg.DataBind()
    End Sub

    Public Function SetSend(ByVal e As Object) As String
        Select Case e.ToString
            Case 1
                Return "~\dashboard\assets\img\icon_Consideration.png"
            Case 2
                Return "~\dashboard\assets\img\icon_sent.png"
            Case 3
                Return "~\dashboard\assets\img\icon_deny.png"
        End Select
    End Function

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        lblWarning.Text = String.Format("مقدار پول کاربر در کیف خود: مبلغ {0} تومان", Val(DLLd.getWallet(Request.QueryString("email"))).ToString("N0"))
    End Sub

    Protected Sub btnBank_Click(sender As Object, e As System.EventArgs) Handles btnBank.Click
        Dim DLL As New DLL_CMS
        DLL.UpdateWalletValueInProfileCreator(Request.QueryString("email"), Val(txtBack.Text))
        lblWarning.Text += "<br/>" + String.Format("مقدار پول کاربر در کیف خود: مبلغ {0} تومان", Val(DLLd.getWallet(Request.QueryString("email"))).ToString("N0"))
        txtBack.Text = ""
        DLL_Email.SendMail(Request.QueryString("email"), String.Format("مقداری مالی {0} به حساب کیف پولی شما برگشت داده شده است. شما میتوانید از لینک زیر به کیف پولی خود دسترسی داشته باشید.", txtBack.Text), "برگشت مالی", "http://iranfilmport.com/dashboard/user/me/wallet")
    End Sub
End Class
