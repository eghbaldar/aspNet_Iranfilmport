
Partial Class kingRevisingScreenplay
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT - Rewrite Screenplays & Scripts"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Agents" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(False)
                Catch ex As Exception
                End Try
            Else
                Title = "نگارش و بازنویسی فیلمنامه های کوتاه و بلند"
                Page.MetaDescription = "نگارش فیلمنامه های کوتاه و بلند و بازنویسی فیلمنامه و مشاوره کارشناسی پخش و ارسال بین المللی فیلم کوتاه و بلند به جشنواره های فیلم خارجی"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "نگارش و بازنویسی فیلمنامه های کوتاه و بلند" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
                Catch ex As Exception
                End Try
            End If
        Else
            Title = "نگارش و بازنویسی فیلمنامه های کوتاه و بلند"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "نگارش و بازنویسی فیلمنامه های کوتاه و بلند" + "</span>"
            Page.MetaDescription = "نگارش فیلمنامه های کوتاه و بلند و بازنویسی فیلمنامه و مشاوره کارشناسی پخش و ارسال بین المللی فیلم کوتاه و بلند به جشنواره های فیلم خارجی"
            Try
                Dim ds As New DLL_CMS
                lbl.Text = ds.ShowScriptConsultation.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
            Catch ex As Exception
            End Try
            ''''''''''''' کامنت
            KingComments.Section = 4
            KingComments.IDPOST = -1
        End If
    End Sub
End Class
