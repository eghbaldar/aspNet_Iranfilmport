
Partial Class CMS_Pages_profiles
    Inherits System.Web.UI.Page
    Public Function getphoto(ByVal e As Object) As String
        If e.ToString() = "" Then
            Return "~\dashboard/assets/img/NonUser.png"
        Else
            Return "~\files\uploadFiles\PhotoHeaderUsers\" + e.ToString()
        End If
    End Function
    Public Function getPass(ByVal e As Object) As String
        Dim d As New Encryptor
        Return d.DecryptText(e.ToString, "IfP_COM")
    End Function

    Public Function getDate(ByVal e As Object) As String
        If e.ToString <> "" Then
            Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
        End If
    End Function

    Public Function getStatus(ByVal e As Object) As String
        Select Case e.ToString
            Case "0"
                Return "تائید نشده"
            Case "1"
                Return "تائید شده"
            Case "2"
                Return "محروم شده"
            Case "3"
                Return "<span style='color:black'>" + "نماد" + "</span>"
        End Select
    End Function
    Public Function getBackStatus(ByVal e As Object) As Drawing.Color
        Select Case e.ToString
            Case "0"
                Return Drawing.Color.Red
            Case "1"
                Return Drawing.Color.Green
            Case "2"
                Return Drawing.Color.Gray
            Case "3"
                Return Drawing.Color.Yellow
        End Select
    End Function
    '
    Public Sub delete(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim dl As New DLL_CMS
        dl.DeleteProfile(e.CommandArgument.ToString)
        GV_All.DataBind()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        HiddenFieldSearchUsers.Value = txtSearchUsers.Text.Trim
        DgSearch.DataBind()
    End Sub

    Protected Sub btnProfileCreator_Click(sender As Object, e As System.EventArgs) Handles btnProfileCreator.Click
        Response.Redirect("profileCreator.aspx")
    End Sub

    Public Sub SendInformationOfLogin(sender As Object, e As CommandEventArgs)
        Dim ee As String() = e.CommandArgument.ToString.Split("|")
        ' ee(0) = email
        ' ee(1) = mobile
        ' ee(2) = user
        ' ee(3) = pass
        Dim msg As String = ""
        msg += "%0a%0a"
        msg += "لینک پنل دسترسی:"
        msg += "%0a"
        msg += "http://iranfilmport.com/me/"
        msg += "%0a"
        msg += "نام کاربری:"
        msg += "%0a"
        msg += ee(0)
        msg += "%0a"
        msg += "کلمه عبور:"
        msg += "%0a"
        msg += ee(3)
        msg += "%0a%0a%0a"
        msg += "لینک صفحه اختصاصی شما که میتوانید آن را به اشتراک بگذارید:"
        msg += "%0a"
        msg += "www.iranfilmport.com/filmmaker/" & ee(2)
        Response.Redirect("https://wa.me/" & "98" & ee(1) & "/?text=" & msg)
    End Sub

    Public Sub Login(sender As Object, e As CommandEventArgs)
        Dim DLL_Dash As New DLL_Dashboard
        '''''''''''''' create cookie
        Dim myCookie As HttpCookie = New HttpCookie("IFP")
        myCookie("email") = Server.HtmlEncode(e.CommandArgument.ToString)
        myCookie.Expires = Now.AddYears(1)
        Response.Cookies.Add(myCookie)
        ''''''''''''''
        DLL_Dash._Email_ = e.CommandArgument.ToString
        ''''''''''''''
        Response.Redirect("~\dashboard\")
    End Sub

End Class
