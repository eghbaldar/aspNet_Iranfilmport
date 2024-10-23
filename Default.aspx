<%@ Page Title="" Language="VB" MasterPageFile="~/KingMaster.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Src="usercontrols/KingPostCategories.ascx" TagName="KingPostCategories" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/KingMoviePosterCarausel.ascx" TagName="KingMoviePosterCarausel" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/KingLastAccolades.ascx" TagName="KingLastAccolades" TagPrefix="uc3" %>
<%@ Register Src="usercontrols/KingPopularNews.ascx" TagName="KingPopularNews" TagPrefix="uc4" %>
<%@ Register Src="usercontrols/KingLastComments.ascx" TagName="KingLastComments" TagPrefix="uc5" %>
<%@ Register Src="usercontrols/KingNewsletter.ascx" TagName="KingNewsletter" TagPrefix="uc6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/files/kingMaterials/css/pagging.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <!--Featured Grid-->
        <div class="mb-20 sentence-container">

            <p class="sentence">
                پخش و ارسال فیلم و فیلمنامه به فستیوال‌های بین‌المللی با
    <b>12 سال </b>سابقه
            </p>

            <p class="sentence">
                اولین پخش کننده با حضور در لیست نهایی <b>اسکار </b>
            </p>

            <p class="sentence">
                تنها پخش کننده با <b>پنل اختصاصی</b> فول امکانات برای فیلمساز
            </p>

            <p class="sentence">
                تنها پخش کننده با <b>استراتژی</b> پخش تخصصی
            </p>

            <p class="sentence">
                تنها پخش کننده با <b>کارنامه‌ای  قابل دسترس</b> و قابل استناد
            </p>



        </div>
    </div>
    <main class="position-relative">
        <div class="container">
            <!--Featured Grid-->
            <div class="row mb-50">
                <div class="col-lg-6">
                    <!-- Featured posts -->
                    <div class="featured-post featured-post-grid ">
                        <div class="featured-slider-1 border-radius-10">
                            <div class="featured-slider-1-items">
                                <asp:Repeater ID="R_Slider" runat="server" DataSourceID="SDS_Slider">
                                    <ItemTemplate>
                                        <div class="slider-single p-10 kingLightGray">
                                            <div class="img-hover-slide border-radius-15 position-relative overflow-hidden">
                                                <a href='<%# String.Format("{0}", Eval("link")) %>' target="_blank">
                                                    <img src='<%# String.Format("\files\uploadFiles\sliders\{0}", Eval("photo")) %>' alt="post-slider">
                                                </a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                            <div class="pr-10 pl-10">
                                                <h4 class="post-title full-width mb-5   ">
                                                    <a href='<%# String.Format("{0}", Eval("link")) %>' target="_blank">
                                                        <h1 class="SliderUp">
                                                            <asp:Label Visible='<%# EnFa("FA") %>' ID="Label4" runat="server" CssClass="SliderUp"
                                                                Text='<%# Eval("text").Replace("ي", "ی") %>'></asp:Label>
                                                            <asp:Label Visible='<%# EnFa("EN") %>' ID="Label12" runat="server" CssClass="SliderUpEn"
                                                                Text='<%# Eval("textEn")%>'></asp:Label>
                                                        </h1>
                                                    </a><a href='<%# String.Format("{0}", Eval("link")) %>' target="_blank">
                                                        <p class="tag-text mb-5" style="font-family: Koodak; margin-top: 5px;">
                                                            <asp:Label ID="Label1" Visible='<%# EnFa("FA") %>' CssClass="SliderDown" runat="server"
                                                                Text='<%# Eval("subtext").Replace("ي", "ی") %>'></asp:Label>
                                                        </p>
                                                    </a>
                                                </h4>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SDS_Slider" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                    SelectCommand="SELECT * FROM [tbl_slider] WHERE ([visible] = @visible) ORDER BY [ID] DESC">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="true" Name="visible" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row">

                        <asp:Repeater ID="gv_master" runat="server" DataSourceID="SDS_Master">
                            <ItemTemplate>
                                <div class="col-md-6">
                                    <div class="slider-single mb-30 bg-white p-10 border-radius-15 kingYellow">
                                        <div class="img-hover-scale border-radius-10 pointer">
                                            <a href='<%# String.Format("/{0}", Eval("id")) %>'>
                                                <asp:Image AlternateText='<%# Eval("title").Replace("ي", "ی") %>' Width="100%" Style="-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                                                    ID="Image1" runat="server" ImageUrl='<%# "~\convertToUnscale\?photo=" + String.Format("files\uploadFiles\article\{0}", Eval("photo")) + "&w=400&h=236" %>' />
                                            </a>
                                        </div>
                                        <h6 class="post-title pr-5 pl-5 mb-10 mt-15 text-limit-2-row">
                                            <a href='<%# String.Format("/{0}", Eval("id")) %>'>
                                                <h6 style="font-size: 12px;">
                                                    <asp:Label Visible='<%# EnFa("FA") %>' ID="La1bel11" runat="server" CssClass="TitleNews"
                                                        Text='<%# Eval("title").Replace("ي", "ی") %>'></asp:Label>
                                                    <asp:Label Visible='<%# EnFa("EN") %>' ID="Label1" Style="font-size: 14px;" runat="server"
                                                        Text='<%# Bind("titleEn") %>'></asp:Label>
                                                </h6>
                                            </a>
                                        </h6>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:SqlDataSource ID="SDS_Master" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                            SelectCommand="SELECT top 4 * FROM [tbl_articles] WHERE [visible] = 1 and  [date_time] <= getdate() and id in (SELECT top 20 [id] FROM [tbl_articles] order by [date_time] desc) order by date_time desc"></asp:SqlDataSource>

                    </div>
                </div>
            </div>
            <!--Widget Movies Poster -->
            <uc2:KingMoviePosterCarausel ID="KingMoviePosterCarausel" runat="server" />
            <!--Ads-->
            <div class="row">
                <div class="col-12 text-center mb-20">
                    <a href="https://iranfilmport.com/%D8%A7%D8%B1%D8%B3%D8%A7%D9%84-%D8%AE%D8%A8%D8%B1-%D9%88-%D8%AA%D8%A8%D9%84%DB%8C%D8%BA%D8%A7%D8%AA">
                        <img class="border-radius-10 d-inline" src="files/kingMaterials/imgs/ads.jpg" alt="post-slider">
                    </a>
                </div>
            </div>
            <!--Content-->
            <div class="row">
                <!-- sidebar-left -->
                <div class="col-lg-3 col-md-3 primary-sidebar sticky-sidebar sidebar-left order-2 order-md-1">
                    <!-- Widget Categories -->
                    <div class="sidebar-widget widget_categories_2 border-radius-10 bg-white mb-30">
                        <div class="widget-header position-relative mb-15">
                            <h5 class="widget-title"><strong>باید از ما بدانید ...</strong></h5>
                        </div>
                        <ul class="font-small text-muted">
                                                        <li class="cat-item cat-item-6">
                                <a target="_blank" href="https://iranfilmport.com/accolades">
                                    <span class="ml-10">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-layers-fill" viewBox="0 0 16 16">
                                            <path d="M7.765 1.559a.5.5 0 0 1 .47 0l7.5 4a.5.5 0 0 1 0 .882l-7.5 4a.5.5 0 0 1-.47 0l-7.5-4a.5.5 0 0 1 0-.882z" />
                                            <path d="m2.125 8.567-1.86.992a.5.5 0 0 0 0 .882l7.5 4a.5.5 0 0 0 .47 0l7.5-4a.5.5 0 0 0 0-.882l-1.86-.992-5.17 2.756a1.5 1.5 0 0 1-1.41 0z" />
                                        </svg>
                                    </span>کارنامه پر افتخار و <a style="color:#ECCE01 !important;" href="/tag/اسکار" target="_blank">اسکاری</a> «درگاه»
                                </a>
                            </li>
                            <li class="cat-item cat-item-2 ">
                                <a target="_blank" href="https://iranfilmport.com/%D9%BE%D8%AE%D8%B4-%D9%88-%D8%A7%D8%B1%D8%B3%D8%A7%D9%84-%D9%81%DB%8C%D9%84%D9%85">
                                    <span class="ml-10">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-film" viewBox="0 0 16 16">
                                            <path d="M0 1a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1zm4 0v6h8V1zm8 8H4v6h8zM1 1v2h2V1zm2 3H1v2h2zM1 7v2h2V7zm2 3H1v2h2zm-2 3v2h2v-2zM15 1h-2v2h2zm-2 3v2h2V4zm2 3h-2v2h2zm-2 3v2h2v-2zm2 3h-2v2h2z" />
                                        </svg>
                                    </span>شیوه پخش و ارسال فیلم و فیلمنامه
                                </a>
                            </li>
                            <li class="cat-item cat-item-3">
                                <a target="_blank" href="https://iranfilmport.com/%D9%87%D8%B2%DB%8C%D9%86%D9%87-%D9%BE%D8%AE%D8%B4-%D8%A8%DB%8C%D9%86-%D8%A7%D9%84%D9%85%D9%84%D9%84%DB%8C-%D9%81%DB%8C%D9%84%D9%85">
                                    <span class="ml-10">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8m5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0" />
                                            <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195z" />
                                            <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083q.088-.517.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1z" />
                                            <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 6 6 0 0 1 3.13-1.567" />
                                        </svg>
                                    </span>تعرفه و هزینه‌های پخش چگونه است؟
                                </a>
                            </li>
                            <li class="cat-item cat-item-4">
                                <a target="_blank" href="https://iranfilmport.com/%D9%85%D8%B4%D8%A7%D9%88%D8%B1%D9%87-%D9%81%DB%8C%D9%84%D9%85%D9%86%D8%A7%D9%85%D9%87-%DA%A9%D9%88%D8%AA%D8%A7%D9%87-%D9%85%D8%B4%D8%A7%D9%88%D8%B1%D9%87-%D9%81%DB%8C%D9%84%D9%85%D9%86%D8%A7%D9%85%D9%87-%D8%A8%D9%84%D9%86%D8%AF">
                                    <span class="ml-10">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                                            <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001m-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708z" />
                                        </svg>
                                    </span>مشاوره و بازنویسی فیلمنامه کوتاه و بلند
                                </a>
                            </li>
                            <li class="cat-item cat-item-5">
                                <a target="_blank" href="https://iranfilmport.com/2188">
                                    <span class="ml-10">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bullseye" viewBox="0 0 16 16">
                                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                                            <path d="M8 13A5 5 0 1 1 8 3a5 5 0 0 1 0 10m0 1A6 6 0 1 0 8 2a6 6 0 0 0 0 12" />
                                            <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6m0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8" />
                                            <path d="M9.5 8a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0" />
                                        </svg>
                                    </span>فروش فیلمنامه کوتاه و بلند
                                </a>
                            </li>
                            <li class="cat-item cat-item-2">
                                <a target="_blank" href="https://iranfilmport.com/team">
                                    <span class="ml-10">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-person" viewBox="0 0 16 16">
                                            <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z" />
                                        </svg>
                                    </span>مدیریت و تیم «درگاه فیلم ایران»
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- Widget Categories -->
                    <uc1:KingPostCategories ID="KingPostCategories1" runat="server" />
                </div>
                <!-- main content -->
                <div class="col-lg-9 col-md-9 order-1 order-md-2">
                    <div class="row mb-50 mt-15">
                        <div class="col-md-12">
                            <div class="widget-header position-relative mb-30">
                                <h4 class="widget-title mb-0">فستیوال‌های معتبر <span>در حال بسته شدن</span></h4>
                            </div>
                            <div class="post-carausel-2 post-module-1 row">
                                <asp:Repeater ID="Repeater2" DataSourceID="SDS_LastFestivals" runat="server">
                                    <ItemTemplate>
                                        <div class="col">
                                            <div class="post-thumb position-relative">
                                                <div class="thumb-overlay img-hover-slide border-radius-15 position-relative"
                                                    style="background-image: url('<%# String.Format("/files/uploadFiles/festival/{0}", Eval("logo")) %>')">
                                                    <a class="img-link" href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"), Eval("title_en").Replace(" ", "-"), getLinkFest(Eval("title_fa")).Replace(" ", "-").Replace("ي", "ی")) %>'></a>
                                                    <div class="post-content-overlay">
                                                        <div class="entry-meta meta-0 font-small mb-15">
                                                            <a href="category.html"><span class="post-cat bg-success color-white"><%# Eval("RemainDays") %> روز باقیمانده</span></a>
                                                        </div>
                                                        <h5 class="post-title">
                                                            <a class="color-white" href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"), Eval("title_en").Replace(" ", "-"), getLinkFest(Eval("title_fa")).Replace(" ", "-").Replace("ي", "ی")) %>'>
                                                                <a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"), Eval("title_en").Replace(" ", "-"), getLinkFest(Eval("title_fa")).Replace(" ", "-").Replace("ي", "ی")) %>'>
                                                                    <asp:Label Visible='<%# EnFa("FA") %>' ID="Label2" runat="server" Style="font-size: 12px; color: white;"
                                                                        Text='<%# Eval("title_fa").Replace("ي", "ی") %>'></asp:Label>
                                                                    <asp:Label Visible='<%# EnFa("EN") %>' Style="font-size: 12px;" ID="Label1" runat="server"
                                                                        Text='<%# Bind("title_en") %>'></asp:Label>
                                                                </a>
                                                            </a>
                                                        </h5>
                                                        <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                            <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span><%# Eval("counter") %></span>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SDS_LastFestivals" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                    SelectCommand="
