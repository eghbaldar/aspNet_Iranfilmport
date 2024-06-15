<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingLastComments.ascx.vb" Inherits="usercontrols_KingLastComments" %>
<div class="sidebar-widget p-20 border-radius-15 bg-white widget-latest-comments wow fadeIn animated">
    <div class="widget-header mb-30">
        <h5 class="widget-title">آخرین <span>نظرات</span></h5>
    </div>
    <div class="post-block-list post-module-6">




        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS_LastComments">
            <ItemTemplate>


                <div class="last-comment mb-20 d-flex wow fadeIn animated">
                    <span class="item-count vertical-align">
                        <a class="red-tooltip author-avatar" href='<%# String.Format("/{0}", Eval("id_post")) %>' target="_blank" data-toggle="tooltip" data-placement="top" title="" data-original-title="مرجان - 985 پست">
                            <img src="https://iranfilmport.com/files/images/icons/profile.png" alt=""></a>
                    </span>
                    <div class="alith_post_title_small">
                        <p class="font-medium mb-10">
                            <a  href='<%# String.Format("/{0}", Eval("id_post")) %>' target="_blank">
                                <%# Eval("text") %>
                            </a>
                        </p>
                        <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase mb-10">
                            <span class="post-by">توسط <a href="author.html"><%# Eval("name") %></a></span>
                            <span class="post-on"><span style="color: #808080; font-style: italic; font-size: 11px;"><%# Eval("date") %></span></span>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SDS_LastComments" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="select top 5 [id_post],[name],[text],[dbo].[MiladiTOShamsi]([date],0) 'date' from [dbo].[tbl_Comment] where [admin]=0 and id_post!=-1 and flag=1 order by [date] desc"></asp:SqlDataSource>



    </div>
</div>
