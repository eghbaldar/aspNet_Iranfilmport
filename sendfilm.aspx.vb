Imports System.Net
Imports System.Web.Services
Partial Class sendfilm
    Inherits System.Web.UI.Page
    Protected Shared ReCaptcha_Key As String = "6LeOmVEUAAAAAEYz3v3pPuyNGbfdwaVRYH9nW_7t"
    Protected Shared ReCaptcha_Secret As String = "6LeOmVEUAAAAACxd0KOXpgTd2kBo8vcMt3fTLmlb"

    <WebMethod()> _
    Public Shared Function VerifyCaptcha(ByVal response As String) As String
        Dim url As String = "https://www.google.com/recaptcha/api/siteverify?secret=" & ReCaptcha_Secret & "&response=" & response
        Return (New WebClient()).DownloadString(url)
    End Function
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Page.MetaDescription = "ارسال لینک فیلم - ارسال فیلمنامه - ارسال بسته ی پستی فیلم - ارسال فیلم - پخش فیلم"
        Title = "ارسال فیلم و فیلمنامه به درگاه فیلم ایران"
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As System.EventArgs) Handles btnSubmit.Click
        Try
            Dim DL As New DLL
            If DL.InsertSendInformation(txtName.Text.Trim, txtNum.Text.Trim, cmdHow.Text, txtLink.Text.Trim & "--------Password=" & txtPassword.Text.Trim) <> 0 Then
                div_form.Visible = False
                Div_success.Visible = True
                ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", "alert('اطلاعات شما ثبت شد.');", True)
            End If

        Catch ex As Exception
        End Try
    End Sub

End Class
