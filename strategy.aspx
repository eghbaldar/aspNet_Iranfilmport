<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false" CodeFile="strategy.aspx.vb" Inherits="strategy" %>

<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/comment.ascx" TagName="comment" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
        ul ul li
        {
            list-style-type: circle;            
        }
        p{ font-family:Samim;color:Black;font-size:14px;}
    </style>


        <style>
        .T .fr
        {text-align:right;font-family:Samim;direction:rtl;color:Black;}
        .T
        {
            width: 100%;
            border-collapse: collapse;
            direction:rtl;
            text-align:right;
            color:Black;
        }
        /* Zebra striping */
        .T tr:nth-of-type(odd)
        {
            background: #eee;
            color:Black;
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
            font-family:irsans;
        }
        .T td{text-align:right;direction:rtl;}
        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px)
        {
            /* Force table to not be like tables anymore */
            .T, thead, .T tbody,.T  th, .T td,.T  tr
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
                font-family:irsans;
            }
        
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_13.jpg);">
    <div class="container">
        <div class="title-text">
            <h1><span style="font-family: Titr;">برنامه استراتژیک پخش و ارسال فیلم به جشنواره‌های خارجی</span> </h1>            
        </div>
    </div>
    </section>

    <section class="blog-section style-four section2" style="margin-top: -50px;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12" >
                <div class="left-side">
                <div class="item-holder" style="direction:rtl;text-justify:inter-word;     text-align: justify;padding:10px;">
                    <div class="alert alert-danger" role="alert" style="direction:rtl;text-align:right;font-family:Samim;">
  این مدل از پخش از سال 1397 از برنامه «درگاه فیلم ایران» خارج شده است.
