
Partial Class usercontrols_KingNewsletter
    Inherits System.Web.UI.UserControl

    Dim dl As New DLL
    Private Sub btnNewsletter_Click(sender As Object, e As EventArgs) Handles btnNewsletter.Click
        btnNewsletter.Enabled = False
        If Not String.IsNullOrEmpty(txtNewsletterEmail.Text.Trim) Then
            If IsValidEmail(txtNewsletterEmail.Text) Then
                If dl.InsertNewsletter(txtNewsletterEmail.Text) = 0 Then
                    lblError.Text = "این ایمیل قبلا ثبت شده است."
                    lblError.Visible = True
                    DivlblError.Visible = True
                Else
                    lblError.Visible = False
                    DivlblError.Visible = False
                    newsletter_1.Visible = False
                    newsletter_2.Visible = True
                    lbl.Text = "ایمیل شما با موفقیت ثبت شد، ممنون از شما. 🙏"
                End If
            Else
                lblError.Text = "فرمت ایمیل شما نادرست است."
                lblError.Visible = True
                DivlblError.Visible = True
            End If
        Else
            lblError.Text = "ایمیل را وارد کنید."
            lblError.Visible = True
            DivlblError.Visible = True
        End If
        btnNewsletter.Enabled = True
    End Sub

    Public Function IsValidEmail(ByVal email As String) As Boolean
        ' Regular expression pattern to validate an email address
        Dim emailPattern As String = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
        Dim regex As New Regex(emailPattern)

        ' Check if the email matches the pattern
        Return regex.IsMatch(email)
    End Function

End Class
