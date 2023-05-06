Imports System.Drawing
Imports System.IO

Partial Class test
    Inherits System.Web.UI.Page

    Dim imgSource As System.Drawing.Image
    Private imgOutput As System.Drawing.Image

    Shared lstMainList As New List(Of String)
    Shared lstFinalNameForDelete As New List(Of String)

    Public Function Resize(ByVal intPercent As Integer, ByVal intType As Integer, filename As String) As Object

        'resize the image by percent
        imgSource = Image.FromFile(MapPath("~/imgtest/org/" & filename))

        Dim intX, intY As Integer
        intX = Int(imgSource.Width / 100 * intPercent)
        intY = Int(imgSource.Height / 100 * intPercent)
        Dim bm As Drawing.Bitmap = New System.Drawing.Bitmap(intX, intY)
        Dim g As System.Drawing.Graphics = Drawing.Graphics.FromImage(bm)

        Select Case intType
            Case 0
                g.InterpolationMode = Drawing.Drawing2D.InterpolationMode.Default
            Case 1
                g.InterpolationMode = Drawing.Drawing2D.InterpolationMode.High
            Case 2
                g.InterpolationMode = Drawing.Drawing2D.InterpolationMode.HighQualityBilinear
            Case 3
                g.InterpolationMode = Drawing.Drawing2D.InterpolationMode.HighQualityBicubic
            Case 4
                g.InterpolationMode = Drawing.Drawing2D.InterpolationMode.Low

        End Select

        g.DrawImage(imgSource, 0, 0, intX, intY)

        imgOutput = bm
        imgOutput.Save(MapPath("~\imgtest\temp\" & filename))

        g.Dispose()
        bm.Dispose()
        imgOutput.Dispose()
        imgSource.Dispose()

    End Function

    Private Sub btnAnalyse_Click(sender As Object, e As EventArgs) Handles btnAnalyse.Click
        Dim files() As FileInfo = New DirectoryInfo(MapPath("~/imgtest/org")).GetFiles
        For Each f In files
            If f.Length > 200000 Then
                lstMainList.Add(f.Name.ToUpper)
                lstAnalyse.Items.Add(f.Name & "    >    " & f.Length.ToString)
            End If
        Next
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        For i As Integer = 0 To lstAnalyse.Items.Count - 1
            Dim name As String() = lstAnalyse.Items(i).Text.Split(">")
            Resize(100, 4, name(0).Trim)

            Dim fi As FileInfo = New FileInfo(MapPath("~/imgtest/temp/" & name(0).Trim))
            If fi.Length > 200000 Then
                Dim j As Integer = 99
                While fi.Length > 200000
                    fi = New FileInfo(MapPath("~/imgtest/temp/" & name(0).Trim))
                    Resize(j, 4, name(0).Trim)
                    j -= 1
                End While
            End If
        Next
        GetFiles(New DirectoryInfo(MapPath("~/imgtest/temp/")))

    End Sub

    Sub GetFiles(ByVal source As DirectoryInfo)

        pnlMain.Controls.Clear()
        'Dim files() As FileInfo = source.GetFiles

        If GetLatestList().Count > 0 Then

            For i As Integer = 0 To GetLatestList.Count - 1

                Dim f As New FileInfo("~/imgtest/temp/" & GetLatestList(0))

                Dim pnl As New Web.UI.WebControls.Panel
                Dim pnlImgOrg As New Web.UI.WebControls.Panel
                Dim pnlImgConverted As New Web.UI.WebControls.Panel
                Dim pnlblName As New Web.UI.WebControls.Panel
                Dim pnlBtnCopyOrg As New Web.UI.WebControls.Panel
                Dim pnlBtnDeleteTemp As New Web.UI.WebControls.Panel
                Dim pnlBtnCopyTemp As New Web.UI.WebControls.Panel
                Dim btnCopy As New HtmlControls.HtmlGenericControl("div")
                Dim btnDelete As New Button
                Dim btnOpenOrg As New HyperLink
                Dim btnOpenTemp As New HyperLink

                Dim imgOrg As New WebControls.Image
                Dim imgConverted As New WebControls.Image
                Dim lblName As New Label

                'original image
                imgOrg.ImageUrl = "~/imgtest/org/" + f.Name
                imgOrg.Width = 100
                imgOrg.Height = 100
                imgOrg.Style.Add("margin", "10px")
                imgOrg.Style.Add("object-fit", "cover")
                'converted image
                imgConverted.ImageUrl = "~/imgtest/temp/" + f.Name
                imgConverted.Width = 100
                imgConverted.Height = 100
                imgConverted.Style.Add("margin", "10px")
                imgConverted.Style.Add("object-fit", "cover")

                lblName.Text = f.Name
                lblName.ID = Guid.NewGuid.ToString
                lblName.Style.Add("font-size", "10px")

                pnl.ID = "pnl_" & lblName.Text
                pnl.Style.Add("border", "1px solid #ccc")
                pnl.Style.Add("padding", "5px")
                pnl.Style.Add("margin", "5px")
                pnl.Style.Add("float", "left")

                btnDelete.Text = "×"
                btnDelete.Attributes.Add("runat", "server")
                btnDelete.Style.Add("background-color", "red")
                btnDelete.Style.Add("width", "100%")
                btnDelete.Style.Add("color", "white")
                btnDelete.ToolTip = lblName.Text
                btnDelete.OnClientClick = "return confirm('Sure?');"
                AddHandler btnDelete.Click, Sub()
                                                Dim frm As Control = Page.FindControl("form1")
                                                For Each c As Control In pnlMain.Controls.OfType(Of Web.UI.WebControls.Panel)
                                                    If c.ID.ToUpper = "PNL_" & btnDelete.ToolTip.ToUpper Then
                                                        lstFinalNameForDelete.Add(btnDelete.ToolTip.ToUpper)
                                                        c.Visible = False
                                                    End If
                                                Next
                                            End Sub

                btnOpenOrg.Text = "  (Show)"
                btnOpenOrg.Style.Add("font-size", "8px")
                btnOpenOrg.Target = "_blank"
                btnOpenOrg.NavigateUrl = "~/imgtest/org/" + f.Name

                btnOpenTemp.Text = "  (Show)"
                btnOpenTemp.Style.Add("font-size", "8px")
                btnOpenTemp.Target = "_blank"
                btnOpenTemp.NavigateUrl = "~/imgtest/temp/" + f.Name

                pnlImgOrg.Controls.Add(imgOrg)
                pnlBtnCopyOrg.Controls.Add(btnOpenOrg)

                pnlImgConverted.Controls.Add(imgConverted)
                pnlBtnCopyTemp.Controls.Add(btnOpenTemp)

                pnlblName.Controls.Add(lblName)
                pnlBtnDeleteTemp.Controls.Add(btnDelete)


                pnl.Controls.Add(pnlImgOrg)
                pnl.Controls.Add(pnlBtnCopyOrg)
                pnl.Controls.Add(pnlImgConverted)
                pnl.Controls.Add(pnlBtnCopyTemp)
                pnl.Controls.Add(pnlblName)
                pnl.Controls.Add(pnlBtnDeleteTemp)

                pnlMain.Controls.Add(pnl)

            Next
        End If

    End Sub

    Private Sub test_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            PreDeleteAllTemp()
        Else
            GetFiles(New DirectoryInfo(MapPath("~/imgtest/temp/")))
        End If
    End Sub

    Private Sub btnFireDelete_Click(sender As Object, e As EventArgs) Handles btnFireDelete.Click
        Dim result As List(Of String) = lstMainList.Except(lstFinalNameForDelete).ToList
        listFinal.DataSource = result
        listFinal.DataBind()
    End Sub

    Private Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        For i As Integer = 0 To listFinal.Items.Count - 1
            File.Delete(MapPath("~/imgtest/org/" & listFinal.Items(i).Value))
        Next
        For i As Integer = 0 To lstFinalNameForDelete.Count - 1
            File.Delete(MapPath("~/imgtest/temp/" & lstFinalNameForDelete(i)))
        Next
        lstMainList = New List(Of String) 'Make Empty
        lstFinalNameForDelete = New List(Of String) 'Make Empty
    End Sub

    Sub PreDeleteAllTemp()
        Dim files() As FileInfo = (New DirectoryInfo(MapPath("~/imgtest/temp/"))).GetFiles
        For Each file In files
            file.Delete()
        Next
    End Sub

    Function GetLatestList() As List(Of String)
        Return lstMainList.Except(lstFinalNameForDelete).ToList
    End Function

End Class
