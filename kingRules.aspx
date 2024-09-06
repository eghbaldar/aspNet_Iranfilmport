﻿<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingRules.aspx.vb" Inherits="kingRules" %>

<%@ Register Src="~/usercontrols/KingComments.ascx" TagPrefix="uc1" TagName="KingComments" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .accordion ul, .accordion li {
            list-style-type: circle;
            text-align: justify;
        }

        .accordion {
            background-color: #f2de00;
            color: #444;
            cursor: pointer;
            padding: 10px;
            width: 100%;
            border: none;
            outline: none;
            transition: 0.4s;
            text-align: right;
            font-size: 15px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin-bottom: 10px;
        }

            /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
            .active, .accordion:hover {
                background-color: #E3EBF2;
            }

        /* Style the accordion panel. Note: hidden by default */
        .panel {
            padding: 0 18px;
            background-color: white;
            display: none;
            overflow: hidden;
            color: Black;
            text-align: justify;
        }

        .accordion:after {
            content: '\02795'; /* Unicode character for "plus" sign (+) */
            font-size: 13px;
            color: #777;
            float: right;
            margin-left: 5px;
        }

        .active:after {
            content: "\2796"; /* Unicode character for "minus" sign (-) */
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
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side">
        <div class="item-holder" style="direction: rtl;">
            <div style="direction: rtl; padding: 10px;">
                <div class="accordion">
                    شرایط عمومی ثبت نام کننده
                </div>
                <div class="panel">
                    <ol>
                        <li>تمامی کاربران حقیقی و حقوقی درگاه فیلم ایران موظف اند اطلاعات حقیقی و حقوقی خود
                                            را وارد کنند.</li>
                        <li>هر پروفایل میتواند توسط یکی از وابستگان فیلم ساخته شود که عبارتنداز: کارگردان، تهیه
                                            کننده ، پخش کننده و یا نماینده رسمی فیلم</li>
                        <li>هر پروفایل می تواند توسط کاربر و یا بصورت مستقیم توسط بخش فنی درگاه فیلم ایران ساخته
                                            شود. حالت دوم زمانی اتفاقی خواهد افتاد که فرد توانایی ساخت پروفایل را نداشته باشد.</li>
                        <li>پروفایل پس ایجاد شدن بصورت غیر فعال درخواهد آمد تا زمانی که بخش فنی درگاه، محتوایات
                                            قرار گرفته شده در پنل را تایید کنند.</li>
                        <li>پس از تایید ابتدایی محتویات هر پروفایل، کاربر می تواند با ارسال مدارک شناسایی، هویت
                                            ادعا شده را تایید و از درگاه نماد اعتماد پروفایل دریافت کند. در این صورت پروفایلشان
                                            از طرف درگاه مورد تایید می باشد.</li>
                        <li>در صورت عدم دریافت نماد اعتماد کاربری، شخص وارد کننده مشخصات پروفایل، مسئول اطلاعات
                                            وارده بوده و درگاه هیچگونه مسئولیتی در این زمینه نخواهد داشت.</li>
                        <li>هویت سنجی کاربران در چهار مرحله انجام خواهد گرفت. 1- تاییدیه تلفن همراه 2-تاییده
                                            پست الکترونیکی (ایمیل) 3-دریافت تصویر شناسنامه 4-تصویر کارت ملی.</li>
                        <li>تمامی مکاتبات رسمی از طریق پست الکترونیکی کاربر بعنوان ایجاد کننده پروفایل و نماینده
                                            اثر انجام خواهد شد.</li>
                        <li>در صورت تمایل به تغییر پست الکترونیکی ثبت شده، با ارسال یک درخواست رسمی (کتبی) بهمراه
                                            ضمیمه کردن تصویر شناسنامه و کارت ملی به پست الکترونیکی درگاه فیلم ایران به نشانی
                                            support@iranfilmport.com ارسال کنید.</li>
                    </ol>
                </div>
                <div class="accordion">
                    شرایط ثبت فیلم و فیلمنامه
                </div>
                <div class="panel">
                    <ol>
                        <li>پس از تکمیل مشخصات پروفایل، ایجاد کننده ی پروفایل میتواند به تعداد نامحدود فیلم
                                            و یا فیلمنامه اضافه کند.</li>
                        <li>پس از ایجاد پروژه (فیلم یا فیلمنامه) سند بصورت غیرفعال در آمده تا زمانی که گروه
                                            پشتیبانی درگاه آن سند را از نظر محتویایی تایید ابتدایی کنند.</li>
                        <li>پس از تایید ابتدایی، با ارسال نسخه اصلی فیلم و یا فیلمنامه میتوانید <a target='_blank'
                            href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد اعتماد درگاه فیلم ایران</a> را برای اثر
                                            خود دریافت کنید.</li>
                        <li>به منظور اخذ <a target='_blank' href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد اعتماد
                                            درگاه فیلم ایران</a> فیلم یا فیلمنامه، لینک معتبر فیلم یا فیلمنامه را ارسال و یا
                                            از طریق پست ، فیلم را در اختیار درگاه فیلم ایران قرار دهید.</li>
                        <li>در صورت عدم دریافت <a target='_blank' href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد
                                            اعتماد درگاه فیلم ایران</a>، وارد کننده مشخصات اثر مسئول اثر یا آثار بوده و درگاه
                                            هیچگونه مسئولیتی در این زمینه نخواهد داشت همچنین اثر مذکور هیچگاه به فستیوالی ارسال
                                            نخواهد شد.</li>
                        <li>وارد کننده مشخصات اثر با آگاهی کامل از قوانین عمومی و اختصاصی درگاه فیلم ایران اقدام
                                            به ثبت اثر نموده و تکمیل شدن مشخصات آن به منزله تایید کله قوانین درگاه نیز می باشد.</li>
                        <li>وارد کننده و ارسال کننده اثر با آگاهی نسبت به قوانین جمهوری اسلامی ایران و نیز با
                                            داشتن مجوزهای لازم در این حوزه از سوی مراجع ذی صلاح اقدام به ارسال اثر نموده و درگاه
                                            فیلم ایران بغیر از بررسی ابتدایی اثر از نظر کیفی و نیز محتوایی، تا آن جایی که مغایرت
                                            با قوانین درگاه فیلم ایران و جمهوری اسلامی ایران نداشته باشد، هیچگونه مسئولیتی نخواهد
                                            داشت. می توانید «قوانین محتوایی فیلم» را در بخش دیگر ملاحضه کنید.</li>
                        <li>تمامی آثار قبل از پخش باید دارای تاییده تهیه کننده و کارگردان بصورت مشترک باشند.</li>
                        <li>درگاه فیلم ایران صرفا یک پلتفرم پخش کننده فیلم یا فیلمنامه نیست، بلکه سازوکاری حقوقی
                                            و معتبر در زمینه پخش است، بنابراین لازم است در انتهای فیلم (تیتراژ پایانی) و نیز
                                            در دیگر فرم های مرتبط با بخش Submitter و یا Distributor بصورت حقوقی معرفی شود. در
                                            غیر این صورت درگاه مختار است که در جا و زمان مناسب مشخصات و لوگوی درگاه را در مورد
                                            فیلم اعمال کند.</li>
                        <li>پس از ارسال اثر به هر فستیوال قرارداد دیجیتال که ارزش حقوقی خواهد داشت در اختیار
                                            صاحب پروفایل قرار خواهد گرفت و در صورت تمایل به آدرس پستی وی پست خواهد شد. </li>
                        <li>وارد کننده فرم های اثر آگاهانه فیلد های مرتبط با اثر را پر کرده و درگاه هیچگونه
                                            مسئولتی در صورت مغایرت مشخصات اثر با فیلدهای فرم های مرتبط با اثر را نخواهد داشت.
                                            تنها در صورتی مسئولیت متوجه درگاه فیلم ایران خواهد شد که کاربر، پخش کنندگی کامل
                                            (پخش کنندگی حرفه ای) اثر را به درگاه واگذار کند. <a href="هزینه-پخش-بین-المللی-فیلم"
                                                style="color: Blue; font-size: 9px;">جهت مشاهده انواع پخش کنندگی درگاه فیلم ایران
                                                کلیک کنید.</a></li>
                        <li>درگاه فیلم ایران مختار است مشخصات و افتخارات اثر شما را با حفظ کامل حقوق تهیه کننده
                                            و کارگردان آن، جهت تبلیغات و رزومه حقوقی درگاه در شبکه های مجازی و کاتالوگ های مرتبط
                                            با سینما استفاده کند.</li>
                        <li>پرداخت هزینه برای هر فستیوال صرفا جهت ورود به فستیوال و حق کمسیون تبادل ارزی و همچنین
                                            حق الزحمه درگاه فیلم ایران است و به هیچ عنوان تضمین کننده موفقیت (راه یافتن و یا
                                            کسب جایزه) برای اثر در فستیوالی نمی باشد.</li>
                        <li>مسئولیت آگاه سازی موفقیت و یا عدم موفقیت اثر بر عهده درگاه فیلم ایران بوده و این
                                            اطلاع رسانی بر اساس زمان بندی جشنواره (Notification date) انجام خواهد شد و از پاسخگویی
                                            قبل از این زمان درگاه معذور است.</li>
                        <li>هزینه هر ارسال براساس فرمول هایی خاص محاسبه می شود و ارزش هر اثر با اثر دیگر کاملا
                                            متفاوت است. توجه به این نکته الزامی است ارزش هر اثر با توجه به کیفیت و محتویات آن
                                            سنجیده خواهد شد و مشخصه ای از قبل تعیین شده نمی باشد. درگاه فیلم ایران این ادعا
                                            را دارد که با نگاهی حرفه ای به فیلم ها می نگرد و چون دلالان عرصه پخش! با هزینه ای
                                            ثابت به آثار نگاه نمی کند<a href="هزینه-پخش-بین-المللی-فیلم" style="color: Blue;">جهت مشاهده تعرفه‌ها و ارزشگذاری آثار کلیک کنید.</a></li>
                        <li>با ارسال هر اثر به فستیوال، پخش کننده حرفه‌ای اثر درگاه فیلم ایران بوده و مختار
                                            است در کاتالوگ هایی محصول را در بازارهای جهانی عرضه کند.</li>
                        <li>فیلم ها باید دارای زیرنویس حک شده بر تصویر باشند.</li>
                        <li>تنها نسخه هایی از فیلم قابل پذیرش است که دارای کیفیت فنی لازم باشد. جهت مشاهده حداقل
                                            کیفیت فیلم به منوی زیرین مراجعه کنید.</li>
                        <li>پس از پذیرش اولیه فیلم در فستیوال، نسخه ی اصلی فیلم با فرمت درخواستی جشنواره (Exhibition
                                            Format) در زمان تعین شده توسط فستیوال باید برای دبیرخانه آن ارسال شود. وظیفه ارسال
                                            و نیز هزینه های حمل ونقل (Shipping) بر عهده ی تهیه کننده فیلم است.</li>
                        <li>در صورت عدم تکمیل کامل فیلدهای فرم اثر و برگشت اثر در مرحله ی Incomplete درگاه فیلم
                                            ایران هیچگونه مسئولیتی نخواهد داشت مگر آنکه پخش کنندگی کامل اثر بر عهده درگاه باشد.</li>
                        <li style="color: red;">کاربرانی که از طریق ارسال پستی مایل به ارسال فیلمهایشان هستند
                                            باید 8 روز قبل از ثبت نام در فستیوال اقدام به ارسال مرسوله کنند در غیر این صورت
                                            درگاه فیلم ایران هیچ مسئولیتی در خصوص عدم رسیدن فیلم به فستیوال را ندارد. </li>
                        <li>کاربرانی که توانایی ساخت اکانت کاربری را نخواهند داشت، اکانت توسط تیم فنی درگاه
                                            ساخته خواهد شد و هیچ تفاوتی بین اکانت ها وجود نخواهد داشت. </li>
                        <li>تمامی افتخاراتی که در قالب Award یا Selection ارائه می شود باید همراه با اسناد و
                                            مدارک باشند در غیر این صورت توسط درگاه تایید و به نمایش گذاشته نخواهد شد. </li>
                        <li>نشر اخبار قبولی در فستیوال ها و تبعات آن قبل از Event Date فستیوال برعهده کاربر
                                            بوده و درگاه فیلم ایران هیچ مسئولیتی در خصوص Out شدن فیلم از لیست نهایی ندارد.</li>
                        <li>در صورت پرداخت دیر هنگام فاکتور صورتحساب ارسال فیلم و عدم رسیدن فیلم در زمان مقرر
                                            شده به فستیوال، به هیچ عنوان هزینه پرداخت شده مسترد نخواهد شد و مسئولیت بر عهده
                                            ی فیلمساز است.</li>
                        <li>در صورت اعلام کنارکشیدن فیلمساز از فستیوال (Withdraw) و یا هر گونه پشیمانی از شرکت
                                            در فستیوالی مشخص و یا پس از پرداخت هزینه به منظور استفاده از پکیج های پخش کنندگی
                                            فیلم، به هیچ عنوان هزینه واریز شده مسترد نخواهد شد.</li>
                        <li>از آنجایی که درگاه فیلم ایران امکان معرفی فیلمسازان و آثارشان را فراهم کرده است
                                            این دغدغه وجود خواهد داشت که صحت ادعای آنها در خصوص وجود آن آثار و هویت شخصیشان
                                            چقدر خواهد بود. از این جهت درگاه فیلم ایران بیان می کند که تمامی آثار و همچنین روزمه
                                            و افتخارات فیلمساز با اعطای نشان اعتماد درگاه بروی آن اثر و روزمه افراد حاکی از
                                            اصالت و حقیقی بودن آن است. فیلمسازان و آثاری که دارای لوگو یا نشان نماد اعتماد درگاه
                                            نمی باشند، مسئولیت صحت ادعایشان بر عهده ی خودشان است و درگاه فیلم ایران هیچگونه
                                            مسئولیتی در خصوص آن نخواهد داشت. همچنین از بازدید کنندگان محترم این پروفایل ها درخواست
                                            داریم که این نماد را ملاک تصمیم گیری خود در خصوص فیلمساز و آثار وی قرار دهند.
                        </li>
                        <li>هزینه تبدیل ارز چه دلار و چه واحدهای پولی دیگر در حین ارجاع به بانک و تعرفه ی روز
                                            محاسبه میگردد بنابراین ممکن است تفاوت ناچیزی با مقدار ثبت شده ی اولیه وجود داشته
                                            باشد، در این صورت کاربر موظف است ما به تفاوت بیشتر را پرداخت و اگر هزینه کل هنگام
                                            ارجاع به بانک کمتر از هزینه پرداخت شده کاربر باشد ما به تفاوت در کیف پولی کاربر
                                            ذخیره می شود. </li>
                        <li>مقدار ارزش تومانی که در کیف پول کاربر وجود دارد غیر قابل برداشت و انتقال است و تنها
                                            کاربر در ارسال پروژه های خود میتواند از آن مقدار استفاده کند.</li>
                        <li>سطح 
                            فستیوال هایی که در درگاه فیلم ایران دسته بندی می شود در سه چهار 
                            A+ ،A، B و C
                            خواهد بود. 
                            سطح A+ عبارتنداز فستیوال هایی که آکادمی اسکار سالیانه آنها را اعلام
                                            میکند که این فستیوال ها بالاترین رده ی فستیوال های قرار گرفته در درگاه فیلم ایران
                                            می باشد. سطح A فستیوال هایی که جزو فستیوال های معتبر کشورها بوده و بلکه در شرف محلق
                                            شدن به لیست اسکار می باشند و در نهایت سطح B فستیوال هایی که جزو دسته اول و دوم نباشد
                                            ولی سابقه ی فستیوال بالای 20 سال می باشد.</li>
                    </ol>
                </div>
                <div class="accordion">
                    قوانین محتوایی فیلم
                </div>
                <div class="panel">
                    <ol>
                        <li>اثر باید تابع قوانین جمهوری اسلامی ایران باشد.</li>
                        <li>اثر نباید حاکی از سیاه نمایی اجتماعی، فرهنگی و سیاسی باشد.</li>
                        <li>اثر نباید تضعیف کننده ی ارزش های دینی و مذهبی باشد.</li>
                        <li>اثر نباید در حوزه ی LG ساخته شده باشد.</li>
                        <li>اثر نباید کپی برداری شده مستقیم از اثر دیگر بدون نام بردن از رفرنس آن اثر باشد.
                                            (دزدی هنری نباید باشد)</li>
                    </ol>
                </div>
                <div class="accordion">
                    حداقل کیفیت پذیرش فیلم در درگاه فیلم ایران
                </div>
                <div class="panel">
                    <ol>
                        <li>حداقل 1920*1080 :Resolution </li>
                        <li>حداقل بیت ریت: 10 هزار</li>
                        <li>FPS بهتر است 24 یا 25 باشد</li>
                        <li>کیفیت عکس ها و نیز پوستر 300dpi باشد</li>
                        <li>بهتر است تریلر فیلم در Vimeo و یا در Youtube آپلود شود</li>
                    </ol>
                </div>
                <script>
                    var acc = document.getElementsByClassName("accordion");
                    var i;

                    for (i = 0; i < acc.length; i++) {
                        acc[i].addEventListener("click", function () {
                            /* Toggle between adding and removing the "active" class,
                            to highlight the button that controls the panel */
                            this.classList.toggle("active");

                            /* Toggle between hiding and showing the active panel */
                            var panel = this.nextElementSibling;
                            if (panel.style.display === "block") {
                                panel.style.display = "none";
                            } else {
                                panel.style.display = "block";
                            }
                        });
                    }
                </script>
                <p>
                    <a href="files/uploadFiles/rules.pdf" target="_blank">
                        <img width="250" src="files/images/icons/pdf.png" />
                    </a>
                </p>
                <p>
                    در صورت داشتن سوالات بیشتر بدون هیچگونه شکی سوالتان را با ما در میان بگذارید. به
                                    منظور ارتباط مستقیم با کارشناسان فنی درگاه به بخش <a href="تماس-با-درگاه-فیلم-ایران">تماس با ما</a> مراجعه کنید.
                </p>
            </div>
        </div>
        <uc1:KingComments runat="server" ID="KingComments" />
    </div>
</asp:Content>
