
Partial Class CMS_Pages_sendinfo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Title = "اطلاعات ارسال شده"
    End Sub

    Public Function getdate(e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
    End Function
End Class
