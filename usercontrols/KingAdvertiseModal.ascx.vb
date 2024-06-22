
Imports System.Data

Partial Class usercontrols_advertiseModal
    Inherits System.Web.UI.UserControl
    Dim DLCMS As New DLL_CMS


    Private Sub usercontrols_advertiseModal_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            Dim dt As DataTable = DLCMS.GetEnableModalAdvertisement()
            Dim dr As DataRow = dt.Rows(0)
            HF_id.Value = dr("id").ToString
            HF_title.Value = dr("title").ToString.Replace("ي", "ی")
            HF_blinkText.Value = dr("blinkText").ToString
            HF_subTitle1.Value = dr("subTitle1").ToString.Replace("ي", "ی")
            HF_LinkSubTitle1.Value = dr("LinkSubTitle1").ToString
            HF_subTitle2.Value = dr("subTitle2").ToString.Replace("ي", "ی")
            HF_LinkSubTitle2.Value = dr("LinkSubTitle2").ToString
            HF_Color.Value = dr("Color").ToString
            HF_Photo.Value = dr("Photo").ToString
        Catch ex As Exception

        End Try
    End Sub
End Class
