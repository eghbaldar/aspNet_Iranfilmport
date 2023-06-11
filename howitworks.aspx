<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="howitworks.aspx.vb" Inherits="Default2" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/comment.ascx" TagName="comment" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .accordion ul, .accordion li
        {
            list-style-type: circle;
            font-family: Samim;
            text-align: justify;
        }
        .accordion
        {
            background-color: #f2de00;
            color: #444;
            cursor: pointer;
            padding: 10px;
            width: 100%;
            border: none;
            outline: none;
            transition: 0.4s;
            text-align: right;
            font-family: Samim;
            font-size: 15px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
        .active, .accordion:hover
        {
            background-color: #E3EBF2;
        }
        
        /* Style the accordion panel. Note: hidden by default */
        .panel
        {
            padding: 0 18px;
            background-color: white;
            display: none;
            overflow: hidden;
            color: Black;
            font-family: Samim;
            text-align: justify;
        }
        .accordion:after
        {
            content: '\02795'; /* Unicode character for "plus" sign (+) */
            font-size: 13px;
            color: #777;
            float: right;
            margin-left: 5px;
        }
        
        .active:after
        {
            content: "\2796"; /* Unicode character for "minus" sign (-) */
        }
        @media (max-width: 767px)
        {
            .item-holder
            {
                width: 100%;
                padding: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_4.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <span style="font-family: Titr;">پخش و ارسال فیلم و فیلمنامه</span></h1>
            </div>
        </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div style="direction: rtl; color: Black; text-align: justify; padding-left: 20px;
                        font-family: Samim;">
                        <ul>
                            <li>پخش کنندگی چون سایر حرفه‌های رایج در سینما یک تخصص و نیازمند توانایی‌هایی جهت انجام
                                آن است. از این جهت درگاه فیلم ایران، تمام قد با <a target="_blank" href="http://iranfilmport.com/5">
                                    خود پخش کنندگی</a> مخالف بوده و سپردن حقوق پخش و فروش فیلم و فیلمنامه را به
                                پخش کنندگان حقیقی توصیه می‌کند. واگذاری حق پخش فیلم و فیلمنامه نیازمند تحقیق در
                                خصوص پخش کنندگان است تا بتوانید پخش کنندگان حقیقی را از شبه پخش کنندگان تشخیص دهید.
                                و پیش نیاز این تحقیق، آشنایی با پارامترهای حقیقی یک پخش کننده است که پیشنهاد می‌شود
                                مقاله‌ی <a target="_blank" href="http://iranfilmport.com/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران">
                                    «چرا باید درگاه فیلم ایران را جهت پخش و ارسال فیلم و فیلمنامه‌تان انتخاب کنید؟ »</a>
                                را مطلعه کرده و سپس تحقیق را آغاز کنید.</li>
                        </ul>
                        <ul>
                            <%--<li style="font-family:titr;">ارسال از طریق سایت</li>
                    <ul>
                    در این روش پس از <a href='http://iranfilmport.com/ورود-و-ثبت-نام'>ثبت نام</a> در درگاه فیلم ایران، از طریق بخش <a href='http://iranfilmport.com/جشنواره-های-فیلم-کوتاه-بلند'>فستیوال ها</a> می توانید اقدام به ارسال فیلم تان کنید.
                    </ul>--%>
                            <li style="font-family: titr;">سپردن پخش کنندگی فیلم و فیلمنامه به درگاه فیلم ایران
                            </li>
                            <ul>
                                <li>هر فیلم و یا فیلمنامه پس از طی کردن هشت مرحله زیر توسط درگاه فیلم ایران پخش و ارسال
                                    خواهد شد:</li>
                            </ul>
                        </ul>
                    </div>

                    					


                    <div class="left-side">
                        <div class="item-holder" style="direction: rtl;">
                            <div class="accordion">
                                1) اولین مرحله: ارسال فیلم و فیلمنامه جهت بازبینی و ارزشگذاری</div>
                            <div class="panel">
                                <ul>
                                    <li>اثر شما جهت ارزشیابی اولیه و سپس تعیین کاستبیس، توسط کار گروه ارزشیابی آژانس پخش
                                        و ارسال فیلم و فیلمنامه درگاه فیلم ایران، باید مشاهده (فیلم) و یا خوانده (فیلمنامه)
                                        شود. از این رو شما میتوانید یکی از روش های زیر را جهت ارسال اثرتان انتخاب کنید:</li>
                                    <ul>
                                        <li>ارسال لینک از طریق وب سایت - <a target="_blank" href="http://iranfilmport.com/send">
                                            کلیک کنید</a></li>
                                        <li>ارسال به آدرس ایمیل «درگاه فیلم ایران» به نشانی support@iranfilmport.com</li>
                                        <li>ارسال به تلگرام «درگاه فیلم ایران» - شماره‌ی 09216343320</li>
                                        <li>ارسال به تلگرام «درگاه فیلم ایران» - شماره‌ی 09020763947</li>
                                        <li>ارسال به واتس اپ «درگاه فیلم ایران» - شماره‌ی 09216343320</li>
                                        <li>ارسال به واتس اپ «درگاه فیلم ایران» - شماره‌ی 09020763947</li>
                                        <li>ارسال لینک به دایرکت پیج اینستاگرام «درگاه فیلم ایران» (<a target="_blank" href="https://instagram.com/iranfilmport/">@iranfilmport</a>)</li>
                                        <li>ارسال DVD به نشانی دفتر مرکزی (<a target="_blank" href="http://iranfilmport.com/تماس-با-درگاه-فیلم-ایران">تماس
                                            با ما</a>)</li>
                                    </ul>
                                    <li><span style="color: Red;">1. پس از ارسال اثرتان، پر کردن «فرم دیجیتالی ارسال اثر»
                                        الزامی است. (<a target="_blank" href="http://iranfilmport.com/send">کلیک کنید</a>)
                                    </span></li>
                                    <li><span style="color: Red;">2. جهت بازبینی نیازی به فیلم کامل و با بالاترین کیفیت
                                        نبوده و می‌توانید از واترمارک استفاده کنید. </span></li>
                                </ul>
                            </div>
                            <div class="accordion">
                                2) دومین مرحله: بررسی توسط کارشناسان درگاه</div>
                            <div class="panel">
                                <ul>
                                    <li>فیلم و فیلمنامه شما پس از دریافت، به کار گروه پخش درگاه فیلم ایران واگذار شده و
                                        توسط کارشناسان درگاه بررسی و براساس شاخص‌های جدولبندی شده، ارزشگذاری می شود.</li>
                                </ul>
                            </div>
                            <div class="accordion">
                                3) سومین مرحله: تعیین کاستبیس</div>
                            <div class="panel">
                                <ul>
                                    <li>براساس امتیازی که فیلم و یا فیلمنامه کسب کرده است، مقدار حد ارزشی «کاستبیس - Costbase»
                                        تعیین می‌شود.</li>
                                    <li style="color: Red; font-size: 13px;">واحد کاستبیس براساس ریال بوده و برای هر فیلم
                                        و فیلمنامه با فیلم و فیلمنامه‌ای دیگر متفاوت است و علت این تفاوت، تفاوت محتوایی
                                        و کیفی فیلم هاست. متاسفانه سوءاستفاده هایی که در عرصه ی پخش فیلم بخصوص در مدیوم
                                        کوتاه آن رخ داده است، اخذ مقادیر ثابتی چون 10 هزار تومن یا 15 هزار تومن برای تمامی
                                        فیلم ها و تمامی ارسال هاست که نشان از نگاه غیر حرفه ای و سودجویانه در این عرصه دارد.</li>
                                    <li>توجه: تعیین کاستبیس تنها در دو مدل ارسال موردی و ارسال بسته‌ای قابل اعمال است و
                                        در مدل‌های دیگر شیوه متفاوت است. جهت کسب اطلاعات بیشتر به شیوه‌های پخش در شماره
                                        4 و یا به بخش تعرفه‌ی پخش مراجعه شود.</li>
                                    <li><a href="هزینه-پخش-بین-المللی-فیلم" style="color: Blue; text-decoration: none;">
                                        جهت اطلاع از تعرفه‌ها و آشنایی با طریقه محاسبه و ارزشگذاری پخش فیلم کلیک کنید.</a></li>
                                </ul>
                            </div>
                            <div class="accordion">
                                4) چهارمین مرحله: تعیین شیوه پخش اثر به فستیوال‌ها
                            </div>
                            <div class="panel">
                                <ul>
                                    <li>براساس ساختار «درگاه فیلم ایران» که در جهت موفقیت هر چه بیشتر فرآیند پخش و ارسال
                                        فیلم و فیلمنامه، با نگاهی حرفه‌ای تبیین شده است، 6 روش جهت ارسال فیلم و فیلمنامه
                                        به فستیوال در نظر گرفته شده است. لازم به ذکر است که <a target="_blank" href="http://iranfilmport.com/برنامه-استراتژیک-پخش-فیلم-به-جشنواره-های-خارجی">
                                            پلانِ استراتژیک و یا همان برنامه ی مدون جهت پخش</a>، تنها در ارسال‌های یکساله،
                                        دوساله، تلفیقی و حرفه‌ای لحاظ خواهد شد.
                                        <ul>
                                            <li><strong style="color: Red;">1) ارسال موردی:</strong> در این مدل، یک فستیوال به درخواست
                                                فیلمساز و یا تشخیص کارشناسان «درگاه فیلم ایران» انتخاب، و ارسال توسط «درگاه فیلم
                                                ایران» صورت می‌گیرد.</li>
                                            <li><strong style="color: Red;">2) ارسال بصورت بسته ای یا پکیج:</strong> در این مدل،
                                                از بین 10 بسته‌ی پخش و ارسال فیلم و فیلمنامه که هر یک دارای تخفیفات پلکانی هستند،
                                                یکی از آنها انتخاب شده و پس از اخذ قرارداد رسمی و حقوقی، در مدت زمان معین پخش و
                                                ارسال فیلم و یا فیلمنامه انجام می شود. <a target="_blank" href="http://iranfilmport.com/هزینه-پخش-بین-المللی-فیلم">
                                                    شما می‌توانید در بخش محاسبه‌ی هزینه پخش و ارسال، این 10 بسته را مشاهده و با تخفیفات
                                                    آنها آشنا شوید.</a></li>
                                            <li><strong style="color: Red;">3) مدل یکساله:</strong>در این مدل، قرارداد یکساله بدون
                                                درصد و با هزینه‌ای مشخص به تعداد نامحدود فستیوال، منعقد خواهد شد.</li>
                                            <li><strong style="color: Red;">4) مدل دوساله:</strong>در این مدل، قرارداد دوسالانه
                                                بدون درصد و با هزینه‌ای مشخص به تعداد نامحدود فستیوال، منعقد خواهد شد.</li>
                                            <li><strong style="color: Red;">5) مدل تلفیقی:</strong> این مدل قرارداد از نوع درصدی
                                                با هزینه کمتر نسبت به پخش دوساله می‌باشد. </li>
                                            <li><strong style="color: Red;">6) پخش کنندگی حرفه‌ای:</strong> در این مدل که حرفه‌ای
                                                ترین مدل پخش کنندگی فیلم می باشد، درگاه فیلم ایران پخش کنندگی کامل یک فیلم را بر
                                                عهده گرفته و هیچگونه هزینه ای بجز هزینه ورودی فستیوال‌ها در صورت وجود، دریافت نخواهد
                                                شد.
                                                <ul>
                                                    <li style="color: Red;">شرط پذیرش فیلم‌ها بصورت حرفه‌ای، بسیار پیچیده بوده و «درگاه
                                                        فیلم ایران» در یک سال کاری به تعداد بسیار محدودی در این مدل قرارداد منعقد خواهد
                                                        کرد.</li>
                                                    <li style="color: Red;">همچنین در این مدل <a target="_blank" href="http://iranfilmport.com/رسانه-سازی-پخش-فیلم">
                                                        «رسانه سازی»</a> بصورت رایگان انجام خواهد گرفت.</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="accordion">
                                5) پنجمین مرحله: پر کردن فرم ها</div>
                            <div class="panel">
                                <ul>
                                    <li>فرم‌های مربوط به اطلاعات <strong>فیلم و مشخصات کارگردان و عوامل فیلم</strong> را
                                        از لینک های زیر دانلود کرده و با دقت پر کنید.</li>
                                    <ul>
                                        <li>
                                            
