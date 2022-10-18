Imports System.IO

Partial Class CMS_Pages_posterofcustomer
    Inherits System.Web.UI.Page

    Dim DLL As New DLL_CMS
    Shared PrePhotoPath As String

    Protected Sub btnInsert_Click(sender As Object, e As System.EventArgs) Handles btnInsert.Click
        Dim FN As String = Guid.NewGuid.ToString + Path.GetExtension(FileInsert.FileName)
        DLL.InsertPosterOfCustomer(txtPageOfName.Text.Trim, FN, txtFilmFa.Text.Trim, _
                                   txtFilmEn.Text.Trim, txtDirectorFa.Text.Trim, txtDirectorEn.Text.Trim, _
                                   txtText.Text.Trim, txtTrailerAparat.Text.Trim)
        FileInsert.SaveAs(MapPath("~/files/UploadFiles/PosterOfCustomers/" + FN))
        txtDirectorEn.Text = ""
        txtDirectorFa.Text = ""
        txtFilmEn.Text = ""
        txtFilmFa.Text = ""
        txtPageOfName.Text = ""
        txtTrailerAparat.Text = ""
        GV.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Request.QueryString("id") <> "" And Not IsPostBack Then
            Pnl_Update.Visible = True
            Pnl_Insert.Visible = False
            setLoad()
        ElseIf Request.QueryString("id") = "" Then
            Pnl_Insert.Visible = True
            Pnl_Update.Visible = False
        End If
    End Sub

    Private Sub setLoad()
        With DLL.SelectPosterOfCustomer(Val(Request.QueryString("id")))
            txtPageofPageUpdate.Text = .Rows(0)("nameofpage").ToString()
            txtFilmEnUpate.Text = .Rows(0)("nameEn").ToString()
            txtFilmFaUpdate.Text = .Rows(0)("nameFa").ToString()
            txtDirectorEnUpdate.Text = .Rows(0)("directorEn").ToString()
            txtDirectorFaUpdate.Text = .Rows(0)("directorFa").ToString()
            txtTextUpdate.Text = .Rows(0)("text").ToString()
            txtTrailerAparatUpdate.Text = .Rows(0)("trailerAparat").ToString()
            Image.ImageUrl = "~/files/UploadFiles/PosterOfCustomers/" + .Rows(0)("photo").ToString()
            PrePhotoPath = .Rows(0)("photo").ToString.Trim
        End With
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As System.EventArgs) Handles btnUpdate.Click

        If txtDirectorEnUpdate.Text.Length < 32 And txtDirectorFaUpdate.Text.Length < 32 And _
            txtFilmEnUpate.Text.Length < 32 And txtFilmFaUpdate.Text.Length < 32 Then
            Dim FN As String
            If FileUpdate.FileName.Trim = "" And PrePhotoPath.ToString.Trim = "" Then
                lblNotify.Text = "عکس را انتخاب کنید."
                Exit Sub
            Else
                If FileUpdate.FileName.Trim <> "" Then
                    FN = Guid.NewGuid.ToString + Path.GetExtension(FileUpdate.FileName.Trim)
                    FileUpdate.SaveAs(MapPath("~/files/UploadFiles/PosterOfCustomers/" + FN))
                Else
                    FN = PrePhotoPath
                End If
            End If
            '''''''''''''''''''''''''''''''''''''
            DLL.UpdatePosterOfCustomer(txtPageofPageUpdate.Text.Trim, _
                                       FN, _
                                       txtFilmFaUpdate.Text.Trim, _
                                       txtFilmEnUpate.Text.Trim, _
                                       txtDirectorFaUpdate.Text.Trim, _
                                       txtDirectorEnUpdate.Text.Trim, _
                                       txtTextUpdate.Text.Trim, _
                                    txtTrailerAparatUpdate.Text.Trim, _
                                       Val(Request.QueryString("id")))
            'GV.DataBind()
            Response.Redirect("posterofcustomer.aspx")
            Pnl_Insert.Visible = False
            Pnl_Update.Visible = False
        Else
            setLoad()
            lblNotify.Text = "تعداد کارکترهای یکی از فیلدها بلندتر از حد مجاز است"
        End If
      
    End Sub

    Public Sub SetType(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        DLL.UpdateTypeOfPostersFilms(Val(s(1)), Val(s(0)))
        GV.DataBind()
    End Sub

    Public Function GetTypeColor(ByVal e As Object) As System.Drawing.Color
        Dim s() As String = e.ToString.Split("|")
        Select Case s(1)
            Case 0
                If Val(DLL.GetTypeOfPostersFilms(Val(s(0)).ToString)) = 0 Then Return Drawing.Color.Azure
            Case 1
                If Val(DLL.GetTypeOfPostersFilms(Val(s(0)).ToString)) = 1 Then Return Drawing.Color.Azure
            Case 2
                If Val(DLL.GetTypeOfPostersFilms(Val(s(0)).ToString)) = 2 Then Return Drawing.Color.Azure
        End Select
    End Function

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Response.Redirect("~/cms/pages/posterofcustomer?searchName=" & txtSearchFilmName.Text.Trim)
    End Sub

End Class
