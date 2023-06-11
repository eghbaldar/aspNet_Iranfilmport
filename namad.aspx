<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="namad.aspx.vb" Inherits="namad" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        h5
        {
            font-family: Samim;
            font-size: 14px;
        }
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
    <section class="page-title text-center" style="background-image: url(files/images/background/MovibetaBG.jpg);">
    <div class="container">
        <div class="title-text">
            <h1><span style="font-family: Titr;">نماد اعتماد درگاه فیلم ایران</span></h1>
        </div>
    </div>
    </section>
    <!--End Page Title-->
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12" >
                <div class="left-side">
                <div class="item-holder" style="direction:rtl;text-justify:inter-word; 
                    line-height:5px;
                        text-align: justify;">


                <p>
                نماد درگاه فیلم ایران چیست و چه کاربردی دارد؟
                </p>
                <p>
                هر سیستم و مجموعه دارای المان های مورد تائید و استاندارد خود می باشد که درگاه فیلم ایران از این قانون مستثنی نمی باشد. براساس آیین نامه داخلی و
                <a target="_blank" href="/قوانین-و-مقررات">
                 قوانین و مقررات درگاه فیلم ایران 
                </a>
                 و همچنین قانون حاکم و جاری در جمهوری اسلامی ایران، هر فیلم جهت بهره مندی از امکانات درگاه فیلم ایران در جهت رساندن فیلم خود به فستیوال ها و جشنواره های خارجی و بین المللی موظف است که
                  دارای
                  <a  target="_blank" href="/نماد-اعتماد-درگاه-فیلم-ایران">
                   نماد اعتماد درگاه فیلم ایران
                   </a>
                   باشد.
                </p>
                <p style="text-align:center;">
                <img alt="نماد درگاه فیلم ایران" title="نماد درگاه فیلم ایران" src="files\images\logos\confidence_logo.png" width="50%" /></p>
<p>
در واقع هر پروژه در قالب فیلم و یا فیلمنامه با دارا بودن این نماد به ما و به مخاطبین خود (در پروفایل کاربر جهت نمایش عمومی) اثبات میکند که این پروژه حقیقی بوده است و مغایرتی با قوانین درگاه فیلم ایران و قانون کشوری ندارد.
</p>

<p style="text-align:center;">
<img alt="نماد درگاه فیلم ایران" title="نماد درگاه فیلم ایران" src="files\images\logos\POSTERwithLogo.jpg" /></p>
 
<p>
هر کاربر پس از ایجاد پروژه و تائید آن توسط کارشناسان پخش، میتواند فیلم و یا فیلمنامه خود را از دو طریق که در سامانه مشخص گردیده است به دست کارشناسان درگاه فیلم ایران برساند. 
شما میتواند در خصوص چگونگی

<a  target="_blank" href="/پخش-و-ارسال-فیلم">
پخش و ارسال فیلم به فستیوال
</a>

توسط درگاه فیلم ایران به بخش مربوطه مراجعه کرده و اطلاعات کسب کنید.
پروژه پس از بررسی و انطباق با اطلاعات وارد شده در سامانه نماد اعتماد گرفته و آماده پخش و ارسال به فستیوال های خارجی خواهد شد. همچنین پروژه هایی که نماد دریافت نمیکنند صرفا در پروفایل کاربر قابل نمایش خواهند بود و هیچگاه نمیتوانند به فستیوال های خارجی ارسال شوند.
</p>

                   </div>
                    
                </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
                </div>
                </div>
                </section>
</asp:Content>
