<%@ Page
    Language="VB"
    MasterPageFile="~/Master_Main.master"
    AutoEventWireup="false"
    CodeFile="movibeta.aspx.vb"
    Inherits="movibeta" %>

<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/last_articles.ascx" TagName="last_articles" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/comment.ascx" TagName="comment" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        p {
            font-size: 14px;
            font-family: Samim;
            direction: rtl;
            color: #000;
        }

        @media (max-width: 767px) {
            .item-holder {
                width: 100%;
                padding: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/MovibetaBG.jpg);">
    <div class="container">
        <div class="title-text">
            <h1>MOVIBETA.com</h1>
        </div>
    </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12" >
                <div class="left-side">
                <div class="item-holder" style="direction:rtl;">

                <div  style="text-align:justify;">
                          
                            <img alt="movibeta.com" width="95%" src="files/images/logos/MovibetaLogo.png" />
                           
                        </div>
                <div class="content-text" style="text-justify:inter-word;     text-align: justify;font-family:Samim;">
                         
                                <p style="color:Black;font-size:14px;">
                                    شرکت پخش کنندگی فیلم اسپانیایی و معتبر Movibeta که در قالب یکی از 10 پلتفرم برتر جهانی نیز عرض اندام کرده 
                                    است از سال 2006 شروع به فعالیت کرده است. این شرکت اسپانیایی حدودا 500 فستیوال جهانی
                                    را تحت پوشش دارد. این گروه پخش کنندگی که در مدیوم کوتاه و بلند فعال است بیشتر فستیوال
                                    های اروپایی را تحت پوشش خود دارد.</p>
                    <p style="direction:ltr;text-align:justify;">
                        Since 2019, IRAN FILM PORT reaches to common dialogue with a famous distribution film company in the world named "MOVIBETA". According to this accordance, IRAN FILM PORT can use all of the services of MOVIBETA for expanding its distribution.
                    </p>
                    <div style="text-align:center;">
                        <a href="https://www.instagram.com/p/CdoWxLZO6ub/" target="_blank">
                         <img alt="movibeta.com" width="400px" src="files\images\icons\MovibetaIG.jpg" 
                             style="-moz-border-radius: 15px;	-webkit-border-radius: 15px;	 border-radius:15px;
border:2px solid #2e79ff;"/>
                            </a>
                    </div>
                                <p style="color:Black;font-size:14px;">
                                    درگاه فیلم ایران (IRAN FILM PORT) طبق توافقی دو جانبه همکاری متقابلی با این شرکت پخش کنندگی
                                    اسپانیایی منعقد کرده است که از جمله مفاد آن میتوان به پوشش فستیوالی و نیز تخفیفاتی
                                    در این زمینه اشاره کرد.</p>                              
                        </div>
                        <div style="direction:ltr;text-align:left; background-color:#c2e8ea;
                        padding:10px;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;">
                        MOVIBETA's statement:
                        <p style="color:Black;direction:ltr;">Movibeta is a film festival platform that has been in the market since 2008,we know
                        deeply the film festivals that work with us any film festival working with us need to be approved by
                        us to avoid fake film festival.</p>
                        <p style="color:Black;direction:ltr;">At the moment we just have less than 20 Iranian film directors, by working with IRAN FILM PORT we expect
                        that number to increase.</p>
                        <p style="color:Black;direction:ltr;">We also hope that IRAN FILM PORT will encourage and facilitate and smooth the use 
                        of Movibeta to Iranian directors.</p>
                        </div>
                        <div>
                          <p style="color:Black;">
                                    در صورت داشتن هرگونه سوال می توانید از طریق پست الکترونیکی اختصاصی IFP (درگاه فیلم ایران) در این شرکت
                                اسپانیایی اقدام کنید.</p>
                        <p style="letter-spacing: 3px;direction:ltr;color:Black;">
                                    <span><img alt="پست الکترونیکی ایمیل" src="files/images/icons/email.png" /></span>
                                    <a href="mailto:iranfilmport@movibeta.com">
                                    iranfilmport@movibeta.com
                                    </a>
                                    </p>
                        </div>

                </div>
                    <uc3:comment ID="comment" runat="server" />
                </div>
                </div>

               <uc1:banners_right ID="banners_right1" runat="server" />

                <%--<uc2:last_articles ID="last_articles1" runat="server" />--%>

                </div>
                </div>
    </section>
</asp:Content>
