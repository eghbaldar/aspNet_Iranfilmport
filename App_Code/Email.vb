Imports Microsoft.VisualBasic
Imports System.Net.Mail
Imports System.Net

Public Class Email

    Dim DLL_CMS As New DLL_CMS

    Sub SendMail(ByVal to_ As String, TEXT As String, ByVal subject_ As String, ByVal link_ As String)

        Dim mTo As String = to_
        Dim mFrom As String = EmailConfiguration.FROM
        Dim mSubject As String = subject_

        Dim LinkDisplay As String = ""
        If (String.IsNullOrEmpty(link_.Trim())) Then LinkDisplay = "display:none;"
        Dim mMsg As String = String.Format(EmailConfiguration.BODY, TEXT, link_, LinkDisplay)

        'NOTE:
        'The Email-Service not working on LOCAL > So, Just test it on SERVER!
        'Fuck that!

        Try
            Dim message As New MailMessage(mFrom, mTo, mSubject, mMsg)
            message.From = New MailAddress(mFrom, "درگاه فیلم ایران")
            message.IsBodyHtml = True
            Dim mySmtpClient As New SmtpClient(EmailConfiguration.SMTP_CLIENT)
            mySmtpClient.UseDefaultCredentials = False
            mySmtpClient.Credentials = New NetworkCredential(mFrom, EmailConfiguration.PASS)
            mySmtpClient.Send(message)
            '------------------------------ Send to internal messages system --------------------------------
            DLL_CMS.InsertMessage(to_, subject_, TEXT + "</br>" + link_)

        Catch ex As FormatException
        End Try
    End Sub

End Class
