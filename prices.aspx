<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="prices.aspx.vb" Inherits="prices" %>

<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/last_articles.ascx" TagName="last_articles" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/comment.ascx" TagName="comment" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        p, h5
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
        }
        
        
        .T .fr
        {
            text-align: right;
            font-family: Samim;
            direction: rtl;
            color: Black;
        }
        .T
        {
            width: 100%;
            border-collapse: collapse;
            direction: rtl;
            text-align: right;
            color: Black;
        }
        /* Zebra striping */
        .T tr:nth-of-type(odd)
        {
            background: #eee;
            color: Black;
        }
        .T th
        {
            background: #333;
            color: white;
            font-weight: bold;
        }
        .T td, .T th
        {
            padding: 6px;
            border: 1px solid #ccc;
            text-align: right;
            font-family: irsans;
        }
        .T td
        {
            text-align: right;
            direction: rtl;
        }
        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px)
        {
            .txt
            {
                width: 100%;
            }
            /* Force table to not be like tables anymore */
            .T, thead, .T tbody, .T th, .T td, .T tr
            {
                display: block;
            }
        
            /* Hide table headers (but not display: none;, for accessibility) */
            .T thead tr
            {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
        
            .T tr
            {
                border: 1px solid #ccc;
            }
        
            .T td
            {
                /* Behave  like a "row" */
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                font-family: irsans;
            }
        
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_6.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <span style="font-family: Titr;">هزینه و تعرفه‌ها</span>
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
                        <div class="item-holder" style="direction: rtl;">
                            <div style="text-justify: inter-word; text-align: justify;">
                                <h5>
                                    با پیشرفت فناوری و گسترش وسایل ارتباط جمعی و الخصوص تلفن همراه و به طبع آن نرم افزارهای
                                    Social Networking همچون تلگرام و اینستاگرام، فضا برای سودجویی از دیگران سهل و همه
                                    گیرتر شد که بطور بسیار حیرت انگیزی جامعه سینما و مدیوم کوتاه نیز از آن بی نصیب نماند.
                                    از نمونه ی بارزترین این سودجویی و <a href='http://iranfilmport.com/72' target='_blank'>
                                        کلاهبرداری ها</a>، گرفتن <a href='http://iranfilmport.com/8' target='_blank'>مبالغ ناچیزی
                                            همچون 10 هزار تومان</a> و پخش فیلم به فستیوال های خارجی است که بیشتر شبیه
                                    به یک جوک بی مزه است! ما نام افراد را شبیه پخش کنندگان بنامیم! این افراد درک درستی
                                    از محتوای فیلم، هدف فیلم، هدف پخش، مکان پخش و... نداشته و هیچگونه دلسوزی‌ای بابت
                                    آینده فیلم ندارند چرا که هدفشان فقط کسب درآمد است.</h5>
                                <h5>
                                    درگاه فیلم ایران با سابقه ای که در پخش فیلم در چند سال اخیر داشته است و نیز با رویت
                                    فرآیند پخش جهانی و مطالعه در این زمینه، ساختاری را در ارزشگذاری پخش فیلم ها در پیش
                                    گرفته است که با رعایت انصاف و عدالت، هدفگذاری درست را نشانه میرود.</h5>
                                <p style="text-align: center;">
                                    <img alt="رسانه سازی پخش فیلم کوتاه" src="files/images/background/banner_costB.jpg" /></h5>
                                    <h5>
                                        IFP برای هر فیلم یک کاستبیس در نظر خواهد گرفت که مقدار حدّ ارزشی آن است. این مقدار
                                        برای هر فیلم متفاوت از فیلم دیگر است و وقتی مقدار آن مشخص می شود که فیلم توسط تیم
                                        کارشناسان پخش IFP دیده شود. کاستبیس مقادیر متفاوتی دارد که به هیچ عنوان قابل پیشبینی
                                        نمی باشد. بر اساس این مقدار، فرمول نهایی محاسبه هزینه ارسال هر فیلم برای هر فستیوال
                                        (بعنوان مثال در مدلِ پخش موردی) <span style="color: Red;">معادل: کاستبیس + مقدار هزینه
                                            ورودی فستیوال (fee)</span> است.</h5>
                                    <h5>
                                        متغیرهای که بر کاستبیس موثر است عبارتنداز: کیفیت فیلم، محتوای فیلم، سابقه فیلمساز،
                                        تهیه کننده فیلم، افتخارات پیشین، بازیگران ، عوامل حرفه ای و ...</h5>
                                    <p>
                                        درگاه فیلم ایران براساس فعالیت چندین ساله و بررسی مدل‌های مرسوم و حرفه‌‌ای در پخش
                                        کنندگی و ارسال فیلم و فیلمنامه، 5 مدل را که در جدول شرح آن آمده به تهیه کنندگان
                                        و نمایندگان فیلم و فیلمنامه پیشنهاد و براساس شرایط هر فیلم یکی از آنها را در قرارداد
                                        اتخاذ خواهد کرد.</p>
                                <div class="table-responsive">
                                    <table class="T">
                                        <thead>
                                            <tr>
                                                <th>
                                                    مدل
                                                </th>
                                                <th>
                                                    فرمول
                                                </th>
                                                <th>
                                                    توضیحات
                                                </th>
                                                <th>
                                                    سطح
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td style="font-family: titr;">
                                                    ارسال موردی
                                                </td>
                                                <td>
                                                    CostB + fee
                                                </td>
                                                <td>
                                                    <p>
                                                        این مدل از ارسال، هنگاهی توصیه می شود که یا هدف تنها <span style="color: Red;">یک جشنواره</span>
                                                        ی مشخص باشد و یا به علت خاص بودن فیلم امکان مانیتور فستیوال ها وجود نداشته باشد.
                                                    </p>
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-family: titr;">
                                                    پخش بسته‌ای
                                                </td>
                                                <td>
                                                    y % (x * (CostB + fee))
                                                </td>
                                                <td style="text-justify: inter-word; text-align: justify;">
                                                    <p>
                                                        در این مدل 10 بسته تعبیه شده است، بسته های 10الی 100 فستیوالی. که براساس هر بسته
                                                        تخفیفاتی پلکانی اعمال می شود. به عبارتی دیگر با انتخاب هر بسته فیلم به همان تعداد
                                                        فستیوال ارسال و پخش خواهد شد.
                                                    </p>
                                                    <table class="T">
                                                        <tr>
                                                            <td>
                                                                پکیج
                                                            </td>
                                                            <td>
                                                                تخفیف
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                10
                                                            </td>
                                                            <td>
                                                                10 %
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                20
                                                            </td>
                                                            <td>
                                                                12 %
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                30
                                                            </td>
                                                            <td>
                                                                14 %
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                40
                                                            </td>
                                                            <td>
                                                                21 %
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                50
                                                            </td>
                                                            <td>
                                                                25 %
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                60
                                                            </td>
                                                            <td>
                                                                30 %
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                70
                                                            </td>
                                                            <td>
                                                                32 %
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                80
                                                            </td>
                                                            <td>
                                                                37 %
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                90
                                                            </td>
                                                            <td>
                                                                40 %
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                100
                                                            </td>
                                                            <td>
                                                                42 %
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <p>
                                                        بعنوان مثال با انتخاب بسته‌ی 10 فستیوالی و تعیین کاستبیس 50.000 تومانی (بعنوان مثال)
                                                        و اعمال تخفیف 10% بجای 500.000 تومان مبلغ 450.000 تومان فاکتور خواهد شد.
                                                    </p>
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-family: titr;">
                                                    پخش  یکساله
                                                </td>
                                                <td>
                                                    مبلغ ثابت
                                                </td>
                                                <td>
                                                    <p>
                                                        این مدل، روشی است که تهیه کننده و یا نماینده فیلم، مبلغ معینی
                                                را برای مدت یک سال پرداخت خواهند کرد. در این روش محدودیتی در ارسال
                                                موجود نداشته و براساس استراتژی هر فیلم، فستیوال‌ها انتخاب و ارسال انجام خواهد شد.
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-family: titr;">
                                                    پخش دو ساله
                                                </td>
                                                <td>
                                                    مبلغ ثابت
                                                </td>
                                                <td>
                                                    <p>
                                                        این مدل، روشی است که تهیه کننده و یا نماینده فیلم، مبلغ معینی
                                                را برای مدت دو سال (مصونیت فیلم) پرداخت خواهند کرد. در این روش محدودیتی در ارسال
                                                موجود نداشته و براساس استراتژی هر فیلم، فستیوال‌ها انتخاب و ارسال انجام خواهد شد.
                                                <td>
                                                    <img alt="طرح برنزی پخش فیلم کوتاه و بلند" src="files/images/icons/medal_bronze.png" /><br />
                                                    Bronze برنزی
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-family: titr;">
                                                    پخش تلفیقی
                                                </td>
                                                <td>
                                                    مبلغ ثابت + درصد از جایزه
                                                </td>
                                                <td>
                                                    <p>
                                                        این مدل قرارداد بصورت درصدی از جایزه به همراه پرداخت مبلغ معینی به منظور
                                                حق الزحمه ارسال منعقد خواهد شد. گفتنی است که مبلغ این قرارداد از مدل دو ساله کمتر
                                                خواهد بود.
                                                <td>
                                                    <img alt="طرح برنزی پخش فیلم کوتاه و بلند" src="files/images/icons/medal_silver.png" /><br />
                                                    Bronze برنزی
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-family: titr;">
                                                    پخش حرفه‌ای
                                                </td>
                                                <td>
                                                    بدون هزینه
                                                </td>
                                                <td style="color: #00;">
                                                    </br>
                                                    <p style="text-justify: inter-word; text-align: justify;">
                                                        فیلمسازان و تهیه کنندگان حرفه‌ای عرصه سینما و مدیوم فیلم کوتاه با ساخت فیلم‌هایی
                                                        با کیفیت و قابل قبول افتخار آفرین خواهند بود و به همین جهت رفتار درگاه فیلم ایران
                                                        نیز با این گروه از فیلم ها حرفه‌ای تر و متفاوت تر خواهد بود. این مدل از پخش هیچگونه
                                                        هزینه‌ای را در بر نخواهد داشت. اما گفتنی است که شرایط پذیرش این دست از فیلم ها بسیار پیچیده و 
                                                        میانگین نمره ای بالای 9 در ارزیابی کارگروه شرکت نیازمند است. همچنین «درگاه فیلم ایران» در یک سال
                                                        کاری تعداد بسیار محدودی در مدل حرفه ای پذیرش میکند.
                                                    </p>
                                                    <%--<p  style="color:red;font-family:NazaninB;">از جمله ملاک هایی که در انتخاب فیلم در این مدل حائز اهمیت هستند عبارتنداز:</h5>
<ul style="color:red;font-family:NazaninB;">
<li>کیفیت فیلم از نظر فنی</li>
<li>سوابق کننده فیلم</li>
<li>سوابق کارگردان فیلم</li>
<li>افتخارات فیلم</li>
<li>محتوا و پیام فیلم</li>
<li>سال تولید فیلم</li>
<li>بازیگران حرفه ای</li>
<li>عوامل حرفه ای</li>
<li>توانایی مالی تهیه کننده ( این عامل به این دلیل ملاک خواهد بود که پس از پذیرش فیلم در فستیوال های معتبر فیلم باید به فرمت مورد نظر فستیوال تبدیل و ارسال شود که دارای هزینه های زیادی است) </li>
</ul>
<p style="font-family:Titr;font-size:15px;text-align:justify;">فیلم هایی که از این مدل پخش خواهند شد در فستیوال های A+ حضور خواهند داشت و <a href="رسانه-سازی-پخش-فیلم">رسانه‌سازی پخش فیلم</a> برایشان رایگان خواهد بود.</h5>
                                                    --%>
                                                </td>
                                                <td>
                                                    <img alt="طرح طلایی پخش فیلم کوتاه و بلند" src="files/images/icons/medal_gold.png" /><br />
                                                    Gold طلایی
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <p style="color: red; font-family: NazaninB; font-size: 17px;">
                                    توجه (1): پس از ارسال فیلم و بررسی توسط کارگروه پخش درگاه فیلم ایران، کاستبیس
                                تعیین خواهد شد.</h5>
                                <p style="color: red; font-family: NazaninB; font-size: 17px;">
                                    توجه (2): پس از تعیین کاستبیس، مقدارآن هیچوقت تغییر نخواهد کرد.</h5>
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
