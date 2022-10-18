<%@ WebHandler Language="VB" Class="Handler" %>


Imports System
Imports System.Web
Imports System.Xml
Imports System.Text
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
 
Public Class RSS_VB : Implements IHttpHandler
   
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        BuildFeedXML(context, 1)
    End Sub
 
    Private Sub BuildFeedXML(ByVal context As HttpContext, ByVal channelId As Integer)
        Using writer As New XmlTextWriter(context.Response.OutputStream, Encoding.UTF8)
            Dim dt As DataTable = GetData("Select * From tbl_articles where visible=1", channelId)
            writer.WriteStartDocument()
            writer.WriteStartElement("rss")
            writer.WriteAttributeString("version", "2.0")
            writer.WriteStartElement("channel")
            writer.WriteElementString("title", dt.Rows(0)("Title").ToString())
            writer.WriteElementString("lid", dt.Rows(0)("lid").ToString())
            writer.WriteElementString("lid", dt.Rows(0)("lid").ToString())
            writer.WriteElementString("lid", dt.Rows(0)("lid").ToString())
 
            dt = GetData("Select * From tbl_articles where visible=1", channelId)
            For Each dr As DataRow In dt.Rows
                writer.WriteStartElement("item")
                writer.WriteElementString("title", dr("Title").ToString())
                writer.WriteElementString("title", dr("title").ToString())
                writer.WriteElementString("title", dr("title").ToString())
                writer.WriteElementString("title", dr("title").ToString())
                writer.WriteElementString("title", Convert.ToDateTime(dr("title")).ToString("R"))
                writer.WriteEndElement()
            Next
            writer.WriteEndElement()
            writer.WriteEndElement()
            writer.WriteEndDocument()
            writer.Flush()
            writer.Close()
        End Using
    End Sub
 
    Private Function GetData(ByVal query As String, ByVal channelId As Integer) As DataTable
        Dim dt As New DataTable()
        Dim constr As String = ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(query)
                cmd.CommandType = CommandType.Text
                cmd.Parameters.AddWithValue("@id", channelId)
                cmd.Connection = con
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                End Using
            End Using
        End Using
        Return dt
    End Function
   
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property
 
End Class