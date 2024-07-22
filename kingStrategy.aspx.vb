
Partial Class kingStrategy
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT Strategic Distribution Film Plan"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Clients" + "</span>"
            Else
                Title = "برنامه استراتژیک پخش و ارسال فیلم به جشنواره‌های خارجی"
                Page.MetaDescription = "برنامه استراتژیک پخش و ارسال فیلم به جشنواره‌های خارجی ، برنامه ارسال فیلم به فستیوال های فیلم، جدول ارسال فیلم به جشنواره ها"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "برنامه استراتژیک درگاه فیلم ایران" + "</span>"
            End If
        Else
            Title = "برنامه استراتژیک پخش و ارسال فیلم به جشنواره‌های خارجی"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "برنامه استراتژیک درگاه فیلم ایران" + "</span>"
            Page.MetaDescription = "برنامه استراتژیک پخش و ارسال فیلم به جشنواره‌های خارجی ، برنامه ارسال فیلم به فستیوال های فیلم، جدول ارسال فیلم به جشنواره ها"
        End If
    End Sub

End Class
