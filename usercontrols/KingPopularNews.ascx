<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingPopularNews.ascx.vb" Inherits="usercontrols_KingPopularNews" %>
<div class="sidebar-widget mb-30">
    <div class="widget-header mb-30">
        <h5 class="widget-title">پر بازدیدترین پست‌ها</h5>
    </div>
    <div class="post-aside-style-2">
        <ul class="list-post">

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS_lastAccolades">
                <ItemTemplate>


                    <li class="mb-30 wow fadeIn animated">
                        <div class="d-flex">
                            <div class="post-thumb d-flex ml-15 border-radius-5 img-hover-scale">
                                <a class="color-white" href='<%# String.Format("/{0}", Eval("id")) %>' target="_blank">
                                    <asp:Image ID="Image2" CssClass="border-radius-10" AlternateText='<%# Eval("title") %>'
                                    ImageUrl='<%# String.Format("~\convertToUnscale.aspx?photo=files\uploadFiles\PosterOfCustomers\{0}&w=452&h=640", Eval("photo")) %>'
                                    runat="server" />
                                </a>
                            </div>
                            <div class="post-content media-body">
                                <h6 class="post-title mb-10 text-limit-2-row">

                                    <a href='<%# String.Format("/{0}", Eval("id")) %>' target="_blank">
                                        <%# Eval("title") %>
                                    </a>
                                </h6>
                                <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                    <span class="post-by">توسط <span><%# Eval("Authors") %></span></span>
                                    <span class="post-on"><%# Eval("date") %></span>
                                </div>
                            </div>
                        </div>

                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SDS_lastAccolades" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="select top 5 [Authors],[photo],[id],[title],[dbo].[MiladiTOShamsi]([date_time],0) 'date' from [dbo].[tbl_articles] where visible=1 and [date_time]< getdate() order by visit desc"></asp:SqlDataSource>

        </ul>
    </div>
</div>
