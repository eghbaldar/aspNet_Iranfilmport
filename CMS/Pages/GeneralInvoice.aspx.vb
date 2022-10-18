
Partial Class CMS_Pages_GeneralInvoice
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Case Request.QueryString("type")
            Case "OK"
                MultiView.ActiveViewIndex = 0
            Case "NOK"
                MultiView.ActiveViewIndex = 1
        End Select
    End Sub
End Class
