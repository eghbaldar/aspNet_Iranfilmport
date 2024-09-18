
Partial Class _Default
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
    Public Function getLinkFest(ByVal title As Object) As String

        Dim DL As New DLL
        Dim T As String = DL.GetClearString(title.ToString())

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1) & "?lang=en"
                If T.Length > 50 Then
                    Return T.Substring(0, 50) & "?lang=en"
                Else
                    Return T & "?lang=en"
                End If
            Else
                If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
                If T.Length > 50 Then
                    Return T.Substring(0, 50)
                Else
                    Return T
                End If
            End If
        Else
            If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
            If T.Length > 50 Then
                Return T.Substring(0, 50)
            Else
                Return T
            End If
        End If

    End Function
End Class
