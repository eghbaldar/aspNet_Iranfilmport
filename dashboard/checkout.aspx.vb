Imports System.Net.Mail
Imports System.Net

Partial Class dashboard_checkout
    Inherits System.Web.UI.Page

    Dim DLL As New DLL_Dashboard

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        HiddenEmail.Value = Request.Cookies("IFP").Item("email")

        'Try
        If Not IsPostBack Then
            If DLL.ExistAnyUnpayFactor(HiddenEmail.Value) Then
                If DLL.DuplicationFactorNotPay(HiddenEmail.Value, RouteData.Values("festivalID"), RouteData.Values("deadlineID"), RouteData.Values("projectID")) Then
                    DLL.InsertCheckout(Request.Cookies("IFP").Item("email"), _
                                RouteData.Values("festivalID"), _
                                RouteData.Values("projectID"), _
                                RouteData.Values("deadlineID"), _
                                DLL.CalcPriceOfFestival(RouteData.Values("deadlineID")))

                    dgCheckout.DataBind()

                    DivConfirm.Visible = True                    
                    lblConfirm.Text = "فاکتور ایجاد شده است"
                    lblConfirm.ForeColor = Drawing.Color.Green
                    DivWarning.Visible = False

                Else
                    DivWarning.Visible = True
                    lblWarning.Text = "فاکتوری با همین مشخصات و پرداخت نشده وجود دارد، ابتدا نسبت به پرداخت آن اقدام کنید."
                    lblWarning.ForeColor = Drawing.Color.Red
                    DivConfirm.Visible = False
                End If
            Else
                lblWarning.Visible = True                
                lblWarning.Text = "شما دو فاکتور پرداخت نشده دارید، قبل از ایجاد و یا درخواست فاکتور جدید، فاکتورهای قبلی را پرداخت و یا در جهت حذف آنها اقدام کنید."
                lblWarning.ForeColor = Drawing.Color.Red
                DivConfirm.Visible = False
            End If
        End If
        'Catch ex As Exception

        'End Try

    End Sub

    Public Function deleteFactor(sender As Object, e As CommandEventArgs)
        DLL.DeleteFactor(Val(e.CommandArgument.ToString))
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
        Dim Status As Integer = zp.PaymentRequest("33e2b226-1313-11e9-846b-005056a205be", DLL.CalcPriceLikePast(Val(s(1)), Val(s(3)), Val(s(0))), s(2), "invoices@iranfilmport.com", "09216343320", "http://iranfilmport.com/dashboard/user/me/CallBackBank", Authority)
        'Authority= کد تراکنش است که همین کد از طریق کوئری استرینگ آدرس برگشتی قابل تطبیق است
        If Status = 100 Then
            'دستورات برورسانی بانک اطلاعاتی براساس کد تراکنش 
            DLL.UpdateTransactionCode(Val(s(0)), Val(Authority))
            'Go to the bank
            Response.Redirect("https://www.zarinpal.com/pg/StartPay/" + Authority)
        Else
            lblWarning.Text = "خطایی رخ داده است: " + Status
            lblWarning.ForeColor = Drawing.Color.Red
        End If

    End Function

    Public Function PaymentFactorWallet(sender As Object, e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        If DLL.IsWalletEnough(HiddenEmail.Value, Val(s(1))) Then
            'دستورات برورسانی بانک اطلاعاتی براساس پرداهتی لز طریق کیف پولی
            DLL.UpdateTransactionCode(Val(s(0)), -1)
            DLL.UpdateWalletValue(HiddenEmail.Value, Val(s(1)), Val(s(0)))
            dgCheckout.DataBind()
            SendMail(HiddenEmail.Value, "فاکتور شما با موفقیت از کیف پولتان پرداخت گردید و پروژه شما در اسرع وقت به فستیوال مربوطه ارسال خواهد شد. جهت مشاهده صورت حساب به لینک زیر مراجعه کنید", "تاییده پرداخت", "http://iranfilmport.com/dashboard/user/me/invoice")

            DivConfirm.Visible = True
            DivWarning.Visible = False
            lblConfirm.Text = "پرداخت با موفقیت انجام شد و مبلغ از کیف پول شما کسر شد."
            lblConfirm.ForeColor = Drawing.Color.Green
        Else            
            DivConfirm.Visible = False
            DivWarning.Visible = True
            lblWarning.Visible = True
            lblWarning.Text = "مقدار کیف پول شما کافی نیست" + "</br>" + "مقدار کیف پول را از لینک زیر افزایش و یا از طریق پرداخت بانکی اقدام کنید." + "</br>" + "<a href='wallet'>مشاهده کیف پول</a>"
            lblWarning.ForeColor = Drawing.Color.Red
        End If

    End Function

    Protected Sub btnGoToInvoice_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("~/dashboard/user/me/invoice")
    End Sub

    Sub SendMail(ByVal to_ As String, TEXT As String, ByVal subject_ As String, ByVal link_ As String)

        Dim mTo As String = to_
        Dim mFrom As String = "no-reply@iranfilmport.com"
        Dim mSubject As String = subject_
        Dim mMsg As String = "<div style='padding:10px;border:1px solid #ccc;direction:rtl;text-align:center;'><div><img src='http://iranfilmport.com/files/images/logos/logo_3.png' /></div><div style='font-family:Tahoma;margin:5px;'>" + Text + "</div><div style='padding:10px;text-align:center;background-color:Yellow;margin:5px;'>" + "<a href=" + link_ + " target='_blank'>" + link_ + "</a>" + "</div><div><a href='http://iranfilmport.com' style='color:Orange;text-decoration:none;font-size:10px;'> Iran Film Port @</a></div></div>"
        Dim mMailServer As String = ConfigurationManager.AppSettings.Get("MyMailServer")
        Dim mPort As Integer = ConfigurationManager.AppSettings.Get("MyMailServerPort")

        Try

            Dim message As New MailMessage(mFrom, mTo, mSubject, mMsg)

            'If fileAttachments.HasFile Then
            '    Dim attached As New Attachment(Trim(fileAttachments.PostedFile.FileName.ToString()))
            '    message.Attachments.Add(attached)
            'End If

            'If mCC <> "" Or mCC <> String.Empty Then
            '    Dim strCC() As String = Split(mCC, ";")
            '    Dim strThisCC As String
            '    For Each strThisCC In strCC
            '        message.CC.Add(Trim(strThisCC))
            '    Next
            'End If
            message.IsBodyHtml = True
            Dim mySmtpClient As New SmtpClient("ns289.mihanwebhost.com")
            mySmtpClient.UseDefaultCredentials = False
            mySmtpClient.Credentials = New NetworkCredential("no-reply@iranfilmport.com", "mailIFP2018")
            mySmtpClient.Send(message)

        Catch ex As FormatException
        End Try
    End Sub

End Class
