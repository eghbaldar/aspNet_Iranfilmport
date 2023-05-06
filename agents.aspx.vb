
Partial Class agents
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "The Official Agents of IRAN FLLM PORT Company"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "About of IRAN FILM PORT" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(False)
                Catch ex As Exception
                End Try
            Else
                Title = "نماینده‌های رسمی درگاه فیلم ایران"
                Page.MetaDescription = "درگاه فیلم ایران - شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "نماینده‌ها‌ی رسمی درگاه فیلم ایران" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
                Catch ex As Exception
                End Try
            End If
        Else
            Title = "نماینده‌های رسمی درگاه فیلم ایران"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "نماینده‌ها‌ی رسمی درگاه فیلم ایران" + "</span>"
            Page.MetaDescription = "درگاه فیلم ایران - شرکت پخش و ارسال فیلم و فیلمنامه به جشنواره های بین المللی"
            Try
                Dim ds As New DLL_CMS
                lbl.Text = ds.ShowAgent(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
            Catch ex As Exception
            End Try
        End If

    End Sub

End Class
