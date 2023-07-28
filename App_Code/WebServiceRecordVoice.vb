Imports System.ComponentModel
Imports System.IO
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebServiceRecordVoice
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Sub RecordVoice()

        Dim DL_PANEL As New DLL_Panel

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
        DL_PANEL.InsertCommentClient(Val(ID), Val(Sections), Val(Id_Submission), 0, 1, filename & ".mp3")
        File.WriteAllBytes(HttpContext.Current.Server.MapPath("~/files/clientsStaff/ticketVoices/" & filename & ".mp3"), bytes)

    End Sub

End Class