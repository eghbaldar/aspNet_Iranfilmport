
Partial Class CMS_Pages_participationplan
    Inherits System.Web.UI.Page
    Private Sub btn_Click(sender As Object, e As EventArgs) Handles btn.Click
        Dim ds As New DLL_CMS
        ds.UpdateParticipationPlan(txtParticipationPlan.Value)
    End Sub

    Private Sub CMS_Pages_advertise_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim ds As New DLL_CMS
        If Not IsPostBack Then
            txtParticipationPlan.Value = ds.ShowParticipationPlan()
        End If
    End Sub
End Class