select top 4 *,
DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc)) as 'RemainDays',
sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) 'sign'	
from dbo.tbl_festivals f
where
f.flag=1
and
sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) is not null
and
sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc)))=1
ORDER BY newid()"></asp:SqlDataSource>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-12">
                            <div class="latest-post mb-50">
                                <div class="widget-header position-relative mb-30">
                                    <div class="row">
                                        <div class="col-7">
                                            <h4 class="widget-title mb-0">آخرین <span>اخبار</span></h4>
                                        </div>
                                        <div class="col-5 text-left">
                                            <h6 class="font-medium pl-15">
                                                <a class="text-muted font-small" href="#">مشاهده همه</a>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="loop-list-style-1">
                                    <%--main article--%>
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS_LastArticle">
                                        <ItemTemplate>
                                            <article class="first-post p-10 background-white border-radius-10 mb-30 wow fadeIn  animated" style="visibility: visible; animation-name: fadeIn;">
                                                <div class="img-hover-slide border-radius-15 mb-30 position-relative overflow-hidden">
                                                    <a href='<%# Eval("id", "/{0}") %>'>
                                                        <asp:Image AlternateText='<%# Eval("title").Replace("ي", "ی") %>' Width="100%" Style="-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                                                            ID="Image1" runat="server" ImageUrl='<%# "~\convertToUnscale\?photo=" + String.Format("files\uploadFiles\article\{0}", Eval("photo")) + "&w=700&h=410" %>' />
                                                    </a>
                                                </div>
                                                <div class="pr-10 pl-10">
                                                    <div class="entry-meta mb-30">
                                                        <a class="entry-meta meta-0" href='<%# Eval("id", "/{0}") %>'><span class="post-in background2 text-primary font-x-small">
                                                            <%# Eval("catname").Replace("ي", "ی") %>
                                                        </span></a>
                                                        <div class="float-left font-small">
                                                            <span><span class="ml-10 text-muted"><i class="fa fa-eye" aria-hidden="true"></i></span><%# Eval("visit", "{0}") %></span>
                                                        </div>
                                                    </div>
                                                    <h4 class="post-title mb-20">
                                                        <a href='<%# Eval("id", "/{0}") %>'>
                                                            <asp:Label Visible='<%# EnFa("FA") %>' ID="La1bel11" runat="server" CssClass="TitleNews"
                                                                Text='<%# Eval("title").Replace("ي", "ی") %>'></asp:Label>
                                                            <asp:Label Visible='<%# EnFa("EN") %>' ID="Label1" Style="font-size: 14px;" runat="server"
                                                                Text='<%# Bind("titleEn") %>'></asp:Label>
                                                        </a></h4>
                                                    <div class="mb-20 overflow-hidden">
                                                        <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                            <span class="post-by">توسط <a href="author.html"><%# Eval("authors").Replace("ي", "ی") %></a></span>
                                                            <span class="post-on"><%# Eval("shamsidate") %></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SDS_LastArticle" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                        SelectCommand="SELECT TOP 1 a.*, cat.[name] catName, (select [dbo].[MiladiTOShamsi] (getdate(),0)) shamsidate FROM [tbl_articles] a, [dbo].[tbl_articleCategory] cat WHERE a.[visible] = 1 AND a.[date_time] <= GETDATE() AND a.id IN (SELECT TOP 20 [id] FROM [tbl_articles] ORDER BY [date_time] DESC) ORDER BY a.[date_time] DESC"></asp:SqlDataSource>
                                    <%--10 articles--%>
                                    <asp:GridView ID="GridView1"
                                        runat="server"
                                        PageSize="10"
                                        DataSourceID="SDS_10Artciles_And_More"
                                        AutoGenerateColumns="False"
                                        AllowPaging="true"
                                        GridLines="None"
                                        ShowHeader="False">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <article class="p-10 background-white border-radius-10 mb-30 wow fadeIn animated">
                                                        <div class="d-flex">
                                                            <div class="post-thumb d-flex ml-15 border-radius-15 img-hover-scale">
                                                                <a class="color-white" href='<%# Eval("id", "/{0}") %>'>

                                                                    <asp:Image AlternateText='<%# Eval("title").Replace("ي", "ی") %>' Width="100%" CssClass="border-radius-15"
                                                                        ID="Image1" runat="server" ImageUrl='<%# "~\convertToUnscale\?photo=" + String.Format("files\uploadFiles\article\{0}", Eval("photo")) + "&w=400&h=236" %>' />

                                                                </a>
                                                            </div>
                                                            <div class="post-content media-body">
                                                                <div class="entry-meta mb-15 mt-10">
                                                                    <a class="entry-meta meta-2" href='<%# Eval("id", "/{0}") %>'><span class="post-in text-danger font-x-small"><%# Eval("catname") %></span></a>
                                                                </div>
                                                                <h5 class="post-title mb-15 text-limit-2-row">
                                                                    <a href='<%# Eval("id", "/{0}") %>'>
                                                                        <asp:Label Visible='<%# EnFa("FA") %>' ID="La1bel11" runat="server" CssClass="TitleNews"
                                                                            Text='<%# Eval("title").Replace("ي", "ی") %>'></asp:Label>
                                                                        <asp:Label Visible='<%# EnFa("EN") %>' ID="Label1" Style="font-size: 14px;" runat="server"
                                                                            Text='<%# Bind("titleEn") %>'></asp:Label>
                                                                    </a></h5>
                                                                <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                                    <span class="post-by">توسط <a href="author.html"><%# Eval("authors").Replace("ي", "ی") %></a></span>
                                                                    <span class="post-on"><%# Eval("shamsidate") %></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </article>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                        <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#848484" />
                                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                                        <RowStyle BackColor="White" ForeColor="#330099" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SDS_10Artciles_And_More" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                        SelectCommand="SELECT a.*, cat.[name] catName, (SELECT [dbo].[MiladiTOShamsi] (GETDATE(), 0)) shamsidate FROM ( SELECT id, date_time FROM [tbl_articles] WHERE [visible] = 1 AND [date_time] <= GETDATE() ORDER BY date_time DESC OFFSET 1 ROWS FETCH NEXT 100 ROWS ONLY ) t INNER JOIN [tbl_articles] a ON t.id = a.id INNER JOIN [dbo].[tbl_articleCategory] cat ON a.CateCode = cat.ID ORDER BY a.date_time DESC"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="sidebar-widget widget-ads mb-30 text-center">
                                <a href="https://iranfilmport.com/%D8%A7%D8%B1%D8%B3%D8%A7%D9%84-%D8%AE%D8%A8%D8%B1-%D9%88-%D8%AA%D8%A8%D9%84%DB%8C%D8%BA%D8%A7%D8%AA">
                                    <img class="border-radius-10" src="files/kingMaterials/imgs/ads-3.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 sidebar-right">
                            <!--Post aside style 1-->
                            <uc3:KingLastAccolades ID="KingLastAccolades1" runat="server" />
                            <!--Newsletter-->
                            <uc6:KingNewsletter ID="KingNewsletter" runat="server" />
                            <!--Popular News-->
                            <uc4:KingPopularNews ID="KingPopularNews1" runat="server" />
                            <!--Last Comments-->
                            <uc5:KingLastComments ID="KingLastComments1" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
