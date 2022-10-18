
Partial Class festivals
    Inherits System.Web.UI.Page

    Public Function getDeadlineStatus(sign As Object, remaindays As Object) As String
        Select Case Val(sign)
            Case 1
                Return "<span style='color:green;font-weight:bold'>" + "روزهای باقی مانده: " + remaindays.ToString + " روز</span>"
            Case 0
                Return "<span style='color:gray;font-style:italic'>" + "ددلاینی وارد نشده است" + "</span>"
            Case -1
                Return "<span style='color:red;font-style:italic'>" + "فستیوال بسته شده است." + "</span>"
        End Select
    End Function

    Sub search()
        '''''''''''''''''''
        'Search Format: oc=N&level=N&genre=N+N2&sf=N+N2&t=N
        '''''''''''''''''''
        'Festival Status
        Dim oc As String = rb_OC.SelectedValue.ToString
        'Festival level
        Dim level As String =rb_level.SelectedValue.ToString 
        'Festival(Genre)
        Dim Genre As String = ""
        For i As Byte = 0 To chk_genre.Items.Count - 1
            If chk_genre.Items(i).Selected Then
                Genre += chk_genre.Items(i).Value.ToString + ","
            End If
        Next
        If Genre.Trim.Length > 0 Then Genre = Genre.Substring(0, Genre.Length - 1)
        'Festival Short or Feature
        Dim SF As String = chkShortFeature.SelectedValue
        'If SF = "" Then SF = 1
        'Festival Name or Country
        Dim T As String
        If txtSearch.Value.Trim <> "فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ..." Then
            T = txtSearch.Value.Trim.Replace(" ", "-")
        Else
            T = ""
        End If

        Response.Redirect("festivals/search/?" + _
                          "oc=" + oc.ToString + "&" + _
                          "level=" + level.ToString + "&" + _
                          "genre=" + Genre + "&" + _
                          "sf=" + SF + "&" + _
                          "t=" + T
                          )
    End Sub

    Protected Sub rb_OC_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles rb_OC.SelectedIndexChanged
        search()
    End Sub
    Protected Sub chk_genre_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles chk_genre.SelectedIndexChanged
        search()
    End Sub
    Protected Sub chkShortFeature_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles chkShortFeature.SelectedIndexChanged
        search()
    End Sub
    Protected Sub rb_level_TextChanged(sender As Object, e As System.EventArgs) Handles rb_level.TextChanged
        search()
    End Sub
    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
search()
    End Sub

    Protected Sub btnALL_Click(sender As Object, e As System.EventArgs) Handles btnALL.Click
        Response.Redirect("~/festivals/search/?oc=&level=&genre=&sf=&t=")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Title = "جشنواره ها و فستیوال های فیلم کوتاه و بلند"
    End Sub

    Public Function getLink(ByVal title As Object) As String
        Dim DL As New DLL
        Dim T As String = DL.GetClearString(title.ToString())
        If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
        If T.Length > 50 Then
            Return T.Substring(0, 50)
        Else
            Return T
        End If
    End Function

End Class
