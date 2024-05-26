
Partial Class CMS_Pages_Default2
    Inherits System.Web.UI.Page

    Private Sub btnCanceled_Click(sender As Object, e As EventArgs) Handles btnCanceled.Click
        Dg_Canceled.DataSource = SDS_Canceled
        Dg_Canceled.DataBind()
    End Sub

    Private Sub btnDone_Click(sender As Object, e As EventArgs) Handles btnDone.Click
        Dg_Done.DataSource = SDS_Done
        Dg_Done.DataBind()
    End Sub

    Private Sub btnRequested_Click(sender As Object, e As EventArgs) Handles btnRequested.Click
        DG_Requested.DataSource = SDS_Requested
        DG_Requested.DataBind()
    End Sub

    Public Function GetAgree(agree As Object) As System.Drawing.Color
        Select Case Val(agree)
            Case 1
                Return System.Drawing.Color.Yellow
            Case 2
                Return System.Drawing.Color.Green
            Case 3
                Return System.Drawing.Color.LightGray
            Case 4
                Return System.Drawing.Color.Pink
        End Select
    End Function

    Public Sub UpdateAgree(sender As Object, e As CommandEventArgs)
        Dim DL_Panel As New DLL_Panel
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        DL_Panel.UpdateFestivalSuggestionAgree(s(0), s(1))
        dgPaid.DataBind()
        Dg_Canceled.DataBind()
        Dg_Done.DataBind()
        DG_Requested.DataBind()
    End Sub
End Class
