
Partial Class dashboard_contract
    Inherits System.Web.UI.Page

    Public Function getDate(ByVal e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
    End Function
    '
    'Public Function getWayPay(ByVal e As Object) As String
    '    Select Case e.ToString
    '        Case 1
    '            Return "نقدی"
    '        Case 2
    '            Return "درگاه اینترنتی"
    '        Case 3
    '            Return "کارت به کارت"
    '    End Select
    'End Function
    '
    Public Function Total(ByVal e As Object) As String
        Dim s() As String = e.ToString.Split("|")
        Return MoneyNum((Val(s(0) + 0)))
    End Function

    Public Function MoneyNum(ByVal _str As Integer) As String
        Return _str.ToString("N0") + " ریال"
    End Function

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        Title = "فاکتور پرداخت"
    End Sub
End Class
