Imports System.Data.SqlClient
Imports System.Data
Imports System.Net
Imports System.IO
Imports System.Xml

Partial Class CMS_Pages_rss
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim connectionString As String = "Data Source=MYCBJ017550027;Initial Catalog=MySamplesDB;Integrated Security=True"
        Dim dt As DataTable = New DataTable
        Dim conn As SqlConnection = New SqlConnection(connectionString)
        conn.Open()
        Dim ad As SqlDataAdapter = New SqlDataAdapter("SELECT * from tblRSS", conn)
        ad.Fill(dt)
        Response.Clear()
        Response.ContentType = "text/xml"
        Dim TextWriter As XmlTextWriter = New XmlTextWriter(Response.OutputStream, Encoding.UTF8)
        TextWriter.WriteStartDocument()
        'Below tags are mandatory rss
        TextWriter.WriteStartElement("rss")
        TextWriter.WriteAttributeString("version", "2.0")
        ' Channel tag will contain RSS feed details
        TextWriter.WriteStartElement("channel")
        TextWriter.WriteElementString("title", "C#.NET,ASP.NET Samples and Tutorials")
        TextWriter.WriteElementString("link", "http://aspdotnet-suresh.blogspot.com")
        TextWriter.WriteElementString("description", "Free ASP.NET articles,C#.NET,ASP.NET tutorials and Examples,Ajax,SQL Server,Javascript,XML,GridView A" & _
            "rticles and code examples -- by Suresh Dasari")
        TextWriter.WriteElementString("copyright", "Copyright 2009 - 2010 aspdontnet-suresh.blogspot.com. All rights reserved.")
        For Each oFeedItem As DataRow In dt.Rows
            TextWriter.WriteStartElement("item")
            TextWriter.WriteElementString("title", oFeedItem("Title").ToString)
            TextWriter.WriteElementString("description", oFeedItem("Description").ToString)
            TextWriter.WriteElementString("link", oFeedItem("URL").ToString)
            TextWriter.WriteEndElement()
        Next
        TextWriter.WriteEndElement()
        TextWriter.WriteEndElement()
        TextWriter.WriteEndDocument()
        TextWriter.Flush()
        TextWriter.Close()
        Response.End()
    End Sub

End Class
