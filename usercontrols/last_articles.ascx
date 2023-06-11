<%@ Control Language="VB" AutoEventWireup="false" CodeFile="last_articles.ascx.vb"
    Inherits="usercontrols_last_articles" %>

<%--<div class="col-md" style="direction: rtl;">--%>
<%--   <div>
    <i class="bi bi-chevron-bar-left"></i>
        <span style="font-family:Samim;color:black;font-weight:bold;">آخرین اخبار</span>
   </div>
    <div class="right-side">
        <asp:Repeater ID="gv_master" runat="server" DataSourceID="SDS_Master">
            <ItemTemplate>
                <div style="text-align: justify;">
                    <a style="text-decoration: none; color: Black;" target="_blank" href='<%# ResolveUrl(getLink(Eval("id"),Eval("title")))%>'>
                        <div style="padding-right: 5px;padding-left: 5px;padding-bottom: 5px;">
                            <i class="bi bi-arrow-return-left"></i>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("title").Replace("ي", "ی") %>'></asp:Label>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SDS_Master" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT top 10 * FROM [tbl_articles] WHERE [visible] = 1 and id in (SELECT top 20 [id] FROM [tbl_articles] order by [date_time] desc) order by date_time desc">
            <%--With Random--%>
            <%--SELECT top 4 * FROM [tbl_articles] WHERE id in (
            SELECT top 20 [id] FROM [tbl_articles] order by id desc
            ) AND [visible] = 1 ORDER BY newid()
        </asp:SqlDataSource>
    </div>
<%--</div>--%>
