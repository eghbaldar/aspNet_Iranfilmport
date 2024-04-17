
Imports RestSharp

Partial Class CMS_Pages_SMS
    Inherits System.Web.UI.Page

    Protected Sub cmdPattern_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmdPattern.SelectedIndexChanged
        txtpattern.Text = cmdPattern.SelectedValue
    End Sub

    Private Sub btnSendTest_Click(sender As Object, e As EventArgs) Handles btnSendTest.Click

        If String.IsNullOrEmpty(txtpattern.Text) Or
            String.IsNullOrEmpty(txtpattern.Text) Or
            String.IsNullOrEmpty(txtTo.Text) Or
            String.IsNullOrEmpty(txtValue.Text) Then
            Exit Sub
        End If

        Dim client = New RestClient("http://188.0.240.110/api/select")
        Dim request = New RestRequest(Method.POST)
        request.AddHeader("cache-control", "no-cache")
        request.AddHeader("Content-Type", "application/json")
        request.AddParameter("undefined", "{""op"" : ""pattern""" _
                             & ",""user"" : """ + SMS.USERNAME + """" _
                             & ",""pass"":  """ + SMS.PASSWORD + """" _
                             & ",""fromNum"" : """ + SMS.numberHamkaran + """" _
                             & ",""toNum"": """ + txtTo.Text.Trim() + """" _
                             & ",""patternCode"": """ + txtpattern.Text.Trim() + """" _
                             & ",""inputData"" : [{""" + txtPar.Text.Trim() + """: """ + txtValue.Text.Trim() + """}]}", ParameterType.RequestBody)

        Dim response As IRestResponse = client.Execute(request)
        lblResult.Text = response.Content
    End Sub

    Private Sub CMS_Pages_SMS_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblfrom.Text = SMS.numberHamkaran
        lblpas.Text = SMS.PASSWORD
        lblUsername.Text = SMS.USERNAME
    End Sub
End Class
