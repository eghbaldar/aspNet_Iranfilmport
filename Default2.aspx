<%@ Page Title="" Language="VB" MasterPageFile="~/KingMaster.master" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                                            <div class="img-hover-slide border-radius-15 mb-30 position-relative overflow-hidden">
                                                <span class="top-right-icon bg-dark"><i class="mdi mdi-camera-alt"></i></span>
                                                <a href="single.html">
                                                    <img src='<%# String.Format("\files\uploadFiles\sliders\{0}", Eval("photo")) %>' alt="post-slider">
                                                </a>
                                            </div>
                                            <div class="pr-10 pl-10">
                                                <div class="entry-meta mb-20">
                                                    <a class="entry-meta meta-0" href="category.html"><span class="post-in background1 text-danger font-x-small">اقتصاد</span></a>
                                                    <div class="float-left font-small">
                                                        <span><span class="ml-10 text-muted"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                        <span class="mr-30"><span class="ml-10 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                        <span class="mr-30"><span class="ml-10 text-muted"><i class="fa fa-share-alt" aria-hidden="true"></i></span>125 هزار</span>
                                                    </div>
                                                </div>
                                                <h4 class="post-title full-width mb-20">
                                                    <a href='<%# String.Format("{0}",Eval("link")) %>' target="_blank">
                                                        <h1 class="SliderUp">
                                                            <asp:Label Visible='<%# EnFa("FA") %>' ID="Label4" runat="server" CssClass="SliderUp"
                                                                Text='<%# Eval("text").Replace("ي", "ی") %>'></asp:Label>
                                                            <asp:Label Visible='<%# EnFa("EN") %>' ID="Label12" runat="server" CssClass="SliderUpEn"
                                                                Text='<%# Eval("textEn")%>'></asp:Label>
                                                        </h1>
                                                    </a><a href='<%# String.Format("{0}",Eval("link")) %>' target="_blank">
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
                                <div class="img-hover-scale border-radius-10">
                                    <span class="top-right-icon background10"><i class="mdi mdi-share"></i></span>
                                    <a href="single.html">
