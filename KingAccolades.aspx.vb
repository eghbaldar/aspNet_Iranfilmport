
Partial Class KingAccolades
    Inherits System.Web.UI.Page
    Public FaEn As Boolean
    Dim DL_CMS As New DLL_CMS

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                Title = "Resume of IRAN FILM PORT"
                Page.MetaDescription = "CV or Resume of IRAN FILM PORT - Iranian Films Agency and Distribution company"
                lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "IRAN FILM PORT Accolades" + "</span>"
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowResume(False)
                Catch ex As Exception
                End Try
                FaEn = False
            Else
                Title = "کارنامه پخش و ارسال فیلم درگاه فیلم ایران"
                Page.MetaDescription = "کارنامه کاری و موفقیت های ارسال و پخش خارجی بین المللی درگاه فیلم ایران "
                Try
                    Dim ds As New DLL_CMS
                    lbl.Text = ds.ShowResume(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
                Catch ex As Exception
                End Try
                FaEn = True
            End If
        Else
            Title = "کارنامه پخش و ارسال فیلم درگاه فیلم ایران"
            Page.MetaDescription = "کارنامه کاری و موفقیت های ارسال و پخش خارجی بین المللی درگاه فیلم ایران "
            lblTopTitle.Text = "<span style='font-family:Tahoma;'>" + "کارنامه درگاه فیلم ایران" + "</span>"
            Try
                Dim ds As New DLL_CMS
                lbl.Text = ds.ShowResume(True).Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans")
            Catch ex As Exception
            End Try
            FaEn = True
        End If


    End Sub

    'Public Function rep(txt As String) As String
    '    Return txt.Replace("ي", "ی").Replace("Tahoma,Geneva,sans-serif", "irsans").Replace("Tahoma,Gene7a,sans-serif", "irsans").Replace("<p>", "").Replace("</p>", "")

    'End Function

    Public Function GetFilmName(Id_film As Object, Language As Object)
        If Language.ToString().ToUpper = "FA" Then
            Return DL_CMS.GetFilmNameWithId(Val(Id_film))
        End If
    End Function

    Public Function GetAccolade(Id_film As Object, Language As Object)
        Return DL_CMS.GetAccoladeFilmId(Val(Id_film), Language.ToString)
    End Function
End Class
