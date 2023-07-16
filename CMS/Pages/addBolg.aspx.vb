Imports System.IO
Imports CKFinder
Imports System.Drawing
Imports System.Data
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Web.Script.Services

Partial Class CMS_Pages_addBolg
    Inherits System.Web.UI.Page

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click

        Dim DL As New DLL_CMS

        If FilePhoto.PostedFile.ContentLength > 110000 And Not (chkPhoto.Checked) Then
            lblNotify.Text = "حجم فایل عکس شما بیش از 110 کیلوبایت است"
            Exit Sub
        End If

        If cmd_type.SelectedValue <> "" And txtTitle.Text <> "" And txtText.Text <> "" Then

            Dim End_FN As String = DateTime.Now.Ticks.ToString & "-" & txtTags.Text.Trim.Replace("-", "_").Replace(" ", "").Replace("_", "-").Replace("ي", "ی") & "-" & Path.GetExtension(FilePhoto.FileName)

            Dim DT As String = Convert.ToDateTime(txtDate.Text).ToShortDateString & " " & txtHH.Text & ":" & txtMM.Text & ":" & txtSS.Text

            DL.InsertArticle(Val(cmd_category.SelectedValue),
                             Val(cmd_type.SelectedValue),
                             Val(cmd_short_feature.SelectedValue),
                              convertNumFatoEn(txtTitle.Text.Trim.Replace("ي", "ی").Replace("-", " ")),
                              convertNumFatoEn(txtText.Text.Trim.Replace("ي", "ی")),
                              convertNumFatoEn(txtLid.Text.Trim.Replace("ي", "ی")),
                              txtAuthors.Text.Trim,
                              txtReference.Text.Trim.Replace("ي", "ی"),
                              End_FN.Trim, "film",
                              txtTags.Text.Replace("ي", "ی"),
                              0,
                              1,
                              DT,
                              txtTitleEn.Text.Trim)
            FilePhoto.SaveAs(MapPath("~/files/UploadFiles/article/" + End_FN.Trim))
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'Page.RegisterStartupScript("OpenPages", "<script type='text/javascript'>window.open('editArticle.aspx','_self');window.open('../../sitemap.aspx');</script>")
            Response.Redirect("EditPost?type=complete")
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Else
            lblNotify.Visible = True
            lblNotify.Text = "فیلدها پر شوند"
        End If

    End Sub

    Public Function convertNumFatoEn(ByVal T As String) As String
        Return T.Replace("۰", "0").Replace("۱", "1").Replace("۲", "2").Replace("۳", "3").Replace("۴", "4").Replace("۵", "5").Replace("۶", "6").Replace("۷", "7").Replace("۸", "8").Replace("۹", "9").Replace("٫", "/")
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim _FileBrowser As CKFinder.FileBrowser = New CKFinder.FileBrowser()
        _FileBrowser.BasePath = "../../files/ckfinder"
        _FileBrowser.SetupCKEditor(txtText)
        If Not IsPostBack Then
            S = ""
            txtDate.Text = Now.ToShortDateString
            txtHH.Text = "12"
            txtMM.Text = "00"
            txtSS.Text = "00"
        End If
    End Sub

    Shared S As String = Nothing
    Dim btn As New Button

    Protected Sub btnPreTag_Click(sender As Object, e As System.EventArgs) Handles btnPreTag.Click
        If txtPreTag.Text.Trim.Length > 0 Then
            listTags.Items.Add(txtPreTag.Text.Trim.Replace(" ", "_"))
            FillHiddenTags()
            txtPreTag.Text = ""
        End If
    End Sub

    Public Function RemoveHTML(htmlString) As String
        Dim matchpattern As String = "<(?:[^>=]|='[^']*'|=""[^""]*""|=[^'""][^\s>]*)*>"
        Dim replacementstring As String = ""
        Return Regex.Replace(htmlString, matchpattern, replacementstring, RegexOptions.IgnoreCase Or RegexOptions.IgnorePatternWhitespace Or RegexOptions.Multiline Or RegexOptions.Singleline)
    End Function

    Protected Sub deletelist_Click(sender As Object, e As System.EventArgs) Handles deletelist.Click
        listTags.Items.RemoveAt(listTags.SelectedIndex)
        FillHiddenTags()
        ListedTags()
    End Sub

    Private Sub ListedTags()
        S = Nothing
        If listTags.Items.Count > 0 Then
            For i As Byte = 0 To listTags.Items.Count - 1
                S = S & listTags.Items(i).Text.Trim.Replace(" ", "_") + " - "
            Next
            txtTags.Text = S.Substring(0, S.Length - 2)
        End If
    End Sub

    Protected Sub CalDate_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalDate.SelectionChanged
        'If Not IsPostBack Then
        txtDate.Text = CalDate.SelectedDate.ToString
        'End If
    End Sub

    Protected Sub tag_1_Click(sender As Object, e As System.EventArgs) Handles tag_1.Click
        listTags.Items.Add(tag_1.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_2_Click(sender As Object, e As System.EventArgs) Handles tag_2.Click
        listTags.Items.Add(tag_2.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_3_Click(sender As Object, e As System.EventArgs) Handles tag_3.Click
        listTags.Items.Add(tag_3.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_4_Click(sender As Object, e As System.EventArgs) Handles tag_4.Click
        listTags.Items.Add(tag_4.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_5_Click(sender As Object, e As System.EventArgs) Handles tag_5.Click
        listTags.Items.Add(tag_5.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_6_Click(sender As Object, e As System.EventArgs) Handles tag_6.Click
        listTags.Items.Add(tag_6.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_7_Click(sender As Object, e As System.EventArgs) Handles tag_7.Click
        listTags.Items.Add(tag_7.Text.Trim.Replace(" ", "_"))
    End Sub
    Protected Sub tag_8_Click(sender As Object, e As System.EventArgs) Handles tag_8.Click
        listTags.Items.Add(tag_8.Text.Trim.Replace(" ", "_"))
    End Sub

    Private Sub rbSelection_CheckedChanged(sender As Object, e As EventArgs) Handles rbFestival.CheckedChanged, rbFilm.CheckedChanged, rbOther.CheckedChanged
        Dim RB As RadioButton = CType(sender, RadioButton)
        PanelFilm.Visible = False
        PanelFestival.Visible = False
        PanelOther.Visible = False
        btnNextTag.Visible = True
        Select Case RB.ID
            Case "rbFilm"
                PanelFilm.Visible = True
            Case "rbFestival"
                PanelFestival.Visible = True
            Case "rbOther"
                MultiView.ActiveViewIndex = 1
        End Select
    End Sub

    Private Sub btnNextTag_Click(sender As Object, e As EventArgs) Handles btnNextTag.Click

        If rbFilm.Checked _
            And txtTagFilm.Text.Trim.Length > 0 _
            And txtTagFilmEng.Text.Trim.Length > 0 _
            And txtTagDirectors1.Text.Trim.Length > 0 _
            And txtTagDirector1_Eng.Text.Trim.Length > 0 Then

            listTags.Items.Add(txtTagFilm.Text.Trim.Replace(" ", "_"))
            listTags.Items.Add(txtTagFilmEng.Text.Trim.Replace(" ", "_"))
            listTags.Items.Add(txtTagDirectors1.Text.Trim.Replace(" ", "_"))
            listTags.Items.Add(txtTagDirector1_Eng.Text.Trim.Replace(" ", "_"))
            If txtTagDirectors2.Text.Trim.Length > 0 Then listTags.Items.Add(txtTagDirectors2.Text.Trim.Replace(" ", "_"))
            If txtTagDirector2_Eng.Text.Trim.Length > 0 Then listTags.Items.Add(txtTagDirector2_Eng.Text.Trim.Replace(" ", "_"))
            MultiView.ActiveViewIndex = 1
        End If
        If rbFestival.Checked _
           And txtTagFestivalFa.Text.Trim.Length > 0 _
           And txtTagFestivalEng.Text.Trim.Length > 0 Then
            listTags.Items.Add(txtTagFestivalFa.Text.Trim.Replace(" ", "_"))
            listTags.Items.Add(txtTagFestivalEng.Text.Trim.Replace(" ", "_"))
            MultiView.ActiveViewIndex = 1
        End If

        FillHiddenTags()

    End Sub

    Private Sub FillHiddenTags()
        HiddenFieldTags.Value = String.Empty
        For i As Byte = 0 To listTags.Items.Count - 1
            HiddenFieldTags.Value += listTags.Items(i).Text & "+"
        Next
        HiddenFieldTags.Value += "علیمحمد اقبالدار"
        ListedTags()
    End Sub

    <ScriptMethod()>
    <WebMethod()>
    Public Shared Function SearchTitleEn(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Using conn As SqlConnection = New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString
            Using cmd As SqlCommand = New SqlCommand()
                cmd.CommandText = "select top 10 titleEn from tbl_articles where titleEn like N'%' + @SearchText + '%' order by date_time desc"
                cmd.Parameters.AddWithValue("@SearchText", prefixText)
                cmd.Connection = conn
                conn.Open()
                Dim customers As List(Of String) = New List(Of String)()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        customers.Add(sdr("titleEn").ToString())
                    End While
                End Using
                conn.Close()

                Return customers
            End Using
        End Using
    End Function
    <ScriptMethod()>
    <WebMethod()>
    Public Shared Function SearchTitleFa(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Using conn As SqlConnection = New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString
            Using cmd As SqlCommand = New SqlCommand()
                cmd.CommandText = "select  top 10 title from tbl_articles where title like N'%' + @SearchText + '%' order by date_time desc"
                cmd.Parameters.AddWithValue("@SearchText", prefixText.Replace("ی", "ي"))
                cmd.Connection = conn
                conn.Open()
                Dim customers As List(Of String) = New List(Of String)()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        customers.Add(sdr("title").ToString())
                    End While
                End Using
                conn.Close()

                Return customers
            End Using
        End Using
    End Function

End Class
