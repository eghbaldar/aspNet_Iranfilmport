
Partial Class kingfestivalSearch
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT - Film Festival Search"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Agents" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(False)
                Catch ex As Exception
                End Try
            Else
                Title = "جستجو فستیوال بین‌المللی فیلم"
                Page.MetaDescription = "جستجو فستیوال بین‌المللی فیلم کوتاه و بلند داستانی و مستند و انیمیشن و تجربی"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" +  "جستجو فستیوال بین‌المللی فیلم" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
                Catch ex As Exception
                End Try
            End If
        Else
            Title = "جستجو فستیوال بین‌المللی فیلم"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "جستجو فستیوال بین‌المللی فیلم" + "</span>"
            Page.MetaDescription = "جستجو فستیوال بین‌المللی فیلم کوتاه و بلند داستانی و مستند و انیمیشن و تجربی"
        End If
        Dim DLL As New DLL
        If Not IsPostBack Then
            If Request.QueryString("oc").Trim = "" And
                 Request.QueryString("level").Trim = "" And
                 Request.QueryString("genre").Trim = "" And
                 Request.QueryString("sf").Trim = "" And
                 Request.QueryString("t").Trim = "" Then
                dgSearch.DataSource = DLL.FestivalALL
            Else
                dgSearch.DataSource = DLL.FestivalSearch(Request.QueryString("oc").Trim,
                                                   Request.QueryString("level").Trim,
                                                   Request.QueryString("genre").Trim,
                                                   Request.QueryString("sf").Trim,
                                                   Request.QueryString("t").Trim)
            End If
            dgSearch.DataBind()
            txtSearch.Value = Request.QueryString("t")
        End If
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Response.Redirect("~/festivals/search/?oc=&level=&genre=&sf=&t=" & txtSearch.Value)
    End Sub

    Public Function getDeadlineStatus(sign As Object, remaindays As Object) As String
        Select Case Val(sign)
            Case 1
				Return "<span style='color:green;font-weight:bold'>" + remaindays.ToString + " روز مانده</span>"
			Case 0
				Return "<span style='color:gray;font-style:italic'>" + "بدون تاریخ" + "</span>"
			Case -1
				Return "<span style='color:red;font-style:italic'>" + "بسته شده" + "</span>"
		End Select
    End Function

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
