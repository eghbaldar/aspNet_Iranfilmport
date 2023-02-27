
Partial Class CMS_Pages_resumeeachone
    Inherits System.Web.UI.Page

    Dim ds As New DLL_CMS

    Public Sub ShowEdit(sender As Object, e As CommandEventArgs)
        MultiView.ActiveViewIndex = 1
        lblTitle.Text = "وضعیت: ویرایش"
        lblIdEdit.Text = e.CommandArgument.ToString
        txtAccolade_fa.Value = ds.GetEachResumeEnFa(Val(lblIdEdit.Text), True)
        txtAccolade_en.Value = ds.GetEachResumeEnFa(Val(lblIdEdit.Text), False)
    End Sub

    Private Sub btnUpdateAccolade_Click(sender As Object, e As EventArgs) Handles btnUpdateAccolade.Click
        ds.UpdateAccolade(txtAccolade_fa.Value, txtAccolade_en.Value, Val(lblIdEdit.Text))
        dgAccolades.DataBind()
        MultiView.ActiveViewIndex = 0
    End Sub

    Private Sub CMS_Pages_resumeeachone_Load(sender As Object, e As EventArgs) Handles Me.Load
        Title = "Accolade ..."
    End Sub
End Class
