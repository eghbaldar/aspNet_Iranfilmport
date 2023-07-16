<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GeneralDetails.aspx.vb" Inherits="GeneralDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>درگاه فیلم ایران</title>
    <link rel="shortcut icon" href="<%= ResolveUrl("~/files/images/icons/icon.png")%>" />
    <style>
        @font-face {
            font-family: Samim;
            src: url('../files/font/Samim-FD.eot');
            src: url('../files/font/Samim-FD.eot?#iefix') format('FontName-opentype'), url('../files/font/Samim-FD.woff') format('woff'), url('../files/font/Samim-FD.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        body {
            background-color: #E5DA00;
            padding: 10px;
            font-family: Samim;
            direction: rtl;
            text-align: right;
            line-height: 30px;
            text-align:justify;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center;">
            <img src="../files/images/logos/logoSquare.png" width="70" />
        </div>
        <div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">            <b>جهت شروع فرآیند پخش و ارسال فیلم تان توسط درگاه فیلم ایران براساس متن زیر عمل کنید:
            </b>
            <br /><br />
            1) ابتدا باید یک نسخه از فیلم بصورت کم حجم و همینطور واترمارک شده (الزامی نیست) دست ما برسه (از طریق تلگرام یا واتساپ یا لینک)
             
            <br />
            2) فیلم براساس شاخص های فستیوالی بازبینی میشه و یک میانگین نمره ای بین 0 تا 10 بدست میاره (مثلا 4.5) >> اگه فیلم زیر 4 بیاد، همکاری نمیکنیم معمولا غیر از اینکه خود فیلمساز بخواد. اگر بالای 4 باشه ما خواهان پخش فیلم هستیم
             
            <br />
            3) با شما تماس میگیریم و در خصوص مدل، استراتژی، زمان، تعداد و هزینه قرارداد به توافق شفاهی میرسیم
             
            <br />
            4) فرم های مربوطه پر میشه و قرارداد تنظیم میشه توسط شرکت و واحد مالی
             
            <br />
            5) پرداخت هزینه قرارداد
             
            <br />
            6) شروع به پخش</asp:View>
                <asp:View ID="View2" runat="server">
                 <b>   در خصوص «فیلمنامه»، درگاه فیلم ایران سه خدمت را بصورت زیر ارائه خواهد داد:</b>
                    <br /><br />
1. مشاوره فیلمنامه
شامل تحلیل فیلمنامه در سه سطح: «نگارش فیلمنامه، روایت و قصه گویی و در راستا بودن فستیوالی متن»
این مشاوره دارای هزینه بوده و برای فیلمنامه های کوتاه و بلند متفاوت است
زمان بررسی: 7 تا 10 روز کاری
روش: فیلمنامه خود را پس از ثبت در خانه سینما، ارسال و پس از پرداخت هزینه، منتظر تحلیل بمانید.
                    <br /><br />
2. پخش فیلمنامه
جهت پخش و ارسال فیلمنامه‌تان به جشنواره های بین المللی، ابتدا فیلمنامه خود را در خانه سینما ثبت و سپس «فقط خلاصه داستان قصه تان» را ارسال کنید. پس از بررسی و تائید خلاصه داستان، فیلمنامه بررسی و پس از آن، قرارداد بسته خواهد شد.
پروسه بررسی فیلمنامه، بدون هزینه می باشد.
هزینه پخش و ارسال فیلمنامه از قبل تعیین نشده است.
                    <br /><br />
3. شرکت در «طرح مشارکت» درگاه فیلم ایران:
جهت اطلاع از چگونگی اقدام در طرح مشارکت روی لینک زیر کلیک و موارد را دقیق مطالعه کنید:
                    <br />
<a href="http://iranfilmport.com/participationplan">http://iranfilmport.com/participationplan</a>
                    <br /><br />

جهت آموزش ثبت فیلمنامه در بانک فیلمنامه خانه سینما به لینک زیر مراجعه کنید:
                    <br />
                    <a href="http://iranfilmport.com/1151">http://iranfilmport.com/1151</a>
                </asp:View>
            </asp:MultiView>
              <br />
            <br />
            لطفا به صفحه واتساپ برگشته و شماره ی خود را به همراه نام کاملتان قرار دهید و یا اگر سوال دیگری دارید، سوال خود را مطرح کنید تا در اسرع وقت پاسخ مناسب داده شود.

        </div>
    </form>
</body>
</html>
