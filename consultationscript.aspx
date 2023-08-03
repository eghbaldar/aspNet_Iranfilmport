<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="consultationscript.aspx.vb" Inherits="consultation" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/comment.ascx" TagName="comment" TagPrefix="uc3" %>
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
            .imgRes
            {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_7.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <span style="font-family: Titr;">مشاوره ارسال و پخش فیلم</span>
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
                        <div class="item-holder" style="direction: rtl; text-justify: inter-word;
                            text-align: justify;font-family:Samim;">
                            <p>
                                اساس «درگاه فیلم ایران» بر مشاوره از لحظه‌ی نخست استوار است. چرا که توانایی پخش فیلم در
                                حد آشنایی ابتدای با پلتفرم‌های رایج و یا آشنایی با زبان انگلیسی آخرین مرحله
                                از یک پخش مطلوب و حرفه‌ای یک فیلم محسوب می شود ولی آن چیزی که حائز اهمیت است شناساسی درست فستیوال است،
                                نه طریق ارسال به آن! بیشتر دوستان فعال در این عرصه با اندک دانشی در این زمینه احساس
                                پخش کنندگی کرده و اقدام به ارسال فیلم به فستیوال ها می کنند و پس از مدتی با ناراحتی
                                بسیار بیان می کنند که از ارسال فیلمشان به تعداد زیادی فستیوال نتیجه نگرفته اند.
                                هر فیلم با توجه به محتوا و تمی که در زیرلایه های خود دارد مناسب هر فستیوالی نیست.
                                پخش کننده ی حقیقی با احاطه ی کامل بر فستیوال ها و شاخص های فراوانی دیگر بهترین تصمیم
                                را برای ارسال می گیرد. در غیر این صورت بغیر از مقدار هزینه ای که از بودجه ی پخش
                                فیلم هدر خواهد رفت، فرصت و شانس حضور فیلم در فستیوال های A+ و A نیز ازبین می رود.
                            </p>
                            <p style="text-align: center;">
                                <img alt="مشاوره پخش فیلم کوتاه بین المللی" class="imgRes" src="files/images/background/consultation.png" /></p>
                            <p>
                                «درگاه فیلم ایران» با دارا بودن کارشناسان مجرب و حرفه‌ای در زمینه مشاوره فیلمنامه
                                و بررسی و تحلیل متن و بازنویسی، از مرحله ایده تا فیلمنامه نهایی، در خدمت فیلمسازان
                                و گروه‌های فیلمسازی است. از این رو؛ با سپردن ایده و فیلمنامه‌های کامل خود به «درگاه
                                فیلم ایران» می‌توانید پیش از آنکه اقدام به ساخت فیلم و صرف هزینه‌ی میلیونی جهت ساخت
                                فیلمی کنید که احتمال دیده شدنش در فستیوال‌های بین المللی در هاله ای از ابهام خواهد بود، از آینده نسبی آن با مشاوره
                                پیش از ساخت مطلع شوید.
                            </p>
                            <br />
                            <p>
                                مراحل مشاوره فیلمنامه:
                                <ul>
                                    <li>ثبت فیلمنامه در بانک فیلمنامه خانه سینما <a href="http://iranfilmport.com/1151"
                                        target="_blank">(جهت آموزش چگونگی ثبت فیلمنامه اینجا کلیک کنید) </a></li>
                                    <li>درج شماره ثبت و تاریخ ثبت در صفحه اول فیلمنامه</li>
                                    <li>ارسال یک نسخه بصورت PDF به کارشناسان «درگاه فیلم ایران»</li>
                                    <li>پرداخت هزینه مشاوره - هزینه فیلمنامه کوتاه با بلند متفاوت است</li>
                                </ul>
                            </p>
                            <br />
                                                        <p>
                                برخی از فیلمسازانی که متن های خود را جهت مشاوره در اختیار «درگاه فیلم ایران» قرار داده اند:
                                <ul>
                                    <li>مرجان صفابخش (فیلمنامه کوتاه: خرگوش کوچولو)</li>
                                    <li>امین شاهرخیان (فیلمنامه کوتاه: آرمیتا کجاست)</li>
                                    <li>ترک (فیلمنامه کوتاه: امین محمدی)</li>
                                    <li>علیرضا نوری (فیلمنامه کوتاه: دفرم)</li>                                    
                                    <li>علی هاشم نیا (فیلمنامه کوتاه: کورمار)</li>                                    
                                    <li>سید حمید کرمانی (فیلمنامه کوتاه: از کار افتاده)</li>                                    
                                </ul>
                            </p>
                            <br />
                            <p>
                                در صورت داشتن هرگونه سوال، در خصوص مشاوره فیلمنامه‌تان جهت ساخت و ارسال به فستیوال های بین
                                المللی از قسمت <a href='http://iranfilmport.com/%D8%AA%D9%85%D8%A7%D8%B3-%D8%A8%D8%A7-%D8%AF%D8%B1%DA%AF%D8%A7%D9%87-%D9%81%DB%8C%D9%84%D9%85-%D8%A7%DB%8C%D8%B1%D8%A7%D9%86'
                                    target="_blank">تماس با ما</a> اقدام فرمائید.
                            </p>
                        </div>
                        <uc3:comment ID="comment" runat="server" />
                    </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>
</asp:Content>
