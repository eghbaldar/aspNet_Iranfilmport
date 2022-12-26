
Imports System.IO
Imports System.Net

Partial Class PanelTicketNew
    Inherits System.Web.UI.Page

    Dim DL_Panel As New DLL_Panel

    Private Sub PanelTicketNew_Load(sender As Object, e As EventArgs) Handles Me.Load
        Title = "تیکت جدید  |  پنل اختصاصی کاربران"

        If Page.Request.QueryString("ticket_token") <> "" Then
            MultiView.ActiveViewIndex = 2
        End If

        GetFlag()


    End Sub

    Public Sub GetFlag()
        Select Case Val(Request.QueryString("Status"))
            Case 0
                'Return "ارسال نشده"
            Case 1
                lblStatus.Text = "در حال بررسی"
            Case 2
                lblStatus.Text = "پاسخ داده شده"
            Case 3
                lblStatus.Text = "بسته شده"
        End Select
    End Sub

    Public Function GetAdminClientBackground(obj As Object) As System.Drawing.Color
        If Val(obj) = 0 Then
            Return System.Drawing.Color.FromName("#fff4bf")
        Else
            Return System.Drawing.Color.FromName("#f0f0f0")
        End If
    End Function

    Public Function GetDate(data As Object) As String
        Return ShamsiDate.Miladi2Shamsi(data, ShamsiDate.ShowType.LongDate) & " | " & Convert.ToDateTime(data).TimeOfDay.ToString("hh':'mm':'ss")
    End Function


    Public Function GetWhich(obj As Object) As String
        If obj <> 0 Then
            Return "پاسخ فیلمساز /  فیلمنامه نویس"
        Else
            Return "پاسخ کارشناس"
        End If
    End Function


    Protected Sub cmdSections_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmdSections.SelectedIndexChanged
        If cmdSections.SelectedValue = 0 Then
            cmdFilm.Enabled = True
            cmdFestival.Enabled = True
        Else
            cmdFilm.Enabled = False
            cmdFestival.Enabled = False
        End If
    End Sub

    Private Sub btnInsert_Click(sender As Object, e As EventArgs) Handles btnInsert.Click
        If txtText.Text.Length <> 0 Then
            DL_Panel.InsertCommentClient(Val(Page.RouteData.Values("id")), cmdSections.SelectedValue, cmdFestival.SelectedValue, txtText.Text.Trim.Replace(ControlChars.Lf, "<br/>"))
            SendSMS(Val(Page.RouteData.Values("id")), "تیکت شما با موفقیت به ثبت رسید و در اسرع وقت توسط کارشناس مربوطه‌ی «درگاه فیلم ایران» پاسخ داده خواهد شد.")
            MultiView.ActiveViewIndex = 1
        End If
    End Sub

    Private Sub SendSMS(customerid As Long, text As String)

        Dim cell As String = DL_Panel.GetPhoneCustomer(customerid)
        Dim url As String = "http://login.parsgreen.com/UrlService/sendSMS.ashx?from=" +
        "10009332300598" +
        "&to=" + cell +
        "&text=" + text +
        "&signature=" + "9D57838D-3935-4724-BB71-5A5FCB2EA579"

        Dim req As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        Dim resp As Net.WebResponse = req.GetResponse()
        Dim st = resp.GetResponseStream()
        Dim sr = New StreamReader(st, Encoding.UTF8)
        Dim _responseStr As String = sr.ReadToEnd()
        sr.Close()
        resp.Close()

    End Sub

    Private Sub btnResponse_Click(sender As Object, e As EventArgs) Handles btnResponse.Click
        If Val(DL_Panel.GetStatusOfClientComments(Val(Page.Request.QueryString("ticket_token")))) = 0 Then

            If txtResponse.Text.Length <> 0 Then
                DL_Panel.InsertCommentClientResponse(Val(Page.RouteData.Values("id")), Val(Page.Request.QueryString("ticket_token")),
                                          txtResponse.Text.Trim.Replace(ControlChars.Lf, "<br/>"), 1, 0)
                SendSMS(Val(Page.RouteData.Values("id")), "کامنت جدید شما با موفقیت به ثبت رسید و در اسرع وقت توسط کارشناس مربوطه‌ی «درگاه فیلم ایران» پاسخ داده خواهد شد.")
                MultiView.ActiveViewIndex = 1
            End If
        Else
            MultiView.ActiveViewIndex = 3
        End If
    End Sub

End Class
