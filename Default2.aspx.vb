
Partial Class Default2
    Inherits System.Web.UI.Page
    Public Function EnFa(input As String) As Boolean
        Dim Result As Boolean
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Result = True
            Else
                Result = False
            End If
        Else
            Result = False
        End If
        Select Case input
            Case "FA"
                Return Not Result
            Case "EN"
                Return Result
        End Select
    End Function
End Class
