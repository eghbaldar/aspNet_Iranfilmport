Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Xml
Imports System.Text

Public Class CreateSitemap

    Dim changefreqWeekly As String = "weekly"
    Dim changefreqYearly As String = "yearly"
    Dim priority As String = "1.0"
    Dim DL As DLL = New DLL()

    Public Sub Load()

        ''/////////////////////////////////////////////////////
        'Dim cnn As New SqlConnection("Data Source=89.32.251.8,9992;Initial Catalog=IFPDB;User ID=IFPusr;Password=7zd$1lH0;")
        'Dim cmd As New SqlCommand
        'cmd.Connection = cnn
        ''////////////////////////////////////////////////////
        'Using writer As XmlWriter = XmlWriter.Create("~/sitemapTest.xml")
        '    '//شروع شی XML
        '    writer.WriteStartDocument() '//start
        '    writer.WriteStartElement("urlset", "http://www.sitemaps.org/schemas/sitemap/0.9")

        '    '// لینک ثابت صفحه اصلی
        '    writer.WriteStartElement("url")
        '    writer.WriteElementString("loc", "http://www.iranfilmport.com")
        '    writer.WriteElementString("changefreq", changefreqWeekly)
        '    writer.WriteElementString("priority", priority)

        '    cnn.Open()
        '    cmd.CommandText = "Select top 1 [date_time] From tbl_articles order by id desc"
        '    cmd.CommandType = CommandType.Text
        '    writer.WriteElementString("lastmod", cmd.ExecuteScalar().ToString())
        '    cnn.Close()

        '    writer.WriteEndElement()

        ''//لینک صفحات ثابت
        'Dim Home As String() = New String() {"http://www.iranfilmport.com/پخش-و-ارسال-فیلم", "http://www.iranfilmport.com/تماس-با-درگاه-فیلم-ایران", "http://www.iranfilmport.com/درباره-درگاه-فیلم-ایران", "http://www.iranfilmport.com/نقد-تحلیل-اخبار-فیلم-کوتاه", "http://www.iranfilmport.com/کارنامه-پخش-فیلم-درگاه-فیلم-ایران", "http://www.iranfilmport.com/سرویس-های-پخش-فیلم", "http://www.iranfilmport.com/رسانه-سازی-پخش-فیلم", "http://www.iranfilmport.com/قوانین-و-مقررات", "http://www.iranfilmport.com/movibeta", "http://www.iranfilmport.com/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران", "http://www.iranfilmport.com/هزینه-پخش-بین-المللی-فیلم", "http://www.iranfilmport.com/مشاوره-پخش-بین-المللی-فیلم", "http://www.iranfilmport.com/1/نقد-تحلیل-فیلم-کوتاه/دسته-اصلی", "http://www.iranfilmport.com/2/مقالات-آموزشی-فیلم-فیلمنامه-سینمایی/دسته-اصلی", "http://www.iranfilmport.com/3/شناخت-جشنواره-خارجی-اسکاری/دسته-اصلی", "http://www.iranfilmport.com/4/اخبار-درگاه-فیلم-ایران/دسته-اصلی", "http://www.iranfilmport.com/5/اخبار-جشنواره-داخلی/دسته-اصلی", "http://www.iranfilmport.com/6/اخبار-جشنواره-خارجی/دسته-اصلی", "http://www.iranfilmport.com/7/فراخوان-جشنواره/دسته-اصلی", "http://www.iranfilmport.com/8/یادداشت-سردبیر/دسته-اصلی"}
        'Dim i As Integer = 0
        'While (i <= Home.Length - 1)
        '    writer.WriteStartElement("url")
        '    writer.WriteElementString("loc", Home(i))
        '    writer.WriteElementString("lastmod", "2019-01-01 09:00 +03:00")
        '    writer.WriteElementString("changefreq", changefreqYearly)
        '    writer.WriteElementString("priority", "0.80")
        '    writer.WriteEndElement()
        'End While
        ''//برای لینک هایی که از دیتا بیس استخراج میشه . مثل اخبار و . . .             
        ''///////////////////////// قسمت پست ها
        ''//cmd.CommandText = "Select * From tbl_articles where visible=1 order by id desc";
        'cmd.CommandText = "Select * From dbo.[vw_sitemap]"
        'cmd.CommandType = CommandType.Text
        'Dim dap As New SqlDataAdapter(cmd)
        'Dim ds As DataSet
        'Dim ds1 As DataSet
        'dap.Fill(ds, "ds")
        'For Each dr As DataRow In ds.Tables(0).Rows
        '    '//string Loc = "http://www.iranfilmport.com/" + dr["id"].ToString() + "/" + dr["title"].ToString().Replace(" ", "-");
        '    Dim Loc As String = "http://www.iranfilmport.com/" + dr("id").ToString() + "/" + DL.GetClearString(dr("title").ToString())
        '    writer.WriteStartElement("url")
        '    writer.WriteElementString("loc", Loc)
        '    writer.WriteElementString("lastmod", dr("date_time").ToString())
        '    writer.WriteElementString("changefreq", dr("Changefreq").ToString())
        '    writer.WriteElementString("priority", dr("Priority").ToString())

        '    writer.WriteStartElement("image", "image", "http://www.google.com/schemas/sitemap-image/1.1")
        '    writer.WriteElementString("image", "loc", "http://www.google.com/schemas/sitemap-image/1.1", "http://iranfilmport.com/files/uploadFiles/article/" + dr("photo").ToString())

        '    writer.WriteEndElement()

        '    writer.WriteEndElement()
        'Next
        ''//////////////////////// قسمت فستیوال ها
        'cmd.CommandText = "Select * From tbl_festivals"
        'cmd.CommandType = CommandType.Text
        'dap = New SqlDataAdapter(cmd)
        'dap.Fill(ds1, "ds1")
        'For Each dr As DataRow In ds1.Tables(0).Rows
        '    Dim Loc As String = "http://www.iranfilmport.com/festival/" + dr("id").ToString() + "/" + dr("title_en").ToString().Replace(" ", "-") + "/" + DL.GetClearString(dr("title_fa").ToString().Replace(" ", "-").Replace("ي", "ی"))
        '    writer.WriteStartElement("url")
        '    writer.WriteElementString("loc", Loc)
        '    writer.WriteElementString("changefreq", "monthly")
        '    writer.WriteElementString("priority", "0.30")
        '    writer.WriteEndElement()
        'Next
        ''//پایان شی XML
        'writer.WriteEndDocument()
        'writer.Flush()
        'End Using
        'Response.End()

    End Sub

End Class
