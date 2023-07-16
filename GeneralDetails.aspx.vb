
Partial Class GeneralDetails
    Inherits System.Web.UI.Page

    Private Sub form1_Load(sender As Object, e As EventArgs) Handles form1.Load
        Select Case RouteData.Values("type")
            Case 1
                MultiView1.ActiveViewIndex = 0
            Case 2
                MultiView1.ActiveViewIndex = 1
        End Select
    End Sub

End Class
