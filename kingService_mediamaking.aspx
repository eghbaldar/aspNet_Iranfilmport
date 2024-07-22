<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingService_mediamaking.aspx.vb" Inherits="kingService_mediamaking" %>
<%@ Register Src="~/usercontrols/KingComments.ascx" TagPrefix="uc1" TagName="KingComments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side">
        <div class="item-holder" style="direction: rtl; text-justify: inter-word; text-align: justify;">


            <p>رسانه سازی تخصص و حرفه ی جدیدی است که بسیار در ایران مهجور مانده است. تخصصی که در فرآنید پخش کنندگی فیلم بسیار حائز اهمیت است. فیلم شما چقدر مورد جستجو واقع می شود؟ نام شما بعنوان کارگردان و یا تهیه کننده فیلمتان چقدر در لیست موتورهای جستجوگر نشان داده می شود؟ محصول شما (که در این بحث فیلم نام خواهد داشت) چقدر شناخته شده است؟ تصاویر اثر شما در چند وب سایت معتبر نشان داده شده است؟ آیا روزمه شخصی شما به زبان انگلیسی جایی قابل مشاهده است؟ و ... اگر جواب شما به این سوالات و سوالات نظیر به آن مثبت باشد ممکن است در انتخاب فیلمتان توسط هیئت انتخاب و حتی هیئت Jury موفقترعمل کنید. آیا می دانستید؟</p>
            <br />
            <p>درگاه فیلم ایران با دارا بودن متخصصین امر رسانه که سال هاست در این زمینه فعال بوده‌اند و با همکاری گروه تبلیغاتی «تابش» و <a target="_blank" href="https://filmema.com">«فیلمما»</a> که سابقه ای بیش از 20 سال در زمینه تبلیغات رسانه ای دارند، به پروتکلی مشترک جهت ارائه بهترین نوع خدمات رسانه ای برای فیلمسازان و فیلم هایشان رسیده است که در ایران برای اولین بار خواهد بود.</p>
            <br />
            <p>پیشنهاد ویژه ی درگاه فیلم ایران به فیلمسازان دریافت این خدمات جهت بهتر دیدن شدن فیلم هایشان در فستیوال های معتبر جهانی ایست.</p>
            <br />
            <br />


        </div>
        <uc1:KingComments runat="server" ID="KingComments" />
    </div>

</asp:Content>

