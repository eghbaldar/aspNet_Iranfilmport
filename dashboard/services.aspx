<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="services.aspx.vb" Inherits="dashboard_services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .alert
        {
            font-family: Samim;
            text-justify: inter-word;
            text-align: justify;
            color: Black;
            margin:4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right;">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                    سرویس ها</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table>
                    <tr>
                        <td style="vertical-align:top;">
                            <img src='<%= ResolveUrl("~/files/images/icons/icon_media.png")%>' width="100" />
                        </td>
                        <td>
                            <div class="alert alert-warning">
                                <div>
                                    رسانه سازی تخصص و حرفه ی جدیدی است که بسیار در ایران مهجور مانده است. تخصصی که در
                                    فرآنید پخش کنندگی فیلم بسیار حائز اهمیت است. فیلم شما چقدر مورد جستجو واقع می شود؟
                                    نام شما بعنوان کارگردان و یا تهیه کننده فیلمتان چقدر در لیست موتورهای جستجوگر نشان
                                    داده می شود؟ محصول شما (که در این بحث فیلم نام خواهد داشت) چقدر شناخته شده است؟
                                    تصاویر اثر شما در چند وب سایت معتبر نشان داده شده است؟ آیا روزمه شخصی شما به زبان
                                    انگلیسی جایی قابل مشاهده است؟ و ... اگر جواب شما به این سوالات و سوالات نظیر به
                                    آن مثبت باشد ممکن است در انتخاب فیلمتان توسط هیئت انتخاب و حتی هیئت Jury موفقترعمل
                                    کنید. آیا می دانستید؟</div>
                                <div>
                                    درگاه فیلم ایران (IFP) با دارا بودن متخصصین امر رسانه که سال هاست در این زمینه فعال
                                    بوده اندو با همکاری گروه تبلیغاتی «تابش» که سابقه ای بیش از 20 سال در زمینه تبلیغات
                                    رسانه ای دارند، به پرتکلی مشترک جهت ارائه بهترین نوع خدمات رسانه ای برای فیلمسازان
                                    و فیلم هایشان رسیده است که در ایران برای اولین بار خواهد بود.
                                </div>
                                <div>
                                    پیشنهاد ویژه ی درگاه فیلم ایران به فیلمسازان دریافت این خدمات جهت بهتر دیدن شدن
                                    فیلم هایشان در فستیوال های معتبر جهانی نیست.
                                </div>
                                <div>
                                    جهت کسب اطلاع بیشتر در این خصوص با بخش رسانه ای درگاه در ارتباط باشید و یا هم اکنون
                                    جهت دریافت این خدمات از لینک زیر اقدام کنید.
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src='<%= ResolveUrl("~/files/images/icons/icon_subtitle.png") %>' width="100" />
                        </td>
                        <td>
                            <div class="alert alert-warning">
                                درگاه فیلم ایران با دارا بودن متخصصین زبان، بهترین زیر نویس مناسب فیلم شما را عرضه
                                میکند. درست است که زیر نویس جزوی از فیلم نیست ولی بدانید که تاثیر استفاده کلمات
                                درست و بعضا خاص فیلم تاثیرات مثبتی در اذهان و داوری داوران خواهد داشت.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src='<%= ResolveUrl("~/files/images/icons/icon_poster.png")%>' width="100" />
                        </td>
                        <td>
                            <div class="alert alert-warning">
                                درگاه فیلم ایران با همکاری مشترک و استفاده از طراحان بنام گرافیکی پوستر شما را طراحی
                                خواهد کرد. پوستر بخش رسانه ای فیلم شماست آن را جدی بگیرید.
                            </div>
                        </td>
                    </tr>                    
                </table>
            </div>
        </div>
    </div>
</asp:Content>
