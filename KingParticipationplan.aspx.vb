
Partial Class KingParticipationplan
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT - Participation Plan"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Agents" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(False)
                Catch ex As Exception
                End Try
            Else
                Title = "طرح مشارکت در پخش و ارسال فیلم درگاه فیلم ایران"
                Page.MetaDescription = "مشارکت در پخش و ارسال بین المللی فیلم بعد از ساخت توسط درگاه فیلم ایران "
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "طرح مشارکت در پخش و ارسال فیلم درگاه فیلم ایران" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
                Catch ex As Exception
                End Try
            End If
        Else
            Title = "طرح مشارکت در پخش و ارسال فیلم درگاه فیلم ایران"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "طرح مشارکت در پخش و ارسال فیلم درگاه فیلم ایران" + "</span>"
            Page.MetaDescription = "مشارکت در پخش و ارسال بین المللی فیلم بعد از ساخت توسط درگاه فیلم ایران "
            Try
                Dim ds As New DLL_CMS
                lbl.Text = ds.ShowParticipationPlan.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
            Catch ex As Exception
            End Try
        End If
    End Sub
End Class