<a target="_blank" 
href='<%= String.Format("{0}?t={1}", "../files/uploadFiles/form_crew.docx", DateTime.Now.Ticks)  %>'>
دانلود فرم خام اطلاعات کارگردان و عوامل
</a>


                                        </li>
                                        <li>
                                            


<a target="_blank" 
href='<%= String.Format("{0}?t={1}", "../files/uploadFiles/form_film.docx", DateTime.Now.Ticks)  %>'>
   دانلود فرم خام اطلاعات فیلم
</a>


                                        </li>
                                    </ul>
                                    <div>
                                        <ul>
                                            <li style="color: Red; font-style: italic;">در قراردادهایی که تهیه کننده اثر امکان امضای
                                                قرارداد را نداشته و یا شخص دیگری را بعنوان جانشین خود در امور قرارداد منصوب کرده
                                                باشد، پر کردن فرم رضایت نامه تهیه کننده الزامی است.</li>
                                            <li>
                                                <li>
                                                    


<a target="_blank" 
href='<%= String.Format("{0}?t={1}", "../files/uploadFiles/form_consentletter_producer.docx", DateTime.Now.Ticks)  %>'>
دانلود فرم رضایت نامه تهیه کننده
</a>


                                                </li></li>
                                        </ul>
                                    </div>
                                    <li>فرم مربوط به اطلاعات <strong>فیلمنامه و مشخصات فیلمنامه‌نویس</strong> را از لینک
                                        زیر دانلود کرده و با دقت پر کنید.
                                    <ul>
                                        <li>

