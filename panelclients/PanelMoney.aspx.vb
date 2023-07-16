
Partial Class PanelMoney
    Inherits System.Web.UI.Page

    Protected Sub btnShowInfo_Click(sender As Object, e As System.EventArgs) Handles btnShowInfo.Click
        DetailsViewGeneralInformation.DataBind()
    End Sub

    Private Sub PanelMoney_Load(sender As Object, e As EventArgs) Handles Me.Load
        Title = "پرونده مالی  |  پنل اختصاصی کاربران"
    End Sub
End Class
