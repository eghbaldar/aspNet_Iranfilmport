Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Imports System.Data

Partial Class rss
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString)
        sqlconn.Open()
        Dim sqlcom As New SqlCommand("select top 30 * from tbl_articles where visible=1 order by id desc", sqlconn)
        Dim sqlda As New SqlDataAdapter(sqlcom)
        Dim ds As New DataSet
        sqlda.Fill(ds)
        rep.DataSource = ds.Tables(0)
        rep.DataBind()
        sqlconn.Close()
    End Sub

    Public Function getLink(ByVal id As Object, ByVal title As Object)
        Return "http://www.iranfilmport.com/" + id.ToString() '+ "/" + title.ToString().Replace(" ", "-")
    End Function

End Class
