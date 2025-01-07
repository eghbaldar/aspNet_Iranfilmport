Imports ZarinPal
Partial Class panelclients_PanelSuggestedFestival
    Inherits System.Web.UI.Page

	Dim DL_Panel As New DLL_Panel
	Public userID As Long
    Public ClosedStyle As String

    Private Sub PanelMoney_Load(sender As Object, e As EventArgs) Handles Me.Load
        Title = "فستیوال های پیشنهادی |  پنل اختصاصی کاربران"
        userID = Page.RouteData.Values("id")
        hiddenUsername.Value = userID
        DL_Panel.SeenAllSuggestedFestival(userID)
    End Sub
    Public Function Country(id As Object) As String
        Return DL_Panel.GetCountry(Val(id))
    End Function

    Public Function GetShamsi(date_ As Object) As String
        Return ShamsiDate.Miladi2Shamsi(date_, ShamsiDate.ShowType.ShortDate)
    End Function

    Public Function Closed(date_ As Object) As String
        Return IIf(Convert.ToDateTime(date_).AddDays(1) <= Date.Now.Date, False, True)
    End Function

    Public Function ClosedText(date_ As Object, agree_ As Object) As String
        If agree_ = 0 Then
            Return IIf(Convert.ToDateTime(date_).AddDays(1) <= Date.Now.Date, "اتمام مهلت", "ثبت اولیه")
        End If

        If agree_ = 1 Then
            Return "آپلود رسید پرداختی"
        End If

        If agree_ = 2 Then
            Return "منتظر تائید کارشناس"
        End If

        If agree_ = 3 Then
            Return "تائید و ارسال انجام شد"
        End If

        If agree_ = 4 Then
            Return "کنسل شده"
        End If

    End Function
    Public Sub Bank(sender As Object, e As CommandEventArgs)
        Dim pars() As String = e.CommandArgument.ToString().Split("|")
		'Dim amount = (Val(pars(1)) * 66000).ToString("N0") & " تومان"
		Dim amount = (Val(pars(1)) * DL_Panel.GetDollar()).ToString("N0") & " تومان"
		Dim agree = pars(2)
        Dim festivalId = pars(0)

        If agree = 0 Then
            Dim jsFunction As String = "RequestSent('" + amount + "'," + festivalId + "," + Page.RouteData.Values("id") + ");" ' Replace "yourJavaScriptFunction()" with the actual function name
            ClientScript.RegisterStartupScript(Me.GetType(), "YourKey", jsFunction, True)
        ElseIf agree = 1 Then
            Response.Redirect("~/panel/PanelSuggestedFestivalUploadReceipt/" & Page.RouteData.Values("id") & "/" & festivalId)
        End If

    End Sub

End Class
