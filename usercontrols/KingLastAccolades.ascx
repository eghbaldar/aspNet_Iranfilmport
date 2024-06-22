<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingLastAccolades.ascx.vb" Inherits="usercontrols_KingLastAccolades" %>
<div class="sidebar-widget mb-30">
    <div class="widget-header position-relative mb-30">
        <div class="row">
            <div class="col-7">
                <h4 class="widget-title mb-0">10 <span>افتخار</span> آخر</h4>
            </div>
            <div class="col-5 text-left">
                <h6 class="font-medium pl-15">
                    <a class="text-muted font-small" target="_blank" href="https://iranfilmport.com/%DA%A9%D8%A7%D8%B1%D9%86%D8%A7%D9%85%D9%87-%D9%BE%D8%AE%D8%B4-%D9%81%DB%8C%D9%84%D9%85-%D8%AF%D8%B1%DA%AF%D8%A7%D9%87-%D9%81%DB%8C%D9%84%D9%85-%D8%A7%DB%8C%D8%B1%D8%A7%D9%86">مشاهده کارنامه</a>
                </h6>
            </div>
        </div>
    </div>
    <div class="post-aside-style-1 border-radius-10 p-20 bg-white">
        <ul class="list-post">

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS_lastAccolades">
                <ItemTemplate>
                    <li class="mb-20">
                        <div class="d-flex">
                            <div class="post-thumb d-flex">
                                <a class="kingYellowForeColor" href='<%# String.Format("/{0}", Eval("id")) %>'>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-trophy" viewBox="0 0 16 16">
                                        <path d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5q0 .807-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33 33 0 0 1 2.5.5m.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935m10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935M3.504 1q.01.775.056 1.469c.13 2.028.457 3.546.87 4.667C5.294 9.48 6.484 10 7 10a.5.5 0 0 1 .5.5v2.61a1 1 0 0 1-.757.97l-1.426.356a.5.5 0 0 0-.179.085L4.5 15h7l-.638-.479a.5.5 0 0 0-.18-.085l-1.425-.356a1 1 0 0 1-.757-.97V10.5A.5.5 0 0 1 9 10c.516 0 1.706-.52 2.57-2.864.413-1.12.74-2.64.87-4.667q.045-.694.056-1.469z" />
                                    </svg>
                                </a>
                            </div>
                            <div class="post-content media-body">
                                <h6 class="post-title mb-10 text-limit-2-row">
                                    <a href='<%# String.Format("/{0}", Eval("id")) %>' style="font-size:12px;">
                                        <%# Eval("title") %>
                                    </a>
                                </h6>
                                <span style="color:#808080;font-style:italic;font-size:11px;"><%# Eval("date") %></span>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SDS_lastAccolades" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="select top 10 [id],[title],[dbo].[MiladiTOShamsi]([date_time],0) 'date' from [dbo].[tbl_articles] where visible=1 and [date_time]< getdate() and CateCode=11 order by [date_time] desc"></asp:SqlDataSource>

        </ul>
    </div>
</div>
