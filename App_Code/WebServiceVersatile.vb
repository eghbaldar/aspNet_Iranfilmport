Imports System.ComponentModel
Imports System.Web.Script.Serialization
Imports System.Web.Services
Imports Microsoft.VisualBasic

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebServiceVersatile
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Sub UpdateFestivalSuggestionAgree()
        Try
            Dim festivalSuggestionId = HttpContext.Current.Request.Params("festivalSuggestionId")
            Dim agree = HttpContext.Current.Request.Params("agree")

            Dim dl As New DLL_Panel
            dl.UpdateFestivalSuggestionAgree(festivalSuggestionId, agree)
            ' Serialize the result to JSON
            Dim serializer As New JavaScriptSerializer()
            Dim json As String = serializer.Serialize(New With {.issuccess = "True"})
            'Return json
        Catch ex As Exception
            ' Serialize the result to JSON
            Dim serializer As New JavaScriptSerializer()
            Dim json As String = serializer.Serialize(New With {.issuccess = "False"})
            'Return json
        End Try
    End Sub
End Class
