
Partial Class CMS_Pages_Default2
    Inherits System.Web.UI.Page

    Dim DL_CMS As New DLL_CMS

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Case Request.QueryString("type")
            Case "list"
                divList.Visible = True
                divFestival.Visible = False
            Case "comment"
                divList.Visible = False
                divFestival.Visible = True

                DL_CMS.UpdateMakeReadCommentByPostId(Request.QueryString("idPost"), 1)
                lblText.Text = DL_CMS.getTextComment(Request.QueryString("id"))

            Case Else
                divList.Visible = True
                divFestival.Visible = False
        End Select
    End Sub

    Public Function getDate(e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e, ShamsiDate.ShowType.LongDate)
    End Function

    Public Sub SetEnable(sender As Object, e As CommandEventArgs)
        DL_CMS.UpdateEnableDisableComment(True, Val(e.CommandArgument.ToString))
        DataListSubComment.DataBind()
    End Sub
    Public Sub SetDsiable(sender As Object, e As CommandEventArgs)
        DL_CMS.UpdateEnableDisableComment(False, Val(e.CommandArgument.ToString))
        DataListSubComment.DataBind()
    End Sub

    Public Function getSection(section As Object, id_post As Object) As String
        Select Case section.ToString
            Case "0"
                Return "قسمت پست ها" + "<br/><a target='_blank' style='color:green' href='../../" + id_post.ToString + "'>مشاهده</a>"
            Case "1"
                Return "قسمت پخش فیلم" + "<br/><a target='_blank' style='color:green' href='../../پخش-و-ارسال-فیلم'>مشاهده</a>"
            Case "2"
                Return "قسمت قوانین و مقررات" + "<br/><a target='_blank' style='color:green' href='../../قوانین-و-مقررات'>مشاهده</a>"
            Case "3"
                Return "قسمت هزینه ها" + "<br/><a target='_blank' style='color:green' href='../../هزینه-پخش-بین-المللی-فیلم'>مشاهده</a>"
            Case "4"
                Return "قسمت مشاوره" + "<br/><a target='_blank' style='color:green' href='../../مشاوره-پخش-بین-المللی-فیلم'>مشاهده</a>"
            Case "5"
                Return "قسمت رسانه سازی" + "<br/><a target='_blank' style='color:green' href='../../رسانه-سازی-پخش-فیلم'>مشاهده</a>"
            Case "6"
                Return "قسمت سرویسها" + "<br/><a target='_blank' style='color:green' href='../../سرویس-های-پخش-فیلم'>مشاهده</a>"
            Case "7"
                Return "MOVIBETA" + "<br/><a target='_blank' style='color:green' href='../../movibeta'>movibeta</a>"
            Case "8"
				Return "قسمت فستیوال‌ها" + "<br/><a target='_blank' style='color:green' href='../../festival/" + id_post.ToString + "'>مشاهده</a>"
			Case "9"
				Return "قسمت استخدامی" + "<br/><a target='_blank' style='color:green' href='../../موقعیت-شغلی-استخدام-در-درگاه-فیلم-ایران/'>مشاهده</a>"
		End Select
    End Function

    Protected Sub btnList_Click(sender As Object, e As System.EventArgs) Handles btnList.Click
        Response.Redirect("Comments")
    End Sub

    Protected Sub btnInsertAdminComment_Click(sender As Object, e As System.EventArgs) Handles btnInsertAdminComment.Click
        Dim dl As New DLL
        Dim em As New Email

        Dim Sec As String = ""
        Select Case Request.QueryString("Sections").ToString
            Case "0"
                Sec = "http://iranfilmport.com/" + Request.QueryString("idPost").ToString
            Case "1"
                Sec = "http://iranfilmport.com/پخش-و-ارسال-فیلم"
            Case "2"
                Sec = "http://iranfilmport.com/قوانین-و-مقررات"
            Case "3"
                Sec = "http://iranfilmport.com/هزینه-پخش-بین-المللی-فیلم"
            Case "4"
                Sec = "http://iranfilmport.com/مشاوره-پخش-بین-المللی-فیلم"
            Case "5"
                Sec = "http://iranfilmport.com/رسانه-سازی-پخش-فیلم"
            Case "6"
                Sec = "http://iranfilmport.com/سرویس-های-پخش-فیلم"
            Case "7"
                Sec = "http://iranfilmport.com/movibeta'"
            Case "8"
                Sec = "http://iranfilmport.com/festival/" + Request.QueryString("idPost").ToString
        End Select
        Dim msg As String = "درود" + "<br/>" + "پاسخی به کامنت شما داده شده است." + "<br/>" + "با تشکر" + "<br/>" + "درگاه فیلم ایران"

        em.SendMail(Request.QueryString("Email"), msg, "پاسخ به کامنت", Sec)
        dl.InsertComment(Request.QueryString("Sections"), Request.QueryString("idPost"),
                         Request.QueryString("id"), txtCommentAdmin.Text.Trim.Replace(ControlChars.Lf, "<br/>"), "", "", True, 1)
        txtCommentAdmin.Text = ""
        DataListSubComment.DataBind()

    End Sub

    Public Sub SetReadEnable(sender As Object, e As CommandEventArgs)
        DL_CMS.UpdateReadEnableDisableComment(True, Val(e.CommandArgument.ToString))
        dgList.DataBind()
    End Sub
    Public Sub SetReadDsiable(sender As Object, e As CommandEventArgs)
        DL_CMS.UpdateReadEnableDisableComment(False, Val(e.CommandArgument.ToString))
        dgList.DataBind()
    End Sub

    Public Sub DeleteSubComment(sender As Object, e As CommandEventArgs)
        DL_CMS.DeleteComment(Val(e.CommandArgument.ToString))
        DataListSubComment.DataBind()
    End Sub

	Public Function ReadUnread(count As Object) As System.Drawing.Color
		If Val(count) > 0 Then
			Return System.Drawing.Color.Red
		Else
			Return System.Drawing.Color.Green
		End If

	End Function

End Class
