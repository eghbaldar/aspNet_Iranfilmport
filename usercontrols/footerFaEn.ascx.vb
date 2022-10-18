
Partial Class usercontrols_footerFaEn
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                DownMenuEN.Visible = True
            Else
                DownMenuFA.Visible = True
            End If
        Else
            DownMenuFA.Visible=True 
        End If
    End Sub

End Class
