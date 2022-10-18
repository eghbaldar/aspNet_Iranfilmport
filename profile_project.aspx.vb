
Partial Class profile_project
    Inherits System.Web.UI.Page

    Dim DLL_Profile As New DLL_Profile

    Public Function getdate(e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.ShortDate)
    End Function

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        Try
            Title = IIf(DLL_Profile.GetTypeProject(Page.RouteData.Values("IdProject").ToString) = "1", "فیلم", "،فیلمنامه") & " - " & _
                Page.RouteData.Values("nameProject").ToString & " - " & _
            DLL_Profile.GetNameByUsername(Page.RouteData.Values("username")).Replace("ي", "ی") & _
            " - درگاه فیلم ایران"
        Catch ex As Exception

        End Try
    End Sub

End Class
