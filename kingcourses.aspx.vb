
Partial Class kingcourses
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "IRAN FLLM PORT - Online Filmmaking Course"
                Page.MetaDescription = "IRAN FILM PORT, iran film port, an Iranian films agency and distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Agents" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(False)
                Catch ex As Exception
                End Try
            Else
                Title = "دوره های آموزش فیلمسازی آنلاین - فیلم های کوتاه و بلند"
                Page.MetaDescription = "دوره های آموزش فیلمسازی آنلاین - فیلم های کوتاه و بلند"
                lblTopTitle.Text = "<span style='font-family:Titr;'>" + "دوره های آموزش فیلمسازی آنلاین" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowAgent(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
                Catch ex As Exception
                End Try
            End If
        Else
            Title = "دوره های آموزش فیلمسازی آنلاین - فیلم های کوتاه و بلند"
            lblTopTitle.Text = "<span style='font-family:Titr;'>" + "دوره های آموزش فیلمسازی آنلاین" + "</span>"
            Page.MetaDescription = "دوره های آموزش فیلمسازی آنلاین - فیلم های کوتاه و بلند"
            'Try
            '    Dim ds As New DLL_CMS
            '    lbl.Text = ds.ShowAdvertise.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "Samim").Replace("Tahoma,Gene7a,sans-serif", "Samim").Replace("tahoma,geneva,sans-serif", "Samim")
            'Catch ex As Exception
            'End Try
        End If
    End Sub
End Class
