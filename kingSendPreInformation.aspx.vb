
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
			If Not IsValidIranianCellphoneNumber(txtNum.Text) Or Not txtNum.Text.StartsWith("09") Then
				ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", "showAlert('خطا','شماره همراه نادرست است.');", True)
				Exit Sub
			End If
			Dim DL As New DLL
			If DL.InsertSendInformation(txtName.Text.Trim, txtNum.Text.Trim, cmdHow.Text, txtLink.Text.Trim & "--------Password=" & txtPassword.Text.Trim) <> 0 Then
				div_form.Visible = False
				Div_success.Visible = True
				ScriptManager.RegisterClientScriptBlock(Me.Page, Me.Page.GetType(), "alert", "showAlert('ثبت اطلاعات','اطلاعات اثر شما با موفقیت ارسال گردید، در اسرع وقت، کارشناسان پخش درگاه فیلم ایران با شما تماس خواهند گرفت.');", True)
				Dim sms As New SMS
				sms.SendSms(txtNum.Text, "zqi028lf2avoqmx", "name", txtName.Text)
			End If

		Catch ex As Exception
		End Try
	End Sub

	Function IsValidIranianCellphoneNumber(phoneNumber As String) As Boolean
		' Regular expression for Iranian cellphone number formats
		Dim pattern As String = "((0?9)|(\+?989))((14)|(13)|(12)|(19)|(18)|(17)|(15)|(16)|(11)|(10)|(90)|(91)|(92)|(93)|(94)|(95)|(96)|(32)|(30)|(33)|(35)|(36)|(37)|(38)|(39)|(00)|(01)|(02)|(03)|(04)|(05)|(41)|(20)|(21)|(22)|(23)|(31)|(34)|(9910)|(9911)|(9913)|(9914)|(9999)|(999)|(990)|(9810)|(9811)|(9812)|(9813)|(9814)|(9815)|(9816)|(9817)|(998))\W?\d{3}\W?\d{4}"
		Dim regex As New Regex(pattern)
		Return regex.IsMatch(phoneNumber)
	End Function

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
