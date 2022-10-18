
Partial Class _Default
    Inherits System.Web.UI.Page

    Public Function getDate(ByVal e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
    End Function

    Public Function getLink(ByVal id As Object, ByVal title As Object) As String
        Dim D As New DLL
        Dim T As String = D.GetClearString(title.ToString())

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
                If T.Length > 50 Then
                    Return String.Format("~/{0}/{1}?lang=en", id.ToString, T.Substring(0, 50))
                Else
                    Return String.Format("~/{0}/{1}?lang=en", id.ToString, T)
                End If
            Else
                If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
                If T.Length > 50 Then
                    Return String.Format("~/{0}/{1}", id.ToString, T.Substring(0, 50))
                Else
                    Return String.Format("~/{0}/{1}", id.ToString, T)
                End If
            End If
        Else
            If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
            If T.Length > 50 Then
                Return String.Format("~/{0}/{1}", id.ToString, T.Substring(0, 50))
            Else
                Return String.Format("~/{0}/{1}", id.ToString, T)
            End If
        End If

    End Function

    Public Function getLinkFest(ByVal title As Object) As String

        Dim DL As New DLL
        Dim T As String = DL.GetClearString(title.ToString())

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1) & "?lang=en"
                If T.Length > 50 Then
                    Return T.Substring(0, 50) & "?lang=en"
                Else
                    Return T & "?lang=en"
                End If
            Else
                If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
                If T.Length > 50 Then
                    Return T.Substring(0, 50)
                Else
                    Return T
                End If
            End If
        Else
            If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
            If T.Length > 50 Then
                Return T.Substring(0, 50)
            Else
                Return T
            End If
        End If

    End Function

    Public Function getDeadlineStatus(sign As Object, remaindays As Object) As String

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Select Case Val(sign)
                    Case 1
                        Return "<span style='color:green;font-weight:bold'>" + "Left Days: " + remaindays.ToString + " Days</span>"
                    Case 0
                        Return "<span style='color:gray;font-style:italic'>" + "No Deadline" + "</span>"
                    Case -1
                        Return "<span style='color:red;font-style:italic'>" + "Festival is closed" + "</span>"
                End Select
            Else
                Select Case Val(sign)
                    Case 1
                        Return "<span style='color:green;font-weight:bold'>" + "روزهای باقی مانده: " + remaindays.ToString + " روز</span>"
                    Case 0
                        Return "<span style='color:gray;font-style:italic'>" + "ددلاینی وارد نشده است" + "</span>"
                    Case -1
                        Return "<span style='color:red;font-style:italic'>" + "فستیوال بسته شده است." + "</span>"
                End Select
            End If
        Else
            Select Case Val(sign)
                Case 1
                    Return "<span style='color:green;font-weight:bold'>" + "روزهای باقی مانده: " + remaindays.ToString + " روز</span>"
                Case 0
                    Return "<span style='color:gray;font-style:italic'>" + "ددلاینی وارد نشده است" + "</span>"
                Case -1
                    Return "<span style='color:red;font-style:italic'>" + "فستیوال بسته شده است." + "</span>"
            End Select
        End If

    End Function

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                lblTitleFestivals.Text = "Top of International Film Festivals"
                lblTitleNews.Text = "Last News & Articles"
            Else
                lblTitleFestivals.Text = "فستیوال‌های بین المللی فیلم و فیلمنامه"
                lblTitleNews.Text = "آخرین اخبار"
            End If
        Else
            lblTitleFestivals.Text = "فستیوال‌های بین المللی فیلم و فیلمنامه"
            lblTitleNews.Text = "آخرین اخبار"
        End If        
    End Sub

    Public Function EnFa(input As String) As Boolean
        Dim Result As Boolean
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Result = True
            Else
                Result = False
            End If
        Else
            Result = False
        End If
        Select Case input
            Case "FA"
                Return Not Result
            Case "EN"
                Return Result
        End Select
    End Function

End Class
