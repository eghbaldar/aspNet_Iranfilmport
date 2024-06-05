
Partial Class CMS_Pages_sendinfo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Title = "اطلاعات ارسال شده"
    End Sub

    Public Function getdate(e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
    End Function

    Public Sub SetSeen(sender As Object, e As CommandEventArgs)
        Dim DL_CMS As New DLL_CMS
        DL_CMS.UpdateSeenSendInfo(Val(e.CommandArgument.ToString))
        GridView1.DataBind()
    End Sub
End Class
