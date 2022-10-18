Imports System.Net
Imports System.Web.Services

Partial Class contact
    Inherits System.Web.UI.Page

    Protected Shared ReCaptcha_Key As String = "6LeOmVEUAAAAAEYz3v3pPuyNGbfdwaVRYH9nW_7t"
    Protected Shared ReCaptcha_Secret As String = "6LeOmVEUAAAAACxd0KOXpgTd2kBo8vcMt3fTLmlb"

    <WebMethod()> _
    Public Shared Function VerifyCaptcha(ByVal response As String) As String
        Dim url As String = "https://www.google.com/recaptcha/api/siteverify?secret=" & ReCaptcha_Secret & "&response=" & response
        Return (New WebClient()).DownloadString(url)
    End Function


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Try
            Dim DL As New DLL
            If DL.InsertContact(Server.HtmlEncode(txtName.Text.Trim), Server.HtmlEncode(txtPhone.Text.Trim), Val(cmd_category.SelectedValue), Server.HtmlEncode(txtText.Text.Trim), Server.HtmlEncode(txtSubject.Text.Trim), Server.HtmlEncode(txtEmail.Text.Trim)) <> 0 Then
                div_form.Visible = False
                div_success.Visible = True
            End If
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "تماس با درگاه فیلم ایران"
        Try
            If Request.QueryString("modal") = "true" Then ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Modal", "window.onload = function() { loadModalDistribution(); };", True)
        Catch ex As Exception

        End Try
    End Sub

End Class