<a target="_blank" 
href='<%= String.Format("{0}?t={1}", "../files/uploadFiles/form_screenplay.docx", DateTime.Now.Ticks)  %>'>
      دانلود فرم خام اطلاعات فیلمنامه و فیلمنامه‌نویس
</a>

                                        </li>
                                    </ul></li>

                                    <li>فرم مربوط به <strong>حق کپی رایت موسیقی</strong> را از لینک
                                        زیر دانلود کرده و با دقت پر کنید.
                                    <ul>
                                        <li>

<a target="_blank" 
href='<%= String.Format("{0}?t={1}", "../files/uploadFiles/form_copyright_consent.docx", DateTime.Now.Ticks)  %>'>
  دانلود فرم خام رضایت نامه مولف خالق موسیقی
</a>

                                        </li>
                                    </ul></li>

                                </ul>
                            </div>
                            <div class="accordion">
                                6) ششمین مرحله: پرداخت هزینه و امضای قرارداد رسمی</div>
                            <div class="panel">
                                <ul>
                                    <li>پس از انتخاب هر کدام از مدل‌های پخش و ارسال فیلم و فیلمنامه که در چهارمین مرحله
                                        توضیح داده شد، قرارداد توسط دپارتمان مشتریان درگاه فیلم ایران تنظیم و پس از تائید
                                        مشتری، مبلغ قرارداد توسط تهیه کننده و یا نماینده رسمی فیلم و فیلمنامه پرداخت و نسخه‌ی
                                        قرارداد مشتری با مهر و امضای «درگاه فیلم ایران» تحویل داده خواهد شد.</li>
                                </ul>
                            </div>
                            <div class="accordion">
                                7) هفتمین مرحله: ارسال نسخه‌ی اصلی فیلم و سایر متریال</div>
                            <div class="panel">
                                <ul>
                                    <li>شما میتوانید از 2 روش «آنلاین» و «پستی»، فیلم و ملزومات آن را به دست کارشناسان درگاه
                                        فیلم ایران برسانید:</li>
                                    <ul>
                                        <li><strong style="color: Red">آنلاین</strong></li>
                                        <li>
                                            <ul>
                                                <li>فیلم و متریال مورد نظر را در یکی از آپلودسنترهای زیر آپلود و لینک آن را ارسال کنید:</li>
                                                <li>
                                                    <ul>
                                                        <li><a href="https://www.mediafire.com/" target="_blank" style="text-decoration: none;">
                                                            آپلودسنتر معروف Mediafire</a></li>
                                                        <li><a href="https://www.pcloud.com/" target="_blank" style="text-decoration: none;">
                                                            آپلودسنتر pCloud</a></li>
                                                        <li><a href="http://uplod.ir/" target="_blank" style="text-decoration: none;">آپلودسنتر
                                                            ایرانی Uplod</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><strong style="color: Red">پستی</strong></li>
                                        <li>
                                            <ul>
                                                <li>فیلم باید با بالاترین بیت ریت و رزولوشن ممکن به همراه لیست ملزومات زیر بصورت دیتا
                                                    (DATA) در قالب دی‌وی‌دی و یا هارد-دیسک به آدرس: رشت خیابان ملت، مجتمع خانه مهر،
                                                    شرکت فیلمسازی گرانش پست شود.</li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <li>
                                        <br />
                                    </li>
                                    <li><strong>حداقل مشخصات فنی فیلم : </strong></li>
                                    <li>
                                        <ul>
                                            <li>Format: MP4</li>
                                            <li>
                                            Codec: H264<li>
                                            <li>Resolution: Full HD (1920*1080)</li>
                                            <li>Bitrate: More than 10.000</li>
                                            <li>Subtitle: Burnt (HardSub)</li>
                                            <li>Sound: Stereo</li>
                                        </ul>
                                    </li>
                                    <li><strong>لیست متریال و ملزومات مورد نیاز : </strong></li>
                                    <li>
                                        <ul>
                                            <li>تصویر کارگردان</li>
                                            <li>5 عکس پشت صحنه</li>
                                            <li>5 عکس صحنه</li>
                                            <li>تریلر فیلم</li>
                                            <li>پوستر</li>
                                            <li>لیست دیالو‌گ‌ها بصورت تکست و اس‌آرتی</li>
                                            <li>تصویر کارت ملی و شناسنامه</li>
                                            <li>تصویر پاسپورت</li>
                                            <li>رزومه کارگردان و تهیه کننده</li>
                                            <li>فرم اطلاعات فیلم</li>
                                            <li>فرم اطلاعات کارگردان و عوامل فیلم</li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="accordion">
                                8) هشتمین مرحله: شروع فرآیند پخش</div>
                            <div class="panel">
                                <ul>
                                    <li>پس از دریافت فیلم، <a target="_blank" href="http://iranfilmport.com/برنامه-استراتژیک-پخش-فیلم-به-جشنواره-های-خارجی">
                                        پلانِ استراتژیک و یا همان برنامه ی مدون جهت پخش</a> براساس محتوای فیلم تعیین و فرآیند
                                        پخش و ارسال فیلم و یا فیلمنامه آغاز می‌شود. </li>
                                </ul>
                            </div>
                            <p>
                                اگر پس از مطالعه موارد فوق همچنان ابهامی در چگونگی پخش و ارسال فیلم به جشنواره ها
                                برای شما باقی مانده است <a target="_blank" href="مشاوره-پخش-بین-المللی-فیلم">مشاوره
                                    پخش و ارسال فیلم</a> درگاه فیلم ایران در خدمت شماست.
                            </p>
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
                        </div>
                        <uc3:comment ID="comment" runat="server" />
                    </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>
</asp:Content>
