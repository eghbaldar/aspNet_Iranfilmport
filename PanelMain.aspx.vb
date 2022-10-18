
Partial Class PanelMain
    Inherits System.Web.UI.Page
    Dim Dll As New DLL_Panel
    Public Sub ShowSubmissions(sender As Object, e As CommandEventArgs)
        HiddenField_FilmID.Value = e.CommandArgument.ToString
        MultiView.ActiveViewIndex = 1   
        If Dll.GetNumberOfNotChecked(HiddenField_FilmID.Value) > 0 Then
            btnNewUpdated.Visible = True
        Else
            btnNewUpdated.Visible = False
        End If
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
                Return e.ToString
        End Select
    End Function

    Protected Sub btnBacktoFilms_Click(sender As Object, e As System.EventArgs) Handles btnBacktoFilms.Click
        MultiView.ActiveViewIndex = 0
    End Sub

    Protected Sub btnNewUpdated_Click(sender As Object, e As System.EventArgs) Handles btnNewUpdated.Click
        Dim dl As New DLL
        For i As Integer = 0 To dgNewUpdated.Rows.Count - 1
            Dll.UpdateSubmissionAfterNotifiedFestival(Val(dgNewUpdated.Rows(i).Cells(15).Text))
        Next
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

End Class
