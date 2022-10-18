
Partial Class dashboard_preCheckout
    Inherits System.Web.UI.Page

    Dim DLLd As New DLL_Dashboard

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        lblFestival.Text = DLLd.GetNameOfFestival(Val(RouteData.Values("festivalID")))
        DLLd._Email_ = Request.Cookies("IFP").Item("email")
        If Not IsPostBack Then HiddenEmail.Value = DLLd._Email_

    End Sub

    Protected Sub btnSendToCheckout_Click(sender As Object, e As System.EventArgs) Handles btnSendToCheckout.Click

        If cmdDeadline.SelectedIndex <> -1 And cmdFilms.SelectedIndex <> -1 And cmdSection.SelectedIndex <> -1 Then
            If DLLd.ExistAnyUnpayFactor(HiddenEmail.Value) Then
                If DLLd.DuplicationFactorNotPay(HiddenEmail.Value, RouteData.Values("festivalID"), cmdDeadline.SelectedValue, cmdFilms.SelectedValue) Then
                    If DLLd.DuplicationFactorPay(HiddenEmail.Value, RouteData.Values("festivalID"), cmdDeadline.SelectedValue, cmdFilms.SelectedValue) Then
                        Response.Redirect("~\dashboard\user\me\checkout\" + _
                                           RouteData.Values("festivalID") + "\" + _
                                           cmdFilms.SelectedValue.ToString + "\" + _
                                           cmdDeadline.SelectedValue.ToString)
                    Else
                        'این پروژه قبلا به این فستیوال ارسال شده است
                        ScriptManager.RegisterStartupScript(UP, Page.GetType, "Script", "SURE('" + RouteData.Values("festivalID") + "','" + cmdFilms.SelectedValue.ToString + "','" + cmdDeadline.SelectedValue.ToString + "');", True)
                    End If
                Else
                    lblTruth.Text = ""
                    lblWarning.Text = "فاکتوری با همین مشخصات و پرداخت نشده وجود دارد، ابتدا نسبت به پرداخت آن از طریق لینک زیر اقدام کنید." + "<br/>" + "<a href='../invoice'>صورت حساب ها</a>"
                    lblWarning.ForeColor = Drawing.Color.Red
                End If
            Else
                lblTruth.Text = ""
                lblWarning.Text = "شما دو فاکتور پرداخت نشده دارید، قبل از ایجاد و یا درخواست فاکتور جدید، فاکتورهای قبلی را پرداخت و یا در جهت حذف آنها اقدام کنید." + "<br/>" + "<a href='../invoice'>صورت حساب ها</a>"
                lblWarning.ForeColor = Drawing.Color.Red
            End If
        Else
            lblWarning.Text = ""
            lblTruth.ForeColor = Drawing.Color.Red
            lblTruth.Text = "<br/>" + "پروژه شما <a target='_blank' href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد اعتماد درگاه فیلم ایران</a> را دریافت نکرده است. لطفا جهت ارسال پروژه خود به فستیوال ها از لینک زیر پروژه را به درگاه فیلم ایران ارسال کنید." + "</br>" + "<a href='../aproject/" + cmdFilms.SelectedValue.ToString + "'>مدیریت پروژه " + cmdFilms.SelectedItem.Text + "</a>"
        End If

    End Sub

    Protected Sub cmdFilms_DataBound(sender As Object, e As System.EventArgs) Handles cmdFilms.DataBound
        CheckStatus()
    End Sub

    Protected Sub cmdFilms_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles cmdFilms.SelectedIndexChanged
        CheckStatus()
    End Sub

    Private Sub CheckStatus()

        Try
            With DLLd.ShowProject(cmdFilms.SelectedValue).Tables(0)
                If Convert.ToBoolean(.Rows(0)("Status")) Then   'تائید نشده است
                    lblWarning.Text = ""
                    lblTruth.ForeColor = Drawing.Color.Red
                    lblTruth.Text = "<br/>" + "پروژه شما هنوز توسط کارشناسان درگاه تایید نشده است، منتظر بمانید."

                    btnSendToCheckout.Visible = False
                Else
                    lblWarning.Text = ""
                    lblTruth.Text = ""
                    btnSendToCheckout.Visible = True
                End If
                If Not Convert.ToBoolean(.Rows(0)("truth")) Then
                    lblWarning.Text = ""
                    lblTruth.ForeColor = Drawing.Color.Red
                    lblTruth.Text = "<br/>" + "پروژه شما <a target='_blank' href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد اعتماد درگاه فیلم ایران</a> را دریافت نکرده است. لطفا جهت ارسال پروژه خود به فستیوال ها از لینک زیر پروژه را به درگاه فیلم ایران ارسال کنید." + "</br>" + "<a href='../aproject/" + cmdFilms.SelectedValue.ToString + "'>مدیریت پروژه " + cmdFilms.SelectedItem.Text + "</a>"

                    btnSendToCheckout.Visible = False
                Else
                    lblWarning.Text = ""
                    lblTruth.Text = ""
                    btnSendToCheckout.Visible = True
                End If
            End With

        Catch ex As Exception
            If Err.Number = 91 Then
                btnSendToCheckout.Visible = False
                lblWarning.Text = ""
                lblTruth.ForeColor = Drawing.Color.Red
                lblTruth.Text = "<br/>" + "شما پروژه ی تائید شده ای ندارید و یا هنوز اقدام به ایجاد پروژه نکرده اید. از لینک زیر وارد بخش مدیریت پروژه ها شوید." + "</br>" + "<a href='../projects/'" + ">مدیریت پروژه </a>"
                cmdFilms.Visible = False
            End If
        End Try

    End Sub

End Class
