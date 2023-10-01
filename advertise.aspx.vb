
Partial Class advertise
    Inherits System.Web.UI.Page

    Private Sub advertise_Load(sender As Object, e As EventArgs) Handles Me.Load
        Title = "ارسال خبر و تعرفه تبلیغات درگاه فیلم ایران"
        Page.MetaDescription = "انتشار خبر سینمایی و فیلمنامه و تبلیغات در درگاه فیلم ایران "
        lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال خبر و تبلیغات درگاه فیلم ایران" + "</span>"
        Try
            Dim ds As New DLL_CMS
            lbl.Text = ds.ShowAdvertise.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
        Catch ex As Exception
        End Try
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim price As String
        Select Case cmdType.SelectedValue
            Case 0
                price = 1000000
            Case 1
                price = 2000000
            Case 2
                price = 3000000
            Case 3
                price = 4000000
            Case 4
                price = 5000000
        End Select

        System.Net.ServicePointManager.Expect100Continue = False
        Dim zp As Zarinpal.PaymentGatewayImplementationServicePortTypeClient = New Zarinpal.PaymentGatewayImplementationServicePortTypeClient()
        Dim Authority As String
        'واحد پولی تومان می باشد
        Dim Status As Integer = zp.PaymentRequest("33e2b226-1313-11e9-846b-005056a205be",
                                                  price, 2000, "invoices@iranfilmport.com", "09216343320",
                                                  "http://iranfilmport.com/dashboard/user/me/CallBackBank", Authority)
        'Authority= کد تراکنش است که همین کد از طریق کوئری استرینگ آدرس برگشتی قابل تطبیق است
        If Status = 100 Then
            'دستورات برورسانی بانک اطلاعاتی براساس کد تراکنش 

            'Go to the bank
            ScriptManager.RegisterStartupScript(Me, GetType(String), "key", "myAlert('" + cmdType.SelectedValue + "','" + Authority + "');", True)
            'Response.Redirect("https://www.zarinpal.com/pg/StartPay/" + Authority)
        Else

        End If
    End Sub



End Class
