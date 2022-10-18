
Partial Class customers
    Inherits System.Web.UI.Page
    Public Function ShowTrailerAparat(T As String) As Boolean
        If T.Trim = Nothing Then
            Return False
        Else
            Return True
        End If

    End Function
End Class
