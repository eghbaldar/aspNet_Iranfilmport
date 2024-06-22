<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingPostCategories.ascx.vb" Inherits="usercontrols_KingPostCategories" %>
<div class="sidebar-widget widget_categories border-radius-10 bg-white mb-30">
    <div class="widget-header position-relative mb-15">
        <h5 class="widget-title"><strong>دسته بندی ها</strong></h5>
    </div>
    <ul class="font-small text-muted">
        <asp:Repeater ID="gv_count" runat="server" DataSourceID="SDS_ArticleCatCount">
            <ItemTemplate>
                <li class="cat-item cat-item-2" style="font-size: 10px !important;">
                    <a href='<%# Page.ResolveUrl(String.Format("{2}/{1}/{0}", "دسته-محتوایی", Eval("name").Replace(" ", "-").Replace("ي", "ی"), Eval("CateCode"))) %>'>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M14.5 1.5a.5.5 0 0 1 .5.5v4.8a2.5 2.5 0 0 1-2.5 2.5H2.707l3.347 3.346a.5.5 0 0 1-.708.708l-4.2-4.2a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 8.3H12.5A1.5 1.5 0 0 0 14 6.8V2a.5.5 0 0 1 .5-.5" />
                        </svg>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name").Replace("ي", "ی") %>'></asp:Label>
                        (<b><asp:Label ID="Label2" CssClass="kingYellowForeColor" runat="server" Text='<%# Bind("count") %>'></asp:Label></b>)            
                    </a>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>

<asp:SqlDataSource ID="SDS_ArticleCatCount" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
    SelectCommand="SELECT * FROM [vw_articleCatCount]"></asp:SqlDataSource>
