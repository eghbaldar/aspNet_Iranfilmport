
Partial Class CMS_Pages_resume
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim ds As New DLL_CMS
            txtCV.Value = ds.ShowResume(True)
            txtCVEn.Value = ds.ShowResume(False)
        End If
    End Sub

    Protected Sub btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn.Click
        Dim ds As New DLL_CMS
        ds.UpdateResume(txtCV.Value, True)
    End Sub

    Protected Sub btnEn_Click(sender As Object, e As System.EventArgs) Handles btnEn.Click
        M_CV.ActiveViewIndex = 1
    End Sub

    Protected Sub btnFa_Click(sender As Object, e As System.EventArgs) Handles btnFa.Click
        M_CV.ActiveViewIndex = 0
    End Sub

    Protected Sub btnEnUpdate_Click(sender As Object, e As System.EventArgs) Handles btnEnUpdate.Click
        Dim ds As New DLL_CMS
        ds.UpdateResume(txtCVEn.Value, False)
    End Sub

    Protected Sub btnUpdateAccolade_Click(sender As Object, e As EventArgs) Handles btnUpdateAccolade.Click
        Dim ds As New DLL_CMS
        ds.InsertAccolade(Val(cmdFilm.SelectedValue), txtAccolade_fa.Value, txtAccolade_en.Value)
        txtAccolade_en.Value = ""
        txtAccolade_fa.Value = ""
        dgAccolades.DataBind()

    End Sub

End Class
