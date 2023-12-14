
Imports System.Data

Partial Class CMS_Pages_activities
    Inherits System.Web.UI.Page

    Dim dll_cms As New DLL_CMS

    Private Sub CMS_Pages_activities_Load(sender As Object, e As EventArgs) Handles Me.Load

        GridView.DataSource = dll_cms.GetContactFromDesktop()
        GridView.DataBind()

        Dim dt As DataTable = dll_cms.GetContactAlphabet()
        For i As Byte = 0 To dt.Rows.Count - 1
            Dim btn As New Button
            btn.Text = dt.Rows(i)(0).ToString()
            btn.CssClass = "btnContact"
            AddHandler btn.Click, AddressOf Me.btnCLick
            PanelAlphabet.Controls.Add(btn)
        Next

    End Sub

    Private Sub btnCLick(sender As Object, e As EventArgs)
        HiddenFieldAlphabet.Value = CType(sender, Button).Text
        cmdContacts.DataBind()
        GridView.DataSource = dll_cms.GetContactFromDesktopByContactId(cmdContacts.SelectedValue)
        GridView.DataBind()
    End Sub

    Protected Sub cmdContacts_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmdContacts.SelectedIndexChanged
        GridView.DataSource = dll_cms.GetContactFromDesktopByContactId(cmdContacts.SelectedValue)
        GridView.DataBind()
    End Sub
End Class
