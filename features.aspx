﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="features.aspx.vb" Inherits="featers" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        h1, h2, h3, h4, h5, h6
        {
            font-family: Samim;
            color: Black;
        }
        p
        {
            text-justify: inter-word;
            font-family: Samim;
            color: Black;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_12.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <span style="font-family: Titr;">ویژگی و تفاوت‌های درگاه فیلم ایران</span>
                </h1>
                <%--            <ul class="title-menu clearfix">
                <li>
                    <a href="../">home &nbsp;/</a>
                </li>
                <li>Features</li>
            </ul>--%>
            </div>
        </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div class="left-side">
                        <div class="item-holder" style="direction: rtl; padding: 7px;">
                            <p style="font-family: Titr; font-size: 27px; text-align: center;">
                                چرا باید درگاه فیلم ایران را جهت پخش و ارسال فیلم و فیلمنامه‌تان انتخاب کنید؟</p>
                            <p style="color: red;">
                                این بهترین و تنها سوالی است که موقع تصمیم گیری در خصوص یک پخش کننده باید از خود
                                بپرسید. اگر در جواب این سوال نتوانید ویژگی های شاخص آن پخش کننده را بشمارید، حتما
                                شک کنید!</p>
                            <p>
                                ملاک از نگارش شاخص‌های زیر تنها بیان ویژگی های درگاه فیلم ایران نیست، بلکه راه و
                                رسمی است که به شما کمک خواهد کرد، یک پخش کننده حقیقی را از غیر حقیقی تشخیص دهید.</p>
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/manager.png" width="150" alt="مدیریت درگاه فیلم ایران - علیمحمد اقبالدار">
                                    </figure>
                                </div>
                                <h6>
                                    Head of Distribution Company | مدیریت پخش یک شرکت پخش</h6>
                                <p>
                                    اینکه شما بدانید که فیلم و یا فیلمنامه شما توسط تفکر، اندیشه و استراتژی چه کسی طرح
                                    ریزی می شود، مهمترین سوال در انتخاب گروه و یا شرکت پخش کننده است. بطور قطع مدیر
                                    یک مجموعه تاثیر مستقیمی در هدایت و موفقیت محصول خواهد گذاشت. همچنین میتوان گفت که
                                    فیلمساز بودن پخش کننده اصلی و یا مدیر تیم جزو موارد بسیار مهم در انتخاب فستیوال
                                    ها و هدایت صحیح فیلم و فیلمنامه در Event های بین المللی است.
                                    <br />
                                    «علیمحمد اقبالدار» بعنوان فیلمساز و سرپرست درگاه فیلم ایران و نیز مدیر عامل شرکت
                                    تصویرسازان عصر گرانش با نزدیک به یک دهه فعالیت سینمایی و همچنین داوری های متعدد
                                    در جشنواره های بین المللی نقش بسزایی در موفقیت فیلم های مجموعه داشته است.
                                    <br />
                                    <a href="../team">(جهت مشاهده رزومه کامل «علیمحمد اقبالدار» به این لینک مراجعه کنید)
                                    </a>
                                </p>
                            </div>
                            <br />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/legal.jpg" width="200" alt="هزینه و تعرفه ها">
                                    </figure>
                                </div>
                                <h6>
                                    Legal | حقوقی بودن پخش کننده</h6>
                                <p>
                                    حقوقی بودن پخش کننده، شاخص و ملاکی ارزشمند در راستای اصالت بخشی به اوست. بسیاری
                                    از افراد ناشناس، حقیقی و یا شرکت هایی اسمی (که با نام کمپانی های جعلی و فاقد رسمیت)
                                    که در عرصه پخش فعالیت دارند بدون ثبت رسمی اقدام به پخش آثار میکنند که برای فیلمساز
                                    و فیلمنامه نویس با ریسک و نگرانی بسیار، همراه خواهد بود.
                                    <br />
                                    آژانس بین المللی «درگاه فیلم ایران» که زیر مجموعه «شرکت فیلمسازی تصویرسازان عصر
                                    گرانش» با کد ملی و ثبتی 20102 به ثبت رسیده است، این نگرانی را برای همراهان همیشگی
                                    خود رفع کرده است.
                                    <br />
                                    <a href="../درباره-درگاه-فیلم-ایران">(جهت مشاهده موارد حقوقی و اطلاعات ثبتی «درگاه فیلم
                                        ایران» به این لینک مراجعه کنید) </a>
                                </p>
                            </div>
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/relations.png" width="150" alt="هزینه و تعرفه ها">
                                    </figure>
                                </div>
                                <h6>
                                    International Relations | روابط بین المللی پخش کننده</h6>
                                <p>
                                    پخش ارتباط مستقیم و تنگاتنگی با جوامع بین المللی دارد. از اینرو پخش کننده باید توانانی
                                    و تجربه لازم با دیگر سازمان ها، پخش کننده و فیلمسازان و مدیران جشنواره ها داشته
                                    باشد. در غیر این صورت؛ پخش اثر با اپراتوری هیچ تفاوتی نخواهد کرد.
                                    <br />
                                    «درگاه فیلم ایران» از لحظه ی رسمیت یافتن خود با شرکت معتبر و مطرح اسپانیایی Movibeta
                                    در تفاهم و رابطه ی دو سویه بوده است. التبه روابط بین المللی شرکت محدود به آن نشده
                                    و در ترکیه و استرالیا نیز روابط نزدیکی پدید آمده است. شایان ذکر است که با عضویت
                                    درگاه فیلم ایران در Cinando فرانسه قدم مهمی در روابط بین المللی پخش توسط این شرکت
                                    برداشته شده است.
                                    <br />
                                    <a href="../movibeta">اطلاعات بیشتر در خصوص شریک اسپانیایی </a>
                                    <img src="files/images/logos/MovibetaLogo.png" width="150" />
                                    <br />
                                    <a href="https://cinando.com/en/Company/iran_film_port_245260/Detail">صفحه اختصاصی شرکت
                                        در سناندوی فرانسه</a>
                                    <img src="files/images/logos/cinando.png" width="150" />
                                </p>
                            </div>
                            <hr />
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/price.png" alt="هزینه و تعرفه ها">
                                    </figure>
                                </div>
                                <h6>
                                    Prices | هزینه و تعرفه‌ها</h6>
                                <p>
                                    بدون شک هزینه در انتخاب یک پخش کنندگی تعیین کننده است. اما آیا همه چیز است؟ بعنوان
                                    یک مثال ساده، اگر عرف قیمت یک کالا 1 میلیون تومان باشد، شما حاضر هستید آن کالا را
                                    هزار تومن خریداری کنید؟ یا همان کالا را 100 میلیون بخرید؟ قطعا جواب منفی است، قیمت
                                    باید در عرف بگنجد، هر ارزانی و رایگان بودنی خطا و کلاهبرداری و از آن طرف هر گرانی
                                    و پول مازادی نیز کلاهبرداری و بیسوادی پخش کننده را میرساند. به منظور کسب اطلاع از
                                    تعرفه حقیقی پخش یک اثر باید بطور جامع تحقیق و از پرداخت هزینه هایی که بسیار پایین
                                    و فریب دهنده هستند دوری کنید.
                                </p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/focus.png" alt="تخصص و تمرکز بروی پخش فیلم و فیلمنامه">
                                    </figure>
                                </div>
                                <h6>
                                    Expertise & Focus on broadcasting | تخصص و تمرکز بروی پخش فیلم و فیلمنامه</h6>
                                <p>
                                    یکی از مهمترین شاخص های یک پخش کننده، تخصص و تمرکز بر روی پخش می باشد. بسیاری از
                                    افراد حقیقی و گروه های حقوقی که صرفا بمنظور وجود گردش مالی زیاد در حوزه پخش فعال
                                    هستند، همزمان به کارهای دیگری چون ساخت کلیپ های تبلیغاتی، طراحی و فعالیت های گرافیکی،
                                    تولید انیمشین و کارهای بسیار زیاد دیگر مشغول هستند. این نشان از نگاه بازاری و تجاری
                                    آنها داشته و عاملی است که میتواند فیلمساز و فیلمنامه نویس را به این نتیجه برساند
                                    که آن فرد یا گروه بروی مقوله پخش متمرکز نبوده و قطعا به روند پخش فیلم و فیلمنامه
                                    اش لطمه وارد خواهد کرد. فیلمساز یا فیلمنامه نویس باید با تحقیقی جامع از طریق سایت
                                    پخش کننده (در صورت وجود!!) و یا اینستاگرام و جستجو گسترده در اینترنت با نام وی،
                                    از وجود فعالیت های دیگر آن پخش کننده، اطمینان حاصل کند.
                                </p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/medal.png" alt="ویترین و کارنامه درگاه فیلم ایران">
                                    </figure>
                                </div>
                                <h6>
                                    Showcase | ویترین</h6>
                                <p>
                                    بطور قطع از اصلی تری شاخص های یک پخش کننده، روشن و واضح بودن فعالیت، مشتریان و لیست
                                    افتخارات پخش کنندگی وی می باشد. بسیاری از پخش کنندگان کلاهبردار در این زمینه با
                                    نوشتن متن هایی در بیوی اینستاگرام خود مدعی هستند که تاکنون در بیش از ده ها فستیوال
                                    حضور داشته اند. اما این ادعا چگونه قابل اثبات برای فیلمساز و فیلمنامه نویس است؟
                                    آنها صرفا ادعای حضور و جوایز را صرفا با نوشتن یک عدد چشم گیر در بیوی اینستاگرام
                                    و سایت خود دارند. اما باید گفت که در کمال شگفتی بسیاری از فیلمسازان و فیلمنامه نویسان
                                    متاسفانه فریب این اعداد را خورده و ترغیب به همکاری می شوند. فیلمساز باید از پخش
                                    کننده مدرک و اسناد اثبات ادعای خود را طلب کند، در غیر این صورت هر کسی میتواند صرفا
                                    با نگارش عددی مدعی سابقه و موفقیت شود!
                                    <br />
                                    درگاه فیلم ایران با دارا بودن وب سایتی رسمی و پویا و همچنین پیچ و اینستاگرامی که
                                    مرتب بروز میشود، تمامی اسناد ادعایی خود را، همچون ویترینی در معرض نمایش قرار داده
                                    است. شما میتواند در وب سایت رسمی شرکت از دو لینک زیر به لیست کامل مشتریان و افتخارات
                                    درگاه دسترسی داشته باشید. همچنین در اینستاگرام، در دو هایلایت مشتریان 1 و 2، و همچنین
                                    هایلایت افتخارات موارد را مشاهده کنید.
                                    <br />
                                    <p>
                                        <a href="مشتریان-درگاه-فیلم-ایران" style="color: Blue; font-size: 14px;" target="_blank">
                                            لیست مشتریان درگاه فیلم ایران</a></p>
                                    <p>
                                        <a href="کارنامه-پخش-فیلم-درگاه-فیلم-ایران" style="color: Blue; font-size: 14px;"
                                            target="_blank">لیست افتخارات و کارنامه موفقیت های (حضورها و جوایز) مشتریان درگاه
                                            فیلم ایران</a></p>
                                </p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/portal.png" width="150" alt="روابط بین المللی">
                                    </figure>
                                </div>
                                <h6>
                                    Dedicated Portal | پرتال اختصاصی فیلمسازان و فیلمنامه نویسان</h6>
                                <p>
                                    یکی از چالش های همیشگی عزیزان فیلمساز، پیگیری روند پخش آثارشان بوده است. درگاه فیلم
                                    ایران با راه اندازی پر هزینه یک سامانه اختصاصی برای هر فیلمساز این مشکل را برای
                                    اولین بار در ایران و برای همیشه حل کرده است. از اینرو، پس از عقد قرارداد هر فیلمساز
                                    و یا فیلمنامه نویس با داشتن یک نام کاربری و کلمه عبور در هر زمان از شبانه بصورت
                                    آنلاین میتواند روند پخش اثر خود را پیگیری و گزارش لحظه ای از آن تهیه کنند.
                                </p>
                                <p>
                                    <a href="files/images/icons/Samaneh.png" style="color: Blue; font-size: 14px;" target="_blank">
                                        تصویری از سامانه اختصاصی</a></p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/instantAccess.png" alt="دسترسی فوری">
                                    </figure>
                                </div>
                                <h6>
                                    Instant Access | دردسترس بودن فوری</h6>
                                <p>
                                    شاید کمی عجیب به نظر برسد ولی از مهمترین و تاثیرگذار ترین عامل هایی که میتواند باعث
                                    آسایش و راحتی خیال فیلمساز و فیلمنامه نویس باشد، دسترسی فوری و یا دردسترس بودن همیشگی
                                    کارشناسان پخش می باشد. درگاه فیلم ایران معتقد است که فیلم برای فیلمساز و یا فیلمنامه
                                    برای فیلمنامه نویس همچون فزند آنهاست و اگر صاحب اثر هر لحظه از اثر خود مطلع نباشد،
                                    احساس ناخوشایندی به آنها دست خواهد دارد. این عامل شاید در ابتدای شروع فعالیت به
                                    چشم نیاید ولی به مرور با جواب ندادن تلفن ها و یا پاسخ های سر بالا و دیرهنگام احساس
                                    بسیار بدی را به شما منتقل خواهد کرد. تیم درگاه فیلم ایران، با پشتیبانی 24 ساعته
                                    و توسط 3 کارشناس حاذق و مجرب، همیشه سعی کرده است که با فیلمساز و فیلمنامه نویس همراه
                                    و ابتدا دوست و رفیق باشد تا در تعاملی سازنده، آنها احساس خوبی نسبت به پخش و همکاری
                                    داشته باشند. این ادعا توسط دوستان و عزیزانی که فیلم ها و فیلمنامه هایشان توسط «درگاه
                                    فیلم ایران» پیگیری می شود قابل اثبات است.
                                </p>
                                <p>
                                    <a href="مشاوره-پخش-بین-المللی-فیلم" style="color: Blue; font-size: 14px;" target="_blank">
                                        جهت آشنایی با فرآیند مشاوره درگاه فیلم ایران کلیک کنید</a></p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/consulting.png" alt="مشاوره جهت پخش فیلم فستیوال های خارجی">
                                    </figure>
                                </div>
                                <h6>
                                    Free Consultion | مشاوره رایگان</h6>
                                <p>
                                    اساس ساختار درگاه فیلم ایران نخست بر مشاوره استوار است چرا که توانایی پخش فیلم در
                                    حد آشنایی ابتدای با پلتفرم های رایج و یا آشنایی مقدماتی به زبان انگلیسی آخرین مرحله
                                    از یک پخش فیلم محسوب می شود ولی آن چیزی که حائز اهمیت است شناساسی درست فستیوال است
                                    نه طریق ارسال به آن!
                                </p>
                                <p>
                                    <a href="مشاوره-پخش-بین-المللی-فیلم" style="color: Blue; font-size: 14px;" target="_blank">
                                        جهت آشنایی با فرآیند مشاوره درگاه فیلم ایران کلیک کنید</a></p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/resource/1.png" alt="قرارداد کاری پخش فیلم کوتاه">
                                    </figure>
                                </div>
                                <h6>
                                    Contract | قرارداد کاری</h6>
                                <p>
                                    یکی از بزرگترین ضعف های پخش کننده نماهای فعال! عدم سازوکار حقوقی و قانونی است. در
                                    این چند سال تجربه کاری درگاه فیلم ایران به کرات دیده شده است که افراد بسیار نامید
                                    و خشمگین از پخش کننده سابق خود، تماس حاصل کرده و بیان می کنند که وی اخبار را به
                                    درستی منتقل نکرده ویا پس از دریافت لوح تقدیر و جوایز آنها را تحویل نداده است. اخذ
                                    قرارداد کاری فی مابین پخش کننده و نماینده رسمی فیلم از اساسی ترین اصول ساختاری درگاه
                                    فیلم ایران است. این قرارداد کاری در مرحله اول بصورت دیجیتال در اختیار نمایندگان
                                    فیلم قرار خواهد گرفت و در مرحله دوم در صورت تمایل افراد بصورت پستی ارسال خواهد شد.</p>
                                <p>
                                    «درگاه فیلم ایران» بصورت آژانسی وابسته ذیل شرکت تصویرسازان عصر گرانش فعالیت کرده
                                    و اعتبار حقوقی خود را از آن شرکت می‌گیرد.</p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/resource/2.png" alt="رسانه سازی پخش فیلم">
                                    </figure>
                                </div>
                                <h6>
                                    Media-Making | رسانه سازی</h6>
                                <p style="color: red;">
                                    درگاه فیلم ایران برای اولین بار در ایران به پشتوانه ی متخصصین بخش رسانه ای خود،
                                    تمامی اقدامات لازم جهت معرفی فیلم ، فیلمساز و عوامل به دنیای عظیم و تاثیرگذار رسانه
                                    (MEDIA) را انجام خواهد. امکانی که در یک پخش موفق بسیار تاثیرگذار است.
                                </p>
                                <p>
                                    <a target="_blank" href="رسانه-سازی-پخش-فیلم" style="color: Blue; font-size: 14px;"
                                        target="_blank">جهت کسب اطلاعات بیشتر به بخش «رسانه سازی - Media-Making» کلیک کنید</a></p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/resource/3.png" alt="ظبقه بندی و دسته بندی جشنواره فیلم کوتاه و بلند">
                                    </figure>
                                </div>
                                <h6>
                                    Categorization | طبقه بندی</h6>
                                <p>
                                    یکی دیگر از بزرگترین ضعف های پخش کننده نماها! و حتی پلتفرم ها، عدم توانایی در تفکیک
                                    جشنواره ها بصورت مشخص است. به عنوان مثال وقتی از آنها در خواست می کنید که فستیوال
                                    های سطح متوسط را هنگام پخش فیلم‌تان هدف قرار دهند قطعا به سراغ فستیوال هایی می روند
                                    که اسم آن فستیوال ها ناشناخته باشد. چرا که از نظر خیلی ها فستیوال ها به دو دسته
                                    ی کلی تقسیم می شوند، دسته اول فستیوال هایی هستند که همه میشناسند مانند کن، کلرمون،
                                    ونیز ،برلین و ... و دسته ی دوم فستیوال هایی که اسمشان را نشنیده ایم مانند شیکاگو
                                    ، ای اف آی و ... در صورتی که به هیچ عنوان این تقسیم بندی صحیح نمی باشد. بسیارند
                                    فستیوال هایی که اسم هایشان بسیار عجیب و ناشناخته اند ولی حتی جزو فستیوال های اسکاری
                                    هستند. درگاه فیلم ایران با بررسی بسیار دقیق چندین ساله و آرشیو و دسته بندی فستیوال‌ها
                                    در سامانه‌ی داخلی خود، سعی کرده است تمامی فستیوال های موجود را به چهار دسته کلی
                                    تقسیم کنند. همچنین گفتنی است از آنجایی که در سال حدودا 10 الی 15 هزار فستیوال فراخوان
                                    می شود پوشش و تفکیک تمامی آنها نیز غیر منطقی است.</p>
                                <p>
                                    درگاه فیلم ایران (IFP) فستیوال ها را در چهار دسته ی A+ A B C دسته بندی خواهد کرد.</p>
                            </div>
                            <%--                                <div class="item" style="text-align:center;">
								<div class="icon-box">
									<figure>
										<a target="_blank href="features.aspx">
											<img src="files/images/resource/5.png" alt="صفحات اختصاصی فیلمسازان در درگاه فیلم ایران">
										</a>
									</figure>
								</div>
								<h6>Own Page | صفحه شخصی</h6>
								<p style="text-justify:inter-word;     text-align: justify;">درگاه فیلم ایران برای اولین بار در ایران این امکان را فراهم کرده است که فیلمسازان و تهیه کنندگان با ایجاد حساب کاربری بتوانند دارای صفحات اختصاصی خود با آدرسی منحصربفرد باشند. با این امکان شما می توانید فیلم های خود را لیست کرده و با تکمیل رزومه از این صفحات بعنوان صفحه ی معرفی خود و فیلمتان استفاده کنید.</p>
                                <p style="color:Blue;font-size:12px;">www.iranfilmport.com/[Username]</p>
							</div>--%>
                            <%--                            <hr />
                            <div class="item" style="text-align:center;">
								<div class="icon-box">
									<figure>
										<a target="_blank href="features.aspx">
											<img src="files/images/resource/4.png" alt="هویت و اعتیار سنجی فیلسازان">
										</a>
									</figure>
								</div>
								<h6>Identity | هویت سنجی</h6>
								<p style="text-justify:inter-word;     text-align: justify;">از آنجایی که درگاه فیلم ایران امکان معرفی فیلمسازان و آثارشان را فراهم کرده است این دغدغه وجود خواهد داشت که صحت ادعای آنها در خصوص وجود آن آثار و هویت شخصیشان چقدر خواهد بود. از این جهت درگاه فیلم ایران بیان می کند که تمامی آثار و همچنین روزمه و افتخارات فیلمساز با اعطای نشان اعتماد درگاه بروی آن اثر و روزمه افراد حاکی از اصالت و حقیقی بودن آن است. فیلمسازان و آثاری که دارای لوگو یا نشان <a target='_blank' href='/نماد-اعتماد-درگاه-فیلم-ایران'>نماد اعتماد درگاه فیلم ایران</a> نمی باشند، مسئولیت صحت ادعایشان بر عهده ی خودشان است و درگاه فیلم ایران هیچگونه مسئولیتی در خصوص آن نخواهد داشت. هچنین از بازدید کنندگان محترم این پروفایل ها درخواست داریم که این نماد را ملاک تصمیم گیری خود در خصوص فیلمساز و آثار وی قرار دهند.</p>
                                <p><img alt="اعتماد سازی" src="files/images/logos/confidence_logo.png" width="100"/></p>
                                <p style="color:Blue;font-size:12px;">نمونه نماد اعتماد درگاه فیلم ایران</p>
							</div>--%>
                            <%--<hr />--%>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/resource/7.jpg" alt="مشاوره جهت پخش فیلم فستیوال های خارجی">
                                    </figure>
                                </div>
                                <h6>
                                    Interaction | ارتباط دو طرفه</h6>
                                <p>
                                    کارشناسان ارتباط با مشتری (CRM) و روابط عمومی درگاه فیلم ایران به طور دائمی و بیست
                                    و چهار ساعته ارتباط متقابل با مشریان دارند. این به آن معناست که مشتریان لحظه به
                                    لحظه در خصوص وضعیت فیلم و فیلمنامه‌ی خود آگاهی کامل دارند و می توانند در جریان ریز
                                    پخش کنندگی اثرشان قرار بگیرند. گفتنی است که سایر پخش کننده‌نماها پس از دریافت پول
                                    کوچکترین ارتباطی با مشتریان خود نداشته و حتی بیشتر آنها هیچ شماره تلفن مستقیمی را
                                    در اختیار مشتریان قرار نمی‌دهند. این در حالیست که درگاه فیلم ایران بصورت 24 ساعته
                                    خدمات خود را اطلاعات رسانی می‌کند.</p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/resource/8.png" alt="مشاوره جهت پخش فیلم فستیوال های خارجی">
                                    </figure>
                                </div>
                                <h6>
                                    Strategic Plan | پلن استراتژیک</h6>
                                <p>
                                    درگاه فیلم ایران پس از عقد قرارداد رسمی برای هر فیلم و یا فیلمنامه استراتژی پخش
                                    مستقل آن اثر تعیین خواهد کرد. به عبارتی درگاه فیلم ایران مانند پخش کننده نماها فیلم
                                    و یا فیلمنامه را بدون برنامه ریزی به فستیوال ارسال نخواهد کرد. این برنامه بصورت
                                    جداگانه و خارج از قرارداد نیز قابل تهیه می باشد.</p>
                                <p>
                                    «درگاه فیلم ایران» با دارا بودن تیمی مجرب و حرفه ای در حوزه <a target="_blank" href="http://iranfilmport.com/%D9%BE%D8%AE%D8%B4-%D9%88-%D8%A7%D8%B1%D8%B3%D8%A7%D9%84-%D9%81%DB%8C%D9%84%D9%85">
                                        پخش و ارسال فیلم به فستیوال های بین المللیِ فیلم و فیلمنامه</a> در تمامی ژانرهای
                                    رایج (کوتاه داستانی، بلند داستانی، مستند کوتاه، مستند بلند، انیمیشن کوتاه، انیمیشن
                                    بلند، تجربی کوتاه و تجربی بلند)، برای اولین بار در ایران <a target="_blank" href="http://iranfilmport.com/%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D9%87-%D8%A7%D8%B3%D8%AA%D8%B1%D8%A7%D8%AA%DA%98%DB%8C%DA%A9-%D9%BE%D8%AE%D8%B4-%D9%81%DB%8C%D9%84%D9%85-%D8%A8%D9%87-%D8%AC%D8%B4%D9%86%D9%88%D8%A7%D8%B1%D9%87-%D9%87%D8%A7%DB%8C-%D8%AE%D8%A7%D8%B1%D8%AC%DB%8C">
                                        «پِلن استراتژیک پخش»</a> را در اختیار فیلمساز و یا تهیه کننده قرار خواهد دارد.</p>
                                <p>
                                    «پِلن استراتژیک پخش» و یا برنامه ی مدون شده ی چگونگی ارسال فیلم به جشنواره های خارجی،
                                    نقشه ی راه موفقیت یک فیلم است. شما بدون نقشه نمیتوانید سفر کنید، پس چگونه بدون «پلن
                                    پخش» انتظار موفقیت فیلمتان را در جشنواره ها دارید؟ 99% شبه پخش کنندگان فیلم در ایران،
                                    بدون هیچگونه برنامه و یا پلنی مشخص، فیلم و یا فیلمنامه را به فستیوال ها ارسال میکنند.
                                    آنها فستیوال های باز شده را رصد کرده و سپس گله‌ای فیلم های زیر دستشان را حواله ی
                                    فستیوال ها میکنند. تعدادی هم با معدود فستیوال هایی، ارتباط مستقیم کاری داشته و تنها
                                    هنرشان رایزنی با همان فستیوال های خاص است. در صورتی که نمیدانند، تعداد فستیوال های
                                    A+ (اسکاری) و A (قدمت بالای 20 سال) در جهان حدود 700 فستیوال است!</p>
                                <p>
                                    <a target="_blank" href="http://iranfilmport.com/%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D9%87-%D8%A7%D8%B3%D8%AA%D8%B1%D8%A7%D8%AA%DA%98%DB%8C%DA%A9-%D9%BE%D8%AE%D8%B4-%D9%81%DB%8C%D9%84%D9%85-%D8%A8%D9%87-%D8%AC%D8%B4%D9%86%D9%88%D8%A7%D8%B1%D9%87-%D9%87%D8%A7%DB%8C-%D8%AE%D8%A7%D8%B1%D8%AC%DB%8C">
                                        جهت مشاهده توضیحات بیشتر در خصوص پلن و یا برنامه استراتژیک کلیک کنید.</a></p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/resource/9.png" alt="مشاوره جهت پخش فیلم فستیوال های خارجی">
                                    </figure>
                                </div>
                                <h6>
                                    Receipt | رسید تحویل هر ارسال</h6>
                                <p>
                                    یکی از اصلی ترین اقدامات درگاه فیلم ایران، اعتماد سازی لحظه به لحظه و آسوده سازی
                                    خیال مشتریان از بابت ارسال ها و اطلاع از فرآیند پخش و ارسال آثارشان است. از این
                                    رو براساس اطلاعات دریافتی از فستیوال‌ها رسید تحویل فیلم و فیلمنامه به جشنواره مذکور
                                    از طرق مختلف همچون ایمیل و یا اسکرین شات به مشتریان تحویل داده خواهد شد.</p>
                                <p>
                                    <a href="http://iranfilmport.com/files/images/resource/receipt.jpg" target="_blank">
                                        (جهت دانلود نمونه‌ای از رسید کلیک کنید)</a></p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <a target="_blank" href="features.aspx">
                                            <img src="files/images/resource/10.png" alt="مشاوره جهت پخش فیلم فستیوال های خارجی">
                                        </a>
                                    </figure>
                                </div>
                                <h6>
                                    Performance Report | گزارش عملکرد</h6>
                                <p>
                                    درگاه فیلم ایران به جهت احترام به مشتری و روشن سازی فرآیند پخش و ارسال آثار در مدت
                                    قرارداد، پس از اتمام مهلت قرارداد گزارشی مختصر در اختیار مشتریان قرار خواهد داد.
                                    براساس این گزارش چگونگی ارسال، تعداد ارسال ها به تفکیک فستیوال ها و همچنین پیشنهاد
                                    کارشناسی کارشناسان در خصوص ادامه پخش آثارشان لحاظ خواهد شد.</p>
                                <p>
                                    <a href="http://iranfilmport.com/files/images/resource/PerformaceReport.png" target="_blank">
                                        (جهت دانلود نمونه‌ای از گزارش عملکرد کلیک کنید)</a></p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/icons/certification.png" alt="گواهینامه">
                                    </figure>
                                </div>
                                <h6>
                                    Certification | گواهینامه</h6>
                                <p>
                                    «درگاه فیلم ایران» باز هم برای اولین بار در ایران، پس از هر حضور و یا جایزه ای،
                                    یک گواهینامه رسمی بهمراه مهر و امضای شرکت به فیلمساز و فیلمنامه نویس ارائه میکند.
                                    این گواهینامه سندی است که شما در آینده میتوانید به سازمان ها و یا تهیه کنندگان جهت
                                    ادعای حضور رسمی و یا جایزه خود ارائه دهید.
                                </p>
                                <p>
                                    <a href="http://iranfilmport.com/files/images/icons/SampleCertification.jpg" target="_blank">
                                        (جهت دانلود نمونه‌ای از این گواهینامه کلیک کنید)</a></p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <a target="_blank" href="features.aspx">
                                            <img src="files/images/resource/11.png" alt="مشاوره جهت پخش فیلم فستیوال های خارجی">
                                        </a>
                                    </figure>
                                </div>
                                <h6>
                                    Double-Supervisor | ناظران پخش</h6>
                                <p>
                                    با توجه به تجربه فعالیت گروهی چندین ساله «درگاه فیلم ایران»، ارسال و پخش فیلم و
                                    فیلمنامه ها به فستیوال‌ها توسط کارشناسان و سپس تائید ناظران ارشد درگاه فیلم ایران
                                    بصورت سیستماتیک انجام می پذیرد. این به بدان معناست که پس از هر ارسال فیلم و یا فیلمنامه
                                    به جشنواره، ناظر مربوطه‌ی فیلم و یا فیلمنامه باید ارسال را تائید نهایی کند در غیر
                                    این صورت ارسال برگشتی محسوب شده و از تعداد قرارداد کاسته نخواهد شد.
                                </p>
                                <p>
                                    <a href="http://iranfilmport.com/files/images/resource/System.png" target="_blank">(تصویری
                                        از محیط کاربری و سامانه اختصاصی درگاه فیلم ایران)</a></p>
                            </div>
                            <hr />
                            <div class="item" style="text-align: center;">
                                <div class="icon-box">
                                    <figure>
                                        <img src="files/images/resource/12.png" alt="مشاوره جهت پخش فیلم فستیوال های خارجی">
                                    </figure>
                                </div>
                                <h6>
                                    Website | وب‌ سایت</h6>
                                <p>
                                    داشتن وب سایت رسمی برای یک شرکت شرط لازم فعالیت است ولی شرط کافی نمی باشد. وب سایت
                                    تنها یکی از پارامترهای تعیین کننده اعتباربخشی به یک پخش کننده است.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
 <uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>
</asp:Content>
