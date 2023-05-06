<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MainMenuEn.ascx.vb" Inherits="usercontrols_MainMenuFa" %>

<link href="<%= ResolveUrl("~/files/css/menu_main/mainEn.css")%>" rel="stylesheet" type="text/css" />

<nav id="menu-wrap">
    <ul id="menu">
        <li><a class="menuMainNode" href="/?lang=en">Home</a></li>
        <li><a class="menuMainNode">Distribution of Films</a>
            <ul>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/پخش-و-ارسال-فیلم?lang=en") %>'>HOW TO DISTRIBUTION
                </a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/قوانین-و-مقررات?lang=en") %>'>RULES & REGULATION
                </a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/هزینه-پخش-بین-المللی-فیلم?lang=en") %>'>HOW TO CALCULATE OF COST</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/مشاوره-پخش-بین-المللی-فیلم?lang=en") %>'>CONSULATION ON DISTRIBUTION</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/مشاوره-فیلمنامه-کوتاه-مشاوره-فیلمنامه-بلند?lang=en") %>'>SCRIPT CONSULATION</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/برنامه-استراتژیک-پخش-فیلم-به-جشنواره-های-خارجی?lang=en") %>'>STRATEGIC PLANS FOR DISTRIBUTION</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/رسانه-سازی-پخش-فیلم?lang=en") %>'>MEDIA-MAKING</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/سرویس-های-پخش-فیلم?lang=en") %>'>‌IRAN FILM PORT'S SERVICES</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/نماد-اعتماد-درگاه-فیلم-ایران?lang=en") %>'>WHAT'S SOT</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/send?lang=en") %>'>SEND YOUR FILM</a> </li>
            </ul>
        </li>
        <li><a class="menuMainNode" href='<%= Page.ResolveUrl("~/نقد-تحلیل-اخبار-فیلم-کوتاه?lang=en") %>'>News</a>
            <ul>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}?lang=en","دسته-اصلی",  "اخبار-درگاه-فیلم-ایران","4")) %>'>IRAN FILM PORT'S NEWS</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}?lang=en","دسته-اصلی",  "اخبار-جشنواره-داخلی","5")) %>'>NATIONAL FESTIVALS' NEWS</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}?lang=en","دسته-اصلی",  "اخبار-جشنواره-خارجی","6")) %>'>INTERNATIONAL FESTIVALS' NEWS</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}?lang=en","دسته-اصلی",  "نقد-تحلیل-فیلم-کوتاه","1")) %>'>CRITICT ARTICILES</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}?lang=en","دسته-اصلی",  "مقالات-آموزشی-فیلم-فیلمنامه-سینمایی","2")) %>'>LEARNING ARTICILES</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}?lang=en","دسته-اصلی",  "شناخت-جشنواره-خارجی-اسکاری","3")) %>'>KNOWING OF FESTIVALS</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}?lang=en","دسته-اصلی",  "فراخوان-جشنواره","7")) %>'>CALL FOR ENTRY</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl(String.Format("{2}/{1}/{0}?lang=en","دسته-اصلی",  "یادداشت-سردبیر","8")) %>'>HEAD EDITOR'S NOTE</a> </li>
            </ul>
        </li>
        <li><a class="menuMainNode" href='<%= Page.ResolveUrl("~/جشنواره-های-فیلم-کوتاه-بلند?lang=en") %>'>Festivals</a>
            <ul>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/جشنواره-های-فیلم-کوتاه-بلند?lang=en") %>'>ALL FESTIVALS</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/فستیوال-های-فیلم?lang=en") %>'>TOP OF FESTIVALS</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/فستیوال-های-اسکاری-فیلم-کوتاه?lang=en") %>'>TOPEST OF FESTIVALS</a></li>
                <li><a class="menuSubNode" href="http://iranfilmport.com/420">IRANIAN FILM FESTIVALS</a></li>
            </ul>
        </li>
        <li><a href="" class="menuMainNode">About Us</a>
            <ul>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/درباره-درگاه-فیلم-ایران?lang=en") %>'>ABOUT US</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/کارنامه-پخش-فیلم-درگاه-فیلم-ایران?lang=en") %>'>CV - RESUME</a></li>

                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/team?lang=en") %>'>CEO & STAFF</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/agents") %>'>The Official Agents</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/مشتریان-درگاه-فیلم-ایران?lang=en") %>'>OUR CUSTOMERS</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران?lang=en") %>'>WHY US?</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/movibeta") %>'>OUR PARTNET</a></li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/ارسال-خبر-و-تبلیغات") %>'>Send News & Advertise</a></li>
                                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/تصدیق-نامه-فیلمسازان?lang=en") %>'>Our Testimonials</a> </li>
                <li><a class="menuSubNode" href='<%= Page.ResolveUrl("~/تماس-با-درگاه-فیلم-ایران?lang=en") %>'>CONTACT US</a></li>
            </ul>
        </li>
    </ul>
</nav>
