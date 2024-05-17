<%@ Control Language="VB" AutoEventWireup="false" CodeFile="RightSide.ascx.vb" Inherits="usercontrols_Left" %>
<style>
    .onItem {
        text-align: justify;
        background-color: #f0f0f0;
        padding: 3px;
        margin-bottom: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        font-size: 11px;
        margin:4px;
    }

        .onItem:hover {
            background-color: #e8e8e8;
            cursor: pointer;
        }
</style>
<%--<div>
    <a target="_blank" href="https://iranfilmport.com/advertise" style="text-decoration: none;">
        <img alt="تبلیغات فیلم خود را اینجا قرار دهید" src='<%= Page.ResolveUrl("~/files/images/background/BannerStrategy.png") %>'
            style="width: 100%; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" />
    </a>
</div>--%>
<div class="col-md-3 col-sm-12 col-xs-12">

    <div
        style="text-align: right; direction: rtl; border-right: 5px solid #F9DF46;padding-right:4px;">

        <i class="bi bi-chevron-bar-left"></i>
        <span style="font-family: Samim; color: black; font-weight: bold;">طبقه بندی</span>
        <div>
            <asp:GridView ID="gv_count" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_ArticleCatCount"
                GridLines="None" ShowHeader="False">
                <Columns>
                    <asp:TemplateField HeaderText="name" SortExpression="name">
                        <ItemTemplate>
                            <i class="bi bi-arrow-return-left"></i>
                            <a style="text-decoration: none; font-family: traffic; color: #000;" href='<%# Page.ResolveUrl(String.Format("{2}/{1}/{0}", "دسته-محتوایی", Eval("name").Replace(" ", "-").Replace("ي", "ی"), Eval("CateCode"))) %>'>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name").Replace("ي", "ی") %>'></asp:Label>
                            </a>(<asp:Label ID="Label2" runat="server" Text='<%# Bind("count") %>'></asp:Label>)
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SDS_ArticleCatCount" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT * FROM [vw_articleCatCount]"></asp:SqlDataSource>
        </div>
    </div>
    <div style="text-align: right; direction: rtl; border-right: 5px solid #48BDC5; padding: 5px;">

        <i class="bi bi-chevron-bar-left"></i>
        <<span style="font-family: Samim; color: black; font-weight: bold;">پست‌های پربازدید</span>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Popular"
            GridLines="None" ShowHeader="False">
            <Columns>
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <ItemTemplate>
                        <div style="padding: 3px;">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Image AlternateText='<%# Eval("title") %>' Width="80" Height="50"
                                            Style="-moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius: 3px;"
                                            ID="Image1" runat="server" ImageUrl='<%# String.Format("~\files\uploadFiles\article\{0}", Eval("photo")) %>' />
                                    </td>
                                    <td style="text-align: right; padding: 3px;">
                                        <a style="text-decoration: none; color: Black;"
                                            href='<%# ResolveUrl(getLink(Eval("id"), Eval("title")))%>'>
                                            <asp:Label ID="Label1" Style="font-family: traffic; font-size: 13px;" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Popular" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT top 7 * FROM [tbl_articles] WHERE ([visible] = @visible) ORDER BY [visit] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="visible" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div
        style="border-right: 5px solid #F9DF46; direction: rtl; text-align: right;">
        <div>
            <i class="bi bi-chevron-bar-left"></i>
            <span style="font-family: Samim; color: black; font-weight: bold;">آخرین اخبار</span>
        </div>
        <div class="right-side">
            <asp:Repeater ID="gv_master" runat="server" DataSourceID="SDS_Master">
                <ItemTemplate>
                    <div class="onItem">
                        <a style="text-decoration: none; color: Black;" target="_blank" href='<%# ResolveUrl(getLink(Eval("id"), Eval("title")))%>'>
                            <div style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px;">
                                <i class="bi bi-arrow-return-left"></i>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("title").Replace("ي", "ی") %>'></asp:Label>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SDS_Master" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT top 10 * FROM [tbl_articles] WHERE [visible] = 1 and date_time<=getdate() and id in (SELECT top 20 [id] FROM [tbl_articles] order by [date_time] desc) order by date_time desc"></asp:SqlDataSource>
        </div>
    </div>
</div>

