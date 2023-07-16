Imports System.IO

Partial Class CMS_Pages_imagesManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            txtUniqueNumber.Text = Guid.NewGuid.ToString                
        End If
        GetFiles(New DirectoryInfo(MapPath("~/files/ckfinder/userfiles/images/")))
        GetEnteredTags(Request.QueryString("enteredTags"))

    End Sub
    Sub GetEnteredTags(Tags As String)
        txtEntryText.Text = Tags.Replace("+", " ").Replace("_", " ").Trim
    End Sub
    Sub GetFiles(ByVal source As DirectoryInfo)

        pnlMain.Controls.Clear()
        Dim files() As FileInfo = source.GetFiles
        Dim f As FileInfo
        For Each f In files

            Dim pnl As New Panel
            Dim pnlImg As New Panel
            Dim pnlblName As New Panel
            Dim pnlBtnCopy As New Panel
            Dim btnCopy As New HtmlControls.HtmlGenericControl("div")
            Dim btnDelete As New Button
            Dim btnOpen As New HyperLink

            Dim img As New Image
            Dim lblName As New Label

            'img.ImageUrl = "~/files/ckfinder/userfiles/images/" + f.Name
            img.ImageUrl = "~\convertToUnscale\?photo=" + "files/ckfinder/userfiles/images/" + f.Name + "&w=100&h=100"
            img.Width = 100
            img.Height = 100
            img.Style.Add("margin", "10px")
            img.Style.Add("object-fit", "cover")

            lblName.Text = f.Name
            lblName.ID = Guid.NewGuid.ToString
            lblName.Style.Add("font-size", "10px")

            pnl.Style.Add("border", "1px solid #ccc")
            pnl.Style.Add("padding", "5px")
            pnl.Style.Add("margin", "5px")
            pnl.Style.Add("float", "left")

            btnCopy.InnerText = "Copy"
            btnCopy.Attributes.Add("onclick", "CP('http://iranfilmport.com/files/ckfinder/userfiles/images/" & f.Name & "')")
            btnCopy.Style.Add("cursor", "pointer")

            btnDelete.Text = "×"
            btnDelete.Attributes.Add("runat", "server")
            btnDelete.Style.Add("background-color", "red")
            btnDelete.ToolTip = lblName.Text
            AddHandler btnDelete.Click, AddressOf btnDeleteClick
            btnDelete.OnClientClick = "return confirm('آیا از حذف این عکس مطمئن هستید؟');"

            btnOpen.Text = "  (Show)"
            btnOpen.Style.Add("font-size", "8px")
            btnOpen.Target = "_blank"
            btnOpen.NavigateUrl = "~/files/ckfinder/userfiles/images/" + f.Name

            pnlImg.Controls.Add(img)
            pnlblName.Controls.Add(lblName)
            pnlBtnCopy.Controls.Add(btnCopy)
            pnlBtnCopy.Controls.Add(btnDelete)
            pnlBtnCopy.Controls.Add(btnOpen)

            pnl.Controls.Add(pnlImg)
            pnl.Controls.Add(pnlblName)
            pnl.Controls.Add(pnlBtnCopy)

            pnlMain.Controls.Add(pnl)

        Next

    End Sub

    Private Sub btnDeleteClick(ByVal sender As Object, ByVal e As EventArgs)
        Dim btn As New Button
        btn = DirectCast(sender, Button)
        File.Delete(MapPath("~/files/ckfinder/userfiles/images/" + btn.ToolTip))
        'chkShowImages.Checked = False
        Response.Redirect("~/cms/pages/imagesManagement")
    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As System.EventArgs) Handles btnUpload.Click

        If FileUpload.FileName = Nothing Then
            lblWarning.ForeColor = Drawing.Color.Red
            lblWarning.Text = "فایل را انتخاب کنید"
            Exit Sub
        End If

        If Not checkFileExtension() Then Exit Sub
        If Not checkFileVolume() Then Exit Sub

        Dim FN As String = ""
        If rbUniqueNumber.Checked Then
            FN = txtUniqueNumber.Text
            txtUniqueNumber.Text = Guid.NewGuid.ToString
        End If
        If rbEntryText.Checked Then
            If Not txtEntryText.Text.Trim = Nothing Then
                FN = txtEntryText.Text.Trim.Replace(" ", "_")
            Else
                lblWarning.ForeColor = Drawing.Color.Red
                lblWarning.Text = "عبارت را وارد کنید."
                Exit Sub
            End If
        End If

        lblWarning.Text = CheckDuplicateNames(New DirectoryInfo(MapPath("~/files/ckfinder/userfiles/images/")), FN)

        If Not CheckDuplicateNames(New DirectoryInfo(MapPath("~/files/ckfinder/userfiles/images/")), FN) Then
            lblWarning.ForeColor = Drawing.Color.Red
            lblWarning.Text = "نام فایل تکراری است."
            Exit Sub
        End If

        FileUpload.SaveAs(MapPath("~/files/ckfinder/userfiles/images/" + FN + Path.GetExtension(FileUpload.FileName)))
        lblWarning.Text = "تصویر آپلود شد."
        lblWarning.ForeColor = Drawing.Color.Green
        GetFiles(New DirectoryInfo(MapPath("~/files/ckfinder/userfiles/images/")))

        DivAfterUploaded.Visible = True
        imgAfterUpload.ImageUrl = "~/files/ckfinder/userfiles/images/" + FN + Path.GetExtension(FileUpload.FileName)
        imgAfterUpload.Dispose()
        lblAfterUpload.ForeColor = Drawing.Color.Blue
        lblAfterUpload.Text = "<a href='http://iranfilmport.com/files/ckfinder/userfiles/images/" + FN + Path.GetExtension(FileUpload.FileName) + "' target='_blank'>Right Click & Click on [Copy Link Address]</a>"

        btnUpload.Visible = False

    End Sub

    Private Function checkFileExtension() As Boolean

        Select Case Path.GetExtension(FileUpload.FileName).ToLower.Replace(".", Nothing)
            Case "jpeg"
                lblWarning.Text = ""
                Return True
            Case "jpg"
                lblWarning.Text = ""
                Return True
            Case Else
                lblWarning.ForeColor = Drawing.Color.Red
                lblWarning.Text = "پسوند فایل: " + Path.GetExtension(FileUpload.FileName) + " می باشد." + " | " + "فرمت اشتباه می باشد فقط جی پگ"
                Return False
        End Select
        Return False

    End Function

    Private Function checkFileVolume() As Boolean
        If Not (chkDenyLimitation.Checked) Then
            If FileUpload.FileBytes.Length < 110000 Then
                Return True
            Else
                lblWarning.ForeColor = Drawing.Color.Red
                lblWarning.Text = "حجم فایل بیشتر از 110 کیلوبایت می باشد"
                Return False
            End If
        Else
            If FileUpload.FileBytes.Length < 200000 Then
                Return True
            Else
                lblWarning.ForeColor = Drawing.Color.Red
                lblWarning.Text = "ماکسیمم حجم فایل باید 200 کیلوبایت باشد"
                Return False
            End If
        End If
    End Function

    Private Function CheckDuplicateNames(source As DirectoryInfo, name As String) As Boolean
        Dim files() As FileInfo = source.GetFiles
        For i As Long = 0 To files.Length - 1
            If Path.GetFileNameWithoutExtension(files(i).Name) = name Then
                Return False
            End If
        Next
        Return True
    End Function

    Private Sub chkShowImages_CheckedChanged(sender As Object, e As EventArgs) Handles chkShowImages.CheckedChanged

        If chkShowImages.Checked Then
            pnlMain.Visible = True
        Else
            pnlMain.Visible = False
        End If
    End Sub

    Private Sub btnImageAfterUpload_Click(sender As Object, e As EventArgs) Handles btnImageAfterUpload.Click
        System.IO.File.Delete(MapPath(imgAfterUpload.ImageUrl))
        imgAfterUpload.ImageUrl = Nothing
        btnUpload.Visible = True
        DivAfterUploaded.Visible = False
    End Sub

    Private Sub btnNextUpload_Click(sender As Object, e As EventArgs) Handles btnNextUpload.Click
        DivAfterUploaded.Visible = False
        btnUpload.Visible = True
    End Sub
End Class
