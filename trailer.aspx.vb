
Partial Class trailer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Try
            frTrailer.Attributes("src") = "https://www.aparat.com/video/video/embed/videohash/" & Request.QueryString("code") & "/vt/frame"
        Catch ex As Exception
        End Try
    End Sub
End Class
