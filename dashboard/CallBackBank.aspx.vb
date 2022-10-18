Imports System.Net.Mail
Imports System.Net

Partial Class dashboard_CallBackBank
    Inherits System.Web.UI.Page

    Dim DLLd As New DLL_Dashboard

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        DLLd._Email_ = Request.Cookies("IFP").Item("email")
        If Not IsPostBack Then

            HiddenEmail.Value = DLLd._Email_
            '''''''''''''''''''''''''''
            If Request.QueryString("Status") <> "" And _
                Request.QueryString("Status") <> Nothing And _
                Request.QueryString("Authority") <> "" And _
                Request.QueryString("Authority") <> Nothing Then

                If Request.QueryString("Status").ToString().Equals("OK") Then
                    Dim Amount As Integer = Val(DLLd.getPriceWithTransactionCode(Val(Request.QueryString("Authority"))))
                    Dim RefID As Long
                    System.Net.ServicePointManager.Expect100Continue = False
                    Dim zp As Zarinpal.PaymentGatewayImplementationServicePortTypeClient = New Zarinpal.PaymentGatewayImplementationServicePortTypeClient()
                    Dim Status As Integer = zp.PaymentVerification("33e2b226-1313-11e9-846b-005056a205be", Request.QueryString("Authority").ToString(), Amount, RefID)

                    If Status = 100 Then
                        'Response.Write("Success!! RefId: " + RefID.ToString)
                        'بروزرسانی فاکتور وارد شدن کد پرداخت
                        DLLd.UpdatePaymentCode(Val(Request.QueryString("Authority")), RefID)
                        'ارسال ایمیل
                        SendMail(HiddenEmail.Value, String.Format("فاکتور با شماره تراکنش {0} و مبلغ {1} با موفقیت پرداخت گردید و پروژه شما در اسرع وقت به فستیوال مربوطه ارسال خواهد شد. جهت مشاهده صورت حساب به لینک زیر مراجعه کنید.", RefID, Val(Amount).ToString("N0")), "تاییده پرداخت", "http://iranfilmport.com/dashboard/user/me/invoice")
                        ''''''''''''''''
                        lblWarning.Text = "فاکتور شما با موفقیت پرداخت شد و در اسرع وقت پروژه شما به فستیوال مربوطه ارسال خواهد شد."
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
                lblWarning.Text = "درخواست غیر قابل قبول می باشد."
                lblWarning.ForeColor = Drawing.Color.Red
                'Response.Write("Invalid Input")
            End If

        End If

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

    Protected Sub btnGO_Click(sender As Object, e As System.EventArgs) Handles btnGO.Click
        Response.Redirect("~/dashboard/user/me/invoice")
    End Sub

End Class
