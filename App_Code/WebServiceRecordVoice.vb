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
Public Class WebServiceRecordVoice
    Inherits System.Web.Services.WebService

    Dim DL_PANEL As New DLL_Panel
    Dim sms As New SMS

    <WebMethod()>
    Public Sub RecordVoice()

        Dim ClientOrAdmin = HttpContext.Current.Request.Params("ClientOrAdmin")
        Dim NewOrResponse = HttpContext.Current.Request.Params("NewOrResponse")
        Dim Token = HttpContext.Current.Request.Params("Token")
        Dim ID = HttpContext.Current.Request.Params("Id_Client")
        Dim Sections = HttpContext.Current.Request.Params("Sections")
        Dim Id_Submission = HttpContext.Current.Request.Params("Id_Submission")

        '///ino badan test kon bebin kar mikone
        'Dim theContext As HttpContext = HttpContext.Current.Request.Params("voice")
        Dim theContext As HttpContext = HttpContext.Current
        Dim Files As HttpFileCollection = theContext.Request.Files
        Dim fs As Stream = Files(0).InputStream
        Dim br As New BinaryReader(fs)
        Dim bytes As Byte() = br.ReadBytes(Convert.ToInt32(fs.Length))

        Dim filename As String = Guid.NewGuid().ToString

        If Val(NewOrResponse) = 0 Then 'New
            DL_PANEL.InsertCommentClient(Val(ID), Val(Sections), Val(Id_Submission), 0, 1, filename & ".mp3")
            If Val(ClientOrAdmin) = 0 Then 'This reqeust was sent by ADMIN
                'Nothing yet
            Else 'This reqeust was sent by CLIENT
                SendSMS_ToClient("7nufm7nm65kdv2x", Val(ID))
                SendSMS_ToAdmin("9du2xqln8hj2rct", Val(ID))
                '''''''''''''''''''''''''''''''''''''''''''''''email
                SendMail("iranfilmportdistributor@gmail.com",
                     "فیلمساز / فیلمنامه؛: " & DL_PANEL.GetNameCustomer(Val(ID)) & "<br/>" & "<strong>" & "ویسی ارسال کرده است" & "</strong>",
                     "تیکت: " & DL_PANEL.GetNameCustomer(Val(ID)),
                     "http://iranfilmport.com/panel/tickets/" & ID)
            End If
        ElseIf Val(NewOrResponse) = 1 Then 'Response
            If Val(ClientOrAdmin) = 0 Then 'This reqeust was sent by ADMIN
                DL_PANEL.InsertCommentClientResponse(0, Token, "", 2, 0, 1, filename & ".mp3")
                SendSMS_ToClient("d4hbplkt4pgeceq", Val(ID))
                '''''''''''''''''''''''''''''''''''''''''''''''email
                SendMail(DL_PANEL.GetEmailClient(Val(ID)),
                     "فیلمساز / فیلمنامه عزیز؛: " & DL_PANEL.GetNameCustomer(Val(ID)) & "<br/>" & "<strong>" & "به تیکت شما پاسخی داده شده است. لطفا جهت مشاهده این پاسخ روی لینک زیر کلیک کنید." & "</strong>",
                     "تیکت: " & DL_PANEL.GetNameCustomer(Val(ID)),
                     "http://iranfilmport.com/panel/tickets/" & ID)
            Else 'This reqeust was sent by CLIENT
                DL_PANEL.InsertCommentClientResponse(Val(ID), Token, "", 1, 0, 1, filename & ".mp3")
                SendSMS_ToClient("bw7a0w8vp9hgwyj", Val(ID))
                SendSMS_ToAdmin("re9x2dh9u0sar1x", Val(ID))
            End If
        End If

        File.WriteAllBytes(HttpContext.Current.Server.MapPath("~/files/clientsStaff/ticketVoices/" & filename & ".mp3"), bytes)

    End Sub

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

    Private Sub SendSMS_ToAdmin(PaternId As String, customerid As Long)

        Try
            sms.SendSms("09111380846", PaternId, "name", DL_PANEL.GetNameCustomer(customerid))
        Catch ex As Exception

        End Try

    End Sub

    Private Sub SendSMS_ToClient(PaternId As String, customerid As Long)

        Try
            sms.SendSms(DL_PANEL.GetPhoneCustomer(customerid), PaternId, "name", DL_PANEL.GetNameCustomer(customerid))
        Catch ex As Exception

        End Try

    End Sub

End Class