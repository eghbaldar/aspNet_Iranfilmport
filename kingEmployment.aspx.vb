
Imports System.Net
Imports System.Web.Services

Partial Class kingEmployment
	Inherits System.Web.UI.Page

	Protected Shared ReCaptcha_Key As String = "6LeOmVEUAAAAAEYz3v3pPuyNGbfdwaVRYH9nW_7t"
	Protected Shared ReCaptcha_Secret As String = "6LeOmVEUAAAAACxd0KOXpgTd2kBo8vcMt3fTLmlb"

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
			If Request.QueryString("lang").Trim.ToLower = "en" Then
				Title = "IRAN FLLM PORT Employment"
				Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
				lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Employment" + "</span>"
			Else
				Page.MetaDescription = "استخدام - همکاری - شغل در سینما - درصدی - همکاری - فرصت شغلی"
				Title = "موقعیت شغلی در درگاه فیلم ایران"
				lblTopTitle.Text = "<span style='font-family:Titr;'>" + "موقعیت شغلی در درگاه فیلم ایران" + "</span>"
			End If
		Else
			lblTopTitle.Text = "<span style='font-family:Titr;'>" + "موقعیت شغلی در درگاه فیلم ایران" + "</span>"
			Page.MetaDescription = "استخدام - همکاری - شغل در سینما - درصدی - همکاری - فرصت شغلی"
			Title = "موقعیت شغلی در درگاه فیلم ایران"
		End If
		''''''''''''' کامنت
		KingComments.Section = 9
		KingComments.IDPOST = -1
	End Sub


	<WebMethod()>
	Public Shared Function VerifyCaptcha(ByVal response As String) As String
		Dim url As String = "https://www.google.com/recaptcha/api/siteverify?secret=" & ReCaptcha_Secret & "&response=" & response
		Return (New WebClient()).DownloadString(url)
	End Function
	Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
		Try
			If cmd_category.SelectedIndex = -1 Or cmd_category.SelectedIndex = 0 Then
				ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myJsFn", "showAlert('خطا','نوع همکاری را مشخص کنید');", True)
				Exit Sub
			End If
			Dim DL As New DLL
			If DL.InsertEmployment(Server.HtmlEncode(txtName.Text.Trim), Server.HtmlEncode(txtPhone.Text.Trim), Val(cmd_category.SelectedValue), Server.HtmlEncode(txtResume.Text.Trim), Server.HtmlEncode(txtEmail.Text.Trim)) <> 0 Then
				ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myJsFn", "showAlert('انجام شده','از درخواست همکاریتان متچکریم. در صورت نیاز با شما تماس گرفته خواهد شد.');", True)
				div_form.Visible = False
			End If
		Catch ex As Exception
		End Try
	End Sub

End Class
