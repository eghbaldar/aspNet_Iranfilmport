
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
                    Select Case DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows(0)(2).ToString
                        Case 0
                            lblTempContractInformation_status.Text = "این قرارداد/نامه رسمی ثبت اولیه شده است" + "<br/>" + "<div style='direction:ltr;text-align:left;'>This contract/official letter was marked as 'Draft'.</div>"
                        Case 1
                            lblTempContractInformation_status.Text = "این قرارداد/نامه رسمی در سامانه ثبت رسمی شده است""<br/>" + "<div style='direction:ltr;text-align:left;'>This contract/official letter was marked as 'Has Been Final'.</div>"
                    End Select
                    lblTempContractInformation_contractNumber.Text = DL.GetTempContractInformation(Page.RouteData.Values("id")).Rows(0)(1).ToString
                Else
                    contractnumber = Page.RouteData.Values("id")
                    NOK.Visible = True
                    OK.Visible = False
                    lblwarning.Text = String.Format("قرارداد/نامه رسمی‌ای با شماره {0} به ثبت نرسیده است." + "<br/>" + "<div style='direction:ltr;text-align:left;'>This contract/official was not recorded yet.</div>", Page.RouteData.Values("id"))
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
