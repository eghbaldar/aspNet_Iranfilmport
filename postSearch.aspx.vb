
Partial Class postSearch
    Inherits System.Web.UI.Page

    Public Function getLink(ByVal id As Object, ByVal title As Object) As String
        Dim DL As New DLL
        Dim T As String = DL.GetClearString(title.ToString())
        If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
        If T.Length > 50 Then
            Return String.Format("~/{0}/{1}", id.ToString, T.Substring(0, 50))
        Else
            Return String.Format("~/{0}/{1}", id.ToString, T)
        End If
    End Function

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        If txtSearch.Value.Trim <> "" And txtSearch.Value.ToString <> "جستجو در مطالب درگاه فیلم ایران ..." Then
            Response.Redirect("~/post/search/" + txtSearch.Value.ToString.Replace(" ", "-"))
        Else
            Response.Redirect("~/post/search/all")
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim DLL As New DLL
        If RouteData.Values("text").ToString.Trim = "all" Then
            gv_master.DataSource = DLL.PostALL

        ElseIf RouteData.Values("text").ToString.Trim <> "" And Not IsPostBack Then
            txtSearch.Value = RouteData.Values("text").ToString.Trim
            gv_master.DataSource = DLL.FestivalPost(RouteData.Values("text").ToString.Trim)
        End If
        gv_master.DataBind()
    End Sub

    Protected Sub gv_master_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gv_master.PageIndexChanging
        Dim DLL As New DLL
        gv_master.PageIndex = e.NewPageIndex
        gv_master.DataSource = DLL.FestivalPost(RouteData.Values("text").ToString.Trim)
        gv_master.DataBind()
    End Sub
End Class