<asp:Image AlternateText='<%# Eval("title").Replace("ي", "ی") %>' Width="100%" Style="-moz-border-radius: 5px;
                                                            -webkit-border-radius: 5px; border-radius: 5px;" ID="Image1" runat="server" ImageUrl='<%# "~\convertToUnscale\?photo=" + String.Format("files\uploadFiles\article\{0}", Eval("photo")) + "&w=400&h=236" %>' />
                                    </a>
                                </div>
                                <h6 class="post-title pr-5 pl-5 mb-10 mt-15 text-limit-2-row">
                                    <a href="single.html">
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
            <!--Ads-->
            <div class="row">
                <div class="col-12 text-center mb-50">
                    <a href="#">
                        <img class="border-radius-10 d-inline" src="files/kingMaterials/imgs/ads.jpg" alt="post-slider">
                    </a>
                </div>
            </div>
            <!--Content-->
            <div class="row">
                <!-- sidebar-left -->
                <div class="col-lg-2 col-md-3 primary-sidebar sticky-sidebar sidebar-left order-2 order-md-1">
                    <!-- Widget Weather -->
                    <div class="sidebar-widget widget-weather border-radius-10 bg-white mb-30">
                        <div class="d-flex">
                            <div class="font-medium">
                                <p>دوشنبه</p>
                                <h2>12</h2>
                                <p><strong>فروردین</strong></p>
                            </div>
                            <div class="font-medium mr-10 pt-20">
                                <div id="datetime" class="d-inline-block">
                                    <ul>
                                        <li><span class="font-small">
                                            <a class="text-primary" href="#">تهران</a><br>
                                            <i class="wi wi-day-sunny ml-5"></i>32ºc
                                        </span>
                                            <p>آفتابی</p>
                                        </li>
                                        <li><span class="font-small">
                                            <a class="text-danger" href="#">کرج</a><br>
                                            <i class="wi wi-day-cloudy ml-5"></i>28ºc
                                        </span>
                                            <p>ابری</p>
                                        </li>
                                        <li><span class="font-small">
                                            <a class="text-success" href="#">رشت</a><br>
                                            <i class="wi wi-rain-mix ml-5"></i>25ºc
                                        </span>
                                            <p>بارانی</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Widget Categories -->
                    <div class="sidebar-widget widget_categories_2 border-radius-10 bg-white mb-30">
                        <ul class="font-small text-muted">
                            <li class="cat-item cat-item-2 active">
                                <a href="#">
                                    <span class="ml-10">
                                        <ion-icon name="earth-outline"></ion-icon>
                                    </span>بین المللی
                                </a>
                            </li>
                            <li class="cat-item cat-item-3">
                                <a href="#">
                                    <span class="ml-10">
                                        <ion-icon name="trending-up-outline"></ion-icon>
                                    </span>کسب و کار
                                </a>
                            </li>
                            <li class="cat-item cat-item-4">
                                <a href="#">
                                    <span class="ml-10">
                                        <ion-icon name="glasses-outline"></ion-icon>
                                    </span>سرگرمی
                                </a>
                            </li>
                            <li class="cat-item cat-item-5">
                                <a href="#">
                                    <span class="ml-10">
                                        <ion-icon name="bicycle-outline"></ion-icon>
                                    </span>اخبار ورزشی
                                </a>
                            </li>
                            <li class="cat-item cat-item-6">
                                <a href="#">
                                    <span class="ml-10">
                                        <ion-icon name="fitness-outline"></ion-icon>
                                    </span>سلامتی
                                </a>
                            </li>
                            <li class="cat-item cat-item-2">
                                <a href="#">
                                    <span class="ml-10">
                                        <ion-icon name="book-outline"></ion-icon>
                                    </span>مجله
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- Widget Categories -->
                    <div class="sidebar-widget widget_categories border-radius-10 bg-white mb-30">
                        <div class="widget-header position-relative mb-15">
                            <h5 class="widget-title"><strong>دسته بندی ها</strong></h5>
                        </div>
                        <ul class="font-small text-muted">
                            <li class="cat-item cat-item-2"><a href="#">اقتصاد جهانی</a></li>
                            <li class="cat-item cat-item-3"><a href="#">محیط زیست</a></li>
                            <li class="cat-item cat-item-4"><a href="#">اجرایی</a></li>
                            <li class="cat-item cat-item-5"><a href="#">مد</a></li>
                            <li class="cat-item cat-item-6"><a href="#">نوریست</a></li>
                            <li class="cat-item cat-item-7"><a href="#">درگیری</a></li>
                            <li class="cat-item cat-item-2"><a href="#">رسوایی</a></li>
                            <li class="cat-item cat-item-2"><a href="#">اجرایی</a></li>
                            <li class="cat-item cat-item-2"><a href="#">سیاست خارجی</a></li>
                            <li class="cat-item cat-item-2"><a href="#">زندگی سالم</a></li>
                            <li class="cat-item cat-item-3"><a href="#">تحقیقات پزشکی</a></li>
                            <li class="cat-item cat-item-4"><a href="#">سلامت کودکان</a></li>
                            <li class="cat-item cat-item-5"><a href="#">سراسر جهان</a></li>
                            <li class="cat-item cat-item-6"><a href="#">تبلیغات</a></li>
                            <li class="cat-item cat-item-7"><a href="#">سلامت روان</a></li>
                            <li class="cat-item cat-item-2"><a href="#">رسانه ای</a></li>
                        </ul>
                    </div>
                </div>
                <!-- main content -->
                <div class="col-lg-10 col-md-9 order-1 order-md-2">
                    <div class="row">
                        <div class="col-lg-8 col-md-12">
                            <div class="latest-post mb-50">
                                <div class="widget-header position-relative mb-30">
                                    <div class="row">
                                        <div class="col-7">
                                            <h4 class="widget-title mb-0">جدیدترین <span>پست ها</span></h4>
                                        </div>
                                        <div class="col-5 text-left">
                                            <h6 class="font-medium pl-15">
                                                <a class="text-muted font-small" href="#">مشاهده همه</a>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="loop-list-style-1">
                                    <article class="first-post p-10 background-white border-radius-10 mb-30 wow fadeIn animated">
                                        <div class="img-hover-slide border-radius-15 mb-30 position-relative overflow-hidden">
                                            <span class="top-right-icon bg-dark"><i class="mdi mdi-flash-on"></i></span>
                                            <a href="single.html">
                                                <img src="files/kingMaterials/imgs/news-21.jpg" alt="post-slider">
                                            </a>
                                        </div>
                                        <div class="pr-10 pl-10">
                                            <div class="entry-meta mb-30">
                                                <a class="entry-meta meta-0" href="category.html"><span class="post-in background2 text-primary font-x-small">تکنولوژیکی</span></a>
                                                <div class="float-left font-small">
                                                    <span><span class="ml-10 text-muted"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                    <span class="mr-30"><span class="ml-10 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                    <span class="mr-30"><span class="ml-10 text-muted"><i class="fa fa-share-alt" aria-hidden="true"></i></span>125 هزار</span>
                                                </div>
                                            </div>
                                            <h4 class="post-title mb-20">
                                                <span class="post-format-icon">
                                                    <ion-icon name="headset-outline"></ion-icon>
                                                </span>
                                                <a href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است</a></h4>
                                            <div class="mb-20 overflow-hidden">
                                                <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                    <span class="post-by">توسط <a href="author.html">رضا کیمیا</a></span>
                                                    <span class="post-on">ارسال در 18/9/1400 09:35</span>
                                                    <span class="time-reading">زمان خواندن 12 دقیقه</span>
                                                    <p class="font-x-small mt-10">به روز شده 18/9/1400 10:28</p>
                                                </div>
                                                <div class="float-left">
                                                    <a href="single.html" class="read-more"><span class="ml-10"><i class="fa fa-thumbtack" aria-hidden="true"></i></span>انتخاب توسط ویراستار</a>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="p-10 background-white border-radius-10 mb-30 wow fadeIn animated">
                                        <div class="d-flex">
                                            <div class="post-thumb d-flex ml-15 border-radius-15 img-hover-scale">
                                                <a class="color-white" href="single.html">
                                                    <img class="border-radius-15" src="files/kingMaterials/imgs/thumbnail-15.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="post-content media-body">
                                                <div class="entry-meta mb-15 mt-10">
                                                    <a class="entry-meta meta-2" href="category.html"><span class="post-in text-danger font-x-small">سیاسی</span></a>
                                                </div>
                                                <h5 class="post-title mb-15 text-limit-2-row">
                                                    <span class="post-format-icon">
                                                        <ion-icon name="videocam-outline"></ion-icon>
                                                    </span>
                                                    <a href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون.</a></h5>
                                                <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                    <span class="post-by">توسط <a href="author.html">الناز روستایی</a></span>
                                                    <span class="post-on">ارسال در 15/9/1400 07:00</span>
                                                    <span class="time-reading">زمان خواندن 12 دقیقه</span>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="p-10 background-white border-radius-10 mb-30 wow fadeIn animated">
                                        <div class="d-flex">
                                            <div class="post-thumb d-flex ml-15 border-radius-15 img-hover-scale">
                                                <a class="color-white" href="single.html">
                                                    <img class="border-radius-15" src="files/kingMaterials/imgs/thumbnail-13.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="post-content media-body">
                                                <div class="entry-meta mb-15 mt-10">
                                                    <a class="entry-meta meta-2" href="category.html"><span class="post-in text-warning font-x-small">ورزشی</span></a>
                                                </div>
                                                <h5 class="post-title mb-15 text-limit-2-row">
                                                    <a href="single.html">سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت</a></h5>
                                                <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                    <span class="post-by">توسط <a href="author.html">رضا کیمیا</a></span>
                                                    <span class="post-on">ارسال در 15/9/1400 07:00</span>
                                                    <span class="time-reading">زمان خواندن 14 دقیقه</span>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="p-10 background-white border-radius-10 mb-30 wow fadeIn animated">
                                        <div class="d-flex">
                                            <div class="post-thumb d-flex ml-15 border-radius-15 img-hover-scale">
                                                <a class="color-white" href="single.html">
                                                    <img class="border-radius-15" src="files/kingMaterials/imgs/thumbnail-16.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="post-content media-body">
                                                <div class="entry-meta mb-15 mt-10">
                                                    <a class="entry-meta meta-2" href="category.html"><span class="post-in text-success font-x-small">سلامت</span></a>
                                                </div>
                                                <h5 class="post-title mb-15 text-limit-2-row">
                                                    <span class="post-format-icon">
                                                        <ion-icon name="image-outline"></ion-icon>
                                                    </span>
                                                    <a href="single.html">طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت</a></h5>
                                                <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                    <span class="post-by">توسط <a href="author.html">بهمن راستی</a></span>
                                                    <span class="post-on">ارسال در 15/9/1400 07:00</span>
                                                    <span class="time-reading">زمان خواندن 6 دقیقه</span>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="p-10 background-white border-radius-10 mb-30 wow fadeIn animated">
                                        <div class="d-flex">
                                            <div class="post-thumb d-flex ml-15 border-radius-15 img-hover-scale">
                                                <a class="color-white" href="single.html">
                                                    <img class="border-radius-15" src="files/kingMaterials/imgs/thumbnail-8.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="post-content media-body">
                                                <div class="entry-meta mb-15 mt-10">
                                                    <a class="entry-meta meta-2" href="category.html"><span class="post-in text-info font-x-small">درگیری</span></a>
                                                </div>
                                                <h5 class="post-title mb-15 text-limit-2-row">
                                                    <span class="post-format-icon">
                                                        <ion-icon name="chatbox-outline"></ion-icon>
                                                    </span>
                                                    <a href="single.html">تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات</a></h5>
                                                <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                    <span class="post-by">توسط <a href="author.html">رضا کیمیا</a></span>
                                                    <span class="post-on">ارسال در 15/9/1400 07:00</span>
                                                    <span class="time-reading">زمان خواندن 13 دقیقه</span>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <div class="pagination-area mb-30">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-start">
                                        <li class="page-item"><a class="page-link" href="#"><i class="ti-angle-right"></i></a></li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#"><i class="ti-angle-left"></i></a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="sidebar-widget widget-ads mb-30 text-center">
                                <a href="files/kingMaterials/imgs/news-1.jpg">
                                    <img class="border-radius-10" src="files/kingMaterials/imgs/ads-3.png" alt="">
                                </a>
                            </div>
                            <!--Videos-->
                            <div class="sidebar-widget">
                                <div class="widget-header position-relative mb-20">
                                    <div class="row">
                                        <div class="col-7">
                                            <h5 class="widget-title mb-0">اخبار <span>ویدیوها</span></h5>
                                        </div>
                                        <div class="col-5 text-left">
                                            <h6 class="font-medium pl-15">
                                                <a class="text-muted font-small" href="#">مشاهده همه</a>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="block-tab-item post-module-1 post-module-4">
                                    <div class="row">
                                        <div class="slider-single col-md-6 mb-30">
                                            <div class="img-hover-scale border-radius-10">
                                                <span class="top-right-icon background10"><i class="mdi mdi-share"></i></span>
                                                <a href="single.html">
                                                    <img class="border-radius-10" src="files/kingMaterials/imgs/news-17.jpg" alt="post-slider">
                                                </a>
                                                <div class="play_btn play_btn_small">
                                                    <a class="play-video" href="https://aparat.com" data-animate="zoomIn" data-duration="1.5s" data-delay="0.1s">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <h5 class="post-title pr-5 pl-5 mb-10 mt-15 text-limit-2-row">
                                                <a href="single.html">طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد</a>
                                            </h5>
                                            <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span>30 هزار</span>
                                                <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>1.5 هزار</span>
                                                <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-share-alt" aria-hidden="true"></i></span>15 هزار</span>
                                                <a class="float-left" href="#"><i class="ti-bookmark"></i></a>
                                            </div>
                                        </div>
                                        <div class="slider-single col-md-6 mb-30">
                                            <div class="img-hover-scale border-radius-10">
                                                <a href="single.html">
                                                    <img class="border-radius-10" src="files/kingMaterials/imgs/news-18.jpg" alt="post-slider">
                                                </a>
                                                <div class="play_btn play_btn_small">
                                                    <a class="play-video" href="https://aparat.com" data-animate="zoomIn" data-duration="1.5s" data-delay="0.1s">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <h5 class="post-title pr-5 pl-5 mb-10 mt-15 text-limit-2-row">
                                                <a href="single.html">سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای</a>
                                            </h5>
                                            <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-share-alt" aria-hidden="true"></i></span>125 هزار</span>
                                                <a class="float-left" href="#"><i class="ti-bookmark"></i></a>
                                            </div>
                                        </div>
                                        <div class="slider-single col-md-6 mb-30">
                                            <div class="img-hover-scale border-radius-10">
                                                <a href="single.html">
                                                    <img class="border-radius-10" src="files/kingMaterials/imgs/news-19.jpg" alt="post-slider">
                                                </a>
                                                <div class="play_btn play_btn_small">
                                                    <a class="play-video" href="https://aparat.com" data-animate="zoomIn" data-duration="1.5s" data-delay="0.1s">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <h5 class="post-title pr-5 pl-5 mb-10 mt-15 text-limit-2-row">
                                                <a href="single.html">تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای</a>
                                            </h5>
                                            <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-share-alt" aria-hidden="true"></i></span>125 هزار</span>
                                                <a class="float-left" href="#"><i class="ti-bookmark"></i></a>
                                            </div>
                                        </div>
                                        <div class="slider-single col-md-6 mb-30">
                                            <div class="img-hover-scale border-radius-10">
                                                <a href="single.html">
                                                    <img class="border-radius-10" src="files/kingMaterials/imgs/news-20.jpg" alt="post-slider">
                                                </a>
                                                <div class="play_btn play_btn_small">
                                                    <a class="play-video" href="https://aparat.com" data-animate="zoomIn" data-duration="1.5s" data-delay="0.1s">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <h5 class="post-title pr-5 pl-5 mb-10 mt-15 text-limit-2-row">
                                                <a href="single.html">طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان</a>
                                            </h5>
                                            <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-share-alt" aria-hidden="true"></i></span>125 هزار</span>
                                                <a class="float-left" href="#"><i class="ti-bookmark"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 sidebar-right">
                            <!--Post aside style 1-->
                            <div class="sidebar-widget mb-30">
                                <div class="widget-header position-relative mb-30">
                                    <div class="row">
                                        <div class="col-7">
                                            <h4 class="widget-title mb-0">از دست <span>ندهید</span></h4>
                                        </div>
                                        <div class="col-5 text-left">
                                            <h6 class="font-medium pl-15">
                                                <a class="text-muted font-small" href="#">مشاهده همه</a>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="post-aside-style-1 border-radius-10 p-20 bg-white">
                                    <ul class="list-post">
                                        <li class="mb-20">
                                            <div class="d-flex">
                                                <div class="post-thumb d-flex ml-15 border-radius-5 img-hover-scale">
                                                    <a class="color-white" href="single.html">
                                                        <img src="files/kingMaterials/imgs/thumbnail-4.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="post-content media-body">
                                                    <h6 class="post-title mb-10 text-limit-2-row"><a href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ</a></h6>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mb-20">
                                            <div class="d-flex">
                                                <div class="post-thumb d-flex ml-15 border-radius-5 img-hover-scale">
                                                    <a class="color-white" href="single.html">
                                                        <img src="files/kingMaterials/imgs/thumbnail-15.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="post-content media-body">
                                                    <h6 class="post-title mb-10 text-limit-2-row"><a href="single.html">سه درصد گذشته، حال و آینده شناخت فراوان</a></h6>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mb-20">
                                            <div class="d-flex">
                                                <div class="post-thumb d-flex ml-15 border-radius-5 img-hover-scale">
                                                    <a class="color-white" href="single.html">
                                                        <img src="files/kingMaterials/imgs/thumbnail-16.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="post-content media-body">
                                                    <h6 class="post-title mb-10 text-limit-2-row"><a href="single.html">سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی</a></h6>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex">
                                                <div class="post-thumb d-flex ml-15 border-radius-5 img-hover-scale">
                                                    <a class="color-white" href="single.html">
                                                        <img src="files/kingMaterials/imgs/thumbnail-15.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="post-content media-body">
                                                    <h6 class="post-title mb-10 text-limit-2-row"><a href="single.html">سه درصد گذشته، حال و آینده شناخت فراوان</a></h6>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--Top authors-->
                            <div class="sidebar-widget mb-30">
                                <div class="widget-top-auhor border-radius-10 p-20 bg-white">
                                    <div class="widget-header widget-header-style-1 position-relative mb-15">
                                        <h5 class="widget-title pl-5">نویسندگان <span>برتر</span></h5>
                                    </div>
                                    <a class="red-tooltip active" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="الناز - 1034 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-2.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="مسعود - 245 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-3.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="مریم - 356 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-4.png" alt=""></a>
                                    <a class="red-tooltip active" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="مجید - 152 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-5.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="بهمن - 245 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-17.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="حامد - 758 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-7.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="نادیا - 231 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-8.png" alt=""></a>
                                    <a class="red-tooltip active" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="فردین - 256 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-9.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="ستاره - 652 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-10.png" alt=""></a>
                                    <a class="red-tooltip active" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="حمید - 125 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-11.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="مهتاب - 452 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-12.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="ناصر - 124 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-13.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="مرجان - 1245 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-14.png" alt=""></a>
                                    <a class="red-tooltip active" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="مرتضی - 1325 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-15.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="نیلوفر - 562 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-16.png" alt=""></a>
                                    <a class="red-tooltip active" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="رضا - 256 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-17.png" alt=""></a>
                                    <a class="red-tooltip" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="یکتا - 652 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-18.png" alt=""></a>
                                    <a class="red-tooltip active" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="فرانک - 125 پست">
                                        <img src="files/kingMaterials/imgs/authors/author-20.png" alt=""></a>
                                </div>
                            </div>
                            <!--Newsletter-->
                            <div class="sidebar-widget widget_newsletter border-radius-10 p-20 bg-white mb-30">
                                <div class="widget-header widget-header-style-1 position-relative mb-15">
                                    <h5 class="widget-title">خبرنامه</h5>
                                </div>
                                <div class="newsletter">
                                    <p class="font-medium">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ</p>
                                    <form target="_blank" action="#" method="get" class="subscribe_form relative mail_part">
                                        <div class="form-newsletter-cover">
                                            <div class="form-newsletter position-relative">
                                                <input type="email" name="EMAIL" placeholder="ایمیل خود را اینجا وارد کنید" required="">
                                                <button type="submit">
                                                    <i class="ti ti-email"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!--Post aside style 2-->
                            <div class="sidebar-widget mb-30">
                                <div class="widget-header mb-30">
                                    <h5 class="widget-title">پرطرفدارترین ها</h5>
                                </div>
                                <div class="post-aside-style-2">
                                    <ul class="list-post">
                                        <li class="mb-30 wow fadeIn animated">
                                            <div class="d-flex">
                                                <div class="post-thumb d-flex ml-15 border-radius-5 img-hover-scale">
                                                    <a class="color-white" href="single.html">
                                                        <img src="files/kingMaterials/imgs/thumbnail-2.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="post-content media-body">
                                                    <h6 class="post-title mb-10 text-limit-2-row"><a href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ</a></h6>
                                                    <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                        <span class="post-by">توسط <a href="author.html">رضا کیمیا</a></span>
                                                        <span class="post-on">4 دقیقه پیش</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mb-30 wow fadeIn animated">
                                            <div class="d-flex">
                                                <div class="post-thumb d-flex ml-15 border-radius-5 img-hover-scale">
                                                    <a class="color-white" href="single.html">
                                                        <img src="files/kingMaterials/imgs/thumbnail-3.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="post-content media-body">
                                                    <h6 class="post-title mb-10 text-limit-2-row"><a href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت</a></h6>
                                                    <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                        <span class="post-by">توسط <a href="author.html">سعید شمس</a></span>
                                                        <span class="post-on">3 ساعت پیش</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mb-30 wow fadeIn animated">
                                            <div class="d-flex">
                                                <div class="post-thumb d-flex ml-15 border-radius-5 img-hover-scale">
                                                    <a class="color-white" href="single.html">
                                                        <img src="files/kingMaterials/imgs/thumbnail-5.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="post-content media-body">
                                                    <h6 class="post-title mb-10 text-limit-2-row"><a href="single.html">سه درصد گذشته، حال و آینده شناخت فراوان</a></h6>
                                                    <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase">
                                                        <span class="post-by">توسط <a href="author.html">الناز روستایی</a></span>
                                                        <span class="post-on">4 ساعت پیش</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sidebar-widget mb-30">
                                <div class="widget-header mb-30">
                                    <h5 class="widget-title">محبوب ترین</h5>
                                </div>
                                <div class="post-aside-style-3">
                                    <article class="bg-white border-radius-15 mb-30 p-10 wow fadeIn animated">
                                        <div class="post-thumb d-flex mb-15 border-radius-15 img-hover-scale">
                                            <a href="single.html">
                                                <video autoplay="" class="photo-item__video" loop="" muted="" preload="none">
                                                    <source src="#" type="video/mp4">
                                                </video>
                                            </a>
                                        </div>
                                        <div class="pl-10 pr-10">
                                            <h5 class="post-title mb-15"><a href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ</a></h5>
                                            <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase mb-10">
                                                <span class="post-in">در <a href="category.html">جهان</a></span>
                                                <span class="post-by">توسط <a href="author.html">الناز روستایی</a></span>
                                                <span class="post-on">4 دقیقه پیش</span>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="bg-white border-radius-15 mb-30 p-10 wow fadeIn animated">
                                        <div class="post-thumb d-flex mb-15 border-radius-15 img-hover-scale">
                                            <a href="single.html">
                                                <img class="border-radius-15" src="files/kingMaterials/imgs/news-22.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="pl-10 pr-10">
                                            <h5 class="post-title mb-15"><a href="single.html">لورم ایپسوم متن ساختگی با تولید</a></h5>
                                            <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase mb-10">
                                                <span class="post-in">در <a href="category.html">سلامت</a></span>
                                                <span class="post-by">توسط <a href="author.html">رضا کیمیا</a></span>
                                                <span class="post-on">14 دقیقه پیش</span>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <div class="sidebar-widget p-20 border-radius-15 bg-white widget-latest-comments wow fadeIn animated">
                                <div class="widget-header mb-30">
                                    <h5 class="widget-title">آخرین <span>نظرات</span></h5>
                                </div>
                                <div class="post-block-list post-module-6">
                                    <div class="last-comment mb-20 d-flex wow fadeIn animated">
                                        <span class="item-count vertical-align">
                                            <a class="red-tooltip author-avatar" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="مرجان - 985 پست">
                                                <img src="files/kingMaterials/imgs/authors/author-14.png" alt=""></a>
                                        </span>
                                        <div class="alith_post_title_small">
                                            <p class="font-medium mb-10"><a href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان.</a></p>
                                            <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase mb-10">
                                                <span class="post-by">توسط <a href="author.html">مرجان همتی</a></span>
                                                <span class="post-on">4 دقیقه پیش</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="last-comment d-flex wow fadeIn animated">
                                        <span class="item-count vertical-align">
                                            <a class="red-tooltip author-avatar" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="بهمن - 1245 پست">
                                                <img src="files/kingMaterials/imgs/authors/author-9.png" alt=""></a>
                                        </span>
                                        <div class="alith_post_title_small">
                                            <p class="font-medium mb-10"><a href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان</a></p>
                                            <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase mb-10">
                                                <span class="post-by">توسط <a href="author.html">بهمن راستی</a></span>
                                                <span class="post-on">4 دقیقه پیش</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-50 mt-15">
                        <div class="col-md-12">
                            <div class="widget-header position-relative mb-30">
                                <h4 class="widget-title mb-0">از <span>وبلاگ</span></h4>
                            </div>
                            <div class="post-carausel-2 post-module-1 row">
                                <div class="col">
                                    <div class="post-thumb position-relative">
                                        <div class="thumb-overlay img-hover-slide border-radius-15 position-relative" style="background-image: url(files/kingMaterials/imgs/thumbnail-7.jpg)">
                                            <a class="img-link" href="single.html"></a>
                                            <div class="post-content-overlay">
                                                <div class="entry-meta meta-0 font-small mb-15">
                                                    <a href="category.html"><span class="post-cat bg-success color-white">سفر</span></a>
                                                </div>
                                                <h5 class="post-title">
                                                    <a class="color-white" href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده</a>
                                                </h5>
                                                <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                    <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                    <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="post-thumb position-relative">
                                        <div class="thumb-overlay img-hover-slide border-radius-15 position-relative" style="background-image: url(files/kingMaterials/imgs/thumbnail-8.jpg)">
                                            <a class="img-link" href="single.html"></a>
                                            <div class="post-content-overlay">
                                                <div class="entry-meta meta-0 font-small mb-15">
                                                    <a href="category.html"><span class="post-cat bg-info color-white">زیبایی</span></a>
                                                </div>
                                                <h5 class="post-title">
                                                    <a class="color-white" href="single.html">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ</a>
                                                </h5>
                                                <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                    <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                    <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="post-thumb position-relative">
                                        <div class="thumb-overlay img-hover-slide border-radius-15 position-relative" style="background-image: url(files/kingMaterials/imgs/thumbnail-10.jpg)">
                                            <a class="img-link" href="single.html"></a>
                                            <div class="post-content-overlay">
                                                <div class="entry-meta meta-0 font-small mb-15">
                                                    <a href="category.html"><span class="post-cat bg-danger color-white">هنر</span></a>
                                                </div>
                                                <h5 class="post-title">
                                                    <a class="color-white" href="single.html">تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای</a>
                                                </h5>
                                                <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                    <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                    <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="post-thumb position-relative">
                                        <div class="thumb-overlay img-hover-slide border-radius-15 position-relative" style="background-image: url(files/kingMaterials/imgs/thumbnail-15.jpg)">
                                            <a class="img-link" href="single.html"></a>
                                            <div class="post-content-overlay">
                                                <div class="entry-meta meta-0 font-small mb-10">
                                                    <a href="category.html"><span class="post-cat bg-warning color-white">بازی</span></a>
                                                </div>
                                                <h5 class="post-title">
                                                    <a class="color-white" href="single.html">طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد</a>
                                                </h5>
                                                <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                    <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                    <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="post-thumb position-relative">
                                        <div class="thumb-overlay img-hover-slide border-radius-15 position-relative" style="background-image: url(files/kingMaterials/imgs/thumbnail-16.jpg)">
                                            <a class="img-link" href="single.html"></a>
                                            <div class="post-content-overlay">
                                                <div class="entry-meta meta-0 font-small mb-10">
                                                    <a href="category.html"><span class="post-cat bg-primary color-white">باغچه</span></a>
                                                </div>
                                                <h5 class="post-title">
                                                    <a class="color-white" href="single.html">سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان</a>
                                                </h5>
                                                <div class="entry-meta meta-1 font-x-small mt-10 pr-5 pl-5 text-muted">
                                                    <span><span class="ml-5"><i class="fa fa-eye" aria-hidden="true"></i></span>5.8 هزار</span>
                                                    <span class="mr-15"><span class="ml-5 text-muted"><i class="fa fa-comment" aria-hidden="true"></i></span>2.5 هزار</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>



