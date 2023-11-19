
Partial Class advertiseModalInterface
    Inherits System.Web.UI.Page
    Private Sub form1_Load(sender As Object, e As EventArgs) Handles form1.Load
        Try
            Dim ds As New DLL
            ds.IncreaseVisitAdvertModal(Val(Request.QueryString("id")))
        Catch ex As Exception

        End Try
        Response.Redirect(Request.QueryString("ref"))
    End Sub
End Class
