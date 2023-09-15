
Partial Class participationplan
    Inherits System.Web.UI.Page

    Private Sub advertise_Load(sender As Object, e As EventArgs) Handles Me.Load
        Title = "طرح مشارکت در پخش و ارسال فیلم درگاه فیلم ایران"
        Page.MetaDescription = "مشارکت در پخش و ارسال بین المللی فیلم بعد از ساخت توسط درگاه فیلم ایران "
        lblTopTitle.Text = "<span style='font-family:Titr;'>" + "طرح مشارکت در پخش و ارسال فیلم درگاه فیلم ایران" + "</span>"
        Try
            Dim ds As New DLL_CMS
            lbl.Text = ds.ShowParticipationPlan.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
        Catch ex As Exception
        End Try
    End Sub

End Class
