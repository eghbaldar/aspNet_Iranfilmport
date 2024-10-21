Imports System.IO

Partial Class dashboard_aproject
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
		If Not IsPostBack Then loaddata()
	End Sub

	Sub loaddata()
		Dim DLL As New DLL_Dashboard

		If Not Convert.ToBoolean(DLL.ShowProject(RouteData.Values("id")).Tables(0).Rows(0)("Status")) Then 'تائید نشده است
			MultiView.ActiveViewIndex = 2
			MultiView_Photo.ActiveViewIndex = 1
			MultiView_Link.ActiveViewIndex = 1
			MultiView_Turth.ActiveViewIndex = 1
			Exit Sub
		End If

		Select Case DLL.ShowProject(RouteData.Values("id")).Tables(0).Rows(0)("type")
			Case "1" 'فیلم
				MultiView.ActiveViewIndex = 0
				MultiView_Photo.ActiveViewIndex = 0
				cmdType.Visible = True
				'-------------------------------------
				With DLL.ShowProject(RouteData.Values("id")).Tables(0)
					txt_Film_NameF.Text = .Rows(0)("namef").ToString
					txt_Film_NameEn.Text = .Rows(0)("namee").ToString
					txt_Film_summaryF.Text = .Rows(0)("SynopsisF").ToString
					txt_Film_summaryEn.Text = .Rows(0)("SynopsisE").ToString
					txt_Film_PageLink.Text = .Rows(0)("PageLink").ToString
					txt_Film_Director.Text = .Rows(0)("Director").ToString
					txt_Film_writer.Text = .Rows(0)("Writer").ToString
					txt_Film_producer.Text = .Rows(0)("Producer").ToString
					txt_Film_castcrew.Text = .Rows(0)("OtherCastCrew").ToString

					Dim value As DateTime = DateTime.ParseExact((.Rows(0)("ProductDate")), "d", Nothing)
					cmd_Year.SelectedValue = Val(value.Year.ToString())
					cmd_Month.SelectedValue = Val(value.Month.ToString())
					cmd_Day.SelectedValue = Val(value.Day.ToString())

					txtLink.Text = .Rows(0)("link").ToString
					txtPass.Text = .Rows(0)("passlink").ToString
					'--------------- Project and page name
					lblProjectName.Text = String.Format("{0}", .Rows(0)("namef").ToString)
					Me.Title = String.Format("درگاه فیلم ایران | پروژه: {0}", .Rows(0)("namef").ToString)
					'--------------- Truth
					If Convert.ToBoolean(.Rows(0)("truth")) Then
						imgTruth.ImageUrl = "~/files/images/logos/confidence_logo.png"
						lblTruth.ForeColor = Drawing.Color.Green
						lblTruth.Text = String.Format("اثر شما دارای {0} می باشد.", "<a target='_blank' href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد اعتماد درگاه فیلم ایران</a>")
					Else
						imgTruth.ImageUrl = "~/dashboard/assets/img/suspend.png"
						lblTruth.ForeColor = Drawing.Color.Red
						lblTruth.Text = String.Format("جهت اخذ {0} ، فیلم و یا فیلمنامه خود را ارسال کنید.", "<a target='_blank' href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد اعتماد درگاه فیلم ایران</a>")
					End If

				End With
			Case "2" 'فیلمنامه
				MultiView.ActiveViewIndex = 1
				'Panel_Photo.Visible = False
				cmdTypeScript.Visible = True

				With DLL.ShowProject(RouteData.Values("id")).Tables(0)
					txt_Screenplay_NameF.Text = .Rows(0)("namef").ToString
					txt_Screenplay_NameEn.Text = .Rows(0)("namee").ToString
					txt_Screenplay_summaryF.Text = .Rows(0)("SynopsisF").ToString
					txt_Screenplay_summaryEn.Text = .Rows(0)("SynopsisE").ToString
					txt_Screenplay_writer.Text = .Rows(0)("Writer").ToString
					txt_Screenplay_detail.Text = .Rows(0)("OtherCastCrew").ToString
					'--------------- Truth
					If Convert.ToBoolean(.Rows(0)("truth")) Then
						imgTruth.ImageUrl = "~/files/images/logos/confidence_logo.png"
						lblTruth.ForeColor = Drawing.Color.Green
						lblTruth.Text = String.Format("اثر شما دارای {0} می باشد.", "<a target='_blank' href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد اعتماد درگاه فیلم ایران</a>")
					Else
						imgTruth.ImageUrl = "~/dashboard/assets/img/suspend.png"
						lblTruth.ForeColor = Drawing.Color.Red
						lblTruth.Text = String.Format("جهت اخذ {0} ، فیلم و یا فیلمنامه خود را ارسال کنید.", "<a target='_blank' href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد اعتماد درگاه فیلم ایران</a>")
					End If
				End With
		End Select
	End Sub

	Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
		Dim errorText As String = "<div class='alert alert-danger' role='alert'>{0}</div>"
		Dim DLL As New DLL_Dashboard
		If FilePhoto.HasFile Then

			If CheckFileExtension(FilePhoto.FileName) Then

				If FilePhoto.PostedFile.ContentLength < 150000 Then
					If DLL.CheckMorePhotos(RouteData.Values("id"), 1) And cmdType.SelectedValue = 1 Then
						lblStatus.Text = String.Format(errorText, "پوستر فیلم یا کاور فیلمنامه قبلا اضافه شده است.")
						Exit Sub
					End If

					If DLL.CheckMorePhotos(RouteData.Values("id"), 2) And cmdType.SelectedValue = 2 Then
						lblStatus.Text = String.Format(errorText, "تعداد عکس صحنه کافی است.")
						Exit Sub
					End If

					If DLL.CheckMorePhotos(RouteData.Values("id"), 3) And cmdType.SelectedValue = 3 Then
						lblStatus.Text = String.Format(errorText, "تعداد عکس پشت صحنه کافی است.")
						Exit Sub
					End If

					Dim FN As String = Guid.NewGuid.ToString + Path.GetExtension(FilePhoto.FileName)
					FilePhoto.SaveAs(MapPath("~/files/UploadFiles/ProjectPhotos/" + FN))
					If IsValidImageSignature(MapPath("~/files/UploadFiles/ProjectPhotos/" + FN)) Then
						DLL.InsertProjectPhotos(RouteData.Values("id"), FN, cmdType.SelectedValue)
						DL_Photos.DataBind()
						lblStatus.Text = ""
					Else
						IO.File.Delete(MapPath("~/files/UploadFiles/ProjectPhotos/" + FN))
						lblStatus.Text = String.Format(errorText, "فایل شما تصویر نیست! هکر هستید؟.")
					End If

				Else
					lblStatus.Text = String.Format(errorText, "حجم و اندازه تصویر انتخاب شده صحیح نمی باشد.")
				End If

			Else
				lblStatus.Text = String.Format(errorText, "فرمت استاندارد JPG می باشد.")
			End If

		End If
	End Sub

	Public Function IsValidImageSignature(filePath As String) As Boolean
		Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".bmp"}

		Dim validImageSignatures As New Dictionary(Of String, Byte()) From
			{
				{"jpg", New Byte() {&HFF, &HD8}},
				{"jpeg", New Byte() {&HFF, &HD8}},
				{"png", New Byte() {&H89, &H50, &H4E, &H47}},
				{"bmp", New Byte() {&H42, &H4D}}
			}

		Dim extension As String = Path.GetExtension(filePath).ToLower()
		If Not validExtensions.Contains(extension) Then
			Return False
		End If

		Dim expectedSignature As Byte() = validImageSignatures(extension.TrimStart("."c))
		Dim fileSignature As Byte() = New Byte(expectedSignature.Length - 1) {}

		Using fs As New FileStream(filePath, FileMode.Open, FileAccess.Read)
			fs.Read(fileSignature, 0, fileSignature.Length)
		End Using

		Return fileSignature.SequenceEqual(expectedSignature)
	End Function


	Protected Sub btnInsertLink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertLink.Click
		Dim DL As New DLL_Dashboard
		DL.UpdateProjectLink(RouteData.Values("id"), txtLink.Text.Trim, txtPass.Text.Trim)
	End Sub

	Protected Sub btnUpdateFilm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateFilm.Click

		Dim dl As New DLL_Dashboard

		Dim nameF As String = txt_Film_NameF.Text.Trim
		Dim nameE As String = txt_Film_NameEn.Text.Trim
		Dim sysF As String = txt_Film_summaryF.Text.Trim
		Dim sysE As String = txt_Film_summaryEn.Text.Trim
		Dim ProductDate As Date = New Date(Val(cmd_Year.SelectedValue), Val(cmd_Month.SelectedValue), Val(cmd_Day.SelectedValue))
		Dim Link As String = txt_Film_PageLink.Text.Trim
		Dim director As String = txt_Film_Director.Text.Trim
		Dim writter As String = txt_Film_writer.Text.Trim
		Dim producer As String = txt_Film_producer.Text.Trim
		Dim other As String = txt_Film_castcrew.Text.Trim

		dl.UpdateProject(nameF, nameE, sysF, sysE, ProductDate, Link, director, writter, producer, other, Val(RouteData.Values("id")))

		loaddata()

	End Sub

	Protected Sub btnUpdateScreenplay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateScreenplay.Click
		Dim dl As New DLL_Dashboard

		Dim nameF As String = txt_Screenplay_NameF.Text.Trim
		Dim nameE As String = txt_Screenplay_NameEn.Text.Trim
		Dim sysF As String = txt_Screenplay_NameF.Text.Trim
		Dim sysE As String = txt_Screenplay_summaryEn.Text.Trim
		Dim writter As String = txt_Screenplay_writer.Text.Trim
		Dim other As String = txt_Screenplay_detail.Text.Trim

		dl.UpdateProject(nameF, nameE, sysF, sysE, Now, "", "", writter, "", other, Val(RouteData.Values("id")))

		loaddata()

	End Sub

	Public Sub DeletePhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
		Dim dl As New DLL_Dashboard
		dl.DeleteProjectPhoto(Val(e.CommandArgument.ToString))
		DL_Photos.DataBind()
	End Sub

	Protected Sub btnDeleteProject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteProject.Click
		Dim dl As New DLL_Dashboard
		dl.DeleteProject(Val(RouteData.Values("id")))
		Response.Redirect("~/dashboard/user/me/projects")
	End Sub

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

