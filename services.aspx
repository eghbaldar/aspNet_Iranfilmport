<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="services.aspx.vb" Inherits="services" %>

<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/last_articles.ascx" TagName="last_articles" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/comment.ascx" TagName="comment" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        p
        {
            font-size: 14px;
            font-family: Samim;
            direction: rtl;
            color: #000;
        }
        @media (max-width: 767px)
        {
            .item-holder
            {
                width: 100%;
                padding: 20px;
            }
            img
            {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_11.png);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <span style="font-family: Titr;">سرویس‌های درگاه فیلم ایران</span>
                </h1>
            </div>
        </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div class="left-side">
                        <div style="direction: rtl; font-family: NazaninB;text-align:justify;padding:5px;">
                            <p>
                                درگاه فیلم ایران (IFP) جهت تسهیل در امور Post-Production و پخش فیلم خدماتی را از
                                جمله، ترجمه زیرنویس، حک کردن زیرنویس روی فیلم، تولید فایل اس آر تی، طراحی پوستر
                                و طراحی تریلر را نیز ارائه میدهد.
                            </p>
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
