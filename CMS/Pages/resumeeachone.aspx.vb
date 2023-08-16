
Partial Class CMS_Pages_resumeeachone
    Inherits System.Web.UI.Page

    Dim ds As New DLL_CMS

    Public Sub ShowEdit(sender As Object, e As CommandEventArgs)

        MultiView.ActiveViewIndex = 1
        lblIdEdit.Text = e.CommandArgument.ToString
        txtAccolade_fa.Value = ds.GetEachResumeEnFa(Val(lblIdEdit.Text), True)
        txtAccolade_en.Value = ds.GetEachResumeEnFa(Val(lblIdEdit.Text), False)

    End Sub

    Private Sub btnUpdateAccolade_Click(sender As Object, e As EventArgs) Handles btnUpdateAccolade.Click
        ds.InsertUpdateAccolade(Val(Page.RouteData.Values("id_film")), txtAccolade_fa.Value, txtAccolade_en.Value)
        dgAccolades.DataBind()
        MultiView.ActiveViewIndex = 0
    End Sub

    Private Sub CMS_Pages_resumeeachone_Load(sender As Object, e As EventArgs) Handles Me.Load
        Title = "Accolade ..."
        If Not ds.ExistAccoalde(Page.RouteData.Values("id_film")) Then
            MultiView.ActiveViewIndex = 1
            lblTitle.Text = String.Format("{0}", "اولین درج") + "<br/>" + String.Format("{0}{1}{2}", "<span style='color:red;font-size:50px;'>", ds.GetFilmNameWithId(Page.RouteData.Values("id_film")), "</span>")
        Else
            MultiView.ActiveViewIndex = 0
            lblTitle.Text = String.Format("{0}", "ویرایش") + "<br/>" + String.Format("{0}{1}{2}", "<span style='color:red;font-size:50px;'>", ds.GetFilmNameWithId(Page.RouteData.Values("id_film")), "</span>")
        End If
    End Sub
End Class
