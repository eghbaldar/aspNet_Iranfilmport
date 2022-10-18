<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="service_mediamaking.aspx.vb" Inherits="service_mediamaking" %>

<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/last_articles.ascx" TagName="last_articles" TagPrefix="uc2" %>
<%@ Register src="usercontrols/comment.ascx" tagname="comment" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        p
        {
            font-size: 14px;
            font-family:Samim;
            direction:rtl;            
            color:#000;
        }
       @media (max-width: 767px) {
            .item-holder{ width: 100%;padding:20px;}
            img{width:100%;}
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_10.jpg);">
    <div class="container">
        <div class="title-text">
            <h1><span style="font-family: Titr;">رسانه سازی</span> </h1>           
        </div>
    </div>
</section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12" >
                <div class="left-side">
                <div class="item-holder" style="direction:rtl;text-justify:inter-word;     text-align: justify;">


                <p>رسانه سازی تخصص و حرفه ی جدیدی است که بسیار در ایران مهجور مانده است. تخصصی که در فرآنید پخش کنندگی فیلم بسیار حائز اهمیت است. فیلم شما چقدر مورد جستجو واقع می شود؟ نام شما بعنوان کارگردان و یا تهیه کننده فیلمتان چقدر در لیست موتورهای جستجوگر نشان داده می شود؟ محصول شما (که در این بحث فیلم نام خواهد داشت) چقدر شناخته شده است؟ تصاویر اثر شما در چند وب سایت معتبر نشان داده شده است؟ آیا روزمه شخصی شما به زبان انگلیسی جایی قابل مشاهده است؟ و ... اگر جواب شما به این سوالات و سوالات نظیر به آن مثبت باشد ممکن است در انتخاب فیلمتان توسط هیئت انتخاب و حتی هیئت Jury موفقترعمل کنید. آیا می دانستید؟</p>
                <br />
                <p>درگاه فیلم ایران (IFP) با دارا بودن متخصصین امر رسانه که سال هاست در این زمینه فعال بوده اندو با همکاری گروه تبلیغاتی «تابش» که سابقه ای بیش از 20 سال در زمینه تبلیغات رسانه ای دارند، به پرتکلی مشترک جهت ارائه بهترین نوع خدمات رسانه ای برای فیلمسازان و فیلم هایشان رسیده است که در ایران برای اولین بار خواهد بود.</p>
                <br />
                <p>پیشنهاد ویژه ی درگاه فیلم ایران به فیلمسازان دریافت این خدمات جهت بهتر دیدن شدن فیلم هایشان در فستیوال های معتبر جهانی نیست.</p>
                <br />
                <br />
                

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
