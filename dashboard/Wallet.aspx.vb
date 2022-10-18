Imports ZarinPal
Partial Class dashboard_Wallet
    Inherits System.Web.UI.Page

    Dim DLLd As New DLL_Dashboard
    Dim Email As New Email

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If DLLd._Email_ Is Nothing Then DLLd._Email_ = Request.Cookies("IFP").Item("email")        
        '''''''''''''''''''''''''''
        If Request.QueryString("Status") <> "" And _
            Request.QueryString("Status") <> Nothing And _
            Request.QueryString("Authority") <> "" And _
            Request.QueryString("Authority") <> Nothing Then

            If Request.QueryString("Status").ToString().Equals("OK") Then
                Dim Amount As Integer = Val(DLLd.getLastAmount4Wallet(DLLd._Email_))
                Dim RefID As Long
                System.Net.ServicePointManager.Expect100Continue = False
                Dim zp As Zarinpal.PaymentGatewayImplementationServicePortTypeClient = New Zarinpal.PaymentGatewayImplementationServicePortTypeClient()
                Dim Status As Integer = zp.PaymentVerification("33e2b226-1313-11e9-846b-005056a205be", Request.QueryString("Authority").ToString(), Amount, RefID)

                If Status = 100 Then
                    'Response.Write("Success!! RefId: " + RefID.ToString)
                    'بروزرسانی فاکتور وارد شدن کد پرداخت
                    DLLd.UpdateWallet(DLLd._Email_, Amount, RefID)
                    'ارسال ایمیل
                    Email.SendMail(DLLd._Email_, String.Format("فاکتور افزایش کیف پولی شما با شماره تراکنش {0} و مبلغ {1} با موفقیت پرداخت گردید. جهت مشاهده کیف پولی خود به لینک زیر مراجعه کنید.", RefID, Amount), "تاییده پرداخت", "http://iranfilmport.com/dashboard/user/me/wallet")
                    ''''''''''''''''
                    lblWarning.Text = "فاکتور شما با موفقیت پرداخت شد."
                    lblWarning.ForeColor = Drawing.Color.Green
                Else
                    lblWarning.Text = "خطایی در پرداخت فاکتور بوجود آمده است لطفا از فسمت فاکتورهای پرداخت نشده مجدد اقدام کنید."
                    lblWarning.ForeColor = Drawing.Color.Red
                End If
            Else
                lblWarning.Text = "خطایی در پرداخت فاکتور بوجود آمده است لطفا از فسمت فاکتورهای پرداخت نشده مجدد اقدام کنید."
                lblWarning.ForeColor = Drawing.Color.Red
                'Response.Write("Error! Authority: " + Request.QueryString("Authority").ToString() + " Status: " + Request.QueryString("Status").ToString())
            End If

        Else
            'lblWarning.Text = "درخواست غیر قابل قبول می باشد."
            'lblWarning.ForeColor = Drawing.Color.Red
            'Response.Write("Invalid Input")
        End If
        '''''''''''''''''''''''''''''''''''''''''''''''''''
        lblWallet.Text = "مقدار کیف پول شما: " + "<span style='color:red;font-weight:bold;'>" + IIf(DLLd.getWallet(DLLd._Email_) Is Nothing, "0", Val(DLLd.getWallet(DLLd._Email_)).ToString("N0")) + "</span>" + " تومان"
        Title = "داشبورد" + " | " + "کیف پول"
    End Sub

    Public Sub PaymentFactor(Amount As Long)

        Dim zar As Zarinpal.ZarinPal = Zarinpal.ZarinPal.Get
        Dim MerchantID As String = "33e2b226-1313-11e9-846b-005056a205be"
        Dim CallbackURL As String = "http://iranfilmport.com/dashboard/user/me/wallet"
        Dim Description As String = "افزایش کیف پول درگاه فیلم ایران"


        Dim pr As Zarinpal.PaymentRequest = New Zarinpal.PaymentRequest(MerchantID, Amount, CallbackURL, Description)

        Dim res = zar.InvokePaymentRequest(pr)
        If res.Status = 100 Then
            DLLd.InsertWallet(DLLd._Email_, Amount, pr.MerchantID)
            Response.Redirect(res.PaymentURL)
        Else
            lblWarning.Text = "خطایی رخ داده است: " + res.Status
            lblWarning.ForeColor = Drawing.Color.Red
        End If

              
        'System.Net.ServicePointManager.Expect100Continue = False
        'Dim zp As Zarinpal.PaymentGatewayImplementationServicePortTypeClient = New Zarinpal.PaymentGatewayImplementationServicePortTypeClient()
        'Dim Authority As String
        ''واحد پولی تومان می باشد
        'Dim Status As Integer = zp.PaymentRequest("33e2b226-1313-11e9-846b-005056a205be", Amount, "افزایش کیف پول درگاه فیلم ایران", "invoices@iranfilmport.com", "09216343320", "http://iranfilmport.com/dashboard/user/me/wallet", Authority)
        ''Authority= کد تراکنش است که همین کد از طریق کوئری استرینگ آدرس برگشتی قابل تطبیق است
        'If Status = 100 Then
        '    'دستورات درج در بانک 
        '    DLLd.InsertWallet(DLLd._Email_, Amount, Authority)
        '    'Go to the bank
        '    Response.Redirect("https://www.zarinpal.com/pg/StartPay/" + Authority)
        'Else
        '    lblWarning.Text = "خطایی رخ داده است: " + Status
        '    lblWarning.ForeColor = Drawing.Color.Red
        'End If

    End Sub

    Protected Sub btnGotoBank_Click(sender As Object, e As System.EventArgs) Handles btnGotoBank.Click
        If txtSearch.Value.ToString.Trim <> "" And txtSearch.Value.ToString.Trim <> "مقدار خود را به تومان وارد کنید" Then
            If Val(txtSearch.Value.ToString) >= 500 Then
                PaymentFactor(Val(txtSearch.Value.ToString))
            Else
                lblWarning.ForeColor = Drawing.Color.Red
                lblWarning.Text = "حداقل مقدار وارد شده باید 500 تومان باشد"
            End If
        Else
            lblWarning.ForeColor = Drawing.Color.Red
            lblWarning.Text = "مقدار را به عدد وارد کنید"
        End If
    End Sub

End Class
