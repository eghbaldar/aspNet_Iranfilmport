Imports System.IO
Imports System.Data

Partial Class CMS_Pages_slider
    Inherits System.Web.UI.Page

    Shared PrePhotoPath As String

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click

        Try
            If txtLink_Insert.Text.Trim <> "" And txtMain_Insert.Text.Trim <> "" _
            And FileInsert.FileName.ToString <> "" And txtSubText_insert.Text.Trim <> "" Then
                Dim DLL As New DLL_CMS
                Dim FN As String = Guid.NewGuid.ToString + Path.GetExtension(FileInsert.FileName)
                DLL.InsertSlider(FN, txtMain_Insert.Text.Trim, _
                                 txtSubText_insert.Text.Trim, txtLink_Insert.Text.Trim, txtEnMain_Insert.Text.Trim)
                FileInsert.SaveAs(MapPath("~/files/UploadFiles/sliders/" + FN))
                GV.DataBind()
                NotifyInsert.Text = "اسلاید اضافه شد. بررسی کنید."
            Else
                NotifyInsert.Text = "تمامی فیلد ها را پر کنید."
            End If
        Catch ex As Exception
            NotifyInsert.Text = "خطایی رخ داده است"
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim DL As New DLL_CMS
        Dim Dset As New DataSet
        If Not IsPostBack Then
            If Request.QueryString("id") <> "" Then
                Panel.Enabled = True
                ''''''''''''''''''''''''''
                Dset = DL.PreUpdateSlider(Val(Request.QueryString("id")))
                ''''''''''''''''''''''''''
                imgSlider.ImageUrl = "~\files\uploadFiles\sliders\" + Dset.Tables(0).Rows(0)("photo").ToString
                PrePhotoPath = Dset.Tables(0).Rows(0)("photo").ToString.Trim
                ''''''''''''''''''''''''''''
                If Convert.ToBoolean(Dset.Tables(0).Rows(0)("visible").ToString) Then
                    cmd_visible.Items(0).Selected = True
                Else
                    cmd_visible.Items(1).Selected = True
                End If
                ''''''''''''''''
                txtUpdateText.Text = Dset.Tables(0).Rows(0)("text").ToString
                txtUpdateSubText.Text = Dset.Tables(0).Rows(0)("subtext").ToString
                txtUpdateLink.Text = Dset.Tables(0).Rows(0)("link").ToString
                txtUpdateTextEn.Text = Dset.Tables(0).Rows(0)("textEn").ToString
            End If
        End If

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        Dim DL As New DLL_CMS
        '''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''
        If FilePhoto.FileName.Trim = "" And PrePhotoPath.ToString.Trim = "" Then
            lblNotify.Text = "لوگو را انتخاب کنید."
            Exit Sub
        End If
        '''''''''''''''''''''''''''''''''''''
        Dim FN As String
        If FilePhoto.FileName.Trim <> "" Then
            FN = Guid.NewGuid.ToString + Path.GetExtension(FilePhoto.FileName.Trim)
            FilePhoto.SaveAs(MapPath("~/files/UploadFiles/sliders/" + FN))
        Else
            FN = PrePhotoPath
        End If

        DL.UpdateSlider(FN, txtUpdateText.Text.Trim, _
                        txtUpdateSubText.Text.Trim, txtUpdateLink.Text.Trim, Request.QueryString("id"), _
                        cmd_visible.SelectedValue, txtUpdateTextEn.Text.Trim)

        GV.DataBind()
        Panel.Enabled = False
        Dim color As New Drawing.ColorConverter
        Panel.BackColor = color.ConvertFromString("#b8edc6")

    End Sub

End Class
