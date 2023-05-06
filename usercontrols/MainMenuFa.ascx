<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MainMenuFa.ascx.vb" Inherits="usercontrols_MainMenuFa" %>

<link href="<%= ResolveUrl("~/files/css/menu_main/main.css")%>" rel="stylesheet" type="text/css" />

<nav id="menu-wrap">
    <ul id="menu">
        <li><a class="menuMainNode" href="/">صفحه نخست</a></li>
        <li><a class="menuMainNode">پخش و ارسال فیلم</a>
            <ul>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/پخش-و-ارسال-فیلم") %>'>چگونگی
                    ارسال فیلم از درگاه</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/قوانین-و-مقررات") %>'>قوانین
                    و مقررات</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/هزینه-پخش-بین-المللی-فیلم") %>'>چگونگی محاسبه هزینه پخش فیلم</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/مشاوره-پخش-بین-المللی-فیلم") %>'>مشاوره پخش و ارسال فیلم</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/مشاوره-فیلمنامه-کوتاه-مشاوره-فیلمنامه-بلند") %>'>مشاوره فیلمنامه کوتاه و بلند</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/برنامه-استراتژیک-پخش-فیلم-به-جشنواره-های-خارجی") %>'>پلن استراتژیک پخش فیلم</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/رسانه-سازی-پخش-فیلم") %>'>رسانه‌سازی
                    فیلم و فیلمساز</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/سرویس-های-پخش-فیلم") %>'>سرویس‌های
                    درگاه فیلم ایران</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/نماد-اعتماد-درگاه-فیلم-ایران") %>'>نماد اعتماد چیست؟</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/send") %>'>ارسال اطلاعات فیلم
                    و فیلمنامه</a> </li>
            </ul>
        </li>
        <li><a class="menuMainNode" href='<%= Page.ResolveUrl("~/نقد-تحلیل-اخبار-فیلم-کوتاه") %>'>اخبار و نقد و تحلیل فیلم کوتاه</a>
            <ul>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}","دسته-اصلی",  "اخبار-درگاه-فیلم-ایران","4")) %>'>اخبار درگاه فیلم ایران</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}","دسته-اصلی",  "اخبار-جشنواره-داخلی","5")) %>'>اخبار جشنواره‌های داخلی</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}","دسته-اصلی",  "اخبار-جشنواره-خارجی","6")) %>'>اخبار جشنواره‌های خارجی</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}","دسته-اصلی",  "نقد-تحلیل-فیلم-کوتاه","1")) %>'>نقد و مطالب تحلیلی</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}","دسته-اصلی",  "مقالات-آموزشی-فیلم-فیلمنامه-سینمایی","2")) %>'>مقالات آموزشی فیلمنامه و فیلم</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}","دسته-اصلی",  "شناخت-جشنواره-خارجی-اسکاری","3")) %>'>شناخت جشنواره‌ها</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}","دسته-اصلی",  "فراخوان-جشنواره","7")) %>'>فراخوان‌ها</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}","دسته-اصلی",  "یادداشت-سردبیر","8")) %>'>یادداشت سردبیر</a> </li>
            </ul>
        </li>
        <li><a class="menuMainNode" href='<%= Page.ResolveUrl("~/جشنواره-های-فیلم-کوتاه-بلند") %>'>فستیوال‌ها</a>
            <ul>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/جشنواره-های-فیلم-کوتاه-بلند") %>'>همه فستیوال‌ها</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/فستیوال-های-فیلم") %>'>فستیوال‌های
                    معتبر</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/فستیوال-های-اسکاری-فیلم-کوتاه") %>'>فستیوال‌های اسکاری - ای‌پلاس</a></li>
                <li><a class="menuSubNode" href="http://iranfilmport.com/420">فستیوال‌های کوتاه و بلند ایرانی</a></li>
            </ul>
        </li>
        <li><a href="" class="menuMainNode">درباره‌ی درگاه فیلم ایران</a>
            <ul>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/درباره-درگاه-فیلم-ایران") %>'>درباره ی درگاه</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/کارنامه-پخش-فیلم-درگاه-فیلم-ایران") %>'>کارنامه پخش درگاه</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/team") %>'>تیم و مدیریت درگاه</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/agents") %>'>نماینده‌های رسمی درگاه</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/مشتریان-درگاه-فیلم-ایران") %>'>مشتریان درگاه فیلم ایران</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>'>چرا درگاه فیلم ایران؟</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/movibeta") %>'>شریک اسپانیایی
                    درگاه فیلم ایران</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/ارسال-خبر-و-تبلیغات") %>'>ارسال خبر و تبلیغات</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/تصدیق-نامه-فیلمسازان") %>'>تصدیق‌نامه‌های فیلمسازان ما</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/تماس-با-درگاه-فیلم-ایران") %>'>تماس با درگاه فیلم ایران</a></li>
            </ul>
        </li>
    </ul>
</nav>
