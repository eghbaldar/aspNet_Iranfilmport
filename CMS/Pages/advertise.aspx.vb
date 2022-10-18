
Partial Class CMS_Pages_advertise
    Inherits System.Web.UI.Page

    Private Sub btn_Click(sender As Object, e As EventArgs) Handles btn.Click
        Dim ds As New DLL_CMS
        ds.UpdateAdvertise(txtAdvertise.Value)
    End Sub

    Private Sub CMS_Pages_advertise_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim ds As New DLL_CMS
        If Not IsPostBack Then
            txtAdvertise.Value = ds.ShowAdvertise()
        End If
    End Sub
End Class
