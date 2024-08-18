
Partial Class CMS_Pages_features
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim ds As New DLL_CMS
            txt.Value = ds.ShowFeatures()
        End If
    End Sub

    Protected Sub btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn.Click
        Dim ds As New DLL_CMS
        ds.UpdateFeatures(txt.Value)
    End Sub
End Class
