
Partial Class PanelTicket
    Inherits System.Web.UI.Page

    Dim DL_Panel As New DLL_Panel

    Private Sub PanelTicket_Load(sender As Object, e As EventArgs) Handles Me.Load
        Title = "تیکت‌ها  |  پنل اختصاصی کاربران"
    End Sub
    Protected Sub btnNewTicket_Click(sender As Object, e As EventArgs) Handles btnNewTicket.Click
        Response.Redirect("~/panel/newtickets/" & Page.RouteData.Values("id"))
    End Sub

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

    Public Function GetDate(data As Object) As String
        Return ShamsiDate.Miladi2Shamsi(data, ShamsiDate.ShowType.LongDate)
    End Function

    Public Sub Ticket(sender As Object, e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Response.Redirect("~/panel/newtickets/" & Page.RouteData.Values("id") +
            "?newpost=off&ticket_token=" + s(0) + "&Status=" + s(1) + "&sections=" + s(2) + "&id_submission=" + s(3))
    End Sub

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

    Public Function GetFilmFestival(id_submission As Object) As String
        Return DL_Panel.GetFilmFestival(id_submission)
    End Function


End Class
