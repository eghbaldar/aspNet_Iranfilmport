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
        Dim mFrom As String = "noreply@iranfilmport.com"
        Dim mSubject As String = subject_
        Dim mMsg As String = "<div style='font-family:BNazanin, B Nazanin, Tahoma;padding:10px;border:1px solid #fffdeb;direction:rtl;font-size:14px;text-align:center;'><div style='margin:5px;text-align:right;'>" + TEXT + "</div><div style='padding:10px;text-align:center;background-color:#e8e8e8;margin:5px;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>" + "<a href=" + link_ + " target='_blank' style='color:black;text-decoration:none;'>" + "جهت مشاهده لینک، کلیک کنید" + "</a>" + "</div><div style='text-align:center;'><img width='150px' src='http://iranfilmport.com/files/images/logos/logo_3.png' /></div><div style='text-align:center;'><a href='http://iranfilmport.com' style='color:Orange;text-decoration:none;font-size:10px;'> Iran Film Port ®</a><a href='http://eghbaldar.ir' style='color:Orange;text-decoration:none;font-size:10px;'> Under the Supervision of Alimohammad Eghbaldar ®</a></div></div>"

        Try

            Dim message As New MailMessage(mFrom, mTo, mSubject, mMsg)
            message.From = New MailAddress("noreply@iranfilmport.com", "درگاه فیلم ایران")

            message.IsBodyHtml = True
            Dim mySmtpClient As New SmtpClient("mail.iranfilmport.com")
            mySmtpClient.UseDefaultCredentials = False
            mySmtpClient.Credentials = New NetworkCredential("noreply@iranfilmport.com", "mailIFP2019")
            mySmtpClient.Send(message)

        Catch ex As FormatException
        End Try

    End Sub

End Class