</div>
                 <p style="font-family:Titr;">برنامه استراتژیک پخش فیلم چیست؟</p>
                <p>«درگاه فیلم ایران» با دارا بودن تیمی مجرب و حرفه ای در حوزه <a target="_blank" href="http://iranfilmport.com/%D9%BE%D8%AE%D8%B4-%D9%88-%D8%A7%D8%B1%D8%B3%D8%A7%D9%84-%D9%81%DB%8C%D9%84%D9%85">پخش و ارسال فیلم به فستیوال های بین المللیِ فیلم و فیلمنامه</a> در تمامی ژانرهای رایج (کوتاه داستانی، بلند داستانی، مستند کوتاه، مستند بلند، انیمیشن کوتاه، انیمیشن بلند، تجربی کوتاه و تجربی بلند)، برای اولین بار در ایران <a target="_blank" href="http://iranfilmport.com/%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D9%87-%D8%A7%D8%B3%D8%AA%D8%B1%D8%A7%D8%AA%DA%98%DB%8C%DA%A9-%D9%BE%D8%AE%D8%B4-%D9%81%DB%8C%D9%84%D9%85-%D8%A8%D9%87-%D8%AC%D8%B4%D9%86%D9%88%D8%A7%D8%B1%D9%87-%D9%87%D8%A7%DB%8C-%D8%AE%D8%A7%D8%B1%D8%AC%DB%8C">«پِلن استراتژیک پخش»</a> را در اختیار فیلمساز و یا تهیه کننده قرار خواهد دارد.</p>
                <p>«پِلن استراتژیک پخش» و یا برنامه ی مدون شده ی چگونگی ارسال فیلم به جشنواره های خارجی، نقشه ی راه موفقیت یک فیلم است. شما بدون نقشه نمیتوانید سفر کنید، پس چگونه بدون «پلن پخش» انتظار موفقیت فیلمتان را در جشنواره ها دارید؟ 99% شبه پخش کنندگان فیلم در ایران، بدون هیچگونه برنامه و یا پلنی مشخص، فیلم و یا فیلمنامه را به فستیوال ها ارسال میکنند. آنها فستیوال های باز شده را رصد کرده و سپس گله‌ای فیلم های زیر دستشان را حواله ی فستیوال ها میکنند. تعدادی هم با معدود فستیوال هایی، ارتباط مستقیم کاری داشته و تنها هنرشان رایزنی با همان فستیوال های خاص است. در صورتی که نمیدانند، تعداد فستیوال های A+ (اسکاری) و A (قدمت بالای 20 سال) در جهان حدود 700 فستیوال است!</p>
                <p>اگر تاکنون روش های پخش به 3 گونه ی:</p>
                <p>
                    <ul>
                        <li style="font-family:Samim;color:Black;font-size:14px;">1.	پخش کنندگی شخصی (فیلمسازانی که خودشان اقدام به پخش و ارسال فیلمشان میکنند که از نظر درگاه فیلم ایران کاری اشتباه و معمولا به شکست ختم می شود <a target="_blank" href="http://iranfilmport.com/5">(به این مقاله رجوع شود)</a> )</li>
                        <li style="font-family:Samim;color:Black;font-size:14px;">2.	پخش کنندگی واسطه ای (فیلمسازانی که با پخش کننده، به تعداد محدود و در زمانی مشخص، قرارداد می بندند. مانند روش دوم پخش در درگاه فیلم ایران که به روش «بسته ای» معروف است <a target="_blank" href="http://iranfilmport.com/%D9%87%D8%B2%DB%8C%D9%86%D9%87-%D9%BE%D8%AE%D8%B4-%D8%A8%DB%8C%D9%86-%D8%A7%D9%84%D9%85%D9%84%D9%84%DB%8C-%D9%81%DB%8C%D9%84%D9%85">(جهت اطلاعات بیشتر به این صفحه رجوع شود)</a> )</li>
                        <li style="font-family:Samim;color:Black;font-size:14px;">3.	پخش کنندگی حرفه ای (فیلمسازانی که حق کامل فیلم را در زمانی مشخص با قرارداد به پخش کننده واگذار میکنند. مانند مدل سوم پخش در شرکت درگاه فیلم ایران  <a target="_blank" href="http://iranfilmport.com/%D9%87%D8%B2%DB%8C%D9%86%D9%87-%D9%BE%D8%AE%D8%B4-%D8%A8%DB%8C%D9%86-%D8%A7%D9%84%D9%85%D9%84%D9%84%DB%8C-%D9%81%DB%8C%D9%84%D9%85">(جهت اطلاعات بیشتر به این صفحه رجوع شود)</a> )</li>
                    </ul>
                </p>
                <p>تقسیم بندی می شد؛ <span style="color:Red;font-weight:bold">حال «شرکت پخش درگاه فیلم ایران» گونه ای جدید را عرضه میکند. شما با تهیه ی «پِلن استراتژیک پخش» فیلمتان میتوانید، ترکیبی از موارد فوق را داشته باشید</span>.</p>
                <p>این پلن، جدولی مدون شده از فستیوال های اسکاری و درجه ی «الف» جهانی است که براساس پریمیر و تاریخ فستیوال ها، پس از «مشاوره رایگان» با فیلمساز (الزامی) و تعیین سطح کیفی، فنی و محتوایی اثر (الزامی)، در اختیار صاحب اثر و درخواست کننده ی «پلن استراتژیک پخش» قرار خواهد گرفت. اساس تبیین این استراتژی، داده هایی است که حدود 3 سال توسط کارشناسان «درگاه فیلم ایران» جمع آوری، تحلیل و آنالیز و همچنان روزانه بروز میشوند. از طرف دیگر عامل ثانویه ی «اصالت فیلم» باید در نظر گرفته شود. بدین معنا که این «پلن» براساس شاخص ها و المان هایی تعیین و فیلتر میشود که در فیلم وجود داشته و کشف شود.</p>
                <br />
                <p style="font-family:Titr;">روند کلی تهیه پلن و یا برنامه‌ی استراتژیک پخش فیلم:</p>
                    <ul>
                        <li style="font-family:Samim;color:Black;font-size:14px;">1. ارسال فیلم از طریق شبکه‌های <a target="_blank" href="https://t.me/iranfilmportsupport">تلگرام</a> و واتس‌اپ، <a target="_blank" href="mailto:support@iranfilmport.com">ایمیل</a> و یا پستی <a target="_blank" style="color:Red;" href="http://iranfilmport.com/%D8%AA%D9%85%D8%A7%D8%B3-%D8%A8%D8%A7-%D8%AF%D8%B1%DA%AF%D8%A7%D9%87-%D9%81%DB%8C%D9%84%D9%85-%D8%A7%DB%8C%D8%B1%D8%A7%D9%86">(تماس با ما)</a></li>
                        <li style="font-family:Samim;color:Black;font-size:14px;">2. پرداخت هزینه به ازای تعداد فستیوال</li>
                        <li style="font-family:Samim;color:Black;font-size:14px;">3. تحلیل و آنالیز فیلم توسط کارشناسان درگاه فیلم ایران </li>
                        <li style="font-family:Samim;color:Black;font-size:14px;">4. تعیین استراتژی پخش</li>
                        <li style="font-family:Samim;color:Black;font-size:14px;">5. تحویل فایل وُرد برنامه به فیلمساز و یا تهیه کننده</li>
                    </ul>
                <br />
                                <p style="font-family:Titr;">تعرفه‌ی پلن استراتژیک پخش فیلم:</p>

                <table class="T">
<tr><td>تعداد فستیوال</td><td> هزینه </td></tr>
<tr><td>به ازای هر فستیوال</td><td>جهت کسب اطلاعات بیشتر با کارشناسان شرکت در ارتباط باشید</td></tr>
</table>
<p style="color:Red;font-size:11px;">توجه: هر پلن استراتژیک پخش، حداقل باید دارای 10 فستیوال باشد.</p>
                <br />
                <p>به منظور کسب اطلاعات بیشتر و مشاوره رایگان به <a target="_blank" href="http://iranfilmport.com/%D8%AA%D9%85%D8%A7%D8%B3-%D8%A8%D8%A7-%D8%AF%D8%B1%DA%AF%D8%A7%D9%87-%D9%81%DB%8C%D9%84%D9%85-%D8%A7%DB%8C%D8%B1%D8%A7%D9%86">صفحه تماس</a> با ما مراجه کنید. کارشناسان درگاه فیلم ایران آماده پاسخگویی و تدوین این پنل برای فیلم شما هستند.</p>
                <br />


                   </div>
                </div>
                </div>

<uc1:RightSide ID="RightSide1" runat="server" />

                </div>
                </div>
                </section>

</asp:Content>


