Imports System.Data
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text.pdf
Partial Class sendinformation
    Inherits System.Web.UI.Page

    Private Sub sendinformation_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            lblSteps.Text = "(نسخه آنلاین)"
            btnNextStep.Text = "جهت شروع فرآیند پر کردن فرم‌های آنلاین کلیک کنید"
            BtnPreviousStep.Visible = False
        End If

    End Sub

    Private Sub Run()
        Select Case Val(MultiView.ActiveViewIndex)
            Case 0
                lblSteps.Text = "(نسخه آنلاین)"
                btnNextStep.Text = "جهت شروع فرآیند پر کردن فرم‌های آنلاین کلیک کنید"
                BtnPreviousStep.Visible = False
            Case 1
                lblSteps.Text = "(بخش نام و ژانر فیلم)"
                btnNextStep.Text = "مرحله بعد"
                BtnPreviousStep.Text = "مرحله قبل"
                BtnPreviousStep.Visible = True
            Case 2
                lblSteps.Text = "(بخش تایم فیلم)"
            Case 3
                lblSteps.Text = "(بخش مشخصات فنی فیلم)"
            Case 4
                lblSteps.Text = "(روش پخش و ارسال فیلم)"
            Case 5
                lblSteps.Text = "(مُعرف فیلمساز کیست؟)"
            Case 6
                lblSteps.Text = "(فستیوال‌های سطح دی)"
            Case 7
                lblSteps.Text = "(فستیوال‌های ورودی دار)"
            Case 8
                lblSteps.Text = "(خلاصه داستان - اجباری)"
            Case 9
                lblSteps.Text = "(بیانیه ویژه کارگردان - اجباری)"
            Case 10
                lblSteps.Text = "(مشخصات کارگردان - اجباری)"
            Case 11
                lblSteps.Text = "(بیوگرافی و فیلموگرافی کارگردان)"
            Case 12
                lblSteps.Text = "(مشخصات تهیه کننده - اجباری)"
            Case 13
                lblSteps.Text = "(بیوگرافی و فیلموگرافی تهیه کننده)"
            Case 14
                lblSteps.Text = "(عوامل فیلم)"
            Case 15
                lblSteps.Text = "(وضعیت موسیقی - اجباری)"
            Case 16
                lblSteps.Text = "(بازیگران فیلم)"
            Case 17
                lblSteps.Text = "(آشنایی با درگاه فیلم ایران)"
            Case 18
                lblSteps.Text = "(وضعیت پخش کننده قبلی)"
            Case 19
                lblSteps.Text = "(بررسی)"
                btnNextStep.Text = "بررسی"
            Case 20
                lblSteps.Text = "(تائید نهایی)"
                btnNextStep.Text = "ثبت نهایی (غیر قابل برگشت)"
                BtnPreviousStep.Text = "بررسی از اولین مرحله"
                '''''''''''''''''''''''''''''''''''''''''''''''
                Dim dt = New DataTable

                dt.Columns.Add("عنوان")
                dt.Columns.Add("عبارت وارد شده")

                dt.Rows.Add("نام فارسی فیلم", IIf(txtNameFa.Text.Trim = "", "-", txtNameFa.Text.Trim))
                dt.Rows.Add("نام فینگلیش", IIf(txtNameFinglish.Text.Trim = "", "-", txtNameFinglish.Text.Trim))
                dt.Rows.Add("نام انگلیسی", IIf(txtNameEn.Text.Trim = "", "-", txtNameEn.Text.Trim))
                dt.Rows.Add("ژانر فیلم", cmdGenre.Text)
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("زمان دقیق فیلم", txtTime_Minutes.Text.Trim & ":" & txtTIme_Seconds.Text.Trim)
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("زبان فیلم", IIf(txtMainSpecifications_Language.Text.Trim = "", "-", txtMainSpecifications_Language.Text.Trim))
                dt.Rows.Add("زیرنویس", IIf(txtMainSpecifications_FilmSubtitle.Text.Trim = "", "-", txtMainSpecifications_FilmSubtitle.Text.Trim))
                dt.Rows.Add("کشور", IIf(txtMainSpecifications_Country.Text.Trim = "", "-", txtMainSpecifications_Country.Text.Trim))
                dt.Rows.Add("زمان دقیق تولید", IIf(txtMainSpecifications_FilmProductionDate.Text.Trim = "", "-", txtMainSpecifications_FilmProductionDate.Text.Trim))
                dt.Rows.Add("ورژن فیلم", IIf(txtMainSpecifications_FilmVersion.Text.Trim = "", "-", txtMainSpecifications_FilmVersion.Text.Trim))
                dt.Rows.Add("نسبت تصویر", IIf(txtMainSpecifications_FilmAscept.Text.Trim = "", "-", txtMainSpecifications_FilmAscept.Text.Trim))
                dt.Rows.Add("رزولوشن", IIf(txtMainSpecifications_FilmResolution.Text.Trim = "", "-", txtMainSpecifications_FilmResolution.Text.Trim))
                dt.Rows.Add("فرمت", IIf(txtMainSpecifications_FilmFormat.Text.Trim = "", "-", txtMainSpecifications_FilmFormat.Text.Trim))
                dt.Rows.Add("برند دوربین", IIf(txtMainSpecifications_FilmCamera.Text.Trim = "", "-", txtMainSpecifications_FilmCamera.Text.Trim))
                dt.Rows.Add("رنگ", IIf(txtMainSpecifications_FilmColor.Text.Trim = "", "-", txtMainSpecifications_FilmColor.Text.Trim))
                dt.Rows.Add("صدا", IIf(txtMainSpecifications_FilmSound.Text.Trim = "", "-", txtMainSpecifications_FilmSound.Text.Trim))
                dt.Rows.Add("بیت ریت", IIf(txtMainSpecifications_FilmBitrates.Text.Trim = "", "-", txtMainSpecifications_FilmBitrates.Text.Trim))
                dt.Rows.Add("اسکوپ", IIf(txtMainSpecifications_FilmScope.Text.Trim = "", "-", txtMainSpecifications_FilmScope.Text.Trim))
                dt.Rows.Add("تم", IIf(txtMainSpecifications_FilmTheme.Text.Trim = "", "-", txtMainSpecifications_FilmTheme.Text.Trim))
                dt.Rows.Add("ژانر", IIf(txtMainSpecifications_FilmGenre.Text.Trim = "", "-", txtMainSpecifications_FilmGenre.Text.Trim))
                dt.Rows.Add("وب سایت فیلم", IIf(txtMainSpecifications_FilmWebsite.Text.Trim = "", "-", txtMainSpecifications_FilmWebsite.Text.Trim))
                dt.Rows.Add("فیسبوک فیلم", IIf(txtMainSpecifications_FilmFacebook.Text.Trim = "", "-", txtMainSpecifications_FilmFacebook.Text.Trim))
                dt.Rows.Add("توئیتر فیلم", IIf(txtMainSpecifications_FilmTwitter.Text.Trim = "", "-", txtMainSpecifications_FilmTwitter.Text.Trim))
                dt.Rows.Add("اینستاگرام فیلم", IIf(txtMainSpecifications_FilmInstagram.Text.Trim = "", "-", txtMainSpecifications_FilmInstagram.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                Dim Method As String = ""
                If rbMethod_True.Checked Then Method = "بلی"
                If rbMethod_False.Checked Then Method = "خیر"
                dt.Rows.Add("آیا روند پخش و ارسال درگاه فیلم ایران را قبول داشته اید؟", Method)
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("مُعرف فیلمساز کیست؟", IIf(txtRepresented_Code.Text.Trim = "", "-", txtRepresented_Code.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                Dim FestivalD As String = ""
                If rbFestivalD_True.Checked Then FestivalD = "موافق"
                If rbFestivalD_False.Checked Then FestivalD = "مخالف"
                dt.Rows.Add("وضعیت تائیدیه فستیوال های گرید دی", FestivalD)
                dt.Rows.Add("*", "*") '************************************************'
                Dim Fee As String = ""
                If rbFees_Full.Checked Then Fee = "توان پرداخت همه ورودی ها"
                If rbFees_150.Checked Then Fee = "تا 150 دلار"
                If rbFees_100.Checked Then Fee = "تا 100 دلار"
                If rbFees_50.Checked Then Fee = "تا 50 دلار"
                If rbFees_30.Checked Then Fee = "تا 30 دلار"
                If rbFees_10.Checked Then Fee = "تا 10 دلار"
                If rbFees_5.Checked Then Fee = "تا 5 دلار"
                If rbFees_0.Checked Then Fee = "اصلا توان پرداخت ندارم"
                dt.Rows.Add("وضعیت فستیوال‌های ورودی دار", Fee)
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("خلاصه داستان فیلم", IIf(txtSynopsis.Text.Trim = "", "-", txtSynopsis.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("بیانیه کارگردان", IIf(txtStatement.Text.Trim = "", "-", txtStatement.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("نام کارگردان", IIf(txtDirector_name.Text.Trim = "", "-", txtDirector_name.Text.Trim))
                dt.Rows.Add("نام خانوادگی کارگردان", IIf(txtDirector_family.Text.Trim = "", "-", txtDirector_family.Text.Trim))
                dt.Rows.Add("نام پدر کارگردان", IIf(txtDirector_father.Text.Trim = "", "-", txtDirector_father.Text.Trim))

                dt.Rows.Add("نام و نام خانوادگی مادر کارگردان", IIf(txtDirector_mother.Text.Trim = "", "-", txtDirector_mother.Text.Trim))

                dt.Rows.Add("شماره شناسنامه کارگردان", IIf(txtDirector_shsh.Text.Trim = "", "-", txtDirector_shsh.Text.Trim))
                dt.Rows.Add("کد ملی  کارگردان", IIf(txtDirector_codemeli.Text.Trim = "", "-", txtDirector_codemeli.Text.Trim))
                dt.Rows.Add("وضعیت تاهل کارگردان", IIf(txtDirector_marriage.Text.Trim = "", "-", txtDirector_marriage.Text.Trim))
                dt.Rows.Add("صادره از  کارگردان", IIf(txtDirector_borncity.Text.Trim = "", "-", txtDirector_borncity.Text.Trim))
                dt.Rows.Add("آدرس کارگردان", IIf(txtDirector_address.Text.Trim = "", "-", txtDirector_address.Text.Trim))
                dt.Rows.Add("کد پستی کارگردان", IIf(txtDirector_codepost.Text.Trim = "", "-", txtDirector_codepost.Text.Trim))
                dt.Rows.Add("تلفن ثابت کارگردان", IIf(txtDirector_phone.Text.Trim = "", "-", txtDirector_phone.Text.Trim))
                dt.Rows.Add("تلفن همراه کارگردان", IIf(txtDirector_cell.Text.Trim = "", "-", txtDirector_cell.Text.Trim))
                dt.Rows.Add("ایمیل کارگردان", IIf(txtDirector_email.Text.Trim = "", "-", txtDirector_email.Text.Trim))
                dt.Rows.Add("اینستاگرام کارگردان", IIf(txtDirector_instagram.Text.Trim = "", "-", txtDirector_instagram.Text.Trim))
                dt.Rows.Add("تاریخ تولد کارگردان", IIf(txtDirector_birthdate.Text.Trim = "", "-", txtDirector_birthdate.Text.Trim))
                dt.Rows.Add("وضعیت دانشجو بودن کارگردان", IIf(txtDirector_student.Text.Trim = "", "-", txtDirector_student.Text.Trim))
                dt.Rows.Add("محل تحصیل کارگردان", IIf(txtDirector_studentLocation.Text.Trim = "", "-", txtDirector_studentLocation.Text.Trim))
                dt.Rows.Add("شماره دانشجویی کارگردان", IIf(txtDirector_studentID.Text.Trim = "", "-", txtDirector_studentID.Text.Trim))
                dt.Rows.Add("آیا اولین فیلم کارگردان است یا خیر؟", IIf(txtDirector_debut.Text.Trim = "", "-", txtDirector_debut.Text.Trim))
                dt.Rows.Add("شغل و حرفه کارگردان", IIf(txtDirector_job.Text.Trim = "", "-", txtDirector_job.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("بیوگرافی کارگردان", IIf(txtDirectorFilmpography_Bio.Text.Trim = "", "-", txtDirectorFilmpography_Bio.Text.Trim))
                dt.Rows.Add("فیلموگرافی کارگردان", IIf(txtDirectorFilmpography_Film.Text.Trim = "", "-", txtDirectorFilmpography_Film.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("نام تهیه کننده", IIf(txtProducer_name.Text.Trim = "", "-", txtProducer_name.Text.Trim))
                dt.Rows.Add("نام خانوادگی تهیه کننده", IIf(txtProducer_family.Text.Trim = "", "-", txtProducer_family.Text.Trim))
                dt.Rows.Add("نام پدر تهیه کننده", IIf(txtProducer_father.Text.Trim = "", "-", txtProducer_father.Text.Trim))

                dt.Rows.Add("نام و نام خانوادگی مادر تهیه کننده", IIf(txtProducer_mother.Text.Trim = "", "-", txtProducer_mother.Text.Trim))

                dt.Rows.Add("شماره شناسنامه تهیه کننده", IIf(txtProducer_shsh.Text.Trim = "", "-", txtProducer_shsh.Text.Trim))
                dt.Rows.Add("کد ملی  تهیه کننده", IIf(txtProducer_codemeli.Text.Trim = "", "-", txtProducer_codemeli.Text.Trim))
                dt.Rows.Add("وضعیت تاهل تهیه کننده", IIf(txtProducer_marriage.Text.Trim = "", "-", txtProducer_marriage.Text.Trim))
                dt.Rows.Add("صادره از  تهیه کننده", IIf(txtProducer_borncity.Text.Trim = "", "-", txtProducer_borncity.Text.Trim))
                dt.Rows.Add("آدرس تهیه کننده", IIf(txtProducer_address.Text.Trim = "", "-", txtProducer_address.Text.Trim))
                dt.Rows.Add("کد پستی تهیه کننده", IIf(txtProducer_codepost.Text.Trim = "", "-", txtProducer_codepost.Text.Trim))
                dt.Rows.Add("تلفن ثابت تهیه کننده", IIf(txtProducer_phone.Text.Trim = "", "-", txtProducer_phone.Text.Trim))
                dt.Rows.Add("تلفن همراه تهیه کننده", IIf(txtProducer_cell.Text.Trim = "", "-", txtProducer_cell.Text.Trim))
                dt.Rows.Add("ایمیل تهیه کننده", IIf(txtProducer_email.Text.Trim = "", "-", txtProducer_email.Text.Trim))
                dt.Rows.Add("اینستاگرام تهیه کننده", IIf(txtProducer_instagram.Text.Trim = "", "-", txtProducer_instagram.Text.Trim))
                dt.Rows.Add("تاریخ تولد تهیه کننده", IIf(txtProducer_birthdate.Text.Trim = "", "-", txtProducer_birthdate.Text.Trim))
                dt.Rows.Add("وضعیت دانشجو بودن تهیه کننده", IIf(txtProducer_student.Text.Trim = "", "-", txtProducer_student.Text.Trim))
                dt.Rows.Add("محل تحصیل تهیه کننده", IIf(txtProducer_studentLocation.Text.Trim = "", "-", txtProducer_studentLocation.Text.Trim))
                dt.Rows.Add("شماره دانشجویی تهیه کننده", IIf(txtProducer_studentID.Text.Trim = "", "-", txtProducer_studentID.Text.Trim))
                dt.Rows.Add("آیا اولین فیلم تهیه کننده است یا خیر؟", IIf(txtProducer_debut.Text.Trim = "", "-", txtProducer_debut.Text.Trim))
                dt.Rows.Add("شغل و حرفه تهیه کننده", IIf(txtProducer_job.Text.Trim = "", "-", txtProducer_job.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("بیوگرافی تهیه کننده", IIf(txtProducerFilmpography_Bio.Text.Trim = "", "-", txtProducerFilmpography_Bio.Text.Trim))
                dt.Rows.Add("فیلموگرافی تهیه کننده", IIf(txtProducerFilmpography_Film.Text.Trim = "", "-", txtProducerFilmpography_Film.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("فیلمنامه نویس", IIf(txtCrew_writer.Text.Trim = "", "-", txtCrew_writer.Text.Trim))
                dt.Rows.Add("فیلمبردار", IIf(txtCrew_dop.Text.Trim = "", "-", txtCrew_dop.Text.Trim))
                dt.Rows.Add("صدابردار", IIf(txtCrew_sound.Text.Trim = "", "-", txtCrew_sound.Text.Trim))
                dt.Rows.Add("صداگذار", IIf(txtCrew_soundmixing.Text.Trim = "", "-", txtCrew_soundmixing.Text.Trim))
                dt.Rows.Add("گریم", IIf(txtCrew_makeup.Text.Trim = "", "-", txtCrew_makeup.Text.Trim))
                dt.Rows.Add("طراح لباس", IIf(txtCrew_custom.Text.Trim = "", "-", txtCrew_custom.Text.Trim))
                dt.Rows.Add("تدوینگر", IIf(txtCrew_editor.Text.Trim = "", "-", txtCrew_editor.Text.Trim))
                dt.Rows.Add("سرمایه گذار", IIf(txtCrew_investor.Text.Trim = "", "-", txtCrew_investor.Text.Trim))
                dt.Rows.Add("اقتباس از", IIf(txtCrew_adpation.Text.Trim = "", "-", txtCrew_adpation.Text.Trim))
                dt.Rows.Add("انیماتور", IIf(txtCrew_animator.Text.Trim = "", "-", txtCrew_animator.Text.Trim))
                dt.Rows.Add("جلوه های ویژه", IIf(txtCrew_vfx.Text.Trim = "", "-", txtCrew_vfx.Text.Trim))
                dt.Rows.Add("طراح پوستر", IIf(txtCrew_poster.Text.Trim = "", "-", txtCrew_poster.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("وضعیت موسیقی", IIf(txtMusic.Text.Trim = "", "-", txtMusic.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("بازیگر نقش اصلی مرد", IIf(txtCast_1.Text.Trim = "", "-", txtCast_1.Text.Trim))
                dt.Rows.Add("بازیگر نقش اصلی زن", IIf(txtCast_2.Text.Trim = "", "-", txtCast_2.Text.Trim))
                dt.Rows.Add("بازیگر", IIf(txtCast_3.Text.Trim = "", "-", txtCast_3.Text.Trim))
                dt.Rows.Add("بازیگر", IIf(txtCast_4.Text.Trim = "", "-", txtCast_4.Text.Trim))
                dt.Rows.Add("بازیگر", IIf(txtCast_5.Text.Trim = "", "-", txtCast_5.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                Dim WhereFrom As String = ""
                If rbIntroduction_friends.Checked Then WhereFrom = "دوستان و آشنایان"
                If rbIntroduction_google.Checked Then WhereFrom = "گوگل"
                If rbIntroduction_instagram.Checked Then WhereFrom = "اینستاگرام"
                If rbIntroduction_other.Checked Then WhereFrom = "سایر شبکه های مجازی"
                dt.Rows.Add("چگونگی آشنایی", WhereFrom)
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("پخش کننده قبلی", IIf(txtPreviousDistribution.Text.Trim = "", "-", txtPreviousDistribution.Text.Trim))
                dt.Rows.Add("*", "*") '************************************************'
                dt.Rows.Add("تاریخ ثبت فرم آنلاین", ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate))


                GridViewFinal.DataSource = dt
                GridViewFinal.DataBind()

        End Select
    End Sub

    Private Sub btnNextStep_Click(sender As Object, e As EventArgs) Handles btnNextStep.Click
        If MultiView.ActiveViewIndex = 21 Then 'درج فیلم جدید

            btnNextStep.Visible = True
            BtnPreviousStep.Visible = False
            lblSteps.Text = "(نسخه آنلاین)"
            btnNextStep.Text = "جهت شروع فرآیند پر کردن فرم‌های آنلاین کلیک کنید"

            txtNameFa.Text = ""
            txtNameFinglish.Text = ""
            txtNameEn.Text = ""
            txtTime_Minutes.Text = "00"
            txtTIme_Seconds.Text = "00"
            txtMainSpecifications_Language.Text = ""
            txtMainSpecifications_FilmSubtitle.Text = ""
            txtMainSpecifications_Country.Text = ""
            txtMainSpecifications_FilmProductionDate.Text = ""
            txtMainSpecifications_FilmVersion.Text = ""
            txtMainSpecifications_FilmAscept.Text = ""
            txtMainSpecifications_FilmResolution.Text = ""
            txtMainSpecifications_FilmFormat.Text = ""
            txtMainSpecifications_FilmCamera.Text = ""
            txtMainSpecifications_FilmColor.Text = ""
            txtMainSpecifications_FilmSound.Text = ""
            txtMainSpecifications_FilmBitrates.Text = ""
            txtMainSpecifications_FilmScope.Text = ""
            txtMainSpecifications_FilmTheme.Text = ""
            txtMainSpecifications_FilmGenre.Text = ""
            txtMainSpecifications_FilmWebsite.Text = ""
            txtMainSpecifications_FilmFacebook.Text = ""
            txtMainSpecifications_FilmTwitter.Text = ""
            txtMainSpecifications_FilmInstagram.Text = ""
            txtRepresented_Code.Text = ""
            txtSynopsis.Text = ""
            txtStatement.Text = ""
            txtDirector_name.Text = ""
            txtDirector_family.Text = ""
            txtDirector_father.Text = ""
            txtDirector_mother.Text = ""
            txtDirector_shsh.Text = ""
            txtDirector_codemeli.Text = ""
            txtDirector_marriage.Text = ""
            txtDirector_borncity.Text = ""
            txtDirector_address.Text = ""
            txtDirector_codepost.Text = ""
            txtDirector_phone.Text = ""
            txtDirector_cell.Text = ""
            txtDirector_email.Text = ""
            txtDirector_instagram.Text = ""
            txtDirector_birthdate.Text = ""
            txtDirector_student.Text = ""
            txtDirector_studentLocation.Text = ""
            txtDirector_studentID.Text = ""
            txtDirector_debut.Text = ""
            txtDirectorFilmpography_Bio.Text = ""
            txtDirectorFilmpography_Film.Text = ""
            txtProducer_name.Text = ""
            txtProducer_family.Text = ""
            txtProducer_father.Text = ""
            txtProducer_mother.Text = ""
            txtProducer_shsh.Text = ""
            txtProducer_marriage.Text = ""
            txtProducer_borncity.Text = ""
            txtProducer_address.Text = ""
            txtProducer_codepost.Text = ""
            txtProducer_phone.Text = ""
            txtProducer_cell.Text = ""
            txtProducer_email.Text = ""
            txtProducer_instagram.Text = ""
            txtProducer_birthdate.Text = ""
            txtProducer_student.Text = ""
            txtProducer_studentLocation.Text = ""
            txtProducer_studentID.Text = ""
            txtProducer_debut.Text = ""
            txtProducerFilmpography_Bio.Text = ""
            txtProducerFilmpography_Film.Text = ""
            txtCrew_writer.Text = ""
            txtCrew_dop.Text = ""
            txtCrew_sound.Text = ""
            txtCrew_soundmixing.Text = ""
            txtCrew_makeup.Text = ""
            txtCrew_custom.Text = ""
            txtCrew_editor.Text = ""
            txtCrew_investor.Text = ""
            txtCrew_adpation.Text = ""
            txtCrew_animator.Text = ""
            txtCrew_vfx.Text = ""
            txtCrew_poster.Text = ""
            txtMusic.Text = ""
            txtCast_1.Text = ""
            txtCast_2.Text = ""
            txtCast_3.Text = ""
            txtCast_4.Text = ""
            txtCast_5.Text = ""
            txtPreviousDistribution.Text = ""

            MultiView.ActiveViewIndex = 0

        ElseIf MultiView.ActiveViewIndex = 20 Then 'ثبت نهایی اطلاعات

            Dim _DLL As New DLL
            Dim Result As String = Nothing
            For i As Byte = 0 To GridViewFinal.Rows.Count - 1
                For j As Byte = 0 To 1
                    Result += GridViewFinal.Rows(i).Cells(j).Text & " | "
                Next
                Result = Result.Substring(0, Len(Result) - 3)
                Result += " ^ "
            Next
            Dim _ID As Long = _DLL.InsertTemporaryForms(Result.Substring(0, Len(Result) - 2))
            If _ID <> 0 Then
                BtnPreviousStep.Visible = False
                lblSteps.Text = "اطلاعات شما ثبت نهایی شده است"
                btnNextStep.Text = "درج اطلاعات فیلم جدید"
                lblSuccessful.Text = String.Format("اطلاعات شما به درستی با کد رهگیری ** {0} ** ارسال شده است. جهت پیگیری این کد را به همکاران بخش امور قراردادها تحویل دهید.", _ID)
                MultiView.ActiveViewIndex += 1
            End If
        ElseIf MultiView.ActiveViewIndex < 20 Then
            MultiView.ActiveViewIndex += 1
            Run()
        End If

    End Sub
    Private Sub BtnPreviousStep_Click(sender As Object, e As EventArgs) Handles BtnPreviousStep.Click
        If MultiView.ActiveViewIndex = 20 Then
            MultiView.ActiveViewIndex = 1
            btnNextStep.Text = "مرحله بعد"
            BtnPreviousStep.Text = "مرحله قبل"
        Else
            MultiView.ActiveViewIndex -= 1
            Run()
        End If
    End Sub

    Private Sub GridViewFinal_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewFinal.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            For Each cell As TableCell In e.Row.Cells
                If cell.Text.Trim = "*" Then
                    e.Row.BackColor = System.Drawing.Color.Orange
                End If
            Next
        End If
    End Sub

End Class
