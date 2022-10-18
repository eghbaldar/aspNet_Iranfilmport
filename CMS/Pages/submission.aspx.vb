
Partial Class CMS_Pages_submission
    Inherits System.Web.UI.Page

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        If txtfestival.Text.Trim <> "" And txtDetail.Text.Trim <> "" Then
            Dim dl As New DLL_CMS
            dl.InsertSubmission(Val(Request.QueryString("projectid")), txtfestival.Text, Val(txtfestivalID.Text), txtDetail.Text)
            GV.DataBind()
            Panel_Insert.Visible = False
            Panel_update.Visible = True
        Else
            lblwarning.Text = "فیلدهای نام فستیوال و توضیحات اجباری است"
        End If
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim dl As New DLL_CMS
        dl.UpdateSubmission(Val(Request.QueryString("projectid")), Val(cmdSendUpdate.SelectedValue), Val(cmdAccoladesUpdate.SelectedValue), txtDetailUpdate.Text.Trim)
        GV.DataBind()
        loading()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        loading()
    End Sub
    Private Sub loading()
        Dim dl As New DLL_CMS
        If Not IsPostBack Then
            If dl.ShowEachSubmission(Val(Request.QueryString("projectid"))).Tables(0).Rows.Count > 0 Then
                Panel_Insert.Visible = False
                '----------------------------
                txtDetailUpdate.Text = dl.ShowEachSubmission(Val(Request.QueryString("projectid"))).Tables(0).Rows(0)("detail").ToString
            Else
                Panel_update.Visible = False
            End If
        End If
    End Sub

    Public Sub delete(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim dl As New DLL_CMS
        dl.DeleteSubmission(Val(e.CommandArgument.ToString))
        GV.DataBind()
        Panel_Insert.Visible = True
        Panel_update.Visible = False
    End Sub

End Class

