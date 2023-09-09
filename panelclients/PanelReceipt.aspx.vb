
Imports System.IO
Imports System.Net

Partial Class PanelReceipt
    Inherits System.Web.UI.Page

    Private Sub PanelReceipt_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim DL_Panel As New DLL_Panel
        DL_Panel.UpdateSubmissionAfterCheckingReceipt(Val(Page.RouteData.Values("idSubmission")))
        imgReceipt.ImageUrl = "https://files.iranfilmport.com/receipts/" & Page.RouteData.Values("idSubmission") & ".jpg"

    End Sub

    Private Sub btnDownload_Click(sender As Object, e As EventArgs) Handles btnDownload.Click
        Dim webClient As Net.WebClient = New Net.WebClient()
        Dim url = "https://files.iranfilmport.com/receipts/" & Page.RouteData.Values("idSubmission") & ".jpg"
        Dim bytes As Byte() = webClient.DownloadData(url)
        Response.Clear()
        Response.ContentType = "image/jpeg"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & Path.GetFileName(url))
        Response.BinaryWrite(bytes)
        'Response.[End]()
    End Sub

End Class
