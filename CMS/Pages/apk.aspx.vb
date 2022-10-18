
Imports System.IO

Partial Class CMS_Pages_apk
    Inherits System.Web.UI.Page

    Dim DLL_CMS As New DLL_CMS

    Protected Sub BtnStaffVersion_Click(sender As Object, e As EventArgs) Handles BtnStaffVersion.Click

        If txtStaff.Text.Trim <> "" And FileUploadStaffVersion.FileName.Trim <> "" Then
            'Update Database
            DLL_CMS.UpdateAPK(txtStaff.Text.Trim, True)
            'Delete File Physically
            Dim fi As New FileInfo(MapPath("~/files/uploadFiles/apk/staff/" & dgStaff.Rows(0).Cells(2).Text))
            fi.Delete()
            'Upoad New File
            FileUploadStaffVersion.SaveAs(MapPath("~/files/uploadFiles/apk/staff/" & txtStaff.Text.Trim))
            'Update GridView
            dgStaff.DataBind()
            txtStaff.Text = ""
        End If

    End Sub

    Protected Sub BtnClientsVersion_Click(sender As Object, e As EventArgs) Handles BtnClientsVersion.Click
        If txtClient.Text.Trim <> "" And FileUploadClientVersion.FileName.Trim <> "" Then
            'Update Database
            DLL_CMS.UpdateAPK(txtClient.Text.Trim, False)
            ' Delete File Physically
            Dim fi As New FileInfo(MapPath("~/files/uploadFiles/apk/clients/" & dgClients.Rows(0).Cells(2).Text))
            fi.Delete()
            'Upoad New File
            FileUploadClientVersion.SaveAs(MapPath("~/files/uploadFiles/apk/clients/" & txtClient.Text.Trim))
            ' Update GridView
            dgClients.DataBind()
            txtClient.Text = ""
        End If
    End Sub
End Class
