
Partial Class festivalEach
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
        'Search Format: oc=N&level=N&genre=N-N2&sf=N-N2&t=N
        '''''''''''''''''''
        'Festival Status
        Dim oc As String = rb_OC.SelectedValue.ToString
        'Festival level
        Dim level As String = rb_level.SelectedValue.ToString
        'Festival(Genre)        
        Dim Genre As String = ""
        For i As Byte = 0 To chk_genre.Items.Count - 1
            If chk_genre.Items(i).Selected Then
                Genre += chk_genre.Items(i).Value + ","
            End If
        Next
        If Genre.Trim.Length > 0 Then Genre = Genre.Substring(0, Genre.Length - 1)
        ''Festival Short or Feature
        Dim SF As String = chkShortFeature.SelectedValue.ToString
        ''Text
        Dim T As String
        If txtSearch.Value.Trim <> "فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ..." Then
            T = txtSearch.Value.Trim.Replace(" ", "-")
        ElseIf txtSearch.Value.Trim = "" Then
            T = ""
        Else
            T = ""
        End If

        Response.Redirect("~/festivals/search/?" + _
                          "oc=" + oc.ToString + "&" + _
                          "level=" + level.ToString + "&" + _
                          "genre=" + Genre + "&" + _
                          "sf=" + SF + "&" + _
                          "t=" + T.Trim
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

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim DLL As New DLL
        If Not IsPostBack Then
            If Request.QueryString("oc").Trim = "" And _
                 Request.QueryString("level").Trim = "" And _
                 Request.QueryString("genre").Trim = "" And _
                 Request.QueryString("sf").Trim = "" And _
                 Request.QueryString("t").Trim = "" Then
                dgSearch.DataSource = DLL.FestivalALL
            Else
                dgSearch.DataSource = DLL.FestivalSearch(Request.QueryString("oc").Trim, _
                                                   Request.QueryString("level").Trim, _
                                                   Request.QueryString("genre").Trim, _
                                                   Request.QueryString("sf").Trim, _
                                                   Request.QueryString("t").Trim)
            End If
            dgSearch.DataBind()
            LoadField()
        End If        
    End Sub

    Private Sub LoadField()
        'open or closed
        Select Case Request.QueryString("oc")
            Case "1"
                rb_OC.SelectedIndex = 0
            Case "-1"
                rb_OC.SelectedIndex = 1
            Case Else
                rb_OC.SelectedIndex = -1
        End Select
        ''level
        Select Case Request.QueryString("level")
            Case "1"
                rb_level.SelectedIndex = 0
            Case "2"
                rb_level.SelectedIndex = 1
            Case "3"
                rb_level.SelectedIndex = 2
            Case "4"
                rb_level.SelectedIndex = 3
            Case Else
                rb_level.SelectedIndex = -1
        End Select
        'Genre
        Dim PreGenre() As String = Request.QueryString("genre").Split(",")
        Dim Genre As String = ""
        For i As Byte = 0 To PreGenre.Length - 1
            For j As Byte = 0 To chk_genre.Items.Count - 1
                If chk_genre.Items(j).Value = PreGenre(i) Then
                    chk_genre.Items(j).Selected = True
                End If
            Next
        Next
        'Short or Feature
        Select Case Request.QueryString("sf")
            Case "1"
                chkShortFeature.SelectedIndex = 0
            Case "2"
                chkShortFeature.SelectedIndex = 1
            Case "3"
                chkShortFeature.SelectedIndex = 2
        End Select
        'Text
        If txtSearch.Value.Trim <> "" And Request.QueryString("t") <> "" Then
            txtSearch.Value = Request.QueryString("t").Replace("-", " ")
        End If
    End Sub

    Protected Sub btnALL_Click(sender As Object, e As System.EventArgs) Handles btnALL.Click
        Response.Redirect("~/festivals/search/?oc=&level=&genre=&sf=&t=")
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

    Protected Sub dgSearch_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles dgSearch.PageIndexChanging
        dgSearch.PageIndex = e.NewPageIndex
        Dim DLL As New DLL
        dgSearch.DataSource = DLL.FestivalSearch(Request.QueryString("oc").Trim, _
                                                  Request.QueryString("level").Trim, _
                                                  Request.QueryString("genre").Trim, _
                                                  Request.QueryString("sf").Trim, _
                                                  Request.QueryString("t").Trim)
        dgSearch.DataBind()
    End Sub
End Class
