Imports System.ComponentModel
Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports System.Web
Imports System.Web.Script.Services
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebServiceSendEmail
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Sub SendMail(ByVal to_ As String, TEXT As String, ByVal subject_ As String, ByVal link_ As String)

        Dim mTo As String = to_
        Dim mFrom As String = EmailConfiguration.FROM
        Dim mSubject As String = subject_

        Dim LinkDisplay As String = ""
        If (String.IsNullOrEmpty(link_.Trim())) Then LinkDisplay = "display:none;"
        Dim mMsg As String = String.Format(EmailConfiguration.BODY, TEXT, link_, LinkDisplay)

        Try
            Dim message As New MailMessage(mFrom, mTo, mSubject, mMsg)
            message.From = New MailAddress(mFrom, "درگاه فیلم ایران")
            message.IsBodyHtml = True
            Dim mySmtpClient As New SmtpClient(EmailConfiguration.SMTP_CLIENT)
            mySmtpClient.UseDefaultCredentials = False
            mySmtpClient.Credentials = New NetworkCredential(mFrom, EmailConfiguration.PASS)
            mySmtpClient.Send(message)
        Catch ex As FormatException
        End Try

    End Sub

End Class