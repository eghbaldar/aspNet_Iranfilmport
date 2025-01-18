Imports System.Data.SqlClient
Imports System.Data
Imports System.Net
Imports System.Web.Services

Partial Class panel
	Inherits System.Web.UI.Page

	Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DesktopConnectionString").ConnectionString)
	Dim Dll As New DLL_Panel
	Dim sms As New SMS

	Protected Sub btnLogin_Click(sender As Object, e As System.EventArgs) Handles btnLogin.Click

		Dim IDUSER As Long = Dll.GetValid(txtUser.Text.Trim, txtPass.Text.Trim)
		If IDUSER > 0 Then
			Dll.UpdateVisitCounter(IDUSER)
			FormsAuthentication.SetAuthCookie(IDUSER, True)
			Session.Add("username-temp", txtUser.Text.Trim)
			Response.Redirect("~/panel/client/" & IDUSER)
		End If

	End Sub

	Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

		Try
			If Request.QueryString("user") <> Nothing And Request.QueryString("pass") <> "" Then
				txtUser.Text = Request.QueryString("user")
				txtPass.TextMode = TextBoxMode.SingleLine
				txtPass.Text = Request.QueryString("pass")
			End If
		Catch ex As Exception

		End Try
		lblPanelVersion.Text = "Version: " & PanelVersion.Version
		Try
			If Session("PanelClient").ToString <> "" Then Response.Redirect("~/panel/client/" & Session("PanelClient").ToString)
		Catch ex As Exception
			Session.Remove("PanelClient")
		End Try

		If Not Dll.Version.Trim = Nothing Then
			lblVersion.Text = Dll.Version.Replace("ي", "ی")
			If Not IsPostBack Then ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Modal", "window.onload = function() { loadMODAL(); };", True)
		End If

		If Not IsPostBack Then
			txtPhone3.Attributes.Add("onkeyup", "txtInputChanged(this,'txtPhone4');")
			txtPhone4.Attributes.Add("onkeyup", "txtInputChanged(this,'txtPhone5');")
			txtPhone5.Attributes.Add("onkeyup", "txtInputChanged(this,'txtPhone6');")
			txtPhone6.Attributes.Add("onkeyup", "txtInputChanged(this,'txtPhone7');")
			txtPhone7.Attributes.Add("onkeyup", "txtInputChanged(this,'txtPhone8');")
			txtPhone8.Attributes.Add("onkeyup", "txtInputChanged(this,'txtPhone9');")
			txtPhone9.Attributes.Add("onkeyup", "txtInputChanged(this,'txtPhone10');")
			txtPhone10.Attributes.Add("onkeyup", "txtInputChanged(this,'txtPhone11');")
		End If

	End Sub

	Private Sub btnChangeToPhone_Click(sender As Object, e As EventArgs) Handles btnChangeToPhone.Click
		MultiView.ActiveViewIndex = 1
	End Sub

	Private Sub btnBackToLogin_Click(sender As Object, e As EventArgs) Handles btnBackToLogin.Click
		MultiView.ActiveViewIndex = 0
	End Sub

	Private Sub btnSendInfoBySms_Click(sender As Object, e As EventArgs) Handles btnSendInfoBySms.Click
		Dim cellnumber = "09" +
				txtPhone3.Text +
				txtPhone4.Text +
				txtPhone5.Text +
				txtPhone6.Text +
				txtPhone7.Text +
				txtPhone8.Text +
				txtPhone9.Text +
				txtPhone10.Text +
				txtPhone11.Text
		If (cellnumber.Length = 11) Then SendSMS("n1zd8kx1v8z3ho9", cellnumber)
	End Sub
	Shared i As Byte = 0
	Private Sub SendSMS(PaternId As String, cellnumber As String)

		Dim dt As DataTable = Dll.GetClientUserPassByPhone(cellnumber)
		If (dt.Rows.Count > 0) Then
			sms.SendSms(Val(cellnumber), PaternId, "username",
						dt(0)("username").ToString(), "password", dt(0)("password").ToString())
			ScriptManager.RegisterStartupScript(Me, GetType(String), "key", "success('نام کاربری و کلمه عبور با موفقیت ارسال شد')", True)
			MultiView.ActiveViewIndex = 0
			txtPhone3.Text = ""
			txtPhone4.Text = ""
			txtPhone5.Text = ""
			txtPhone6.Text = ""
			txtPhone7.Text = ""
			txtPhone8.Text = ""
			txtPhone9.Text = ""
			txtPhone10.Text = ""
			txtPhone11.Text = ""
		Else
			ScriptManager.RegisterStartupScript(Me, GetType(String), "key", "error('شماره شما در سامانه ثبت نمی باشد')", True)
		End If
	End Sub

End Class
