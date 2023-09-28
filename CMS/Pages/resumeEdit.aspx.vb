
Partial Class CMS_Pages_resumeEdit
    Inherits System.Web.UI.Page

    Private Sub CMS_Pages_resumeEdit_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim DLL As New DLL_CMS
            txtAccolade_fa.Value = DLL.ShowResumeEach(Convert.ToInt64(Page.RouteData.Values("idCV")), True)
            txtAccolade_en.Value = DLL.ShowResumeEach(Convert.ToInt64(Page.RouteData.Values("idCV")), False)
        End If

    End Sub

    Private Sub btnUpdateAccolade_Click(sender As Object, e As EventArgs) Handles btnUpdateAccolade.Click
        'Dim ds As New DLL_CMS
        'ds.UpdateAccolade(txtAccolade_fa.Value, txtAccolade_en.Value, Convert.ToInt64(Page.RouteData.Values("idCV")))
        'ScriptManager.RegisterStartupScript(Me, GetType(String), "key", "window.close();", True)
    End Sub

End Class
