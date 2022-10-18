Imports System.Data

Partial Class aFestival
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Try
            Dim Dset As New DataSet
            Dim DL As New DLL_CMS
            Dim DLL As New DLL

            ''''''''''' آیا از URL بدون عنوان استفاده کرده است؟
            If String.IsNullOrEmpty(RouteData.Values("name_fa").ToString.Trim) Then
                Dset = DL.PreUpdateFest(Val(RouteData.Values("id").ToString))
                'Response.Redirect("~/festival/" + RouteData.Values("id") + "/" + Dset.Tables(0).Rows(0)("title_en").ToString.Replace(" ", "-") + "/" + Dset.Tables(0).Rows(0)("title_fa").ToString.Replace(" ", "-").Replace("ي", "ی"))
                Response.Redirect("~/festival/" + RouteData.Values("id") + "/" + Dset.Tables(0).Rows(0)("title_en").ToString.Replace(" ", "-") + "/" + DLL.GetClearString(Dset.Tables(0).Rows(0)("title_fa")))
            End If
            ''''''''''' بازدید
            DLL.FestivalCounter(Val(RouteData.Values("id")))
            '''''''''''
            setTages()
            ''''''''''''' کامنت
            comment.Section = 8
            comment.IDPOST = Val(RouteData.Values("id"))
        Catch ex As Exception
        End Try
    End Sub

    Private Sub setTages()
        Dim DL As New DLL

        MetaDescription = String.Format("{0}{1}", "ارسال فیلم به ", RouteData.Values("name_en").ToString.Replace(".html", "")) + "," + String.Format("{0}{1}", "ارسال فیلم به جشنواره  ", RouteData.Values("name_en").ToString.Replace(".html", "")) + "," + String.Format("{0}{1}", "پخش فیلم به ", RouteData.Values("name_en").ToString.Replace(".html", "")) + "," + String.Format("{0}{1}", "پخش فیلم به جشنواره  ", RouteData.Values("name_en").ToString.Replace(".html", ""))
        Title = RouteData.Values("name_en").ToString.Replace("-", " ") + " ارسال فیلم به " + RouteData.Values("name_fa").ToString.Replace("-", " ")
        '''''''''''''''''''''''''''''''''''''''''''''''''' dinamically metag
        Dim Dset As New DataSet
        Dim DLCMS As New DLL_CMS
        Dset = DLCMS.PreUpdateFest(Val(RouteData.Values("id")))

        Dim keywords As HtmlMeta = New HtmlMeta()
        Dim metaTag As New HtmlMeta()
        metaTag.Attributes.Add("property", "og:image")
        metaTag.Content = "http:\\iranfilmport.com\files\uploadFiles\festival\" + Dset.Tables(0).Rows(0)("logo")
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:type")
        metaTag.Content = "article"
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:title")
        metaTag.Content = Dset.Tables(0).Rows(0)("title_fa").ToString
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:description")
        metaTag.Content = MetaDescription
        pc.Controls.Add(metaTag)
        keywords = New HtmlMeta()
        metaTag = New HtmlMeta()
        metaTag.Attributes.Add("property", "og:url")
        metaTag.Content = "http://iranfilmport.com/festival/" + RouteData.Values("id").ToString + "/" + RouteData.Values("name_en").Replace(" ", "-")
        pc.Controls.Add(metaTag)
    End Sub

    Public Function getshortfeature(ByVal e As Object)
        Select Case e.ToString
            Case 1
                Return "دسته فستیوال: " + "کوتاه"
            Case 2
                Return "دسته فستیوال: " + "بلند"
            Case 3
                Return "دسته فستیوال: " + "کوتاه و بلند"
        End Select
    End Function

    Public Function getgenre(ByVal e As Object)
        Dim DL As New DLL_CMS
        Dim Result As String
        For i As Byte = 0 To Len(Str(e)) - 2
            Select Case DL.EachValueOfGenreFestival(RouteData.Values("id")).Tables(0).Rows(i)(0).ToString()
                Case 1
                    Result += "<span class='divGenre'> " + "Animation" + "</span>" + " "
                Case 2
                    Result += "<span class='divGenre'> " + "Documentary" + "</span>" + " "
                Case 3
                    Result += "<span class='divGenre'> " + "Experimental" + "</span>" + " "
                Case 4
                    Result += "<span class='divGenre'> " + "Music Video" + "</span>" + " "
                Case 5
                    Result += "<span class='divGenre'> " + "Fiction" + "</span>" + " "
                Case 6
                    Result += "<span class='divGenre'> " + "Television" + "</span>" + " "
                Case 7
                    Result += "<span class='divGenre'> " + "Virtual" + "</span>" + " "
                Case 8
                    Result += "<span class='divGenre'> " + "Advertisement" + "</span>" + " "
            End Select
        Next
        Return "ژانرهای قابل پذیرش: " + Result
    End Function

    Public Function getLevel(ByVal e As Object)
        Select Case e.ToString
            Case 1
                Return "سطح فستیوال: " + "<span class='divGenre'> " + "A+" + "</span>"
            Case 2
                Return "سطح فستیوال: " + "<span class='divGenre'> " + "A" + "</span>"
            Case 3
                Return "سطح فستیوال: " + "<span class='divGenre'> " + "B" + "</span>"
            Case 4
                Return "سطح فستیوال: " + "<span class='divGenre'> " + "C" + "</span>"
        End Select
    End Function

    Public Sub send(ByVal sender As Object, ByVal e As CommandEventArgs)
        'Response.Redirect("~/dashboard/user/me/precheckout/" + e.CommandArgument.ToString)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Modal", "loadModalDistribution();", True)
    End Sub

    Public Function getShortLink() As String
        Return String.Format("{1}{0}", "<a style='color:blue;' href=" + "http://iranfilmport.com/festival/" + RouteData.Values("id").ToString + ">" + "iranfilmport.com/festival/" + RouteData.Values("id").ToString + "</a>", "لینک کوتاه و استاندارد: ")
    End Function

    Public Function getDate(_date As Object) As String
        Return ShamsiDate.Miladi2Shamsi(_date.ToString, ShamsiDate.ShowType.ShortDate)
    End Function

End Class
