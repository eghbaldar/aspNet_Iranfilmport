
Partial Class kingCostInquiry
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
			If Request.QueryString("lang").Trim.ToLower = "en" Then
				Title = "IRAN FLLM PORT POSTER SUBTITLE Cost Inquiry"
				Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
				lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT POSTER SUBTITLE Cost Inquiry" + "</span>"
			Else
				Title = "استعلام هزینه طراحی پوستر و زیرنویس فیلم"
				Page.MetaDescription = "طراحی پوستر فیلم کوتاه - طراحی پوستر فیلم سینمایی - زیرنویس حک شده فیلم - ترجمه زیرنویس - اس آر تی "
				lblTopTitle.Text = "<span style='font-family:Titr;'>" + "ارسال فیلم و فیلمنامه به درگاه فیلم ایران" + "</span>"
			End If
		Else
			Title = "استعلام هزینه طراحی پوستر و زیرنویس فیلم"
			lblTopTitle.Text = "<span style='font-family:Titr;'>" + "استعلام هزینه طراحی پوستر و زیرنویس فیلم" + "</span>"
			Page.MetaDescription = "طراحی پوستر فیلم کوتاه - طراحی پوستر فیلم سینمایی - زیرنویس حک شده فیلم - ترجمه زیرنویس - اس آر تی "
		End If
	End Sub

	Private Sub btnPoster_Click(sender As Object, e As EventArgs) Handles btnPoster.Click

		Dim dimen_2d As Integer = IIf(rbDimenation2D.Checked, 2000000, 0)
		Dim dimen_3d As Integer = IIf(rbDimenation3D.Checked, 4000000, 0)

		Dim StyleFullPaint As Integer = IIf(rbStyleFullPaint.Checked, 3000000, 0)
		Dim StyleHandCollage As Integer = IIf(rbStyleHandCollage.Checked, 2500000, 0)
		Dim StyleDigitalCollage As Integer = IIf(rbStyleDigitalCollage.Checked, 3000000, 0)
		Dim StyleStill As Integer = IIf(rbStyleStill.Checked, 1000000, 0)

		Dim LogoType As Integer = IIf(chkLogoType.Checked, 1500000, 0)

		Dim angFa As Integer = IIf(rbLangFa.Checked, 1000000, 0)
		Dim LangEn As Integer = IIf(rbLangEn.Checked, 1000000, 0)
		Dim LangBoth As Integer = IIf(rbLangBoth.Checked, 2000000, 0)

		Dim LogoMotion As Integer = IIf(chkLogoMotion.Checked, 4000000, 0)

		Dim Client As Integer = IIf(chkClient.Checked, -2000000, 0)

		Dim Result = dimen_2d + dimen_3d + StyleFullPaint + StyleHandCollage + StyleDigitalCollage + StyleStill +
			LogoType + angFa + LangEn + LangBoth + LogoMotion + Client

		ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myJsFn", "showCost('" + Result.ToString("N0") + " تومان');", True)
	End Sub

	Private Sub btnSubtitle_Click(sender As Object, e As EventArgs) Handles btnSubtitle.Click


		If txtWordsCount.Text.Length = 0 Then
			ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myJsFn", "showCost('تعداد کلمات دیالوگ‌های فارسی را وارد کنید');", True)
		End If
		For Each ch As Char In txtWordsCount.Text
			If Not "0123456789".Contains(ch) Then
				ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myJsFn", "showCost('فقط عدد وارد کنید!');", True)
			End If
		Next

		Dim cost As Integer = Val(txtWordsCount.Text) * 1000

		Dim Burnt As Integer = IIf(rbBurnt.Checked, 800000, 0)
		Dim Srt As Integer = IIf(rbSrt.Checked, 600000, 0)
		Dim BurntSrt As Integer = IIf(rbBurntSrt.Checked, 1300000, 0)

		Dim Client As Integer = IIf(chkSrtClient.Checked, -200000, 0)

		Dim Result = cost + Burnt + Srt + BurntSrt + Client

		ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myJsFn", "showCost('" + Result.ToString("N0") + " تومان');", True)
	End Sub



End Class
