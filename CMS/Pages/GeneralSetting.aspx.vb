
Partial Class CMS_Pages_Default2
    Inherits System.Web.UI.Page

    Dim Dll As New DLL_Panel

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then txtVersion.Text = Dll.Version
    End Sub

    Protected Sub btnUpdateVersion_Click(sender As Object, e As System.EventArgs) Handles btnUpdateVersion.Click
        'Dll.Update_version("<div id=""myModal"" class=""modal""><div class=""modal-content""><span class=""close"">&times;</span>" & vbCrLf & vbCrLf & txtVersion.Text.Trim & vbCrLf & vbCrLf & "</div></div>")
        Dll.Update_version(txtVersion.Text)
        txtVersion.Text = Dll.Version
    End Sub

End Class
