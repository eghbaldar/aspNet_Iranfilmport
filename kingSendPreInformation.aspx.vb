
Imports System.Net
Imports System.Web.Services

Partial Class kingSendPreInformation
    Inherits System.Web.UI.Page

    Protected Shared ReCaptcha_Key As String = "6LeOmVEUAAAAAEYz3v3pPuyNGbfdwaVRYH9nW_7t"
    Protected Shared ReCaptcha_Secret As String = "6LeOmVEUAAAAACxd0KOXpgTd2kBo8vcMt3fTLmlb"

    <WebMethod()>
    Public Shared Function VerifyCaptcha(ByVal response As String) As String
        Dim url As String = "https://www.google.com/recaptcha/api/siteverify?secret=" & ReCaptcha_Secret & "&response=" & response
        Return (New WebClient()).DownloadString(url)
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Send Pre-Information"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Title = "ارسال فیلم و فیلمنامه به درگاه فیلم ایران"
                Page.MetaDescription = "ارسال لینک فیلم - ارسال فیلمنامه - ارسال بسته ی پستی فیلم - ارسال فیلم - پخش فیلم"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال فیلم و فیلمنامه به درگاه فیلم ایران" + "</span>"
            End If
        Else
            Title = "ارسال فیلم و فیلمنامه به درگاه فیلم ایران"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال فیلم و فیلمنامه به درگاه فیلم ایران" + "</span>"
            Page.MetaDescription = "ارسال لینک فیلم - ارسال فیلمنامه - ارسال بسته ی پستی فیلم - ارسال فیلم - پخش فیلم"
        End If
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

    Private Sub cmdHow_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmdHow.SelectedIndexChanged
        If (cmdHow.SelectedIndex = 1) Then
            DivLink.Visible = True
            RequiredFieldValidator4.ValidationGroup = 1
            RegularExpressionValidator1.ValidationGroup = 1
        Else
            DivLink.Visible = False
            RequiredFieldValidator4.ValidationGroup = 0
            RegularExpressionValidator1.ValidationGroup = 0
        End If
    End Sub
End Class
