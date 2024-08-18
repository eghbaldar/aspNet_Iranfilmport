
Partial Class kingFestivalsOscar
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Qualifying Film Festivals"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Page.MetaDescription = "فستیوال های ورودی آکادمی های اسکار سزار بفتا گویا جایزه کانادایی ها"
                Title = "لیست فستیوال های مورد تائید اسکار"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "لیست فستیوال های مورد تائید آکادمی‌ها" + "</span>"
            End If
        Else
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "لیست فستیوال های مورد تائید آکادمی‌ها" + "</span>"
            Page.MetaDescription = "فستیوال های ورودی آکادمی های اسکار سزار بفتا گویا جایزه کانادایی ها"
            Title = "لیست فستیوال های مورد تائید اسکار"
        End If
    End Sub
End Class
