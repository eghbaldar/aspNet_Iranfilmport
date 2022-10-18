
Partial Class CMS_Pages_categoryArticle
    Inherits System.Web.UI.Page

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        Dim DL As New DLL_CMS
        DL.InsertCatArticle(txtInsert.Text.Trim)
        GV.DataBind()
    End Sub
End Class