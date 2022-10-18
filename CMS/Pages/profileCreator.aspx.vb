
Partial Class CMS_Pages_profileCreator
    Inherits System.Web.UI.Page

    Dim DLL_Dash As New DLL_Dashboard
    Dim Email As New Email

    Protected Sub btnRegister_Click(sender As Object, e As System.EventArgs) Handles btnRegister.Click
        Dim DLL As New DLL_Dashboard
        If txtEmailReg.Text.Trim <> "" Then 'آیا فیلد پر شده است؟
            If DLL.CheckDuplicateEmail(Server.HtmlEncode(txtEmailReg.Text.Trim)) Then 'آیا ایمیل تکراری است؟
                lblNotify.ForeColor = Drawing.Color.Green
                lblNotify.Text = "لینک کد ثبت نام با موفقیت به ایمیل شما ارسال گردید. پس از مراجعه به ایمیل خود، بروی لینک ثبت نام کلیک کرده و پس از برگشت به سایت درگاه فیلم ایران، مراحل ثبت نام را ادامه دهید. ممکن است ایمیل ارسال شده در صندوق SPAM شما قرار گرفته باشد."
                txtEmailReg.Enabled = False
                '''''''''''''''''''''''''''''''''
                HiddenFieldR.Value = Guid.NewGuid.ToString ' R = code verification
                DLL_Dash.Insert_ProfileCreator(Server.HtmlEncode(txtEmailReg.Text.Trim), HiddenFieldR.Value)
                ''''''''''''' Check?
                If DLL_Dash.CheckVeriC(txtEmailReg.Text, HiddenFieldR.Value) Then
                    MultiView.ActiveViewIndex = 1
                    HiddenFieldEmail.Value = txtEmailReg.Text
                Else
                    lblNotify.Text = "خطا!"
                End If
                ''''''''''''''''''''''''''''''''''''''''''''''''''''
            Else
                lblNotify.ForeColor = Drawing.Color.Red
                lblNotify.Text = "ایمیل وارد شده تکراری است."
            End If
        Else
            lblNotify.Text = "وارد کردن ایمیل الزامی است."
        End If
    End Sub

    Protected Sub btnUpdateVerification_Click(sender As Object, e As System.EventArgs) Handles btnUpdateVerification.Click
        If txtPass1.Text.Trim.Length > 3 Then
            Select Case DLL_Dash.CheckStructureUsername(Server.HtmlEncode(txtUsername.Text.Trim))
                Case 1
                    If DLL_Dash.CheckDuplicateUsername(Server.HtmlEncode(txtUsername.Text.Trim)) Then
                        DLL_Dash.Update_AfterVerificationLink(HiddenFieldEmail.Value, _
                                                        Server.HtmlEncode(txtPhone.Text.Trim), _
                                                        Server.HtmlEncode(txtName.Text.Trim), _
                                                        Server.HtmlEncode(txtLastName.Text.Trim), _
                                                        Val(cmdType.SelectedValue), _
                                                        Server.HtmlEncode(txtUsername.Text.Trim), _
                                                        Server.HtmlEncode(txtPass1.Text.Trim), _
                                                        Now)
                        DLL_Dash.Update_UpdateVerificationCode(HiddenFieldEmail.Value, HiddenFieldR.Value)
                        '-------------------------------- Get Namad
                        Dim dl As New DLL_CMS
                        dl.UpdateStatusProfileCreator(HiddenFieldEmail.Value, 3)
                        '-------------------------------- Automatically login
                        DLL_Dash._Email_ = HiddenFieldEmail.Value
                        ' create cookie
                        Dim myCookie As HttpCookie = New HttpCookie("IFP")
                        myCookie("email") = HiddenFieldEmail.Value
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
            End Select
        Else
            lblStatus.Text = "کلمه عبور باید بیش از 6 کارکتر باشد."
        End If
    End Sub

End Class
