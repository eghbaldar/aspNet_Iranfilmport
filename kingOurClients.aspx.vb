
Partial Class kingOurClients
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Clients"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Title = "مشتریان درگاه فیلم ایران"
                Page.MetaDescription = "درگاه فیلم ایران - شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "مشتریان درگاه فیلم ایران" + "</span>"
            End If
        Else
            Title = "مشتریان رسمی درگاه فیلم ایران"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "مشتریان درگاه فیلم ایران" + "</span>"
            Page.MetaDescription = "درگاه فیلم ایران - شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
        End If

    End Sub
    Public Function ShowTrailerAparat(T As String) As Boolean
        If T.Trim = Nothing Then
            Return False
        Else
            Return True
        End If
    End Function
End Class
