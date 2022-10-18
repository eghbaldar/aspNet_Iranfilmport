Imports Farahy.Security
Imports System.Security
Imports System.Security.Cryptography

Partial Class ShowPicSecurImage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim query As String = Request.Url.Query
        query = query.Substring(1)
        Dim supplier As SecurityImageSupplier = New SecurityImageSupplier()
        supplier.QueryDecode(query)
        Response.Clear()
        supplier.WriteImageToStream(Response.OutputStream)
    End Sub
End Class
