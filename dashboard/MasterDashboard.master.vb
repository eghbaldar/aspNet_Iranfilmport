
Partial Class dashboard_MasterDashboard
    Inherits System.Web.UI.MasterPage

    Dim DLLd As New DLL_Dashboard

    Protected Sub btnSignOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignOut.Click        
        If (Not Request.Cookies("IFP") Is Nothing) Then
            Dim myCookie As HttpCookie
            myCookie = New HttpCookie("IFP")
            myCookie("email") = ""
            DLLd._Email_ = String.Empty
            myCookie.Expires = DateTime.Now.AddDays(-1D)
            Response.Cookies.Add(myCookie)
            Response.Redirect("~\")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '''''''''''''' age cookie khali bod
        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        If DLLd._Email_ Is Nothing Then DLLd._Email_ = Request.Cookies("IFP").Item("email")
        ''''''''''''''''''''''''''''''''''            
        If Not IsPostBack Then
			lblName.Text = String.Format("{0}", "<span style='color:#ECCE01;font-weight:bold;'>" + DLLd.GetNameWithEmail(DLLd._Email_)).Replace("ي", "ی") + "</span>"
			'lblWallet.Text = "کیف پول شما: " + "<span style='color:black;font-weight:bold;'>" + IIf(DLLd.getWallet(DLLd._Email_) Is Nothing, "0", Val(DLLd.getWallet(DLLd._Email_)).ToString("N0")) + "</span>" + " تومان"
			'--------------------------------- notification
			'lbl_notification_project.Text = DLLd.showNotification(DLLd._Email_, 4)
			'lbl_notification_festivals.Text = DLLd.showNotification(DLLd._Email_, 2)
			'lbl_notification_notPaid.Text = DLLd.showNotification(DLLd._Email_, 3)
			'lbl_notification_msg.Text = DLLd.showNotification(DLLd._Email_, 1)
			'''''''''''''' age karbar madarek ersal konad moalagh mishavad
			With DLLd.ShowInformation(DLLd._Email_).Tables(0)
                If Val(.Rows(0)("statususer").ToString) = 0 Then warning.Visible = True
				''''''''''''''''''''''''''''''''''''''''''''
				'PnlHeader.BackImageUrl = "~\files\uploadFiles\PhotoHeaderUsers\" + .Rows(0)("headerphoto").ToString()
				''''''''''''''''''''''''''''''''''''''''''''
				Select Case .Rows(0)("StatusUser").ToString()
                    Case "1"
						lblStatus.Text = "<span style='color:#818181;font-weight:bold;'>پروفایل تایید شده است</span>"
					Case "2"
						lblStatus.Text = "<span style='color:#818181;font-weight:bold;'>محروم شده</span>"
					Case "3"
						lblStatus.Text = "<span style='color:#818181;font-weight:bold;'>پروفایل دارای نماد اعتماد است</span>"
					Case "0"
						lblStatus.Text = "<span style='color:#818181;font-weight:bold;'>پروفایل معلق شده است</span>"
				End Select

                lblInfoUsername.Text = String.Format("شما از طریق لینک {0} می توانید وارد پروفایل خود شوید و لینک آن را  شبکه‌های مجازی به اشتراک بگذارید.", "<a target='_blank' href='http:\\iranfilmport.com\filmmaker\" + .Rows(0)("username").ToString().Trim + "'>iranfilmport.com\filmmaker\" + .Rows(0)("username").ToString() + "</a>")

            End With
        End If


        'Dim DLL As New DLL_Dashboard
        'imgAvatar.ImageUrl = "~/files/UploadFiles/PhotoHeaderUsers/" + DLL.ShowInformation(DLL_Dashboard._Email_).Tables(0).Rows(0)("Personalphoto").ToString
        'lblName.Text = DLL.ShowInformation(DLL_Dashboard._Email_).Tables(0).Rows(0)("engName") '& " " & DLL.ShowInformation(DLL_Dashboard._Email_).Tables(0).Rows(0)("lastname").ToString

    End Sub

    Public Function getProfileLink() As String
        Dim DLL As New DLL_Dashboard
        Return "filmmaker/" + DLL.ShowInformation(DLLd._Email_).Tables(0).Rows(0)("username").ToString
    End Function

End Class

