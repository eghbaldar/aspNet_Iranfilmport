<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuTopLeft.ascx.vb" Inherits="usercontrols_MenuTopLeft" %>
 <%--////////////////////////// start Menu LOGIN ///////////////////////////--%>

    <link href='<%= ResolveUrl("~/files/css/style.css") %>' rel="stylesheet" type="text/css" />
    <link href='<%= ResolveUrl("~/files/css/MenuTopLeft.css") %>' rel="stylesheet" type="text/css" />
   
    <%--////////////////////////// end Menu LOGIN ///////////////////////////--%>
 <div class="menu">
        <a href="#" class="bars" id="bars"><i class="fa fa-bars"></i></a>
        <ul id="menu-list" style="text-align:right;font-size:13px;font-family:Samim;">
                    <li><a href='<%= Page.ResolveUrl("~") %>' style="background-color:#E5DA00;color:Black;">صفحه نخست درگاه</a></li>   
            <li><a href='<%= ResolveUrl("~/ورود-و-ثبت-نام")%>'>ورود و ثبت نام</p></a></li>
            <li><a href='<%= ResolveUrl("~/ورود-و-ثبت-نام")%>' style="background-color:#48BDC5;color:White;">پخش و ارسال فیلم به فستیوال‌ها</a></li>
            <li><a href='<%= Page.ResolveUrl("~/هزینه-پخش-بین-المللی-فیلم") %>'>هزینه پخش و ارسال فیلم و فیلمنامه</a></li>
            <li><a href='<%= Page.ResolveUrl("~/درباره-درگاه-فیلم-ایران") %>'>درباره ی درگاه فیلم ایران</a></li>
            <li><a href='<%= Page.ResolveUrl("~/تماس-با-درگاه-فیلم-ایران") %>'>تماس با درگاه فیلم ایران</a></li>
         
        </ul>
    </div>