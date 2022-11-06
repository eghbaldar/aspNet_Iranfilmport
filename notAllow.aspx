<%@ Page Language="VB" AutoEventWireup="false" CodeFile="notAllow.aspx.vb" Inherits="notAllow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>عدم دسترسی - درگاه فیلم ایران</title>
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="<%= ResolveUrl("~/files/images/icons/icon.png")%>" />
    <style>
        @font-face
        {
            font-family: 'Titr';
            src: url(files//font/TITRBD.TTF);
        }
        @font-face
        {
            font-family: 'koodak';
            src: url(files//font/KoodakBold.ttf);
        }
        @font-face
        {
            font-family: 'traffic';
            src: url(../../files/font/TRAFFIC.TTF);
        }
        body
        {
            
            direction: rtl;
        }
        ul
        {
            list-style-type: none;
             padding: 0;
        }
        li
        {
            font-family: traffic;
            padding: 10px;
            margin: 10px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            width: 300px;
            border: 2px solid white;
            text-align: center;
            background: #eeeeee; /* Old browsers */
            background: -moz-linear-gradient(top, #eeeeee 0%, #eeeeee 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, #eeeeee 0%,#eeeeee 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, #eeeeee 0%,#eeeeee 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee', endColorstr='#eeeeee',GradientType=0 ); /* IE6-9 */
        }
        
        .btn-container
        {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        a
        {
            text-decoration: none;
            color: red;
            font-family: traffic;
        }
    </style>
</head>
<body style="background: url('<%= ResolveUrl("files/images/background/bg_venue_1.jpg")%>');
    background-size: cover;">
    <div style="background: -moz-linear-gradient(top, rgba(255,255,255,1) 0%, rgba(255,255,255,0) 100%);
        background: -webkit-linear-gradient(top, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%);
        background: linear-gradient(to bottom, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#00ffffff',GradientType=0 );
        /* ie6-9 */
        padding: 10px; ">
        <form id="form1" runat="server">
        <div style="text-align: center;">
            <img src="<%= ResolveUrl("~/files/images/icons/process_stop.png")%>" />
        </div>
        <div style="text-align: center; font-family: traffic; direction: rtl; color: black;">
            <h1>
                صفحه مورد نظر یافت نشد.</h4>
                <h3>
            شما می‌توانید از منوی زیر به بخش مورد نظر دسترسی داشته باشید.</h6>
        </div>
        <div class="btn-container">
            <ul>
                <li><a target="_blank" href="http://iranfilmport.com">صفحه نخست در گاه فیلم ایران</a></li>
                <li><a target="_blank" href="http://iranfilmport.com/پخش-و-ارسال-فیلم">چگونگی پخش و
                    ارسال فیلم</a></li>
                <li><a target="_blank" href="http://iranfilmport.com/قوانین-و-مقررات">قوانین و مقررات
                    پخش و ارسال فیلم</a></li>
                <li><a target="_blank" href="http://iranfilmport.com/نقد-تحلیل-اخبار-فیلم-کوتاه">اخبار
                    فیلم کوتاه و سینمای ایران</a></li>
                <li><a target="_blank" href="http://iranfilmport.com/درباره-درگاه-فیلم-ایران">درباره
                    درگاه فیلم ایران</a></li>
                <li><a target="_blank" href="http://iranfilmport.com/تماس-با-درگاه-فیلم-ایران">تماس
                    با درگاه فیلم ایران</a></li>
            </ul>
        </div>
        </form>
    </div>
</body>
</html>
