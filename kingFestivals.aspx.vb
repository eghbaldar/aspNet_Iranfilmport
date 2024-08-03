
Partial Class kingFestivals
    Inherits System.Web.UI.Page
    Public Function getDeadlineStatus(sign As Object, remaindays As Object) As String
        Select Case Val(sign)
            Case 1
                Return "<span style='color:green;font-weight:bold'>" + "مهلت: " + remaindays.ToString + " روز</span>"
            Case 0
                Return "<span style='color:gray;font-style:italic'>" + "ددلاینی وارد نشده است" + "</span>"
            Case -1
                Return "<span style='color:red;font-style:italic'>" + "فستیوال بسته شده است." + "</span>"
        End Select
    End Function

    'Sub search()
    '    '''''''''''''''''''
    '    'Search Format: oc=N&level=N&genre=N+N2&sf=N+N2&t=N
    '    '''''''''''''''''''
    '    'Festival Status
    '    Dim oc As String = rb_OC.SelectedValue.ToString
    '    'Festival level
    '    Dim level As String = rb_level.SelectedValue.ToString
    '    'Festival(Genre)
    '    Dim Genre As String = ""
    '    For i As Byte = 0 To chk_genre.Items.Count - 1
    '        If chk_genre.Items(i).Selected Then
    '            Genre += chk_genre.Items(i).Value.ToString + ","
    '        End If
    '    Next
    '    If Genre.Trim.Length > 0 Then Genre = Genre.Substring(0, Genre.Length - 1)
    '    'Festival Short or Feature
    '    Dim SF As String = chkShortFeature.SelectedValue
    '    'If SF = "" Then SF = 1
    '    'Festival Name or Country
    '    Dim T As String
    '    If txtSearch.Value.Trim <> "فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ..." Then
    '        T = txtSearch.Value.Trim.Replace(" ", "-")
    '    Else
    '        T = ""
    '    End If

    '    Response.Redirect("festivals/search/?" +
    '                      "oc=" + oc.ToString + "&" +
    '                      "level=" + level.ToString + "&" +
    '                      "genre=" + Genre + "&" +
    '                      "sf=" + SF + "&" +
    '                      "t=" + T
    '                      )
    'End Sub

    'Protected Sub rb_OC_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles rb_OC.SelectedIndexChanged
    '    search()
    'End Sub
    'Protected Sub chk_genre_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles chk_genre.SelectedIndexChanged
    '    search()
    'End Sub
    'Protected Sub chkShortFeature_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles chkShortFeature.SelectedIndexChanged
    '    search()
    'End Sub
    'Protected Sub rb_level_TextChanged(sender As Object, e As System.EventArgs) Handles rb_level.TextChanged
    '    search()
    'End Sub
    'Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
    '    search()
    'End Sub

    'Protected Sub btnALL_Click(sender As Object, e As System.EventArgs) Handles btnALL.Click
    '    Response.Redirect("~/festivals/search/?oc=&level=&genre=&sf=&t=")
    'End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT International Film Festivals"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Page.MetaDescription = "فستیوال های فیلم کوتاه - فستیوال های فیلم بلند - ارسال فیلم به جشنواره ها"
                Title = "جشنواره ها و فستیوال های فیلم کوتاه و بلند"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "جشنواره ها و فستیوال های فیلم کوتاه و بلند" + "</span>"
            End If
        Else
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "جشنواره ها و فستیوال های فیلم کوتاه و بلند" + "</span>"
            Page.MetaDescription = "فستیوال های فیلم کوتاه - فستیوال های فیلم بلند - ارسال فیلم به جشنواره ها"
            Title = "جشنواره ها و فستیوال های فیلم کوتاه و بلند"
        End If
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
