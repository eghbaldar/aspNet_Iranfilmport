
Imports System.IO
Imports System.Net

Partial Class PanelTicketNew
    Inherits System.Web.UI.Page

    Dim DL_Panel As New DLL_Panel
    Dim Email As New Email

    Private Sub PanelTicketNew_Load(sender As Object, e As EventArgs) Handles Me.Load

        Title = "تیکت جدید  |  پنل اختصاصی کاربران"
        HiddenFieldClientID.Value = Page.RouteData.Values("id")

        If Page.Request.QueryString("ticket_token") <> "" Then
            MultiView.ActiveViewIndex = 2
            If Page.Request.QueryString("Status") = 2 And (Not IsPostBack) Then
                'It means after replying this ticket by an expert, then the client change status to "READ"
                DL_Panel.UpdateCommentClient(Val(Page.Request.QueryString("ticket_token")), True, 1)
            End If
        End If

        'If the client's ticket is not answered yet, the client will not be able to reply this ticket!
        If Val(DL_Panel.GetStatusOfClientComments(Val(Page.Request.QueryString("ticket_token")))) <> 0 Then
            MultiViewAnswer.ActiveViewIndex = 0
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
            Return "پیام فیلمساز /  فیلمنامه نویس"
        Else
            Return "پیام کارشناس"
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
            DL_Panel.InsertCommentClient(Val(Page.RouteData.Values("id")),
                                         cmdSections.SelectedValue, cmdFestival.SelectedValue,
            txtText.Text.Trim.Replace(ControlChars.Lf, "<br/>"), 0, "")
            ''''''''''''' SMS
            SendSMS("7nufm7nm65kdv2x", Val(Page.RouteData.Values("id")))
            SendSMS_ToAdmin("9du2xqln8hj2rct", Val(Page.RouteData.Values("id")))
            ''''''''''''' Email
            ''''To Admin
            SendEmail(Val(Page.RouteData.Values("id")), txtText.Text.Trim.Replace(ControlChars.Lf, "<br/>"))
            ''''To Client
            'SendEmail(Val(Page.RouteData.Values("id")), txtText.Text.Trim.Replace(ControlChars.Lf, "<br/>"))
            ''''''''''''''''''''''''''''''''''''''''''''''''''''
            MultiView.ActiveViewIndex = 1
        End If
    End Sub

    Private Sub SendSMS(PaternId As String, customerid As Long)

        'Dim cell As String = DL_Panel.GetPhoneCustomer(customerid)
        'Dim url As String = "http://login.parsgreen.com/UrlService/sendSMS.ashx?from=" +
        '"10009332300598" +
        '"&to=" + cell +
        '"&text=" + text +
        '"&signature=" + "9D57838D-3935-4724-BB71-5A5FCB2EA579"

        Dim url As String = "http://ippanel.com:8080/?apikey=XVU06zwUg1yXY1Dl7gGXQJPIm2o0b9Rq5hytsI2FkFQ=&pid=" & PaternId & "&fnum=" & SMS.numberHamkaran & "&tnum=" & DL_Panel.GetPhoneCustomer(customerid) & " &p1=name&v1=" & DL_Panel.GetNameCustomer(customerid)

        Dim req As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        Dim resp As Net.WebResponse = req.GetResponse()
        Dim st = resp.GetResponseStream()
        Dim sr = New StreamReader(st, Encoding.UTF8)
        Dim _responseStr As String = sr.ReadToEnd()
        sr.Close()
        resp.Close()

    End Sub

    Private Sub SendEmail(customerid As Long, Text As String)
        'توجه ارسال ایمیل در حالت لوکال کار نمیکند
        Try
            Email.SendMail("iranfilmportdistributor@gmail.com",
                      "کاربر: " & DL_Panel.GetNameCustomer(customerid) & "<br/>" & "<strong>" & Text & "</strong>",
                      "تیکت: " & DL_Panel.GetNameCustomer(customerid),
                      "http://iranfilmport.com/cms/pages/commentClients")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub SendSMS_ToAdmin(PaternId As String, customerid As Long)

        Dim url As String = "http://ippanel.com:8080/?apikey=XVU06zwUg1yXY1Dl7gGXQJPIm2o0b9Rq5hytsI2FkFQ=&pid=" & PaternId & "&fnum=" & SMS.numberHamkaran & "&tnum=" & "09111380846" & " &p1=name&v1=" & DL_Panel.GetNameCustomer(customerid)

        Dim req As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        Dim resp As Net.WebResponse = req.GetResponse()
        Dim st = resp.GetResponseStream()
        Dim sr = New StreamReader(st, Encoding.UTF8)
        Dim _responseStr As String = sr.ReadToEnd()
        sr.Close()
        resp.Close()

    End Sub

    Private Sub btnResponse_Click(sender As Object, e As EventArgs) Handles btnResponse.Click

        If txtResponse.Text.Length <> 0 Then
            DL_Panel.InsertCommentClientResponse(Val(Page.RouteData.Values("id")),
                                                 Val(Page.Request.QueryString("ticket_token")),
                                                convertNumFatoEn(txtResponse.Text.Trim.Replace(ControlChars.Lf, "<br/>")), 1, 0, 0, "")
            '''''''''''''' SMS
            SendSMS("bw7a0w8vp9hgwyj", Val(Page.RouteData.Values("id")))
            SendSMS_ToAdmin("re9x2dh9u0sar1x", Val(Page.RouteData.Values("id")))
            ''''''''''''' Email
            '''To Admin
            SendEmail(Val(Page.RouteData.Values("id")), txtResponse.Text.Trim.Replace(ControlChars.Lf, "<br/>"))
            ''''To Client
            'SendEmail(Val(Page.RouteData.Values("id")), txtText.Text.Trim.Replace(ControlChars.Lf, "<br/>"))
            ''''''''''''''''''''''''''''''''''''''''''''''''''''
            MultiView.ActiveViewIndex = 1
        End If

    End Sub

    Private Sub btnMethodRecord_Click(sender As Object, e As EventArgs) Handles btnMethodRecord.Click
        MultiViewMethod.ActiveViewIndex = 2
    End Sub
    Private Sub btnMethodText_Click(sender As Object, e As EventArgs) Handles btnMethodText.Click
        MultiViewMethod.ActiveViewIndex = 1
    End Sub

    Private Sub btnEnableResponseText_Click(sender As Object, e As EventArgs) Handles btnEnableResponseText.Click
        MultiViewAnswer.ActiveViewIndex = 2
    End Sub

    Private Sub btnEnableResponseVoice_Click(sender As Object, e As EventArgs) Handles btnEnableResponseVoice.Click
        MultiViewAnswer.ActiveViewIndex = 3
        HiddenFieldResponseSections.Value = Request.QueryString("sections")
        HiddenFieldResponseIdSubmission.Value = Request.QueryString("id_submission")
        HiddenFieldNewOrResponse.Value = 1
        HiddenFieldToken.Value = Page.Request.QueryString("ticket_token")
    End Sub

    Public Function convertNumFatoEn(ByVal T As String) As String
        Return T.Replace("۰", "0").Replace("۱", "1").Replace("۲", "2").Replace("۳", "3").Replace("۴", "4").Replace("۵", "5").Replace("۶", "6").Replace("۷", "7").Replace("۸", "8").Replace("۹", "9").Replace("٫", "/")
    End Function

End Class
