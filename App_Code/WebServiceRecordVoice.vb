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
    Dim Email As New Email

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
                ''''''''''''''''''''''''''''''''''''''''''''''''email
                Try
                    Email.SendMail("iranfilmportdistributor@gmail.com",
                     "فیلمساز / فیلمنامه؛: " & DL_PANEL.GetNameCustomer(Val(ID)) & "<br/>" & "<strong>" & "ویسی ارسال کرده است" & "</strong>",
                     "تیکت: " & DL_PANEL.GetNameCustomer(Val(ID)),
                     "http://iranfilmport.com/panel/tickets/" & ID)
                Catch ex As Exception
                End Try
            End If
        ElseIf Val(NewOrResponse) = 1 Then 'Response
            If Val(ClientOrAdmin) = 0 Then 'This reqeust was sent by ADMIN
                DL_PANEL.InsertCommentClientResponse(0, Token, "", 2, 0, 1, filename & ".mp3")
                SendSMS_ToClient("d4hbplkt4pgeceq", Val(ID))
                ''''''''''''''''''''''''''''''''''''''''''''''''email
                Try
                    Email.SendMail(DL_PANEL.GetEmailClient(Val(ID)),
                     "فیلمساز / فیلمنامه عزیز؛: " & DL_PANEL.GetNameCustomer(Val(ID)) & "<br/>" & "<strong>" & "به تیکت شما پاسخی داده شده است. لطفا جهت مشاهده این پاسخ روی لینک زیر کلیک کنید." & "</strong>",
                     "تیکت: " & DL_PANEL.GetNameCustomer(Val(ID)),
                     "http://iranfilmport.com/panel/tickets/" & ID)
                Catch ex As Exception
                End Try
            Else 'This reqeust was sent by CLIENT
                DL_PANEL.InsertCommentClientResponse(Val(ID), Token, "", 1, 0, 1, filename & ".mp3")
                SendSMS_ToClient("bw7a0w8vp9hgwyj", Val(ID))
                SendSMS_ToAdmin("re9x2dh9u0sar1x", Val(ID))
            End If
        End If

        File.WriteAllBytes(HttpContext.Current.Server.MapPath("~/files/clientsStaff/ticketVoices/" & filename & ".mp3"), bytes)

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