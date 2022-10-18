
Partial Class t
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        myIframe.Attributes("src") = "https://www.google.com/search?q=site:http://iranfilmport.com " & "eghbaldar"
    End Sub
End Class
