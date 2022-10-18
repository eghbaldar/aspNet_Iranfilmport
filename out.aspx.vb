
Partial Class out
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim DLL_Dash As New DLL_Dashboard
        If (Not Request.Cookies("IFP") Is Nothing) Then
            Dim myCookie As HttpCookie
            myCookie = New HttpCookie("IFP")
            myCookie("email") = ""
            DLL_Dash._Email_ = String.Empty
            myCookie.Expires = DateTime.Now.AddDays(-1D)
            Response.Cookies.Add(myCookie)
            Response.Redirect("~\")
        End If
    End Sub
End Class
