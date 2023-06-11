
Partial Class contract
    Inherits System.Web.UI.Page
    Public contractnumber As String
    Private Sub contract_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not String.IsNullOrEmpty(Page.RouteData.Values("id")) Then
                Dim DL As New DLL
                If DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows.Count > 0 Then
                    NOK.Visible = False
                    OK.Visible = True
                    lblTempContractInformation_regDate.Text = ShamsiDate.Miladi2Shamsi(DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows(0)(3).ToString, ShamsiDate.ShowType.LongDate)
                    lblTempContractInformation_status.Text = DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows(0)(2).ToString
                    lblTempContractInformation_contractNumber.Text = DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows(0)(1).ToString
                Else
                    contractnumber = Page.RouteData.Values("id")
                    NOK.Visible = True
                    OK.Visible = False
                    lblwarning.Text = String.Format("قراردادی با شماره {0} به ثبت نرسیده است.", Page.RouteData.Values("id"))
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
