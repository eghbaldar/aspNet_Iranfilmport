<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="camscanner.aspx.vb" Inherits="camscanner" %>

<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .imgsCam {
            border: 10px dashed #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin: 10px;
        }

        .accordion ul, .accordion li, li {
            list-style-type: circle;
            font-family: Samim;
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
            font-family: NazaninB;
            font-size: 18px;
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

        p {
            font-family: Samim;
            color: Black;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_9.jpg);">
        <div class="container">
            <div class="title-text" style="direction: rtl;">
                <h1>
                    <span style="font-family: Titr;">آموزش و سوالات پر تکرار</span>
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
                        <div style="margin: 10px; direction: rtl; text-align: right; font-family: Samim;">
                            <div class="accordion">
                                راهنمای استفاده از Cam-Scanner برای قراردادها</div>
                            <div class="panel">
                                <div class="item-holder" style="text-justify: inter-word; text-align: justify; padding: 10px;">
                                    <p>
                                        بجای استفاده از پروسه‌ی وقت‌گیر اسکن توسط اسکنرها، با نرم افزار CamScanner براحتی
                                        میتوانید، از صفحات قرارداد، فایل تصویری تهیه کرده و آن را در اختیار کارشناسان «درگاه
                                        فیلم ایران» قرار دهید.
                                    </p>
                                    <p style="text-align: center;">
                                        <img src="files/images/icons/CamScanner.png" width="90%" />
                                    </p>
                                    <p>
                                        1) براساس برند گوشی خود، جهت نصب برنامه روی گوشی، روی آیکن مورد نظر کلیک کنید:
                                    </p>
                                    <p style="text-align: center;">
                                        <a href="https://cafebazaar.ir/app/com.intsig.camscanner" target="_blank">
                                            <img src="files/images/icons/bazzar.png" width="150" />
                                        </a><a href="https://apps.apple.com/us/app/camscanner-pdf-scanner-app/id388627783"
                                            target="_blank">
                                            <img src="files/images/icons/apple.png" width="80" />
                                        </a><a href="https://play.google.com/store/apps/details?id=com.intsig.camscanner&hl=en&gl=US"
                                            target="_blank">
                                            <img src="files/images/icons/andriod.png" width="80" />
                                        </a>
                                    </p>
                                    <p>
                                        2) از قرارداد پرینت رنگی و یا سیاه و سفید گرفته و پس از اعمال اثر انگشت و امضای
                                        کارگردان و تهیه کننده، نرم افزار را در گوشی خود باز کنید</p>
                                    <p>
                                    <p>
                                        3) طبق تصاویر زیر از تمام صفحات قرارداد تصویر تهیه کنید:
                                    </p>
                                    <p style="text-align: center;">
                                        <img src="files/images/icons/camScanner_1.jpg" width="300" class="imgsCam" />
                                    </p>
                                    <p style="text-align: center;">
                                        <img src="files/images/icons/camScanner_2.jpg" width="300" class="imgsCam" />
                                    </p>
                                    <p style="text-align: center;">
                                        <img src="files/images/icons/camScanner_3.jpg" width="300" class="imgsCam" />
                                    </p>
                                    <p style="text-align: center;">
                                        <img src="files/images/icons/camScanner_4.jpg" width="300" class="imgsCam" />
                                    </p>
                                    <p style="text-align: center;">
                                        <img src="files/images/icons/camScanner_5.jpg" width="300" class="imgsCam" />
                                    </p>
                                    <p style="text-align: center;">
                                        <img src="files/images/icons/camScanner_6.jpg" width="300" class="imgsCam" />
                                    </p>
                                </div>
                            </div>
                            <div class="accordion">
                                آموزش ساخت اکانت و فایل در Mediafire.com</div>
                            <div class="panel">
                                جهت دانلود فایل راهنما <a href="http://www.iranfilmport.com/files/uploadFiles/mediafire.pdf"
                                    style="text-decoration: none;">(کلیک)</a> کلیک کنید.
                            </div>
                            <div class="accordion">
                                آموزش کم کردن حجم فایل فیلم با نرم افزار Hybrid</div>
                            <div class="panel">
                                جهت دانلود فایل راهنما <a href="http://www.iranfilmport.com/files/uploadFiles/hybrid.pdf"
                                    style="text-decoration: none;">(کلیک)</a> کلیک کنید.
                            </div>
                            <div class="accordion">
                                آموزش ایجاد زیرنویس غیر چسبیده با نرم افزار Subtitle Edit</div>
                            <div class="panel">
                                جهت مشاهده آموزش <a href="http://www.iranfilmport.com/1620"
                                    style="text-decoration: none;">(کلیک)</a> کلیک کنید.
                            </div>
                            
                        </div>
                    </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
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
    </section>
</asp:Content>
