Imports System.Net.Mail
Imports System.Net

Partial Class dashboard_invoice
    Inherits System.Web.UI.Page

    Dim DLLd As New DLL_Dashboard
    Dim Email As New Email

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        DLLd._Email_ = Request.Cookies("IFP").Item("email")
        HiddenEmail.Value = DLLd._Email_
        Title = "داشبورد" + " | " + "صورت حساب ها"
        'If Not IsPostBack Then
        '    '''''''''''''''''''''''''''
        '    If Request.QueryString("Status") <> "" And _
        '        Request.QueryString("Status") <> Nothing And _
        '        Request.QueryString("Authority") <> "" And _
        '        Request.QueryString("Authority") <> Nothing Then

        '        If Request.QueryString("Status").ToString().Equals("OK") Then
        '            Dim Amount As Integer = Val(DLLd.getPriceWithTransactionCode(Val(Request.QueryString("Authority"))))
        '            Dim RefID As Long
        '            System.Net.ServicePointManager.Expect100Continue = False
        '            Dim zp As Zarinpal.PaymentGatewayImplementationServicePortTypeClient = New Zarinpal.PaymentGatewayImplementationServicePortTypeClient()
        '            Dim Status As Integer = zp.PaymentVerification("33e2b226-1313-11e9-846b-005056a205be", Request.QueryString("Authority").ToString(), Amount, RefID)

        '            If Status = 100 Then
        '                'Response.Write("Success!! RefId: " + RefID.ToString)
        '                'بروزرسانی فاکتور وارد شدن کد پرداخت
        '                DLLd.UpdatePaymentCode(Val(Request.QueryString("Authority")), RefID)
        '                lblWarning.Text = "فاکتور شما با موفقیت پرداخت شد و در اسرع وقت فیلم شما به فستیوال مربوطه ارسال خواهد شد."
        '            Else
        '                lblWarning.Text = "خطایی در پرداخت فاکتور بوجود آمده است لطفا از فسمت فاکتورهای پرداخت نشده مجدد اقدام کنید."
        '            End If
        '        Else
        '            lblWarning.Text = "خطایی در پرداخت فاکتور بوجود آمده است لطفا از فسمت فاکتورهای پرداخت نشده مجدد اقدام کنید."
        '            'Response.Write("Error! Authority: " + Request.QueryString("Authority").ToString() + " Status: " + Request.QueryString("Status").ToString())
        '        End If

        '    Else
        '        lblWarning.Text = ""
        '        'Response.Write("Invalid Input")
        '    End If

        'End If


    End Sub

    Public Function getDate(ByVal e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
    End Function

    Public Function getWayPay(ByVal e As Object) As String
        Select Case e.ToString
            Case 1
                Return "نقدی"
            Case 2
                Return "درگاه اینترنتی"
            Case 3
                Return "کارت به کارت"            
        End Select
    End Function

    Public Function MoneyNum(ByVal _str As Integer) As String
        Return _str.ToString("N0") + " ریال"
    End Function

    Public Function deleteFactor(sender As Object, e As CommandEventArgs)
        DLLd.DeleteFactor(Val(e.CommandArgument.ToString))
        dgCheckout.DataBind()

        DivWarning.Visible = True
        lblWarning.Text = "فاکتور با موفقیت حذف گردید."
        lblWarning.ForeColor = Drawing.Color.Red
        DivConfirm.Visible = False

    End Function

    Public Function PaymentFactorBank(sender As Object, e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        System.Net.ServicePointManager.Expect100Continue = False
        Dim zp As Zarinpal.PaymentGatewayImplementationServicePortTypeClient = New Zarinpal.PaymentGatewayImplementationServicePortTypeClient()
        Dim Authority As String
        'واحد پولی تومان می باشد
        Dim Status As Integer = zp.PaymentRequest("33e2b226-1313-11e9-846b-005056a205be", DLLd.CalcPriceLikePast(Val(s(1)), Val(s(3)), Val(s(0))), s(2), "invoices@iranfilmport.com", "09216343320", "http://iranfilmport.com/dashboard/user/me/CallBackBank", Authority)
        'Authority= کد تراکنش است که همین کد از طریق کوئری استرینگ آدرس برگشتی قابل تطبیق است
        If Status = 100 Then
            'دستورات برورسانی بانک اطلاعاتی براساس کد تراکنش 
            DLLd.UpdateTransactionCode(Val(s(0)), Val(Authority))
            'Go to the bank
            Response.Redirect("https://www.zarinpal.com/pg/StartPay/" + Authority)
        Else
            DivWarning.Visible = True
            lblWarning.Text = "خطایی رخ داده است."
            lblWarning.ForeColor = Drawing.Color.Red
            DivConfirm.Visible = False
        End If

    End Function

    Public Function PaymentFactorWallet(sender As Object, e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        If DLLd.IsWalletEnough(HiddenEmail.Value, Val(s(1))) Then
            'دستورات برورسانی بانک اطلاعاتی براساس پرداهتی لز طریق کیف پولی
            DLLd.UpdateTransactionCode(Val(s(0)), -1)
            DLLd.UpdateWalletValue(HiddenEmail.Value, Val(s(1)), Val(s(0)))
            dgCheckout.DataBind()
            dgPaid.DataBind()

            Email.SendMail(HiddenEmail.Value, "فاکتور شما با موفقیت از کیف پولتان پرداخت گردید و پروژه شما در اسرع وقت به فستیوال مربوطه ارسال خواهد شد. جهت مشاهده صورت حساب به لینک زیر مراجعه کنید", "تاییده پرداخت", "http://iranfilmport.com/dashboard/user/me/invoice")

            DivConfirm.Visible = True
            lblConfirm.Text = "پرداخت با موفقیت انجام شد و مبلغ از کیف پول شما کسر شد."
            lblConfirm.ForeColor = Drawing.Color.Green
            DivWarning.Visible = False

        Else
            DivWarning.Visible = True
            lblWarning.Text = "مقدار کیف پول شما کافی نیست" + "</br>" + "مقدار کیف پول را از لینک زیر افزایش و یا از طریق پرداخت بانکی اقدام کنید." + "</br>" + "<a href='wallet'>مشاهده کیف پول</a>"
            lblWarning.ForeColor = Drawing.Color.Red
            DivConfirm.Visible = False
        End If

    End Function

End Class
