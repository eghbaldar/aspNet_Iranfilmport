
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Net

Partial Class CMS_Pages_commentClients
    Inherits System.Web.UI.Page

    Dim DL_Panel As New DLL_Panel
    Dim Email As New Email
    Dim sms As New SMS

    Public Function GetFilmFestival(id_submission As Object) As String
        Return DL_Panel.GetFilmFestival(id_submission)
    End Function
    Public Function GetSection(section As Object) As String
        Select Case Val(section)
            Case 0
                Return "امور فستیوال‌ها و مسائل فنی پخش"
            Case 1
                Return "امور مالی"
            Case 2
                Return "روابط عمومی"
            Case 3
                Return "امور فنی سایت"
        End Select
    End Function
    Public Function GetFlagBackground(flag As Object) As System.Drawing.Color
        Select Case Val(flag)
            Case 0
                'Return "ارسال نشده"
            Case 1
                Return System.Drawing.Color.Red
            Case 2
                Return System.Drawing.Color.Green
            Case 3
                Return System.Drawing.Color.LightGray
        End Select
    End Function
    Public Function GetFlag(flag As Object) As String
        Select Case Val(flag)
            Case 0
                'Return "ارسال نشده"
            Case 1
                Return "در حال بررسی"
            Case 2
                Return "پاسخ داده شده"
            Case 3
                Return "بسته شده"
        End Select
    End Function
    Public Function GetDate(data As Object) As String
        Return ShamsiDate.Miladi2Shamsi(data, ShamsiDate.ShowType.LongDate) & " | " & Convert.ToDateTime(data).TimeOfDay.ToString("hh':'mm':'ss")
    End Function
    Public Sub Ticket(sender As Object, e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Response.Redirect("commentClients?id=" & s(0) + "&Status=" + s(1) + "&id_client=" + s(2))

    End Sub
    Public Function GetWhich(obj As Object) As String
        If obj <> 0 Then
            Return "پاسخ فیلمساز /  فیلمنامه نویس"
        Else
            Return "پاسخ کارشناس"
        End If
    End Function
    Public Function GetAdminClientBackground(obj As Object) As System.Drawing.Color
        If Val(obj) = 0 Then
            Return System.Drawing.Color.FromName("#fff4bf")
        Else
            Return System.Drawing.Color.FromName("#f0f0f0")
        End If
    End Function
    Public Sub GetFlag()
        Select Case Val(Request.QueryString("Status"))
            Case 0
                'Return "ارسال نشده"
            Case 1
                lblStatus.Text = "در حال بررسی"
            Case 2
                lblStatus.Text = "پاسخ داده شده"
            Case 3
                lblStatus.Text = "بسته شده"
        End Select
    End Sub

    Private Sub SendSMS(PaternId As String, customerid As Long)
        sms.SendSms(DL_Panel.GetPhoneCustomer(customerid), PaternId, "name", DL_Panel.GetNameCustomer(customerid))
    End Sub

    Private Sub btnResponse_Click(sender As Object, e As EventArgs) Handles btnResponse.Click
        If txtResponse.Text.Length <> 0 Then

            Try
                DL_Panel.InsertCommentClientResponse(0, Val(Page.Request.QueryString("id")),
                                      convertNumFatoEn(txtResponse.Text.Trim.Replace(ControlChars.Lf, "<br/>")), 2, 0, 0, "")
            Catch ex As Exception
                lblResult.Text += "Err: Insert" + "</br>"
            End Try
            Try
                SendSMS("d4hbplkt4pgeceq", Val(Page.Request.QueryString("id_client")))
            Catch ex As Exception
                lblResult.Text += "Err: SMS" + "</br>"
            End Try
            Try
                Email.SendMail(DL_Panel.GetEmailClient(Val(Page.Request.QueryString("id_client"))),
                      "فیلمساز / فیلمنامه عزیز؛: " & DL_Panel.GetNameCustomer(Val(Page.Request.QueryString("id_client"))) & "<br/>" & "<strong>" & "به تیکت شما پاسخی داده شده است. لطفا جهت مشاهده این پاسخ روی لینک زیر کلیک کنید." & "</strong>",
                      "تیکت: " & DL_Panel.GetNameCustomer(Val(Page.Request.QueryString("id_client"))),
                      "http://iranfilmport.com/panel/tickets/" & Page.Request.QueryString("id_client"))

            Catch ex As Exception
                lblResult.Text += "Err: Email" + "</br>"
            End Try

            If lblResult.Text.Trim = Nothing Then
                PnlWarning.Visible = True
                lblResult.Text = "Everything has been done!"
                lblResult.ForeColor = System.Drawing.Color.Green
            Else
                lblResult.ForeColor = System.Drawing.Color.Red
            End If

            txtResponse.Text = Nothing
            DataListResponses.DataBind()

        End If
    End Sub

    Public Function GetNameClient(id_client As Object) As String
        Return DL_Panel.GetNameCustomer(id_client)
    End Function

    Private Sub btnBacktoTickets_Click(sender As Object, e As EventArgs) Handles btnBacktoTickets.Click
        Response.Redirect("commentClients")
    End Sub

    Public Function GetReadBackground(read As Object) As System.Drawing.Color
        Select Case Val(read)
            Case 0
                Return System.Drawing.Color.Red
            Case 1
                Return System.Drawing.Color.Green
        End Select
    End Function


	Private Sub btnChangeToClose_Click(sender As Object, e As EventArgs) Handles btnChangeToClose.Click
		DL_Panel.UpdateAllCommentsToClosed()
		SDS_Comments_Responed.SelectCommand = "SELECT * FROM [tbl_Comment_clients] WHERE id_client<>0 And id_parent=0 and (flag=2 or flag=3) ORDER BY flag asc,[date] DESC"
		dgComments.DataBind()
	End Sub

	Public Sub UpdateReadFlag(sender As Object, e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        DL_Panel.UpdateCommentClient(Val(s(0)), s(1), Val(s(2)))
		SDS_Comments_Responed.SelectCommand = "SELECT * FROM [tbl_Comment_clients] WHERE id_client<>0 And id_parent=0 and (flag=2 or flag=3) ORDER BY flag asc,[date] DESC"
		dgComments.DataBind()
    End Sub

    Public Sub DeleteComment(sender As Object, e As CommandEventArgs)

        DL_Panel.DeleteCommentClient(Val(e.CommandArgument))
        dgComments.DataBind()

    End Sub

    Public Sub DeleteCommentEach(sender As Object, e As CommandEventArgs)

        DL_Panel.DeleteCommentClientEach(Val(e.CommandArgument))
        DataListResponses.DataBind()

    End Sub

	Private Sub btnSendSmsAgain_Click(sender As Object, e As EventArgs) Handles btnSendSmsAgain.Click
		SendSMS("d4hbplkt4pgeceq", Val(Page.Request.QueryString("id_client")))
	End Sub

	Public Function convertNumFatoEn(ByVal T As String) As String
        Return T.Replace("۰", "0").Replace("۱", "1").Replace("۲", "2").Replace("۳", "3").Replace("۴", "4").Replace("۵", "5").Replace("۶", "6").Replace("۷", "7").Replace("۸", "8").Replace("۹", "9").Replace("٫", "/")
    End Function
    Private Sub CMS_Pages_commentClients_Load(sender As Object, e As EventArgs) Handles Me.Load
		If Page.Request.QueryString("id") <> "" And (Not IsPostBack) Then
			MultiView1.ActiveViewIndex = 1
			If Page.Request.QueryString("Status") = "1" Then DL_Panel.UpdateCommentClient(Val(Page.Request.QueryString("id")), True, 1)
			GetFlag()
			HiddenFieldToken.Value = Page.Request.QueryString("id")
			HiddenFieldClientID.Value = Page.Request.QueryString("id_client")
		End If
	End Sub

	Protected Sub dgComments_PageIndexChanging(source As Object, e As GridViewPageEventArgs)
        dgComments.PageIndex = e.NewPageIndex
        BindData()
    End Sub
    Public Sub BindData()
        'Try
        Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString)
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
        Dim sqlcom As New SqlCommand("Select * FROM [tbl_Comment_clients] WHERE id_client<>0 And id_parent=0 ORDER BY flag asc, [date] DESC", sqlconn)
        Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            dgComments.DataSource = ds.Tables(0)
            dgComments.DataBind()
            sqlconn.Close()
        'Catch ex As Exception
        'Finally
        'End Try
    End Sub

	''Private Sub btnFilterunRead_Click(sender As Object, e As EventArgs) Handles btnFilterunRead.Click
	''    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString)
	''    If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
	''    sqlconn.Open()
	''    Dim sqlcom As New SqlCommand("SELECT * FROM [tbl_Comment_clients] WHERE id_client<>0 and flag=1 and id_parent=0 ORDER BY flag asc,[date] DESC", sqlconn)
	''    Dim sqlda As New SqlDataAdapter(sqlcom)
	''    Dim ds As New DataSet
	''    sqlda.Fill(ds)
	''    dgComments.DataSource = ds.Tables(0)
	''    dgComments.DataBind()
	''    sqlconn.Close()
	''End Sub

End Class
