<%@ Page Language="VB" ContentType="text/xml"  AutoEventWireup="false" CodeFile="rss.aspx.vb"
    Inherits="rss" %>

<%--<rss version="2.0">
<channel>

<title>title</title>
<link>http://www.link.com/</link>
<description>description</description>
<language>en-us</language>
<ttl>5</ttl>
<item>
<title>title of entry</title>
<description>description of entry</description>
<link>http://www.link.com/</link>
<pubDate>publish date</pubDate>
</item>
<item>
<title>title of entry</title>
<description>description of entry</description>
<link>http://www.link.com/</link>
<pubDate>publish date</pubDate>
</item>

</channel>
</rss>--%>

<asp:Repeater ID="rep" runat="server">
  <HeaderTemplate>
           <rss version="2.0">
                <channel>
                    <title>مقالات و اخبار فیلم کوتاه درگاه فیلم ایران</title>
                    <link>http://www.iranfilmport.com</link>
                    <description>
                    پخش و ارسال بین المللی فیلم کوتاه و تحلیل و نقد فیلم های کوتاه
                    </description>
                    <managingEditor>support@iranfilmport.com</managingEditor>
    <webMaster>eghbaldar@iranfilmport.com</webMaster>
        </HeaderTemplate>
        <ItemTemplate>
            <item>
               <title><%# DataBinder.Eval(Container.DataItem, "Title") %></title>                
              <link><%# getLink(DataBinder.Eval(Container.DataItem, "id"), DataBinder.Eval(Container.DataItem, "Title"))%> </link>
                 <author><%# DataBinder.Eval(Container.DataItem, "Title") %></author>
                <pubDate><%# String.Format("{0:R}", DataBinder.Eval(Container.DataItem, "date_time"))%></pubDate>
                <description><%# Server.HtmlDecode(
                Regex.Replace(DataBinder.Eval(Container.DataItem, "lid"), "<[^>]*(>|$)", String.Empty)
                )%></description>
        </item>
        </ItemTemplate>
        <FooterTemplate>
                </channel>
            </rss>  
        </FooterTemplate>
</asp:Repeater>


<%--<asp:Repeater id="rep" runat="server">


</asp:repeater>--%>