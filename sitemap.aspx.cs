using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net;
using System.Xml;
using System.Text;
using System.Data.SqlClient;

public partial class sitemap : System.Web.UI.Page
{
    public string changefreqWeekly = "weekly";
    public string changefreqYearly = "yearly";    
    public string priority = "1.0";
    DLL DL = new DLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        ///////////// علت حذف اولیه این است که اوررایت به درستی انجام نمیشود
        string path = @"~/sitemap/sitemap1.xml";
        if (File.Exists(path))
        {//////////////////////// Delete File ///////////////////////
            FileInfo myfileinf = new FileInfo(path);
            myfileinf.Delete();
        }
        else
        {//////////////////////// Create File ///////////////////////
            XmlWriterSettings settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.IndentChars = ("    ");
            settings.CloseOutput = true;
            settings.OmitXmlDeclaration = true;
            XmlWriter create = XmlWriter.Create(Server.MapPath(@"~/sitemap/sitemap1.xml"), settings);
            create.Close();
        }
        /////////////////////////////////////////////////////
        /////////////////////////////////////////////////////
        /////////////////////////////////////////////////////
        /////////////////////////////////////////////////////
        SqlConnection cnn = new SqlConnection("Data Source=89.32.250.224,1433;Initial Catalog=ifpdb;User ID=IFPDB;Password=UgjYVKKZfuw5;");
        //SqlConnection cnn = new SqlConnection("Data Source=.;Initial Catalog=IFP;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        ////////////////////////////////////////////////////

        using (XmlWriter writer = XmlWriter.Create(Server.MapPath("~/sitemap/sitemap1.xml")))
        {
            //شروع شی XML
            writer.WriteStartDocument(); //start
            writer.WriteStartElement("urlset", "http://www.sitemaps.org/schemas/sitemap/0.9");

            // لینک ثابت صفحه اصلی
            writer.WriteStartElement("url");
            writer.WriteElementString("loc", "http://www.iranfilmport.com");

            cnn.Open();
            cmd.CommandText = "Select top 1 [date_time] From tbl_articles order by date_time desc";
            cmd.CommandType = CommandType.Text;
            writer.WriteElementString("lastmod", Convert.ToDateTime(cmd.ExecuteScalar().ToString()).ToString("yyyy-MM-dd"));
            cnn.Close();

            writer.WriteElementString("changefreq", changefreqWeekly);
            writer.WriteElementString("priority", priority);

            writer.WriteEndElement();
            //لینک صفحات ثابت
            string[] Home = new string[] { "http://www.iranfilmport.com/پخش-و-ارسال-فیلم", "http://www.iranfilmport.com/تماس-با-درگاه-فیلم-ایران", "http://www.iranfilmport.com/درباره-درگاه-فیلم-ایران", "http://www.iranfilmport.com/نقد-تحلیل-اخبار-فیلم-کوتاه", "http://www.iranfilmport.com/کارنامه-پخش-فیلم-درگاه-فیلم-ایران", "http://www.iranfilmport.com/سرویس-های-پخش-فیلم", "http://www.iranfilmport.com/رسانه-سازی-پخش-فیلم", "http://www.iranfilmport.com/قوانین-و-مقررات", "http://www.iranfilmport.com/movibeta", "http://www.iranfilmport.com/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران", "http://www.iranfilmport.com/هزینه-پخش-بین-المللی-فیلم", "http://www.iranfilmport.com/مشاوره-پخش-بین-المللی-فیلم", "http://www.iranfilmport.com/1/نقد-تحلیل-فیلم-کوتاه/دسته-اصلی", "http://www.iranfilmport.com/2/مقالات-آموزشی-فیلم-فیلمنامه-سینمایی/دسته-اصلی", "http://www.iranfilmport.com/3/شناخت-جشنواره-خارجی-اسکاری/دسته-اصلی", "http://www.iranfilmport.com/4/اخبار-درگاه-فیلم-ایران/دسته-اصلی", "http://www.iranfilmport.com/5/اخبار-جشنواره-داخلی/دسته-اصلی", "http://www.iranfilmport.com/6/اخبار-جشنواره-خارجی/دسته-اصلی", "http://www.iranfilmport.com/7/فراخوان-جشنواره/دسته-اصلی", "http://www.iranfilmport.com/8/یادداشت-سردبیر/دسته-اصلی", "http://www.iranfilmport.com/مشاوره-فیلمنامه-کوتاه-مشاوره-فیلمنامه-بلند", "http://www.iranfilmport.com/team" };
            for (int i = 0; i <= Home.Length - 1; i++)
            {
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", Home[i]);
                writer.WriteElementString("lastmod", "2020-01-01");
                writer.WriteElementString("changefreq", changefreqYearly);
                writer.WriteElementString("priority", "0.80");
                writer.WriteEndElement();
            }
            //برای لینک هایی که از دیتا بیس استخراج میشه . مثل اخبار و . . .             
            ///////////////////////// قسمت پست ها
            //cmd.CommandText = "Select * From tbl_articles where visible=1 order by id desc";
            cmd.CommandText = "Select * From dbo.[vw_sitemap]";
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataSet ds1 = new DataSet();
            dap.Fill(ds, "ds");
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                //string Loc = "http://www.iranfilmport.com/" + dr["id"].ToString() + "/" + dr["title"].ToString().Replace(" ", "-");
                string Loc = "http://www.iranfilmport.com/" + dr["id"].ToString() + "/" + DL.GetClearString(dr["title"].ToString());
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", Loc);
                writer.WriteElementString("lastmod", Convert.ToDateTime(dr["date_time"].ToString()).ToString("yyyy-MM-dd"));
                writer.WriteElementString("changefreq", dr["Changefreq"].ToString());
                writer.WriteElementString("priority", dr["Priority"].ToString());

                //writer.WriteStartElement("image", "image", "http://www.google.com/schemas/sitemap-image/1.1");
                //writer.WriteElementString("image", "loc", "http://www.google.com/schemas/sitemap-image/1.1", "http://iranfilmport.com/files/uploadFiles/article/" + dr["photo"].ToString());
                //writer.WriteEndElement();

                writer.WriteEndElement();
            }
            //////////////////////// قسمت فستیوال ها
            cmd.CommandText = "Select * From tbl_festivals";
            cmd.CommandType = CommandType.Text;
            dap = new SqlDataAdapter(cmd);
            dap.Fill(ds1, "ds1");
            foreach (DataRow dr in ds1.Tables[0].Rows)
            {
                string Loc = "http://www.iranfilmport.com/festival/" + dr["id"].ToString() + "/" + dr["title_en"].ToString().Replace(" ", "-") + "/" + DL.GetClearString(dr["title_fa"].ToString().Replace(" ", "-").Replace("ي", "ی"));
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", Loc);
                writer.WriteElementString("changefreq", "monthly");
                writer.WriteElementString("priority", "0.30");
                writer.WriteEndElement();
            }

            //پایان شی XML
            writer.WriteEndDocument();
            writer.Flush();
        }

        Response.End();
    }
}