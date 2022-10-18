Partial Class CMS_Pages_invoice
    Inherits System.Web.UI.Page

    Dim DLL As New DLL_CMS
    Dim DLL_Email As New Email

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Case Request.QueryString("type")
            Case "V_ReadyForSend"
                MultiView.ActiveViewIndex = 0
                Title = "صورت حساب های آماده ارسال"
            Case "V_Sent"
                MultiView.ActiveViewIndex = 1
                Title = "صورت حساب های ارسال شده"
            Case "V_Deny"
                MultiView.ActiveViewIndex = 2
                Title = "صورت حسابی ردی توسط ادمین"
            Case "V_ALL"
                MultiView.ActiveViewIndex = 3
                Title = "تمام صورت حساب ها"
        End Select
    End Sub
    Protected Sub btnReady_Click(sender As Object, e As System.EventArgs) Handles btnReady.Click
        Response.Redirect("invoice.aspx?type=V_ReadyForSend")
    End Sub
    Protected Sub btnSent_Click(sender As Object, e As System.EventArgs) Handles btnSent.Click
        Response.Redirect("invoice.aspx?type=V_Sent")
    End Sub
    Protected Sub btnDeny_Click(sender As Object, e As System.EventArgs) Handles btnDeny.Click
        Response.Redirect("invoice.aspx?type=V_Deny")
    End Sub
    Protected Sub btnAll_Click(sender As Object, e As System.EventArgs) Handles btnAll.Click
        Response.Redirect("invoice.aspx?type=V_ALL")
    End Sub

    Public Sub GoSend(sender As Object, e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        DLL.UpdateSend_or_Deny(Val(s(0)), 2, 2)
        DLL_Email.SendMail(s(1), "فیلم شما با موفقیت و پس از تائید کارشناسان درگاه فیلم ایران به فستیوال مربوطه ارسال گردید، جهت مشاهده جزئییات این ارسال به لینک زیر مراجعه کنید", "فیلم شما ارسال شد", "http://iranfilmport.com/dashboard/user/me/submission")
        dgReady.DataBind()
        Response.Redirect("backtowallet.aspx?invoiceID=" + s(0) + "&email=" + s(1) + "&price=" + s(2))
    End Sub

    Public Sub GoDeny(sender As Object, e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        DLL.UpdateSend_or_Deny(Val(s(0)), 3, 0)
        dgReady.DataBind()
        Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(1) + "&price=" + s(2))
    End Sub

    Public Sub ChangeAccolades(sender As Object, e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Select Case s(1)
            Case "0"
                DLL.UpdateAccolades(Val(s(0)), 0)
                dgSent.DataBind()
                dgDeny.DataBind()
                dgAll.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "1"
                DLL.UpdateAccolades(Val(s(0)), 1)
                dgSent.DataBind()
                dgDeny.DataBind()
                dgAll.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "2"
                DLL.UpdateAccolades(Val(s(0)), 2)
                dgSent.DataBind()
                dgDeny.DataBind()
                dgAll.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "3"
                DLL.UpdateAccolades(Val(s(0)), 3)
                dgSent.DataBind()
                dgDeny.DataBind()
                dgAll.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "4"
                DLL.UpdateAccolades(Val(s(0)), 4)
                dgSent.DataBind()
                dgDeny.DataBind()
                dgAll.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "5"
                DLL.UpdateAccolades(Val(s(0)), 5)
                dgSent.DataBind()
                dgDeny.DataBind()
                dgAll.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "6"
                DLL.UpdateAccolades(Val(s(0)), 6)
                dgSent.DataBind()
                dgDeny.DataBind()
                dgAll.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
            Case "7"
                DLL.UpdateAccolades(Val(s(0)), 7)
                dgSent.DataBind()
                dgDeny.DataBind()
                dgAll.DataBind()
                Response.Redirect("invoiceMSG.aspx?invoiceID=" + s(0) + "&email=" + s(2))
        End Select

    End Sub

    Public Function SetAccoalde(ByVal e As Object) As String
        Select Case e.ToString
            Case 0
                Return "~\dashboard\assets\img\icon_deny.png"
            Case 1
                Return "~\dashboard\assets\img\icon_Disqualified.png"
            Case 2
                Return "~\dashboard\assets\img\icon_Undecided.png"
            Case 3
                Return "~\dashboard\assets\img\icon_Selected.png"
            Case 4
                Return "~\dashboard\assets\img\icon_NotSelected.png"
            Case 5
                Return "~\dashboard\assets\img\icon_Semi_Finalist.png"
            Case 6
                Return "~\dashboard\assets\img\icon_finlist.png"
            Case 7
                Return "~\dashboard\assets\img\icon_award.png"
        End Select
    End Function

End Class
