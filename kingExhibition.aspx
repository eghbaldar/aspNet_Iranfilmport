<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingExhibition.aspx.vb" Inherits="kingExhibition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .td1{
            width:20%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side panel first-level" style="text-align:justify;">
        <p>
            در راستای سیاست‌های
«درگاه فیلم ایران»
به عنوان «تخصصی‌ترین مرکز 
            <a href="پخش-و-ارسال-فیلم" target="_blank">ارسال و پخش فیلم </a>
            به فستیوال‌های خارجی» که بر ارتقای سطح دانش فیلمسازان استوار است، تصمیم به آن شد که با معرفی فیلم‌های کوتاه شاخص بین المللی که توسط کارشناسان 
            <a href="http://iranfilmport.com" target="_blank">«درگاه فیلم ایران»</a>

            انتخاب می شوند، این فیلم ها را، به مرور در صحفه جاری به نمایش بگذارد. هر فیلم پس از اتمام دوره ی نمایش خود بصورت لینک در انتهای صفحه آرشیو خواهد شد.
        </p>
        <p>
            به دلیل حفظ شئونات و
            <a href="قوانین-و-مقررات" target="_blank">قوانین
جاری در «درگاه فیلم ایران»</a>
            ،
پلان‌های غیر قابل نمایش تار و یا صدای آن تغییر کرده است. ذکر این نکته الزامی که گاها به دلیل اهمیت این مدل از صحنه ها، بجای حدف آن پلان‌ها، فیلم مذکور توسط تیم ارزیابی فیلم انتخاب نخواهد شد.
        </p>
        <h4>اطلاعات فیلم</h4>


        <div style="margin: 5px;padding:5px;color: white; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; /* permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#7abcff+0,2facef+100 */
                    
background: rgb(122,188,255); /* old browsers */
background: -moz-linear-gradient(top, rgba(122,188,255,1) 0%, rgba(47,172,239,1) 100%); /* ff3.6-15 */
background: -webkit-linear-gradient(top, rgba(122,188,255,1) 0%,rgba(47,172,239,1) 100%); /* chrome10-25,safari5.1-6 */
background: linear-gradient(to bottom, rgba(122,188,255,1) 0%,rgba(47,172,239,1) 100%); /* w3c, ie10+, ff16+, chrome26+, opera12+, safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#7abcff', endColorstr='#2facef',GradientType=0 ); /* ie6-9 */">

            <div style="text-align: center;">
            </div>
            <table>
                <tr>
                    <td class="td1">نام فیلم: </td>
                    <td>او هم نفس می‌کشد / That Also Breathes</td>
                </tr>
                <tr>
                    <td class="td1">نام کارگردان: </td>
                    <td>Bahman Radan</td>
                </tr>
                <tr>
                    <td class="td1">نام تهیه کننده: </td>
                    <td>AD1 Film Company</td>
                </tr>
                <tr>
                    <td class="td1">محصول: </td>
                    <td>2023</td>
                </tr>
                <tr>
                    <td class="td1">کشور سازنده: </td>
                    <td>ترکیه</td>
                </tr>
                <tr>
                    <td class="td1">اطلاعات کلی: </td>
                    <td>به گزارش «درگاه فیلم ایران» فیلم کوتاه داستانی «او هم نفس می‌کشد» به کارگردانی «بهمن رادان» و تهیه‌کنندگی «کمپانی فیلم AD1» و پخش‌کنندگی «درگاه فیلم ایران» به مدیریت «علیمحمد اقبالدار» به مناسبت روز جهانی «حمایت از حیوانات» اکران می شود.

                        <div style="direction: ltr;">
                            IRAN FILM PORT (An Iranian Films Agency and Distribution) announces formally and proudly that distribution of "That Also Breathes" short film, directed by "Bahman Radan" and produced by "AD1 Film Company" has started. This film is being distributed by "IRAN FILM PORT" company, under the supervision of "ALIMOHAMMAD EGHBALDAR".

                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td1">لینک فیلم: </td>
                    <td>https://www.aparat.com/v/PEiJj</td>
                </tr>
            </table>

        </div>
        <div style="padding-bottom: 5px;">
            <h4>نمایش فیلم</h4>
        </div>
        <video controls poster="files/video/poster.jpg" width="100%" height="100%" onclick="playPause();">
            <source src="files/video/thatalsobreathe.mp4" type='video/mp4;codecs="avc1.42E01E, mp4a.40.2"' />
        </video>

        <div>
            <br />
            <p>افتخارات:</p>
            <ul style="list-style-type: circle;">
                <li>
                    <span>حضور در جشنواره بین المللی «Vegan Ciftlik Short Film Fest» ترکیه - 2023</span>
                    <span><a target="_blank" href="http://iranfilmport.com/1932">لینک خبر</a></span>
                </li>
                <li>
                    <span>حضور در 13 امین دوره جشنواره بین المللی «Mostra Animal» برزیل - 2023</span>
                    <span><a target="_blank" href="http://iranfilmport.com/1951">لینک خبر</a></span>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>

