Imports System.IO

Partial Class CMS_Pages_profileEdit
    Inherits System.Web.UI.Page

    Dim email As String
    Dim SendEmail As New Email

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        email = Request.QueryString("email")
        If Not IsPostBack Then LoadData()
    End Sub

    Private Sub LoadData()
        Dim DLL As New DLL_Dashboard
        If Not email Is Nothing Then
            With DLL.ShowInformation(email).Tables(0)
                ''''''''''''''''''''''''Username
                lblCurrentUsername.Text = String.Format("نام کاربری فعلی شما {0} می باشد.", .Rows(0)("username").ToString())
                ''''''''''''''''''''''''Melicard and SHSHS
                If .Rows(0)("MeliCardPic").ToString() = "" Then
                    img_Meli.ImageUrl = "~\dashboard/assets/img/melicard.png"
                Else
                    img_Meli.ImageUrl = "~\files\uploadFiles\MeliCard\" + .Rows(0)("MeliCardPic").ToString()
                End If
                If .Rows(0)("BirthCertificatePic").ToString() = "" Then
                    img_shsh.ImageUrl = "~\dashboard/assets/img/melicard.png"
                Else
                    img_shsh.ImageUrl = "~\files\uploadFiles\MeliCard\" + .Rows(0)("BirthCertificatePic").ToString()
                End If
                '''''''''''''''''''''''' Mobile
                txtMobile.Text = .Rows(0)("Mobile").ToString()
                '''''''''''''''''''''''' Photo and Header
                If .Rows(0)("Personalphoto").ToString() = "" Then
                    img_Pic_Profile.ImageUrl = "~\dashboard/assets/img/NonUser.png"
                Else
                    img_Pic_Profile.ImageUrl = "~\files\uploadFiles\PhotoHeaderUsers\" + .Rows(0)("Personalphoto").ToString()
                End If
                If .Rows(0)("HeaderPhoto").ToString() = "" Then
                    img_Pic_Header.ImageUrl = "~\dashboard/assets/img/header.png"
                Else
                    img_Pic_Header.ImageUrl = "~\files\uploadFiles\PhotoHeaderUsers\" + .Rows(0)("HeaderPhoto").ToString()
                End If
                '''''''''''''''''''''''' Attributes
                txtName.Text = .Rows(0)("name").ToString
                txtLastname.Text = .Rows(0)("lastname").ToString
                txtNameEN.Text = .Rows(0)("engname").ToString
                txtLastnameEN.Text = .Rows(0)("englastname").ToString
                cmdType.SelectedValue = Val(.Rows(0)("type").ToString)
                txtBIO.Text = .Rows(0)("bio").ToString.Replace("<br/>", vbCrLf)
                txtBioEN.Text = .Rows(0)("engbio").ToString.ToString.Replace("<br/>", vbCrLf)
                ''''''''''''''''''''''''
                If Not IsDBNull(.Rows(0)("birthdate")) Then
                    cmd_Year.SelectedValue = Convert.ToDateTime(.Rows(0)("birthdate")).Year.ToString
                    cmd_Month.SelectedValue = Val(Convert.ToDateTime(.Rows(0)("birthdate")).Month.ToString)
                    cmd_Day.SelectedValue = Val(Convert.ToDateTime(.Rows(0)("birthdate")).Day.ToString)
                End If
                ''''''''''''''''''''''''
                cmd_country.SelectedValue = .Rows(0)("countryid").ToString
                txtState.Text = .Rows(0)("state").ToString
                txtCity.Text = .Rows(0)("city").ToString
                txtAdress.Text = .Rows(0)("address").ToString
                If Convert.ToBoolean(.Rows(0)("mobileshow").ToString) Then
                    rbShowMobile.Items(0).Selected = True
                Else
                    rbShowMobile.Items(1).Selected = True
                End If
                If Convert.ToBoolean(.Rows(0)("emailshow").ToString) Then
                    rbShowEmail.Items(0).Selected = True
                Else
                    rbShowEmail.Items(1).Selected = True
                End If
                txtTell.Text = .Rows(0)("tell").ToString
                cmdDegree.SelectedValue = .Rows(0)("degree").ToString
                txtField.Text = .Rows(0)("field").ToString
                txtTW.Text = .Rows(0)("TWLink").ToString
                txtInsta.Text = .Rows(0)("InstaLink").ToString
                txtFB.Text = .Rows(0)("FBLink").ToString
                txtIMDb.Text = .Rows(0)("ImdbLink").ToString
                txtGPlus.Text = .Rows(0)("GoogleLink").ToString
                txtWeb.Text = .Rows(0)("Website").ToString
                '''''''''''''' age karbar madarek ersal konad moalagh mishavad
                Select Case Val(.Rows(0)("statususer").ToString)
                    Case "0"
                        Pnl_Status.BackColor = Drawing.Color.Red 'پروفایل بسته است، چون اطلاعات توسط کاربر بروز شده و یا ادمین تائید نکرده است
                    Case "1"
                        Pnl_Status.BackColor = Drawing.Color.Green 'پروفایل تائید و قابل نمایش برای عموم است
                    Case "2"
                        Pnl_Status.BackColor = Drawing.Color.Gray 'کاربر محروم شده است
                    Case "3"
                        Pnl_Status.BackColor = Drawing.Color.Yellow 'کاربر تائید و دارای نماد اعتماد است
                        btnConfirm.Enabled = False
                    Case "4"
                        Pnl_Status.BackColor = Drawing.Color.Orange 'اطلاعات کاربر ناقص است و میتواند ویرایش کند
                End Select
            End With
        End If
    End Sub

    Protected Sub btnUpdatePicProfileHeader_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdatePicProfileHeader.Click
        Dim DLL As New DLL_Dashboard
        If File_Pic_Profile.FileName <> "" Then
            Dim FN_P As String = Guid.NewGuid.ToString + Path.GetExtension(File_Pic_Profile.FileName)
            Dim H As String = DLL.ShowInformation(email).Tables(0).Rows(0)("HeaderPhoto").ToString
            DLL.Update_PictureProfileHeader(email, FN_P, H)
            File_Pic_Profile.SaveAs(MapPath("~/files/UploadFiles/PhotoHeaderUsers/" + FN_P))
        End If

        If File_Pic_Header.FileName <> "" Then
            Dim FN_H As String = Guid.NewGuid.ToString + Path.GetExtension(File_Pic_Header.FileName)
            Dim P As String = DLL.ShowInformation(email).Tables(0).Rows(0)("Personalphoto").ToString
            DLL.Update_PictureProfileHeader(email, P, FN_H)
            File_Pic_Header.SaveAs(MapPath("~/files/UploadFiles/PhotoHeaderUsers/" + FN_H))
        End If
        LoadData()
    End Sub

    Protected Sub btnUpdateMobile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateMobile.Click
        Dim DLL As New DLL_Dashboard
        DLL.Update_Mobile(email, Server.HtmlEncode(txtMobile.Text.Trim))
        LoadData()
    End Sub

    Protected Sub btnUpdateMeliShSh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateMeliShSh.Click
        Dim DLL As New DLL_Dashboard
        If File_Meli.FileName <> "" Then
            Dim FN_P As String = Guid.NewGuid.ToString + Path.GetExtension(File_Meli.FileName)
            Dim H As String = DLL.ShowInformation(email).Tables(0).Rows(0)("BirthCertificatePic").ToString
            DLL.Update_MeliCard(email, FN_P, H)
            File_Meli.SaveAs(MapPath("~/files/UploadFiles/MeliCard/" + FN_P))
        End If

        If File_ShSh.FileName <> "" Then
            Dim FN_H As String = Guid.NewGuid.ToString + Path.GetExtension(File_ShSh.FileName)
            Dim P As String = DLL.ShowInformation(email).Tables(0).Rows(0)("MeliCardPic").ToString
            DLL.Update_MeliCard(email, P, FN_H)
            File_ShSh.SaveAs(MapPath("~/files/UploadFiles/MeliCard/" + FN_H))
        End If
        LoadData()
    End Sub

    Protected Sub btnUsernamePassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUsernamePassword.Click

        Dim DLL As New DLL_Dashboard

        If chkAllowPass.Checked Then 'تغییر پسورد
            'If DLL.CheckLogin(email, Server.HtmlEncode(txtCurrentPass.Text.Trim)) Then 'آیا کلمه عبور فعلی درست وارد شده است
            If txtPass1.Text.Trim <> "" _
                And txtPass2.Text.Trim <> "" And
                (txtPass1.Text.Trim = txtPass2.Text.Trim) And
                lblCurrentUsername.Text.ToString.Trim() <> "" Then
                '''''''''
                If DLL.Update_Password_CMS(lblCurrentUsername.Text.ToString,
                                                   Server.HtmlEncode(txtPass1.Text.Trim),
                                                   email) = 0 Then
                    lblUserPassStatus.ForeColor = Drawing.Color.Red
                    lblUserPassStatus.Text = "کلمه عبور فعلی مطابقت ندارد، دوباره تلاش کنید."
                Else
                    lblUserPassStatus.ForeColor = Drawing.Color.Green
                    lblUserPassStatus.Text = "تغییرات اعمال شده است."
                    LoadData()
                End If
                '''''''''
            Else
                lblUserPassStatus.ForeColor = Drawing.Color.Red
                lblUserPassStatus.Text = "به منظور تغییر کلمه عبور باید دو فیلد کلمه عبور جدید را پر کنید و همچنین نام کاربری مشخض باشد."
            End If
            Else
                lblUserPassStatus.ForeColor = Drawing.Color.Red
                lblUserPassStatus.Text = "کلمه عبور اشتباه می باشد."
            End If

        If txtUsername.Text.Trim <> "" And chkAllowUser.Checked Then
            If DLL.CheckDuplicateUsername(Server.HtmlEncode(txtUsername.Text.Trim)) Then
                DLL.Update_Username_CMS(Server.HtmlEncode(txtUsername.Text.Trim),
                                                "",
                                                email)
                lblUserPassStatus.ForeColor = Drawing.Color.Green
                lblUserPassStatus.Text = "تغییرات اعمال شده است."
                LoadData()
            Else
                lblUserPassStatus.ForeColor = Drawing.Color.Red
                    lblUserPassStatus.Text = "نام کاربری تکراری است."
                End If
            Else
            lblUserPassStatus.ForeColor = Drawing.Color.Red
                lblUserPassStatus.Text = "وارد کردن نام کاربری الزامی است."
            End If

    End Sub

    Protected Sub btnForbiden_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnForbiden.Click
        Dim dl As New DLL_CMS
        dl.UpdateStatusProfileCreator(email, 2)
        LoadData()
        MultiView_Main.ActiveViewIndex = 1
    End Sub
    Protected Sub btnDeny_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeny.Click
        Dim dl As New DLL_CMS
        dl.UpdateStatusProfileCreator(email, 0)
        LoadData()
        MultiView_Main.ActiveViewIndex = 1
    End Sub
    Protected Sub btnNamad_Click(sender As Object, e As System.EventArgs) Handles btnNamad.Click
        Dim dl As New DLL_CMS
        dl.UpdateStatusProfileCreator(email, 3)
        LoadData()
        If chkEmail.Checked Then SendEmail.SendMail(Request.QueryString("email"), "فیلمساز/فیلمنامه‌نویس عزیز، مشخصات و اطلاعات شما با موفقیت تائید و پروفایل شما دارای نماد اعتماد شده است و هم اکنون برای عموم قابل نمایش است. شما می توانید از لینک زیر اطلاعات خود را ویرایش کنید. با تشکر", "اخد نماد اعتماد پروفایل و حساب کاربری", "http://iranfilmport.com/dashboard/user/me/")
    End Sub
    Protected Sub btnConfirm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirm.Click
        Dim dl As New DLL_CMS
        dl.UpdateStatusProfileCreator(email, 1)
        LoadData()
        If chkEmail.Checked Then SendEmail.SendMail(Request.QueryString("email"), "فیلمساز/فیلمنامه‌نویس عزیز، مشخصات و اطلاعات شما با موفقیت تائید شده است و هم اکنون برای عموم قابل نمایش است. شما می توانید از لینک زیر اطلاعات خود را ویرایش کنید. با تشکر", "تائید پروفایل و حساب کاربری", "http://iranfilmport.com/dashboard/user/me/")
    End Sub
    Protected Sub btnNotConfirm_Click(sender As Object, e As System.EventArgs) Handles btnNotConfirm.Click
        Dim dl As New DLL_CMS
        dl.UpdateStatusProfileCreator(email, 4)
        LoadData()
        If chkEmail.Checked Then SendEmail.SendMail(Request.QueryString("email"), "فیلمساز/فیلمنامه‌نویس عزیز، مشخصات و اطلاعات شما ناقص ارزیابی شده است. شما می توانید از لینک زیر اطلاعات خود را ویرایش کرده تا کارشناسان درگاه فیلم ایران دوباره بررسی کنند. با تشکر", "تائید پروفایل و حساب کاربری", "http://iranfilmport.com/dashboard/user/me/")
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        MultiView_Main.ActiveViewIndex = 0
    End Sub

    Protected Sub btnUpdateAttributes_Click(sender As Object, e As System.EventArgs) Handles btnUpdateAttributes.Click
        Dim name As String = Regex.Replace(txtName.Text, "<[^>]*(>|$)", String.Empty)
        Dim lastname As String = Regex.Replace(txtLastname.Text, "<[^>]*(>|$)", String.Empty)
        Dim nameE As String = Regex.Replace(txtNameEN.Text, "<[^>]*(>|$)", String.Empty)
        Dim lastnameE As String = Regex.Replace(txtLastnameEN.Text, "<[^>]*(>|$)", String.Empty)
        Dim type As Byte = cmdType.SelectedValue
        Dim Bio As String = Regex.Replace(txtBIO.Text, "<[^>]*(>|$)", String.Empty)
        Dim BioE As String = Regex.Replace(txtBioEN.Text, "<[^>]*(>|$)", String.Empty)
        Dim dateB As Date '= New Date(Val(cmd_Year.SelectedValue), Val(cmd_Month.SelectedValue), Val(cmd_Day.SelectedValue))
        Dim country As Byte = Val(cmd_country.SelectedValue)
        Dim state As String = Regex.Replace(txtState.Text, "<[^>]*(>|$)", String.Empty)
        Dim city As String = Regex.Replace(txtCity.Text, "<[^>]*(>|$)", String.Empty)
        Dim address As String = Regex.Replace(txtAdress.Text, "<[^>]*(>|$)", String.Empty)
        Dim Rm As Boolean
        If rbShowMobile.Items(0).Selected Then
            Rm = True
        Else
            Rm = False
        End If
        Dim Re As Boolean
        If rbShowEmail.Items(0).Selected Then
            Re = True
        Else
            Re = False
        End If

        Dim Tell As String = Server.HtmlEncode(txtTell.Text.Trim)
        Dim degree As Byte = cmdDegree.SelectedValue
        Dim field As String = Server.HtmlEncode(txtField.Text.Trim)
        Dim TW As String = Server.HtmlEncode(txtTW.Text.Trim)
        Dim Insta As String = Server.HtmlEncode(txtInsta.Text.Trim)
        Dim FB As String = Server.HtmlEncode(txtFB.Text.Trim)
        Dim IMDb As String = Server.HtmlEncode(txtIMDb.Text.Trim)
        Dim G As String = Server.HtmlEncode(txtGPlus.Text.Trim)
        Dim WEB As String = Server.HtmlEncode(txtWeb.Text.Trim)
        '-------------------------------
        Dim email As String = Request.QueryString("email")
        '------------------------------
        Dim DLL As New DLL_Dashboard
        DLL.Update_UpdatePersonalInformation(name, lastname, type, nameE, lastnameE, Bio, BioE, dateB, address, WEB, Rm, Re, Tell, degree, field, TW, Insta, FB, IMDb, G, country, state, city, email)
        Response.Redirect("profileEdit.aspx?id=" + Request.QueryString("id") + "&email=" + email)
    End Sub



End Class
