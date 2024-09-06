<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingfaq.aspx.vb" Inherits="kingfaq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .imgsCam {
            border: 10px dashed #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin: 10px;
        }
    </style>
    <link href="files/kingMaterials/js/accordian/css.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side panel first-level">
        <asp:Label ID="lbl" runat="server"></asp:Label>
        <div id="kingAccordian">
            <div class="kingAccordion">
                راهنمای استفاده از Cam-Scanner برای قراردادها
            </div>
            <div class="kingPanel">
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
                                        کارگردان و تهیه کننده، نرم افزار را در گوشی خود باز کنید
                    </p>
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
            <div class="kingAccordion">
                آموزش ساخت اکانت و فایل در Mediafire.com
            </div>
            <div class="kingPanel">
                جهت دانلود فایل راهنما <a href="http://www.iranfilmport.com/files/uploadFiles/mediafire.pdf"
                    style="text-decoration: none;">(کلیک)</a> کلیک کنید.
            </div>
            <div class="kingAccordion">
                آموزش کم کردن حجم فایل فیلم با نرم افزار Hybrid
            </div>
            <div class="kingPanel">
                جهت دانلود فایل راهنما <a href="http://www.iranfilmport.com/files/uploadFiles/hybrid.pdf"
                    style="text-decoration: none;">(کلیک)</a> کلیک کنید.
            </div>
            <div class="kingAccordion">
                آموزش ایجاد زیرنویس غیر چسبیده با نرم افزار Subtitle Edit
            </div>
            <div class="kingPanel">
                جهت مشاهده آموزش <a href="http://www.iranfilmport.com/1620"
                    style="text-decoration: none;">(کلیک)</a> کلیک کنید.
            </div>
        </div>
    </div>
    <script src="files/kingMaterials/js/accordian/js.js"></script>
</asp:Content>

