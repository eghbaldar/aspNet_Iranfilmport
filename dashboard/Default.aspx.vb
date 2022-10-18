Imports System.IO
Imports System.Text.RegularExpressions

Partial Class dashboard_Default
    Inherits System.Web.UI.Page

    Dim DLLd As New DLL_Dashboard

    Protected Sub btnUpdateAttributes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateAttributes.Click

        Dim name As String = Regex.Replace(txtName.Text, "</?(a|A).*?>", String.Empty)
        Dim lastname As String = Regex.Replace(txtLastname.Text, "</?(a|A).*?>", String.Empty)
        Dim nameE As String = Regex.Replace(txtNameEN.Text, "</?(a|A).*?>", String.Empty)
        Dim lastnameE As String = Regex.Replace(txtLastnameEN.Text, "</?(a|A).*?>", String.Empty)
        Dim type As Byte = cmdType.SelectedValue

        Dim BioTemp As String = Regex.Replace(txtBIO.Text, "</?(a|A).*?>", String.Empty)
        Dim Bio As String = BioTemp.Replace(vbCrLf, "<br/>")

        Dim BioETemp As String = Regex.Replace(txtBioEN.Text, "</?(a|A).*?>", String.Empty)
        Dim BioE As String = BioETemp.Replace(vbCrLf, "<br/>")

        Dim dateB As String = cmd_Year.SelectedValue.ToString & "/" & cmd_Month.SelectedValue.ToString & "/" & cmd_Day.SelectedValue.ToString
        Dim country As Byte = Val(cmd_country.SelectedValue)
        Dim state As String = Regex.Replace(txtState.Text, "</?(a|A).*?>", String.Empty)
        Dim city As String = Regex.Replace(txtCity.Text, "</?(a|A).*?>", String.Empty)
        Dim address As String = Regex.Replace(txtAdress.Text, "</?(a|A).*?>", String.Empty)


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

        Dim Tell As String = txtTell.Text.Trim
        Dim degree As Byte = cmdDegree.SelectedValue
        Dim field As String = txtField.Text.Trim
        Dim TW As String = txtTW.Text.Trim
        Dim Insta As String = txtInsta.Text.Trim
        Dim FB As String = txtFB.Text.Trim
        Dim IMDb As String = txtIMDb.Text.Trim
        Dim G As String = txtGPlus.Text.Trim
        Dim WEB As String = txtWeb.Text.Trim
        '-------------------------------
        Dim email As String
        If Not DLLd._Email_ Is Nothing Then email = DLLd._Email_
        '------------------------------
        Dim DLL As New DLL_Dashboard
        DLL.Update_UpdatePersonalInformation(name, lastname, type, nameE, lastnameE, Bio, BioE, dateB, _
                                             address, WEB, Rm, Re, Tell, degree, field, TW, Insta, FB, IMDb, _
                                             G, country, state, city, email)
        Response.Redirect("~/dashboard/user/me")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        If DLLd._Email_ Is Nothing Then DLLd._Email_ = Request.Cookies("IFP").Item("email")
        If Not IsPostBack Then LoadData()
    End Sub

    Private Sub LoadData()

        Title = "داشبورد" + " | " + "اطلاعات حقیقی و حقوقی"
        '''''''''''''''''''''''''''''''''''''''''''''''''''''
        Dim DLL As New DLL_Dashboard
        If Not DLLd._Email_ Is Nothing Then
            With DLL.ShowInformation(DLLd._Email_).Tables(0)
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
                ''''''''''''''''''''''''
                If Not IsDBNull(.Rows(0)("birthdate")) Then
                    cmd_Year.SelectedValue = Convert.ToDateTime(.Rows(0)("birthdate")).Year.ToString
                    cmd_Month.SelectedValue = Val(Convert.ToDateTime(.Rows(0)("birthdate")).Month.ToString)
                    cmd_Day.SelectedValue = Val(Convert.ToDateTime(.Rows(0)("birthdate")).Day.ToString)
                End If
                '''''''''''''''''''''''' Mobile
                txtMobile.Text = .Rows(0)("Mobile").ToString()
                '''''''''''''''''''''''' Photo and Header
                If .Rows(0)("Personalphoto").ToString() = "" Then
                    img_Pic_Profile.ImageUrl = "~\dashboard/assets/img/NonUser.png"
                Else
                    img_Pic_Profile.ImageUrl = "~\files\uploadFiles\PhotoHeaderUsers\" + .Rows(0)("Personalphoto").ToString()
                End If
                'If .Rows(0)("HeaderPhoto").ToString() = "" Then
                '    img_Pic_Header.ImageUrl = "~\dashboard/assets/img/header.png"
                'Else
                '    img_Pic_Header.ImageUrl = "~\files\uploadFiles\PhotoHeaderUsers\" + .Rows(0)("HeaderPhoto").ToString()
                'End If
                '---------------------- Profile link
                lblProfileLink.Text = String.Format("شما از طریق لینک {0} می توانید وارد پروفایل خارجی خود شوید و لینک آن را بین دوستان و شبکه های مجازی به اشتراک بگذارید.", "<a target='_blank' href='http:\\iranfilmport.com\filmmaker\" + .Rows(0)("username").ToString().Trim + "'>iranfilmport.com\filmmaker\" + .Rows(0)("username").ToString() + "</a>")
                '------------------------ Does he/she send the Identity Cards?
                If DLL.CheckIdentityCards(DLLd._Email_) Then
                    PaneLTruth.Visible = True
                    PaneMadrak.Visible = False
                Else
                    PaneLTruth.Visible = False
                    PaneMadrak.Visible = True
                End If
                '''''''''''''''''''''''' Attributes
                txtEmail.Text = .Rows(0)("email").ToString
                txtName.Text = .Rows(0)("name").ToString.Replace("ي", "ی")
                txtLastname.Text = .Rows(0)("lastname").ToString.Replace("ي", "ی")
                txtNameEN.Text = .Rows(0)("engname").ToString
                txtLastnameEN.Text = .Rows(0)("englastname").ToString
                cmdType.SelectedValue = Val(.Rows(0)("type").ToString)
                txtBIO.Text = .Rows(0)("bio").ToString.Replace("ي", "ی").Replace("<br/>", vbCrLf)
                txtBioEN.Text = .Rows(0)("engbio").ToString.Replace("<br/>", vbCrLf)
                'BirthDate()
                cmd_country.SelectedValue = .Rows(0)("countryid").ToString
                txtState.Text = .Rows(0)("state").ToString.Replace("ي", "ی")
                txtCity.Text = .Rows(0)("city").ToString.Replace("ي", "ی")
                txtAdress.Text = .Rows(0)("address").ToString.Replace("ي", "ی")
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
                ''''''''''''''''''''''''''''''''''''''''''''
                If .Rows(0)("StatusUser") = "3" Then
                    imgNamad.ImageUrl = "~\files\images\logos\confidence_logo_small.png"
                    lblNamad.Text = "<span style='color:green;font-weight:bold;'>این پروفایل دارای نماد اعتماد است</span>"
                    PaneLTruth.Visible = False
                Else
                    imgNamad.ImageUrl = "~\files\images\logos\confidence_logo_small_diactive.png"
                    lblNamad.Text = "<span style='color:gray;font-weight:bold;'>شما میتوانید با ارسال مدارک شناسایی نماد اعتماد دریافت کنید.</span>"
                End If
            End With
        End If
    End Sub

    Protected Sub btnUpdateMobile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateMobile.Click
        Dim DLL As New DLL_Dashboard
        DLL.Update_Mobile(DLLd._Email_, txtMobile.Text.Trim)
        LoadData()
    End Sub

    Protected Sub btnUpdateMeli_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateMeli.Click
        Dim DLL As New DLL_Dashboard
        If File_Meli.HasFile Then
            If CheckFileExtension(File_Meli.FileName) Then
                If Val(File_Meli.PostedFile.ContentLength) < 150000 Then
                    Dim FN_P As String = Guid.NewGuid.ToString + Path.GetExtension(File_Meli.FileName)
                    Dim H As String = DLL.ShowInformation(DLLd._Email_).Tables(0).Rows(0)("BirthCertificatePic").ToString
                    DLL.Update_MeliCard(DLLd._Email_, FN_P, H)
                    File_Meli.SaveAs(MapPath("~/files/UploadFiles/MeliCard/" + FN_P))
                    Response.Redirect("~/dashboard/user/me")
                Else
                    lblwarningMeli.Text = "<div style='padding:10px;color:red;text-align:center;font-family:tahoma;font-size:12px'>" + "ابعداد و یا حجم تصویر کارت ملی   مناسب نیست" + "</div>"
                End If
            Else
                lblWarningSize.Text = "<div style='padding:10px;color:red;text-align:center;font-family:tahoma;font-size:12px'>" + "فرمت تصویر باید JPEG باشد" + "</div>"
            End If
        End If
    End Sub

    Protected Sub btnUpdateShSh_Click(sender As Object, e As System.EventArgs) Handles btnUpdateShSh.Click
        Dim DLL As New DLL_Dashboard
        If File_ShSh.HasFile Then
            If CheckFileExtension(File_ShSh.FileName) Then
                If Val(File_ShSh.PostedFile.ContentLength) < 150000 Then
                    Dim FN_H As String = Guid.NewGuid.ToString + Path.GetExtension(File_ShSh.FileName)
                    Dim P As String = DLL.ShowInformation(DLLd._Email_).Tables(0).Rows(0)("MeliCardPic").ToString
                    DLL.Update_MeliCard(DLLd._Email_, P, FN_H)
                    File_ShSh.SaveAs(MapPath("~/files/UploadFiles/MeliCard/" + FN_H))
                    Response.Redirect("~/dashboard/user/me")
                Else
                    lblwarningMeli.Text = "<div style='padding:10px;color:red;text-align:center;font-family:tahoma;font-size:12px'>" + "ابعداد و یا حجم تصویر شناسنامه مناسب نیست" + "</div>"
                End If
            Else
                lblWarningSize.Text = "<div style='padding:10px;color:red;text-align:center;font-family:tahoma;font-size:12px'>" + "فرمت تصویر باید JPEG باشد" + "</div>"
            End If
        End If
    End Sub

    Protected Sub btnUsernamePassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUsernamePassword.Click

        Dim DLL As New DLL_Dashboard

        If chkAllowPass.Checked Then 'تغییر پسورد
            If txtCurrentPass.Text.Trim.Trim.Length > 6 And txtPass1.Text.Trim.Length > 6 Then
                If DLL.CheckLogin(DLLd._Email_, txtCurrentPass.Text.Trim) Then 'آیا کلمه عبور فعلی درست وارد شده است
                    If txtPass1.Text.Trim <> "" And txtPass2.Text.Trim <> "" Then
                        '''''''''
                        If DLL.Update_Password(txtPass1.Text.Trim, DLLd._Email_) = 0 Then
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
                        lblUserPassStatus.Text = "به منظور تغییر کلمه عبور باید دو فیلد کلمه عبور جدید را پر کنید."
                    End If
                Else
                    lblUserPassStatus.ForeColor = Drawing.Color.Red
                    lblUserPassStatus.Text = "کلمه عبور اشتباه می باشد."
                End If
            Else
                lblUserPassStatus.ForeColor = Drawing.Color.Red
                lblUserPassStatus.Text = "کلمه عبور باید بیش از 6 کاراکتر باشد"
            End If
        Else 'تغییر نام کاربری
            If txtUsername.Text.Trim <> "" Then
                If DLL.CheckLogin(DLLd._Email_, txtCurrentPass.Text.Trim) Then 'آیا کلمه عبور فعلی درست وارد شده است

                    Select Case DLL.CheckStructureUsername(txtUsername.Text.Trim)
                        Case 1
                            If DLL.CheckDuplicateUsername(txtUsername.Text.Trim) Then
                                DLL.Update_Username(txtUsername.Text.Trim, txtCurrentPass.Text.Trim, DLLd._Email_)
                                lblUserPassStatus.ForeColor = Drawing.Color.Green
                                lblUserPassStatus.Text = "تغییرات اعمال شده است."
                                LoadData()
                            Else
                                lblUserPassStatus.ForeColor = Drawing.Color.Red
                                lblUserPassStatus.Text = "نام کاربری تکراری است."
                            End If
                        Case 2
                            lblUserPassStatus.ForeColor = Drawing.Color.Red
                            lblUserPassStatus.Text = "کارکتر ابتدایی نام کاربری نباید عدد باشد."
                        Case 3
                            lblUserPassStatus.ForeColor = Drawing.Color.Red
                            lblUserPassStatus.Text = "در نام کاربری نباید فاصله وجود داشته باشد."
                        Case 4
                            lblUserPassStatus.ForeColor = Drawing.Color.Red
                            lblUserPassStatus.Text = "طول نام کاربری شما باید بالای 6 کاراکتر باشد."
                    End Select
                Else
                    lblUserPassStatus.ForeColor = Drawing.Color.Red
                    lblUserPassStatus.Text = "کلمه عبور اشتباه می باشد."
                End If
            Else
                lblUserPassStatus.ForeColor = Drawing.Color.Red
                lblUserPassStatus.Text = "وارد کردن نام کاربری الزامی است."
            End If
        End If
    End Sub

    Protected Sub btnUpdatePicProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdatePicProfile.Click
        Dim DLL As New DLL_Dashboard
        If File_Pic_Profile.HasFile Then
            If CheckFileExtension(File_Pic_Profile.FileName) Then
                If Val(File_Pic_Profile.PostedFile.ContentLength) < 150000 Then
                    Dim FN_P As String = Guid.NewGuid.ToString + Path.GetExtension(File_Pic_Profile.FileName)
                    DLL.Update_PictureProfileHeader(DLLd._Email_, FN_P, False)
                    File_Pic_Profile.SaveAs(MapPath("~/files/UploadFiles/PhotoHeaderUsers/" + FN_P))
                    Response.Redirect("~/dashboard/user/me")
                Else
                    lblWarningSize.Text = "<div style='padding:10px;color:red;text-align:center;font-family:tahoma;font-size:12px'>" + "ابعداد و یا حجم تصویر پروفایل مناسب نیست" + "</div>"
                End If
            Else
                lblWarningSize.Text = "<div style='padding:10px;color:red;text-align:center;font-family:tahoma;font-size:12px'>" + "فرمت تصویر باید JPEG باشد" + "</div>"
            End If
        End If
    End Sub

    'Protected Sub btnUpdatePicProfileHeader_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdatePicProfileHeader.Click

    '    Dim DLL As New DLL_Dashboard

    '    If File_Pic_Header.HasFile Then
    '        If Val(File_Pic_Header.PostedFile.ContentLength) < 150000 Then
    '            Dim FN_H As String = Guid.NewGuid.ToString + Path.GetExtension(File_Pic_Header.FileName)
    '            DLL.Update_PictureProfileHeader(DLLd._Email_, FN_H, True)
    '            File_Pic_Header.SaveAs(MapPath("~/files/UploadFiles/PhotoHeaderUsers/" + FN_H))
    '            Response.Redirect("~/dashboard/user/me")
    '        End If
    '    Else
    '        lblWarningSize.Text = "<div style='padding:10px;color:red;text-align:center;font-family:tahoma;font-size:12px'>" + "ابعداد و یا حجم تصویر هدِر مناسب نیست" + "</div>"
    '    End If
    'End Sub

    Private Function CheckFileExtension(filename As String) As Boolean
        Select Case Path.GetExtension(filename).ToLower.Replace(".", Nothing)
            Case "jpeg"
                Return True
            Case "jpg"
                Return True
            Case Else
                Return False
        End Select
        Return False
    End Function

End Class
