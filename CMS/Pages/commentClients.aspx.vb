
Imports System.IO
Imports System.Net

Partial Class CMS_Pages_commentClients
    Inherits System.Web.UI.Page

    Dim DL_Panel As New DLL_Panel
    Public Function GetFilmFestival(id_submission As Object) As String
        Return DL_Panel.GetFilmFestival(id_submission)
    End Function
    Public Function GetSection(section As Object) As String
        Select Case Val(section)
            Case 0
                Return "امور فستیوال‌ها و مسائل فنی پخش"
            Case 1
                Return "امور مالی"
            Case 2
                Return "روابط عمومی"
            Case 3
                Return "امور فنی سایت"
        End Select
    End Function
    Public Function GetFlagBackground(flag As Object) As System.Drawing.Color
        Select Case Val(flag)
            Case 0
                'Return "ارسال نشده"
            Case 1
                Return System.Drawing.Color.Red
            Case 2
                Return System.Drawing.Color.Green
            Case 3
                Return System.Drawing.Color.LightGray
        End Select
    End Function
    Public Function GetFlag(flag As Object) As String
        Select Case Val(flag)
            Case 0
                'Return "ارسال نشده"
            Case 1
                Return "در حال بررسی"
            Case 2
                Return "پاسخ داده شده"
            Case 3
                Return "بسته شده"
        End Select
    End Function
    Public Function GetDate(data As Object) As String
        Return ShamsiDate.Miladi2Shamsi(data, ShamsiDate.ShowType.LongDate)
    End Function
    Public Sub Ticket(sender As Object, e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Response.Redirect("commentClients?id=" & s(0) + "&Status=" + s(1) + "&id_client=" + s(2))

    End Sub
    Public Function GetWhich(obj As Object) As String
        If obj <> 0 Then
            Return "پاسخ فیلمساز /  فیلمنامه نویس"
        Else
            Return "پاسخ کارشناس"
        End If
    End Function
    Public Function GetAdminClientBackground(obj As Object) As System.Drawing.Color
        If Val(obj) = 0 Then
            Return System.Drawing.Color.FromName("#fff4bf")
        Else
            Return System.Drawing.Color.FromName("#f0f0f0")
        End If
    End Function
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
    Private Sub CMS_Pages_commentClients_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Page.Request.QueryString("id") <> "" Then
            MultiView1.ActiveViewIndex = 1
            GetFlag()
        End If
    End Sub
    Private Sub SendSMS(PaternId As String, customerid As Long)

        'Dim cell As String = DL_Panel.GetPhoneCustomer(customerid)
        'Dim url As String = "http://login.parsgreen.com/UrlService/sendSMS.ashx?from=" +
        '"10009332300598" +
        '"&to=" + cell +
        '"&text=" + text +
        '"&signature=" + "9D57838D-3935-4724-BB71-5A5FCB2EA579"

        'Dim req As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        'Dim resp As Net.WebResponse = req.GetResponse()
        'Dim st = resp.GetResponseStream()
        'Dim sr = New StreamReader(st, Encoding.UTF8)
        'Dim _responseStr As String = sr.ReadToEnd()
        'sr.Close()
        'resp.Close()

        Dim url As String = "http://ippanel.com:8080/?apikey=XVU06zwUg1yXY1Dl7gGXQJPIm2o0b9Rq5hytsI2FkFQ=&pid=" & PaternId & "&fnum=" & SMS.numberHamkaran & "&tnum=" & DL_Panel.GetPhoneCustomer(customerid) & " &p1=name&v1=" & DL_Panel.GetNameCustomer(customerid)

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
            DL_Panel.InsertCommentClientResponse(0, Val(Page.Request.QueryString("id")),
                                      txtResponse.Text.Trim.Replace(ControlChars.Lf, "<br/>"), 2, 1)
            'SendSMS(Val(Page.Request.QueryString("id_client")), "تیکت شما توسط کارشناسی از «درگاه فیلم ایران» پاسخ داده شد.")
            SendSMS("d4hbplkt4pgeceq", Val(Page.Request.QueryString("id_client")))
            DataListResponses.DataBind()
        End If
    End Sub
    Public Function GetNameClient(id_client As Object) As String
        Return DL_Panel.GetNameCustomer(id_client)
    End Function

    Private Sub btnBacktoTickets_Click(sender As Object, e As EventArgs) Handles btnBacktoTickets.Click
        Response.Redirect("commentClients")
    End Sub

    Public Function GetReadBackground(read As Object) As System.Drawing.Color
        Select Case Val(read)
            Case 0
                Return System.Drawing.Color.Green
            Case 1
                Return System.Drawing.Color.Green
        End Select
    End Function

    Public Sub UpdateReadFlag(sender As Object, e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        DL_Panel.UpdateCommentClient(Val(s(0)), s(1), Val(s(2)))
        dgComments.DataBind()
    End Sub

End Class
