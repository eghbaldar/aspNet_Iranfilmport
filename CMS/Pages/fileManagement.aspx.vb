Imports System.IO
Imports System.Data
Imports System.Web

Partial Class CMS_Pages_fileManagement
    Inherits System.Web.UI.Page
    Private Const VirtualImageRoot As String = "~/files/uploadFiles/"
    Shared FilePath As String
    Shared DelPath As String
    Dim CountVolumeNotFileUsed As Integer
    Dim dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'System.Threading.Thread.Sleep(TimeSpan.FromSeconds(1))
        '----
        If Not Page.IsPostBack Then
            PopulateTree()
            ETree.Nodes(0).Select()
            ETree_SelectedNodeChanged(ETree, EventArgs.Empty)
            '-------------------
            GetFiles(New DirectoryInfo(MapPath("")))
            lbl_SizeSolution.Text = BytesToMegabytes(Convert.ToDouble(lbl_SizeSolution.Text)).ToString() + " MB"
            '-------------------            
        End If
        NotUsedFiles()

    End Sub

    Private Sub NotUsedFiles()

        CountVolumeNotFileUsed = 0
        Dim c As New DataColumn
        Dim r As DataRow

        c.DataType = System.Type.GetType("System.String")
        c.ColumnName = "اسم فایل"
        dt.Columns.Add(c)

        c = New DataColumn()
        c.DataType = System.Type.GetType("System.String")
        c.ColumnName = "(KB)حجم"
        dt.Columns.Add(c)

        c = New DataColumn()
        c.DataType = System.Type.GetType("System.String")
        c.ColumnName = "(MB)حجم"
        dt.Columns.Add(c)

        c = New DataColumn()
        c.DataType = System.Type.GetType("System.String")
        c.ColumnName = "لینک فایل"
        dt.Columns.Add(c)

        '--------------
        Dim CMS As New DLL_CMS
        Dim sFilesInDatabase() As String = CMS.GetAllFilesOfArticles
        '--------------
        Dim bCheck As Boolean = False
        Dim Files() As String = Directory.GetFiles(MapPath("~/files/uploadFiles/article/"))

        For i As Integer = 0 To Files.Length - 1
            bCheck = False
            For j As Integer = 0 To sFilesInDatabase.Length - 1

                If Path.GetFileName(Files(i).ToString()) = sFilesInDatabase(j) Then

                    bCheck = True
                    Exit For

                End If

            Next j

            If Not bCheck Then
                'فایل بلااستفاده وجود دارد
                r = dt.NewRow()
                r("اسم فایل") = Path.GetFileName(Files(i).ToString())
                Dim filesize As New FileInfo(Files(i).ToString())
                r("(kb)حجم") = filesize.Length
                r("(mb)حجم") = BytesToMegabytes(Convert.ToDouble(filesize.Length.ToString())).ToString()
                CountVolumeNotFileUsed += Convert.ToDouble(filesize.Length.ToString())
                r("لینک فایل") = Files(i)
                dt.Rows.Add(r)
            End If

        Next i

        Dim DS As New DataSet
        DS.Tables.Add(dt)
        DGNotUsedFiles.DataSource = DS.Tables(0)
        DGNotUsedFiles.DataBind()
        lblNotUseFiles.Text = DS.Tables(0).Rows.Count
        lblCountVolumeNotFileUsed.Text = Val(Val(CountVolumeNotFileUsed / 1024) / 2014).ToString + " MB"

    End Sub

    Public Function BytesToMegabytes(ByVal Bytes As Double) As Double
        Dim dblAns As Double
        dblAns = (Bytes / 1024) / 1024
        BytesToMegabytes = Format(dblAns, "###,###,##0.00")
    End Function

    Private Sub PopulateTree()
        Dim rootFolder As New DirectoryInfo(Server.MapPath(VirtualImageRoot))
        Dim root As TreeNode = AddNodeAndDescendents(rootFolder, Nothing)
        ETree.Nodes.Add(root)
    End Sub

    Private Function AddNodeAndDescendents(ByVal folder As DirectoryInfo, ByVal parentNode As TreeNode) As TreeNode

        Dim virtualFolderPath As String
        If parentNode Is Nothing Then
            virtualFolderPath = VirtualImageRoot
        Else
            virtualFolderPath = parentNode.Value & folder.Name & "/"
        End If

        Dim node As New TreeNode(folder.Name, virtualFolderPath)

        Dim subFolders As DirectoryInfo() = folder.GetDirectories()
        For Each subFolder As DirectoryInfo In subFolders
            Dim child As TreeNode = AddNodeAndDescendents(subFolder, node)
            node.ChildNodes.Add(child)
        Next

        Return node

    End Function

    Protected Sub ETree_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ETree.SelectedNodeChanged

        lblCurrentDirectory.Text = ETree.SelectedValue
        If ETree.SelectedValue.Trim() <> "~/Images/Public/ ".Trim() Then
            FillDGFiles(ETree.SelectedValue)
            FilePath = ETree.SelectedValue
            lblPathForUpload.Text = FilePath
            lblRealPathForUpload.Text = MapPath(FilePath)
            lbl_currentBranch.Text = MapPath(ETree.SelectedValue)
            DelPath = ETree.SelectedValue

            Dim DirInfo As New DirectoryInfo(MapPath(ETree.SelectedValue))
            lblSizeDirectory.Text = "0"
            For Each FI As FileInfo In DirInfo.GetFiles
                lblSizeDirectory.Text = (Convert.ToInt32(FI.Length) + Convert.ToInt32(lblSizeDirectory.Text)).ToString()
            Next
            lblSizeDirectory.Text = BytesToMegabytes(Convert.ToDouble(lblSizeDirectory.Text)).ToString() + " MB"
            '-------------------------------
            'P.Visible = True
            Dim s() As String = ETree.SelectedValue.Split("/")
            Dim i As Integer = s.Length - 2
            name_dir.Text = s(i)
            '-----------------
            'lbl_err_dir.Text = ""
        ElseIf ETree.SelectedValue.Trim() = "~/Images/Public/ ".Trim() Then
            'P.Visible = False
        End If

    End Sub

    Sub FillDGFiles(ByVal PathFile As String)

        Dim dt As New DataTable
        Dim c As New DataColumn
        Dim r As DataRow

        c.DataType = System.Type.GetType("System.String")
        c.ColumnName = "اسم فایل"
        dt.Columns.Add(c)

        c = New DataColumn()
        c.DataType = System.Type.GetType("System.String")
        c.ColumnName = "(KB)حجم"
        dt.Columns.Add(c)

        c = New DataColumn()
        c.DataType = System.Type.GetType("System.String")
        c.ColumnName = "(MB)حجم"
        dt.Columns.Add(c)

        c = New DataColumn()
        c.DataType = System.Type.GetType("System.String")
        c.ColumnName = "لینک فایل"
        dt.Columns.Add(c)

        '--------------
        Dim Files() As String = Directory.GetFiles(MapPath(PathFile))
        '--------------
        Dim i As Integer
        For i = 0 To Files.Length - 1
            Try
                r = dt.NewRow()
                r("اسم فایل") = Path.GetFileName(Files(i).ToString())
                Dim FileSize As New FileInfo(Files(i).ToString())
                r("(KB)حجم") = FileSize.Length
                r("(MB)حجم") = BytesToMegabytes(Convert.ToDouble(FileSize.Length.ToString())).ToString()
                r("لینک فایل") = Files(i)
                dt.Rows.Add(r)
            Catch ex As Exception
                r = dt.NewRow()
                r("اسم فایل") = "notRead"
                r("(KB)حجم") = "notRead"
                r("(MB)حجم") = "notRead"
                r("لینک فایل") = "notRead"
                dt.Rows.Add(r)
            End Try
        Next i

        Dim DS As New DataSet
        DS.Tables.Add(dt)
        DG.DataSource = DS.Tables(0)
        DG.DataBind()
        '-------------------------

    End Sub

    Protected Sub btn_createDir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_createDir.Click

        If txtUploadFileName.Text.Trim <> "" Then
            Directory.CreateDirectory(MapPath(FilePath + nameDirectory.Text))

            ETree.Nodes.Clear()
            PopulateTree()
            ETree.ExpandAll()
            nameDirectory.Text = ""
        End If

    End Sub

    Protected Sub btn_UpFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_UpFile.Click

        If txtUploadFileName.Text.Trim <> "" And FileUpload.FileName <> ""   Then
            Dim fileInfo As New FileInfo(FileUpload.FileName)
            Dim file = FilePath + Date.Now.Ticks.ToString + "-" + txtUploadFileName.Text.Trim.Replace(" ", "-") + fileInfo.Extension
            FileUpload.SaveAs(MapPath(file))
            FillDGFiles(FilePath)
            lblAfterUploading.Text = "<a href='" & ResolveUrl(file) & "' target='_blank'>GetLink</a>"
            txtUploadFileName.Text = ""
        End If

    End Sub

    Sub GetFiles(ByVal source As DirectoryInfo)

        Dim files() As FileInfo = source.GetFiles
        Dim f As FileInfo
        For Each f In files
            lbl_SizeSolution.Text += f.Length
        Next

        Dim dirs() As DirectoryInfo = source.GetDirectories
        For Each Dir As DirectoryInfo In dirs
            GetFiles(Dir)
        Next

    End Sub

    Sub Delete(ByVal sender As Object, ByVal e As CommandEventArgs)
        File.Delete(MapPath(DelPath + e.CommandArgument))
        FillDGFiles(FilePath)
    End Sub

    Sub DeleteNotUsedFile(ByVal sender As Object, ByVal e As CommandEventArgs)
        File.Delete(MapPath("/files/uploadFiles/article/" + e.CommandArgument))
        DGNotUsedFiles.DataBind()
    End Sub

    Sub Download(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Clear()
        Response.AddHeader("Content-Disposition", "attachment;filename=" + DelPath + e.CommandArgument)
        Response.AddHeader("Cottent-Length", DelPath + e.CommandArgument.ToString())
        Response.ContentType = "application/octet-stream"
        Response.WriteFile(DelPath + e.CommandArgument)
    End Sub

    Protected Sub btn_update_nameDir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_update_nameDir.Click

        Dim s() As String = ETree.SelectedValue.Split("/")
        Dim Result_s As String = ""
        For i As Byte = 0 To s.Length - 3
            Result_s = Result_s + s(i) + "/"
        Next

        Directory.Move(MapPath(DelPath), MapPath(Result_s) + name_dir.Text)
        ETree.Nodes.Clear()
        PopulateTree()
        ETree.Nodes(0).Select()
        ETree.ExpandAll()
        ETree_SelectedNodeChanged(ETree, EventArgs.Empty)
        'P.Visible = False
    End Sub

    Protected Sub Del_Dir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles Del_Dir.Click

        Try
            Directory.Delete(MapPath(DelPath))

            ETree.Nodes.Clear()
            PopulateTree()
            ETree.Nodes(0).Select()
            ETree.ExpandAll()
            ETree_SelectedNodeChanged(ETree, EventArgs.Empty)
            'P.Visible = False
            'lbl_err_dir.Text = ""
        Catch ex As Exception
            'P.Visible = False
            'If Err.Number = 57 Then lbl_err_dir.Text = "تمام زیر پوشه ها و فایل های آنها باید پاک شوند"
        End Try

    End Sub

    Protected Sub DGNotUsedFiles_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles DGNotUsedFiles.PageIndexChanging
        DGNotUsedFiles.PageIndex = e.NewPageIndex
        DGNotUsedFiles.DataSource = dt
        DGNotUsedFiles.DataBind()
    End Sub

    Protected Sub btnDeleteAllNotUsedFiles_Click(sender As Object, e As System.EventArgs) Handles btnDeleteAllNotUsedFiles.Click
        For i As Integer = 0 To DGNotUsedFiles.Rows.Count - 1
            Try
                File.Delete(MapPath("/files/uploadFiles/article/" + DGNotUsedFiles.Rows(i).Cells(2).Text))
            Catch ex As Exception

            End Try
        Next
        DGNotUsedFiles.DataBind()
    End Sub
End Class
