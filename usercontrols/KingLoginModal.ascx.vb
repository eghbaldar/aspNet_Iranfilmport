
Partial Class usercontrols_KingLoginModal
    Inherits System.Web.UI.UserControl
    Shared DF As Date
    Dim DLL_Dash As New DLL_Dashboard
    Shared R As String
    Dim Email As New Email

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click
        P_Login.Visible = False
		P_Register.Visible = True
		lblTitle.Text = "ثبت نام"
	End Sub
    Protected Sub btnBackToLoginPanel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBackToLoginPanel.Click
        P_Login.Visible = True
		P_Register.Visible = False
		lblTitle.Text = "پنل‌های ورودی"
	End Sub
    Protected Sub LinkForgotPassword_Click(sender As Object, e As System.EventArgs) Handles LinkForgotPassword.Click
        P_password.Visible = True
        P_Login.Visible = False
		P_Register.Visible = False
		lblTitle.Text = "فراموشی کلمه عبور"
	End Sub
    Protected Sub btnBacktoLogin2_Click(sender As Object, e As System.EventArgs) Handles btnBacktoLogin2.Click
        P_password.Visible = False
		P_Login.Visible = True
		lblTitle.Text = "پنل‌های ورودی"
	End Sub
    Protected Sub btnSendMail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendMail.Click
        Dim DLL As New DLL_Dashboard
        If txtEmailReg.Text.Trim <> "" Then 'آیا فیلد پر شده است؟
            If DLL.CheckDuplicateEmail(Server.HtmlEncode(txtEmailReg.Text.Trim)) Then 'آیا ایمیل تکراری است؟
                lblNotify.ForeColor = Drawing.Color.Green
                lblNotify.Text = "لینک کد ثبت نام با موفقیت به ایمیل شما ارسال گردید. پس از مراجعه به ایمیل خود، بروی لینک ثبت نام کلیک کرده و پس از برگشت به سایت درگاه فیلم ایران، مراحل ثبت نام را ادامه دهید. ممکن است ایمیل ارسال شده در صندوق SPAM شما قرار گرفته باشد."
                DivbtnSendMail.Visible = False
                DivbtnSendMailAgain.Visible = True
                btnSendMail.Enabled = False
                txtEmailReg.Enabled = False
                DF = Now
                lblRegister.Text = ""
                '''''''''''''''''''''''''''''''''
                R = Guid.NewGuid.ToString ' R = code verification
                DLL_Dash.Insert_ProfileCreator(Server.HtmlEncode(txtEmailReg.Text.Trim), R)
                ''''''''''''' Send LINK with MAIL
                Email.SendMail(txtEmailReg.Text.Trim, "به منظور ادامه ی فرآیند ثبت نام روی لینک زیر کلیک کنید.", "ارسال کد فعالسازی", "http://iranfilmport.com/login/" + R + "/" + txtEmailReg.Text.Trim + "/")
                'Send "http://iranfilmport.com/login/" + veriC + "/"+ email
                ''''''''''''''''''''''''''''''''''''''''''''''''''''
            Else
                lblNotify.ForeColor = Drawing.Color.Red
                lblNotify.Text = "ایمیل وارد شده تکراری است."
            End If
        Else
            lblRegister.Text = "وارد کردن ایمیل الزامی است."
        End If
    End Sub
    Protected Sub btnSendMailAgain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendMailAgain.Click
        Dim duration As TimeSpan = Now - DF
        If Math.Round(duration.TotalSeconds) > 60 Then
            ''''''''''''' Send LINK with MAIL
            Email.SendMail(txtEmailReg.Text.Trim, "http://iranfilmport.com/login/" + R + "/" + txtEmailReg.Text.Trim, "ارسال کد فعالسازی", "")
            'Send "http://iranfilmport.com/login/" + veriC + "/"+ email
            '''''''''''''''''''''''''''''''''''''''
            lblNotify.ForeColor = Drawing.Color.Green
            lblNotify.Text = "ایمیل حاوی لینک کد فعالسازی دوباره ارسال گردید. ممکن است ایمیل ارسال شده در صندوق SPAM شما قرار گرفته باشد."
        Else
            lblNotify.ForeColor = Drawing.Color.Red
            lblNotify.Text = "باید از آخرین تلاش شما یک دقیقه گذشته باشد. پس از یک دقیقه دوباره تلاش کنید."
        End If
        DF = Now
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If Not IsPostBack Then lblTitle.Text = "پنل‌های ورودی"
		''''''''''''''''' vaghti login kardi pas nabayad field haye login dobare neshan dade shavad
		If Not Request.Cookies("IFP") Is Nothing Then
			MultiView.ActiveViewIndex = 2
			lblTitle.Text = "وضعیت شما: ورود کرده"
		End If
		'''''''''''''''''''' Check cookie
		If Not Request.Cookies("IFP") Is Nothing And DLL_Dash.EnableCheckCookie Then Response.Redirect("~\dashboard\")
		''''''''''''''''''''
		If Not String.IsNullOrEmpty(Page.RouteData.Values("veriC")) And Not String.IsNullOrEmpty(Page.RouteData.Values("email")) Then
			MultiView.ActiveViewIndex = 1
			lblTitle.Text = "ادامه روند ثبت نام"
			If DLL_Dash.CheckVeriC(Page.RouteData.Values("email"), Page.RouteData.Values("veriC")) Then
				Pnl_Veri_ok.Visible = True
				lblEmail.Text = Page.RouteData.Values("email")
			Else
				Pnl_Veri_not.Visible = True
				lblTitle.Text = "ادامه روند ثبت نام"
			End If
		End If
		'''''''''''''''''''''' Status of Register
		Dim DLl_CMS As New DLL_CMS
        Select Case DLl_CMS.GetStatusOfRegsiter
            Case True
                btnRegister.Visible = True
                StatusOfRegister.Visible = False
            Case False
                btnRegister.Visible = False
                StatusOfRegister.Visible = True
        End Select
    End Sub
    Protected Sub btnUpdateVerification_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateVerification.Click
        If txtPass1.Text.Trim.Length > 6 Then
            Select Case DLL_Dash.CheckStructureUsername(Server.HtmlEncode(txtUsername.Text.Trim))
                Case 1
                    If DLL_Dash.CheckDuplicateUsername(Server.HtmlEncode(txtUsername.Text.Trim)) Then
                        DLL_Dash.Update_AfterVerificationLink(Page.RouteData.Values("email"),
                                                        Server.HtmlEncode(txtPhone.Text.Trim),
                                                        Server.HtmlEncode(txtName.Text.Trim),
                                                        Server.HtmlEncode(txtLastName.Text.Trim),
                                                        Val(cmdType.SelectedValue),
                                                        Server.HtmlEncode(txtUsername.Text.Trim),
                                                        Server.HtmlEncode(txtPass1.Text.Trim),
                                                        Now)
                        DLL_Dash.Update_UpdateVerificationCode(Page.RouteData.Values("email"), Page.RouteData.Values("veriC"))
                        '-------------------------------- Automatically login
                        DLL_Dash._Email_ = Page.RouteData.Values("email")
                        ' create cookie
                        Dim myCookie As HttpCookie = New HttpCookie("IFP")
                        myCookie("email") = Page.RouteData.Values("email")
                        myCookie.Expires = Now.AddYears(1)
                        Response.Cookies.Add(myCookie)
                        Response.Redirect("~\dashboard\")
                        '-----------------------------------------------------
                    Else
                        lblStatus.Text = "نام کاربری تکراری است."
                    End If
                Case 2
                    lblStatus.Text = "کارکتر ابتدایی نام کاربری نباید عدد باشد."
                Case 3
                    lblStatus.Text = "در نام کاربری نباید فاصله وجود داشته باشد."
                Case 4
					lblStatus.Text = "طول نام کاربری شما باید بالای 6 کاراکتر باشد."
				Case 5
					lblStatus.Text = "نام کاربری تنها باید شامل حروف انگلیسی باشد."
			End Select
        Else
            lblStatus.Text = "کلمه عبور باید بیش از 6 کارکتر باشد."
        End If
    End Sub
    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        If txtEmail.Text.Trim <> "" And txtPass.Text.Trim <> "" Then
            If DLL_Dash.CheckLogin(Server.HtmlEncode(txtEmail.Text.Trim), Server.HtmlEncode(txtPass.Text.Trim)) Then
                '''''''''''''' create cookie
                Dim myCookie As HttpCookie = New HttpCookie("IFP")
                myCookie("email") = Server.HtmlEncode(txtEmail.Text.Trim)
                myCookie.Expires = Now.AddYears(1)
                Response.Cookies.Add(myCookie)
                ''''''''''''''
                DLL_Dash._Email_ = txtEmail.Text.Trim
                ''''''''''''''
                Response.Redirect("~\dashboard\")
            Else
                lblLogin.Text = "ایمیل وارد شده و یا کلمه عبور اشتباه می باشد. دوباره تلاش کنید. "
            End If
        Else
            lblLogin.Text = "وارد کردن ایمیل و کلمه عبور الزامی است."
        End If

    End Sub
    Protected Sub btnSignOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignOut.Click
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
	Protected Sub btnSendPassToMail_Click(sender As Object, e As System.EventArgs) Handles btnSendPassToMail.Click
		If (String.IsNullOrEmpty(txtForgotPasword.Text.Trim)) Then
			lblForgotPasword.Text = "ایمیل را وارد کنید."
			lblForgotPasword.ForeColor = Drawing.Color.Red
			Exit Sub
		End If
		If DLL_Dash.SendForgotPassword(txtForgotPasword.Text.Trim) Then
			lblForgotPasword.Text = "کلمه عبور شما به ایمیل وارد شده ارسال گردید."
			txtForgotPasword.Enabled = False
			lblForgotPasword.ForeColor = Drawing.Color.Green
		Else
			lblForgotPasword.Text = "این ایمیل وجود ندارد."
			txtForgotPasword.Text = ""
			lblForgotPasword.ForeColor = Drawing.Color.Red
		End If
	End Sub
	Protected Sub btnSpecialUsers_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btnSpecialUsers.Click
        MultiView_Logins.ActiveViewIndex = 1
    End Sub

End Class
