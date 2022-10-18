
Partial Class dashboard_submission
    Inherits System.Web.UI.Page

    Dim DLLd As New DLL_Dashboard

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        DLLd._Email_ = Request.Cookies("IFP").Item("email")
        If Not IsPostBack Then HiddenEmail.Value = DLLd._Email_
        Title = "داشبورد" + " | " + "فستیوال های شرکت کرده"
    End Sub

    Public Function SetSend(ByVal e As Object) As String
        Select Case e.ToString
            Case 1
                Return "~\dashboard\assets\img\icon_Consideration.png"
            Case 2
                Return "~\dashboard\assets\img\icon_sent.png"
            Case 3
                Return "~\dashboard\assets\img\icon_deny.png"
        End Select
    End Function

    Public Function SetAccoalde(ByVal e As Object) As String
        Select Case e.ToString
            Case 0
                Return "~\dashboard\assets\img\icon_deny.png"
            Case 1
                Return "~\dashboard\assets\img\icon_Disqualified.png"
            Case 2
                Return "~\dashboard\assets\img\icon_Undecided.png"
            Case 3
                Return "~\dashboard\assets\img\icon_Selected.png"
            Case 4
                Return "~\dashboard\assets\img\icon_NotSelected.png"
            Case 5
                Return "~\dashboard\assets\img\icon_Semi_Finalist.png"
            Case 6
                Return "~\dashboard\assets\img\icon_finlist.png"
            Case 7
                Return "~\dashboard\assets\img\icon_award.png"
        End Select
    End Function

    Public Function getDate(ByVal e As Object) As String
        If e.ToString <> "" Then
            Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.ShortDate)
        Else
            Return "در حال ارسال می باشد"
        End If
    End Function

End Class
