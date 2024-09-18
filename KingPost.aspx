<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false"
    CodeFile="KingPost.aspx.vb" Inherits="KingPost" %>

<%@ Register Src="usercontrols/KingNavigator.ascx" TagName="KingNavigator" TagPrefix="uc4" %>
<%@ Register Src="~/usercontrols/KingRelatedPost.ascx" TagPrefix="uc4" TagName="KingRelatedPost" %>
<%@ Register Src="~/usercontrols/KingComments.ascx" TagPrefix="uc4" TagName="KingComments" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:PlaceHolder runat="server" ID="pc"></asp:PlaceHolder>
    <%-- Change Font Size --%>
    <script src='<%= ResolveUrl("~/files/kingMaterials/js/fontsize/jquery-1.12.4.min.js")%>'></script>
    <script src='<%= ResolveUrl("~/files/kingMaterials/js/fontsize/fontsize.js")%>'></script>
    <style>
        .zoomin:hover, .zoomout:hover {
            background-color: #DEC814;
        }

        .zoomin, .zoomout {
            height: 25px;
            width: 25px;
            background-color: #ECCE01;
            border-radius: 50%;
            display: inline-block;
            text-align: center;
            cursor: pointer;
            color: #8D8D8D;
        }
        .entry-main-content{
            padding:15px !important;
        }
        .entry-main-content img{
            height:unset !important;
        }
        .entry-bottom .tags a {
            background-color:#EBCD01 !important;
            color:white !important;
        }
    </style>
    <%-- End of Change Font Size--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SDS_Master">
            <ItemTemplate>
                <uc4:KingNavigator ID="KingNavigator1" runat="server" />
                <div class="entry-header entry-header-1 mb-30 mt-20">
                    <div class="entry-meta meta-0 font-small mb-30"><span class="post-cat bg-success color-white"><%# getCategory(Eval("id")).Replace("ي", "ی") %></span></div>
                    <h1 class="post-title mb-30">
                        <asp:Label ID="lblGetPostTitle" Text='<%# Eval("title").Replace("ي", "ی") %>' runat="server"></asp:Label>
                    </h1>
                    <div class="entry-meta meta-1 font-x-small color-grey text-uppercase">
                        <span>توسط
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("authors").Replace("ي", "ی") %>'></asp:Label>             
                            <asp:Label ID="Label4" runat="server" Text='<%# getDate(Eval("date_time")) %>'></asp:Label>
                            <span class="hit-count"><i class="ti-comment ml-5"></i>نظرات <%# getTotalComment() %></span>
                        </span>
                    </div>
                </div>
                <div>
                    <span class="zoomout" style="font-size: 20px;" runat="server" visible='<%# GetEditPermission() %>'>
                        <a href='<%# Eval("id", "../cms/pages/EditPost?type=article&id={0}") %>' target="_blank">ویرایش این پست</a>
                        <br />
                    </span>
                </div>
                <figure class="single-thumnail mb-10">
                    <asp:Image AlternateText='<%# Eval("title").Replace("ي", "ی") %>' Style="width: 100%; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                        ID="Image1"
                        runat="server" ImageUrl='<%# String.Format("~\files\uploadFiles\article\{0}", Eval("photo")) %>' />
                    <div class="credit mt-15 font-small color-grey">
                        <i class="ti-credit-card ml-5"></i><span>تصویر از: iranfilmport.com</span>
                    </div>
                </figure>
                <div class="mb-1">
                    <span class="zoomin">+</span> <span class="zoomout">-</span>
                </div>
                <div class="entry-main-content" id="example">
                    <asp:Label ID="Label5" runat="server" CssClass="MainText" Text='<%# Eval("text").Replace("ي", "ی").Replace("tahoma, geneva, sans-serif", "IranYekan").Replace("Tahoma,Geneva,sans-serif", "IranYekan").Replace("Tahoma,Gene7a,sans-serif", "IranYekan").Replace("tahoma,geneva,sans-serif", "IranYekan") %>'></asp:Label>
                </div>
                <div class="entry-bottom mt-50 mb-30">
                    <div class="font-weight-500 entry-meta meta-1 font-x-small color-grey">
                        <span class="update-on"><i class="ti ti-reload ml-5"></i>به روز شده 18/9/1400 10:28</span>
                        <span class="hit-count"><i class="ti-comment"></i>نظرات <%# getTotalComment() %></span>
                        <span class="hit-count"></i><asp:Label ID="Label1" runat="server" Text='<%# getShortLink(Eval("id")) %>'></asp:Label></span>
                    </div>
                    <div class="overflow-hidden mt-30">
                        <div class="tags float-right text-muted mb-md-30">
                            <span class="font-small ml-10 mb-3"><i class="fa fa-tag ml-5"></i>برچسب ها: </span>
                            <br />
                            <br />
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS_Tags">
                                <ItemTemplate>
                                    <a href='<%# Page.ResolveUrl(String.Format("~/tag/{0}", Eval("value").ToString.Trim.Replace(" ", "-").Replace("ي", "ی"))) %>' rel="tag"><%# Eval("value").Replace("ي", "ی").Replace("_", " ") %></a>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SDS_Tags" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                SelectCommand="select * from dbo.StringSplit ((select [tags] from dbo.tbl_articles where id= @ID),' ') where value<>'-'">
                                <SelectParameters>
                                    <asp:RouteParameter Name="ID" RouteKey="id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="single-social-share float-left mt-10">
                            <ul class="d-inline-block list-inline">
                                <li class="list-inline-item"><span class="font-small text-muted"><i class="ti-sharethis ml-5"></i>اشتراک: </span></li>
                                <li class="list-inline-item"><a class="social-icon facebook-icon text-xs-center" target="_blank" href='<%# getFB(Eval("id"), Eval("title")) %>'><i class="ti-facebook"></i></a></li>
                                <li class="list-inline-item"><a class="social-icon bi bi-telegram text-xs-center" target="_blank" href='<%# getTelegram(Eval("id"), Eval("title")) %>'>
                                    <svg width="24px" height="24px" viewBox="0 0 15 15" fill="#38ABD6" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M14.5 1.5L0.5 6.5L4.5 8.5L10.5 4.5L6.5 9.5L12.5 13.5L14.5 1.5Z" stroke="" stroke-linejoin="round" />
                                    </svg></a></li>
                                <li class="list-inline-item"><a class="social-icon twitter-icon text-xs-center" target="_blank" href='<%# getTw(Eval("id"), Eval("title")) %>'><i class="ti-twitter-alt"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <!--author box-->
        <!--related posts-->
        <uc4:KingRelatedPost runat="server" ID="KingRelatedPost" />
        <!--Comments-->
        <uc4:KingComments runat="server" ID="KingComments" />
    
    <script>
        $('#example').FontSize({
            increaseTimes: 5,
            reduceTimes: 5
        });
        $('#example').FontSize({
            increaseBtn: '.zoomin',
            reduceBtn: '.zoomout'
        });
        $('#example').FontSize({
            step: 3
        });

    </script>
    <asp:SqlDataSource ID="SDS_Master" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
        SelectCommand="SELECT * FROM [tbl_articles] WHERE (([ID] = @ID) AND ([visible] = @visible))">
        <SelectParameters>
            <asp:RouteParameter Name="id" RouteKey="id" />
            <asp:Parameter DefaultValue="true" Name="visible" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

