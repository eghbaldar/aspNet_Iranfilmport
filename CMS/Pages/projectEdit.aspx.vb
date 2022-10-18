
Partial Class CMS_Pages_projectEdit
    Inherits System.Web.UI.Page

    Dim EMAIL As New Email

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then loaddata()
    End Sub

    Sub loaddata()
        Dim DLL As New DLL_Dashboard        
        If Not Convert.ToBoolean(DLL.ShowProject(Request.QueryString("id")).Tables(0).Rows(0)("Status")) Then
            pnl_status.BackColor = Drawing.Color.Red
        Else
            pnl_status.BackColor = Drawing.Color.Green
        End If

        Select Case DLL.ShowProject(Request.QueryString("id")).Tables(0).Rows(0)("type")
            Case "1" 'فیلم
                MultiView_FilmOrScript.ActiveViewIndex = 0
                '-------------------------------------
                With DLL.ShowProject(Request.QueryString("id")).Tables(0)
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
                    'lblProjectName.Text = String.Format("پروژه: {0}", .Rows(0)("namef").ToString)
                    Me.Title = String.Format("درگاه فیلم ایران | پروژه: {0}", .Rows(0)("namef").ToString)
                    '--------------- Truth
                    If Convert.ToBoolean(.Rows(0)("truth")) Then
                        imgTruth.ImageUrl = "~/files/images/logos/confidence_logo.png"
                        lblTruth.ForeColor = Drawing.Color.Green
                        lblTruth.Text = "فیلم شما دارای نماد اعتماد درگاه می باشد."
                    ElseIf Not Convert.ToBoolean(.Rows(0)("truth")) Then
                        imgTruth.ImageUrl = "~/dashboard/assets/img/suspend.png"
                        lblTruth.ForeColor = Drawing.Color.Red
                        lblTruth.Text = "جهت برخورداری از سرویس ها و امکانات پخش فیلم درگاه، فیلم خود را به یکی از روش های زیر ارسال کرده تا با اخذ نماد اعتماد بتوانید از خدمات درگاه استفاده کنید."
                    End If

                End With
            Case "2" 'فیلمنامه
                MultiView_FilmOrScript.ActiveViewIndex = 1
                With DLL.ShowProject(Request.QueryString("id")).Tables(0)
                    txt_Screenplay_NameF.Text = .Rows(0)("namef").ToString
                    txt_Screenplay_NameEn.Text = .Rows(0)("namee").ToString
                    txt_Screenplay_summaryF.Text = .Rows(0)("SynopsisF").ToString
                    txt_Screenplay_summaryEn.Text = .Rows(0)("SynopsisE").ToString
                    txt_Screenplay_writer.Text = .Rows(0)("Writer").ToString
                    txt_Screenplay_detail.Text = .Rows(0)("OtherCastCrew").ToString

                End With
        End Select
    End Sub

    Public Sub btnStatusOk(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim dl As New DLL_CMS
        dl.UpdateStatusProjectPhotos(Val(e.CommandArgument), 1)
        DL_Photos.DataBind()
    End Sub
    Public Sub btnStatusNOk(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim dl As New DLL_CMS
        dl.UpdateStatusProjectPhotos(Val(e.CommandArgument.ToString), 0)
        DL_Photos.DataBind()
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub btnTruthOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTruthOK.Click
        Dim dl As New DLL_CMS
        dl.UpdateProjectTruth(Request.QueryString("id"), 1)
        loaddata()
        EMAIL.SendMail(Request.QueryString("email"), "فیلمساز عزیز؛ پروژه شما توسط کارشناسان پخش، نماد اعتماد درگاه فیلم ایران را کسب کرد. هم اکنون شما میتوانید پروژه خود را به فستیوال ها ارسال کنید. از لینک زیر فستیوال ها قابل مشاهده بوده و می توانید فیلم خود را ارسال کنید. با تشکر", "کسب نماد اعتماد پروژه", "http://iranfilmport.com/جشنواره-های-فیلم-کوتاه-بلند")
    End Sub
    Protected Sub btnTruthNok_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTruthNok.Click
        Dim dl As New DLL_CMS
        dl.UpdateProjectTruth(Request.QueryString("id"), 0)
        loaddata()
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub btnStatusProjectOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnStatusProjectOK.Click
        Dim dl As New DLL_CMS
        dl.UpdateStatusProject(Request.QueryString("id"), 1)
        loaddata()
        EMAIL.SendMail(Request.QueryString("email"), "فیلمساز عزیز، پروژه شما با موفقیت تائید شده است. لطفا هر چه سریعتر نسبت به ارسال آن اقدام کنید تا با کسب نماد اعتماد از خدمات درگاه استفاده کنید. همچنین پوستر و تصاویر پشت صحنه پروژه فیلم خود را نیز ارسال کنید تا در پروفایل خارجی در دسترس همگان قرار بگیرد. شما از لینک زیر میتوانید به پروژه های خود دسترسی داشته باشید. با تشکر", "تائید پروژه جدید", "http://iranfilmport.com/dashboard/user/me/projects")
    End Sub
    Protected Sub btnStatusProjectNok_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnStatusProjectNok.Click
        Dim dl As New DLL_CMS
        dl.UpdateStatusProject(Request.QueryString("id"), 0)    
        loaddata()
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        MultiView.ActiveViewIndex = 0
    End Sub

    Public Sub DeletePhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim dl As New DLL_Dashboard
        dl.DeleteProjectPhoto(Val(e.CommandArgument.ToString))
        DL_Photos.DataBind()
    End Sub

    Protected Sub btnSendConfirmationPhotos_Click(sender As Object, e As System.EventArgs) Handles btnSendConfirmationPhotos.Click
        EMAIL.SendMail(Request.QueryString("email"), "فیلمساز عزیز، تصاویر پروژه های شما تائید شده است. لطفا جهت مشاهده پروژه خود روی لینک زیر کلیک کنید.", "تائید تصاویر پروژه", "http://iranfilmport.com/dashboard/user/me/projects")
        btnSendConfirmationPhotos.Text = "ارسال شد"
        btnSendConfirmationPhotos.Enabled = False
    End Sub

End Class
