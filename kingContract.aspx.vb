
Partial Class kingContract
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
			If Request.QueryString("lang").Trim.ToLower = "en" Then
				Title = "IRAN FLLM PORT - Contract"
				Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
				lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Contract" + "</span>"
				Try
					Dim ds As New DLL_CMS
					lbl.Text = ds.ShowAgent(False)
				Catch ex As Exception
				End Try
			Else
				Title = "قراردادها - درگاه فیلم ایران"
				Page.MetaDescription = "انتشار خبر سینمایی و فیلمنامه و تبلیغات در درگاه فیلم ایران "
				lblTopTitle.Text = "<span style='font-family:Titr;'>" + "قراردادها - درگاه فیلم ایران" + "</span>"
				Try
					Dim ds As New DLL_CMS
					lbl.Text = ds.ShowAgent(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
				Catch ex As Exception
				End Try
			End If
		Else
			Title = "قراردادها - درگاه فیلم ایران"
			lblTopTitle.Text = "<span style='font-family:Titr;'>" + "قراردادها - درگاه فیلم ایران" + "</span>"
			Page.MetaDescription = "انتشار خبر سینمایی و فیلمنامه و تبلیغات در درگاه فیلم ایران "
		End If
		Try
			RegisteredDraft.Attributes.Remove("class")
			If Not String.IsNullOrEmpty(Page.RouteData.Values("id")) Then
				Dim DL As New DLL
				If DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows.Count > 0 Then
					lblTempContractInformation_regDate.Text = ShamsiDate.Miladi2Shamsi(DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows(0)(3).ToString, ShamsiDate.ShowType.LongDate)
					RegisteredDraft.Visible = True
					NotRegistered.Visible = False
					Select Case DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows(0)(2).ToString
						Case 0
							RegisteredDraft.Attributes.Add("class", "alert alert-warning")
							lblTempContractInformation_status.Text = "این قرارداد/نامه رسمی «ثبت اولیه» شده است." + "<br/>" + "<div style='direction:ltr;text-align:left;'>This contract/official letter was marked as 'Draft'.</div>"
						Case 1
							RegisteredDraft.Attributes.Add("class", "alert alert-success")
							lblTempContractInformation_status.Text = "این قرارداد/نامه رسمی در سامانه ثبت رسمی شده است." + "<br/>" + "<div style='direction:ltr;text-align:left;'>This contract/official letter is marked as 'Has Been Final'.</div>"
					End Select
					lblTempContractInformation_contractNumber.Text = DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows(0)(1).ToString
				Else
					RegisteredDraft.Visible = False
					NotRegistered.Attributes.Add("class", "alert alert-danger")
					NotRegistered.Visible = True
					lblwarning.Text = String.Format("قرارداد/نامه رسمی‌ای با شماره {0} به ثبت نرسیده است." + "<br/>" + "<div style='direction:ltr;text-align:left;'>This contract/official is not recorded yet.</div>", Page.RouteData.Values("id"))
				End If
			End If
		Catch ex As Exception

		End Try
	End Sub
End Class
