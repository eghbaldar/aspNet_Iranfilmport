Imports Microsoft.VisualBasic
Imports System.Net.Mail
Imports System.Net

Public Class Email

    Dim DLL_CMS As New DLL_CMS

    Sub SendMail(ByVal to_ As String, TEXT As String, ByVal subject_ As String, ByVal link_ As String)

        Dim mTo As String = to_
        Dim mFrom As String = "noreply@iranfilmport.com"
        Dim mSubject As String = subject_
        Dim mMsg As String = "<div style='font-family:BNazanin, B Nazanin, Tahoma;padding:10px;border:1px solid #fffdeb;direction:rtl;font-size:14px;text-align:center;'><div style='margin:5px;text-align:right;'>" + TEXT + "</div><div style='padding:10px;text-align:center;background-color:#e8e8e8;margin:5px;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;'>" + "<a href=" + link_ + " target='_blank' style='color:black;text-decoration:none;'>" + "جهت مشاهده لینک، کلیک کنید" + "</a>" + "</div><div style='text-align:center;'><img width='150px' src='http://iranfilmport.com/files/images/logos/logo_3.png' /></div><div style='text-align:center;'><a href='http://iranfilmport.com' style='color:Orange;text-decoration:none;font-size:10px;'> Iran Film Port ®</a><a href='http://eghbaldar.ir' style='color:Orange;text-decoration:none;font-size:10px;'> Under the Supervision of Alimohammad Eghbaldar ®</a></div></div>"

        'NOTE:
        'The Email-Service not working on LOCAL > So, Just test it on SERVER!
        'Fuck that!

        Try

            Dim message As New MailMessage(mFrom, mTo, mSubject, mMsg)
            message.From = New MailAddress("noreply@iranfilmport.com", "درگاه فیلم ایران")
            'If fileAttachments.HasFile Then
            '    Dim attached As New Attachment(Trim(fileAttachments.PostedFile.FileName.ToString()))
            '    message.Attachments.Add(attached)
            'End If

            'If mCC <> "" Or mCC <> String.Empty Then
            '    Dim strCC() As String = Split(mCC, ";")
            '    Dim strThisCC As String
            '    For Each strThisCC In strCC
            '        message.CC.Add(Trim(strThisCC))
            '    Next
            'End If
            message.IsBodyHtml = True
            Dim mySmtpClient As New SmtpClient("mail.iranfilmport.com")
            mySmtpClient.UseDefaultCredentials = False
            mySmtpClient.Credentials = New NetworkCredential("noreply@iranfilmport.com", "mailIFP2019")
            mySmtpClient.Send(message)
            '------------------------------ Send to internal messages system --------------------------------
            DLL_CMS.InsertMessage(to_, subject_, TEXT + "</br>" + link_)

        Catch ex As FormatException
        End Try
    End Sub

End Class
