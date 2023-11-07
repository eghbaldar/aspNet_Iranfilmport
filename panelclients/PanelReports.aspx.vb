
Imports System.Net

Partial Class panelclients_PanelReports
    Inherits System.Web.UI.Page

    Private Sub panelclients_PanelReports_Load(sender As Object, e As EventArgs) Handles Me.Load
        HiddenField_FilmID.Value = Page.RouteData.Values("IdFilm")
        HiddenField_CustomerID.Value = Page.RouteData.Values("id")
    End Sub

    Public Function GetDateShamsi(e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e, ShamsiDate.ShowType.ShortDate)
    End Function

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
    Public Function GetNotification(e As Object) As String
        Return Convert.ToDateTime(e)
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
    Public Function GetFeeValueBackground(e As Object) As Boolean
        Select Case e.ToString
            Case "1"
                Return False
            Case Else
                Return True
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

    Public Sub PublicSetClick(sender As Object, e As CommandEventArgs)

        CType(sender, Button).Visible = False

        Dim grdrow As GridViewRow = CType(CType(sender, Button).NamingContainer, GridViewRow)

        Dim IdSubmission As String = CType(grdrow.FindControl("lblIdSubmission"), Label).Text
        Dim receipt As String = CType(grdrow.FindControl("lblReceipt"), Label).Text

        CType(grdrow.FindControl("lblStatusReceipt"), Label).Text = GetStatusReceipt(IdSubmission, receipt)

    End Sub
    Public Function GetStatusReceipt(id As Object, receipt As Object) As String
        Dim msg_not_found_physical_file As String = "این رسید در سرور موجود نیست و قبلا برای شما بصورت فیزیکی ارسال شده است. در صورت نیاز از طریق تیکت درخواست خود را ارسال کنید. با تشکر"
        Dim msg_not_uploaded_physical_file As String = "رسید این ارسال هنوز توسط دپارتمان پخش شرکت بارگزاری نشده است. بارگزاری این رسید به زودی اتفاق خواهد افتاد. لطفا صبور باشد. با تشکر"
        Select Case receipt
            Case "2" ' means the receipt was sent but the user has not opened it yet
                If GetStatusExistedFileOnServer(id.ToString & ".jpg") Then 'check whether receipt is existed or not!
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
    Private Function GetStatusExistedFileOnServer(filename As String) As Boolean

        ServicePointManager.Expect100Continue = True ''Just for HTTPS (ssl)
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 ''Just for HTTPS (ssl)
        Dim webRequest As System.Net.WebRequest = System.Net.WebRequest.Create("https://files.iranfilmport.com/receipts/" & filename)
        webRequest.Method = "HEAD"
        Try
            Dim response As System.Net.HttpWebResponse = CType(webRequest.GetResponse, System.Net.HttpWebResponse)
            'If (response.StatusCode.ToString = "OK") Then
            Return True
            'End If
            'Return False
        Catch
            Return False
        End Try

        'Another way to check the file on server is:
        'Try
        '    ServicePointManager.Expect100Continue = True
        '    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
        '    Dim webClient As Net.WebClient = New Net.WebClient()
        '    Dim url = "https://files.iranfilmport.com/" & filename
        '    Dim bytes As Byte() = webClient.DownloadData(url)
        '    If bytes.Length > 0 Then
        '        Return True
        '    End If
        'Catch ex As Exception
        '    Return False
        'End Try

    End Function
End Class
