
Partial Class dashboard_projects
    Inherits System.Web.UI.Page

    Dim DLLd As New DLL_Dashboard

    Protected Sub cmd_type_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmd_type.SelectedIndexChanged
        Select Case cmd_type.SelectedValue
            Case 0
                MultiView.ActiveViewIndex = -1
            Case 1
                MultiView.ActiveViewIndex = 0
            Case 2
                MultiView.ActiveViewIndex = 1
        End Select
    End Sub

    Protected Sub btnInsertFilm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertFilm.Click

        Dim DLL As New DLL_Dashboard
        Dim email As String = DLLd._Email_

        If DLL.CheckMoreSuspendProject(email) Then

            Dim nameF As String = txt_Film_NameF.Text.Trim
            Dim nameEn As String = txt_Film_NameEn.Text.Trim
            Dim type As Byte = 1
            Dim SynFa As String = txt_Film_summaryF.Text.Trim
            Dim SynEn As String = txt_Film_summaryEn.Text.Trim
            Dim ProductDate As Date = New Date(Val(cmd_Year.SelectedValue), Val(cmd_Month.SelectedValue), Val(cmd_Day.SelectedValue))
            Dim PageLink As String = txt_Film_PageLink.Text.Trim
            Dim Director As String = txt_Film_Director.Text.Trim
            Dim Writer As String = txt_Film_writer.Text.Trim
            Dim Producer As String = txt_Film_producer.Text.Trim
            Dim Detail As String = txt_Film_castcrew.Text.Trim

            DLL.InsertProject(email, type, nameF, nameEn, SynFa, SynEn, ProductDate, PageLink, Director, Writer, Producer, Detail)
            GV.DataBind()
            lblStatusFilms.ForeColor = Drawing.Color.Green
            lblStatusFilms.Text = "پروژه با موفقیت اضافه شد و پس از تایید نمایش خواهد یافت."

            txt_Film_NameF.Text = ""
            txt_Film_NameEn.Text = ""
            txt_Film_summaryF.Text = ""
            txt_Film_summaryEn.Text = ""
            txt_Film_PageLink.Text = ""
            txt_Film_Director.Text = ""
            txt_Film_writer.Text = ""
            txt_Film_producer.Text = ""
            txt_Film_castcrew.Text = ""

        Else
            lblStatusFilms.ForeColor = Drawing.Color.Red
            lblStatusFilms.Text = "شما یک پروژه ی تایید نشده دارید، پس از تایید آن پروژه می توانید پروژه ی دیگری را اضافه کنید."
        End If

    End Sub

    Protected Sub btnInsertScreenplay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertScreenplay.Click

        Dim DLL As New DLL_Dashboard
        Dim email As String = DLLd._Email_

        If DLL.CheckMoreSuspendProject(email) Then

            Dim nameF As String = txt_Screenplay_NameF.Text.Trim
            Dim nameEn As String = txt_Screenplay_NameEn.Text.Trim
            Dim type As Byte = 2
            Dim SynFa As String = txt_Screenplay_summaryF.Text.Trim
            Dim SynEn As String = txt_Screenplay_summaryEn.Text.Trim
            Dim ProductDate As Date = Now
            Dim PageLink As String = ""
            Dim Director As String = ""
            Dim Writer As String = txt_Screenplay_writer.Text.Trim
            Dim Producer As String = ""
            Dim Detail As String = txt_Screenplay_detail.Text.Trim

            DLL.InsertProject(email, type, nameF, nameEn, SynFa, SynEn, ProductDate, PageLink, Director, Writer, Producer, Detail)
            GV.DataBind()
            lblStatusScreenplay.ForeColor = Drawing.Color.Green
            lblStatusScreenplay.Text = "پروژه با موفقیت اضافه شد و پس از تایید نمایش خواهد یافت."

            txt_Screenplay_NameF.Text = ""
            txt_Screenplay_NameEn.Text = ""
            txt_Screenplay_summaryF.Text = ""
            txt_Screenplay_summaryEn.Text = ""
            txt_Screenplay_writer.Text = ""
            txt_Screenplay_detail.Text = ""

        Else
            lblStatusScreenplay.ForeColor = Drawing.Color.Red
            lblStatusScreenplay.Text = "شما یک پروژه ی تایید نشده دارید، پس تایید آن پروژه می توانید پروژه ی دیگری را اضافه کنید."
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Cookies("IFP") Is Nothing Then Response.Redirect("~\ورود-و-ثبت-نام")
        DLLd._Email_ = Request.Cookies("IFP").Item("email")
        If Not IsPostBack Then HiddenEmail.Value = DLLd._Email_
        Title = "داشبورد" + " | " + "ایجاد پروژه"
    End Sub

End Class

