
Imports System.IO
Imports System.Net
Imports System.Net.Security
Imports System.Security.Cryptography.X509Certificates

Partial Class PanelMain
	Inherits System.Web.UI.Page
	Dim Dll As New DLL_Panel
	Private DollarMsg As String = "مجموع ورودی های اعتباری صفر شده توسط «درگاه فیلم ایران» برای تمامی فیلم‌های شما، تا این لحظه به دلار میانیگن روز <span style='background-color:black;color:white;padding:2px;width:70px'>({0} تومان)</span>، برابر است با:"
	Public Sub ShowSubmissions(sender As Object, e As CommandEventArgs)

        HiddenField_FilmID.Value = e.CommandArgument.ToString
        MultiView.ActiveViewIndex = 1
        If Dll.GetNumberOfNotChecked(HiddenField_FilmID.Value) > 0 Then
            btnNewUpdated.Visible = True
            lblReceipt.Visible = True
        Else
            btnNewUpdated.Visible = False
        End If

		lblSumFeeTitle.Text = String.Format(DollarMsg, Val(Dll.GetDollar()).ToString("N0"))
		lblSumFee.Text = "<span style='font-size:50px'>" + (Val(Dll.GetSumFeeValue(HiddenField_FilmID.Value)) * Dll.GetDollar()).ToString("N0") + " تومان" + "</span>"

		dgNewUpdated.DataBind()

    End Sub
    Public Function GetAccept(e As Object) As String
        Select Case e.ToString
            Case "0"
                Return "در حال بررسی توسط فستیوال"
            Case "1"
                Return "انتخاب نشده است"
            Case "2"
                Return "انتخاب شده است - پذیرش اولیه"
            Case "3"
                Return "انتخاب نشده است"
            Case "4"
                Return "فستیوال کنسل شده است"
            Case "5"
                Return "نیمه نهایی"
            Case "6"
                Return "فینالیست"
            Case "7"
                Return "کاندید شده"
            Case "8"
                Return "جایزه گرفته"
        End Select
    End Function
    Public Function GetFee(e As Object) As String
        Select Case e.ToString
            Case "0"
                Return "رایگان"
            Case "1"
                Return "با مکاتبه حقوقی صفر شده است"
            Case "2"
                Return "بخش ویژه ایرانیان"
            Case "3"
                Return "پرداخت شده"
        End Select
    End Function
    Public Function GetFeeValue(e As Object) As String
        Select Case e.ToString
            Case "1"
                Return "-"
            Case Else
                Return e.ToString + " - دلار"
        End Select
    End Function

    Public Function GetNotification(e As Object) As String
        Return Convert.ToDateTime(e)
    End Function
	Public Function GetDateShamsi(e As Object) As String
		Return ShamsiDate.Miladi2Shamsi(e, ShamsiDate.ShowType.ShortDate)
	End Function
	Public Function GetFeeValueBackground(e As Object) As Boolean
        Select Case e.ToString
            Case "1"
                Return False
            Case Else
                Return True
        End Select
    End Function

    Protected Sub btnBacktoFilms_Click(sender As Object, e As System.EventArgs) Handles btnBacktoFilms.Click
        MultiView.ActiveViewIndex = 0
        lblReceipt.Visible = False
    End Sub

    Protected Sub btnNewUpdated_Click(sender As Object, e As System.EventArgs) Handles btnNewUpdated.Click

        Dim dl As New DLL
        Dll.UpdateSubmissionAfterNotifiedFestival(Val(HiddenField_FilmID.Value))
        dgNewUpdated.DataBind()
        btnNewUpdated.Visible = False

    End Sub

    Public Function EnableProfile() As Boolean
        Dim DL As New DLL_Panel
        Dim LeftDays As Integer = DL.GetLastLeftDaysOfInstallment(Convert.ToInt64(Page.RouteData.Values("id")))
        If LeftDays < 0 Then
            If Math.Abs(LeftDays) > 10 Then
                Return False
            End If
        End If
        Return True
    End Function

    Public Sub ShowStrategyReport(sender As Object, e As CommandEventArgs)
        Response.Redirect("~/panel/panelStrategyReports/" & Page.RouteData.Values("id") & "/" & e.CommandArgument.ToString)
    End Sub

    Private Sub PanelMain_Load(sender As Object, e As EventArgs) Handles Me.Load

		If Not IsPostBack Then
			Dim email As String = Dll.GetEmailClient(Val(Page.RouteData.Values("id")))
			If String.IsNullOrEmpty(email) Or email.Trim = "iranfilmportdistributor@gmail.com" Then
				ClientEmailModal.Visible = True
			End If
		End If
		FillFeeValue()
    End Sub

    Private Sub FillFeeValue()
		lblSumFeeTitle.Text = String.Format(DollarMsg, Val(Dll.GetDollar()).ToString("N0"))
		lblSumFee.Text = "<span style='font-size:50px'>" + (Dll.GetSumFeeValueAllFilm(Val(Page.RouteData.Values("id"))) * Dll.GetDollar()).ToString("N0") + " تومان" + "</span>"
	End Sub

    Public Sub PublicSetClick(sender As Object, e As CommandEventArgs)

        CType(sender, Button).Visible = False

        Dim grdrow As GridViewRow = CType(CType(sender, Button).NamingContainer, GridViewRow)

        Dim IdSubmission As String = CType(grdrow.FindControl("lblIdSubmission"), Label).Text
        Dim receipt As String = CType(grdrow.FindControl("lblReceipt"), Label).Text

        CType(grdrow.FindControl("lblStatusReceipt"), Label).Text = GetStatusReceipt(IdSubmission, receipt)

    End Sub

    Public Sub PublicSetClickAll(sender As Object, e As CommandEventArgs)

        CType(sender, Button).Visible = False

        Dim grdrow As GridViewRow = CType(CType(sender, Button).NamingContainer, GridViewRow)

        Dim IdSubmission As String = CType(grdrow.FindControl("lblIdSubmissionAll"), Label).Text
        Dim receipt As String = CType(grdrow.FindControl("lblReceiptAll"), Label).Text

        CType(grdrow.FindControl("lblStatusReceiptAll"), Label).Text = GetStatusReceipt(IdSubmission, receipt)

    End Sub

    Public Function GetStatusReceipt(id As Object, receipt As Object) As String
        Dim msg_not_found_physical_file As String = "این رسید در سرور موجود نیست و قبلا برای شما بصورت فیزیکی ارسال شده است. در صورت نیاز از طریق تیکت درخواست خود را ارسال کنید. با تشکر"
        Dim msg_not_uploaded_physical_file As String = "رسید این ارسال هنوز توسط دپارتمان پخش شرکت بارگزاری نشده است. بارگزاری این رسید به زودی اتفاق خواهد افتاد. لطفا صبور باشد. با تشکر"
        Select Case receipt
            Case "2" ' means the receipt was sent but the user has not opened it yet
                If FileExistsOnRemoteServer(id.ToString & ".jpg") Then 'check whether receipt is existed or not!
                    Return "<div class='divGiveReceipt'><a style='text-decoration:none' target='_blank' href='../PanelReceipt/" & Page.RouteData.Values("id") & "/" & id.ToString & "#receipt'>دریافت رسید</a></div>"
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "عدم یافت رسید", "alert('" & msg_not_found_physical_file & "');", True)
                    Return "<img style='cursor:pointer' width='25px'  src='..\..\files\images\icons\ban.png' title='" & msg_not_found_physical_file & "'/>"
                End If
            Case "3" ' means the receipt was opened by user in the past and now he/she will always be able to open/see it.
                Return "<div class='divGiveReceipt'><a style='text-decoration:none' target='_blank' href='../PanelReceipt/" & Page.RouteData.Values("id") & "/" & id.ToString & "#receipt'>دریافت رسید</a></div>"
            Case "1"
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "عدم یافت رسید", "alert('" & msg_not_uploaded_physical_file & "');", True)
                Return "<img style='cursor:pointer' src='..\..\files\images\icons\awating.png' title='" & msg_not_uploaded_physical_file & "' />"
            Case "0" 'thi submission has JUST confrimed but its receipt has not created yet
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "عدم یافت رسید", "alert('" & msg_not_uploaded_physical_file & "');", True)
                Return "<img style='cursor:pointer' src='..\..\files\images\icons\awating.png' title='" & msg_not_uploaded_physical_file & "' />"
            Case Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "عدم یافت رسید", "alert('" & msg_not_found_physical_file & "');", True)
                Return "<img style='cursor:pointer'  width='25px'  src='..\..\files\images\icons\ban.png' title='" & msg_not_found_physical_file & "' />"
        End Select
    End Function

    '==================================== CHECK FILE ON SERVER
    Public Function FileExistsOnRemoteServer(ByVal filename As String) As Boolean
        Try
            ' Create a new WebClient instance and set the security protocol
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 Or SecurityProtocolType.Tls11 Or SecurityProtocolType.Tls
            ServicePointManager.ServerCertificateValidationCallback = AddressOf ValidateRemoteCertificate

            Using client As New WebClient()
                ' Check if the file exists on the remote server
                Dim fileBytes As Byte() = client.DownloadData("https://files.iranfilmport.com/receipts/" & filename)
                Return fileBytes.Length > 0
            End Using
        Catch ex As Exception
            ' If any exception occurs, assume the file does not exist
            Return False
        End Try
    End Function

    Private Function ValidateRemoteCertificate(ByVal sender As Object,
                                           ByVal certificate As X509Certificate,
                                           ByVal chain As X509Chain,
                                           ByVal sslPolicyErrors As SslPolicyErrors) As Boolean
        ' Always return true to bypass certificate validation
        Return True
    End Function
    'NEW WAY
    'OLD WAY
    'Private Function GetStatusExistedFileOnServer(filename As String) As Boolean

    '    'ServicePointManager.Expect100Continue = True ''Just for HTTPS (ssl)
    '    'ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 ''Just for HTTPS (ssl)
    '    Dim webRequest As System.Net.WebRequest = System.Net.WebRequest.Create("https://files.iranfilmport.com/receipts/" & filename)
    '    webRequest.Method = "HEAD"
    '    Try
    '        Dim response As System.Net.HttpWebResponse = CType(webRequest.GetResponse, System.Net.HttpWebResponse)
    '        Return True
    '    Catch
    '        Return False
    '    End Try

    'End Function
    '====================================

    Private Sub dgAll_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles dgAll.RowDataBound
        If Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "receipt")) = 2 _
            And Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "date_of_entryData")) >= "2023-04-22 00:00:00.000" Then
            e.Row.BackColor = System.Drawing.Color.FromName("#ffd6d6")
        End If
    End Sub

    Private Sub dgNewUpdated_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles dgNewUpdated.RowDataBound
        If Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "receipt")) = 2 _
            And Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "date_of_entryData")) >= "2023-04-22 00:00:00.000" Then
            e.Row.BackColor = System.Drawing.Color.FromName("#ffd6d6")
        End If
    End Sub

    Private Sub btnReport_Click(sender As Object, e As EventArgs) Handles btnReport.Click
        Response.Redirect("~/panel/panelReports/" & Page.RouteData.Values("id") & "/" & HiddenField_FilmID.Value)
    End Sub

    Private Sub btnReportMain_Click(sender As Object, e As EventArgs) Handles btnReportMain.Click
        Response.Redirect("~/panel/panelReports/" & Page.RouteData.Values("id") & "/" & HiddenField_FilmID.Value)
    End Sub

    Public Sub ShowReport(sender As Object, e As CommandEventArgs)
        Response.Redirect("~/panel/panelReports/" & Page.RouteData.Values("id") & "/" & e.CommandArgument.ToString())
    End Sub

	Public Function GetSumFee(idFilm As Integer) As String
		Return (Val(Dll.GetSumFeeValue(idFilm)) * Dll.GetDollar()).ToString("N0")
	End Function

End Class
