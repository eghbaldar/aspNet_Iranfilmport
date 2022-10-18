
Partial Class dashboard_messages
    Inherits System.Web.UI.Page

    Dim DLLd As New DLL_Dashboard

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        DLLd._Email_ = Request.Cookies("IFP").Item("email")
        If Not IsPostBack Then HiddenEmail.Value = DLLd._Email_
        Title = "داشبورد" + " | " + "پیام های سیستمی"
    End Sub

    Public Function getDate(ByVal e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.ShortDate)
    End Function

    Public Function getFlag(ByVal e As Object) As String
        Select Case Convert.ToBoolean(e)
            Case True
                Return "بررسی شده"
            Case False
                Return "بررسی نشده"
        End Select
    End Function

    Public Function getimgmsg(ByVal e As Object) As String
        Select Case Convert.ToBoolean(e)
            Case True
                Return "assets/img/openmsg.png"
            Case False
                Return "assets/img/closemsg.png"
        End Select
    End Function

End Class
