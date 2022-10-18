
Partial Class CMS_Pages_ProfileProject
    Inherits System.Web.UI.Page
    Public Function getStatus(ByVal e As Object) As String
        Select Case e.ToString
            Case False
                Return "تائید نشده"
            Case True
                Return "تائید شده"
        End Select
    End Function
    '
    Public Function getTrust(ByVal e As Object) As String
        Select Case e.ToString
            Case False
                Return "تائید نشده"
            Case True
                Return "تائید شده"
        End Select
    End Function
    Public Function getBackStatus(ByVal e As Object) As Drawing.Color
        Select Case e.ToString
            Case False
                Return Drawing.Color.Red
            Case True
                Return Drawing.Color.Green
        End Select

    End Function
    Public Function getfullname(ByVal e As Object) As String
        Dim dl As New DLL_Dashboard
        Return dl.GetNameWithEmail(e.ToString)
    End Function

    Public Sub deleteProject(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim dl As New DLL_Dashboard
        dl.DeleteProject(Val(e.CommandArgument))
        GV.DataBind()
    End Sub
End Class
