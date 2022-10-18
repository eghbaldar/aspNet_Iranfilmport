
Partial Class Default2
    Inherits System.Web.UI.Page

    Dim DLL_dash As New DLL_Dashboard
    Dim username As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        username = Page.RouteData.Values("username")

        Dim DLL_Profile As New DLL_Profile
        HiddenFieldEmail.Value = DLL_Profile.GetEmailByUsername(Page.RouteData.Values("username"))

        With DLL_dash.ShowInformation(DLL_Profile.GetEmailByUsername(username)).Tables(0)
         
            If Not String.IsNullOrWhiteSpace(.Rows(0)("Bio").ToString.Trim) Then
                lblBioFa.Text = .Rows(0)("Bio").ToString()
            Else
                lblBioFa.Text = "بیوگرافی وارد نشده است."
            End If

            If Not String.IsNullOrWhiteSpace(.Rows(0)("EngBio").ToString.Trim) Then
                lblBioEn.Text = .Rows(0)("EngBio").ToString()
            Else
                lblBioEn.Text = "There is no any biography for this profile."
            End If

        End With

    End Sub

    Public Function getType_(ByVal e As Object) As String
        Select Case e.ToString
            Case 1
                Return "کارگردان"
            Case 2
                Return "تهیه کننده"
            Case 3
                Return "پخش کننده"
            Case 4
                Return "نماینده فیلم"
            Case 5
                Return "شرکت مجری طرح"
        End Select
    End Function
    '
    Public Function getField(ByVal e As Object) As String
        If e.ToString.Trim <> "" Then
            Return e.ToString
        Else
            Return "وارد نشده"
        End If    
    End Function
    Public Function getDegree(ByVal e As Object) As String
        Select Case e.ToString
            Case 0
                Return "زیر دیپلم"
            Case 1
                Return "دیپلم"
            Case 2
                Return "فوق دیپلم"
            Case 3
                Return "لیسانس"
            Case 4
                Return "فوق لیسانس"
            Case 5
                Return "دکتری"
        End Select
    End Function

    Public Function GetProjectLink(e As Object) As String
        Dim s() As String = e.ToString.Split("|")
        username = "filmmaker/" & Page.RouteData.Values("username") & "/" & s(0) & "/" & s(1).Replace(" ", "-")
        Return username
    End Function

End Class
