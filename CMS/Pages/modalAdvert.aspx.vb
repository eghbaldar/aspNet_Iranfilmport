
Imports System.IO

Partial Class CMS_Pages_modalAdvert
    Inherits System.Web.UI.Page

    Dim DLCMS As New DLL_CMS
    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click

        If FileUpload.FileName = Nothing Then Exit Sub
        Dim PHOTO As String = Guid.NewGuid.ToString + Path.GetExtension(FileUpload.FileName)
        DLCMS.InsertModalAdvert(txtTitle.Text.Trim, txtBlinkText.Text.Trim, txtSubTitle1.Text.Trim, txtLinkSubTitle1.Text.Trim,
txtSubTitle2.Text.Trim, txtLinkSubTitle2.Text.Trim, txtColor.Text.Trim, PHOTO)
        FileUpload.SaveAs(MapPath("~/files/uploadFiles/ModaAdvertisement/" + PHOTO))
        txtTitle.Text = ""
        txtSubTitle1.Text = ""
        txtLinkSubTitle1.Text = ""
        txtSubTitle2.Text = ""
        txtLinkSubTitle2.Text = ""
        txtColor.Text = ""
        txtBlinkText.Text = ""
        GridView.DataBind()
    End Sub
    Public Sub EnableThis(sender As Object, e As CommandEventArgs)
        DLCMS.UpdateModalAdvertEnable(e.CommandArgument.ToString)
        GridView.DataBind()
    End Sub
    Public Sub DeleteModalAdvertisement(sender As Object, e As CommandEventArgs)
        DLCMS.DeleteModalAdvertisement(Val(e.CommandArgument.ToString))
        GridView.DataBind()
    End Sub
End Class
