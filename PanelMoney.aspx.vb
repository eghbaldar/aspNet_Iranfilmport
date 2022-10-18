
Partial Class PanelMoney
    Inherits System.Web.UI.Page

    Protected Sub btnShowInfo_Click(sender As Object, e As System.EventArgs) Handles btnShowInfo.Click
        DetailsViewGeneralInformation.DataBind()
    End Sub
End Class
