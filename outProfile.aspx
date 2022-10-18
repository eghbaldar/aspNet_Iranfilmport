<%@ Page Language="VB" AutoEventWireup="false" CodeFile="outProfile.aspx.vb" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>پروفایل خارج از دسترس- درگاه فیلم ایران</title>
    <meta name="robots" content="noindex, nofollow">
        <link rel="shortcut icon" href="<%= ResolveUrl("files/images/icons/icon.png")%>" />
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
    </style>
</head>
<body style="direction: rtl; text-align: center; background: url('files/images/background/bg_venue_1.jpg');">
    <form id="form1" runat="server">
    <div style="/* permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ffffff+0,ffffff+100&1+0,0+100;
        white+to+transparent */
background: -moz-linear-gradient(top, rgba(255,255,255,1) 0%, rgba(255,255,255,0) 100%);
        /* ff3.6-15 */
background: -webkit-linear-gradient(top, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%);
        /* chrome10-25,safari5.1-6 */
background: linear-gradient(to bottom, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%);
        /* w3c, ie10+, ff16+, chrome26+, opera12+, safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#00ffffff',GradientType=0 );
        /* ie6-9 */
        padding: 10px; padding-bottom: 300px;">
        <table style="width: 100%;">
            <tr>
                <td>
                    <div style="text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                        border-radius: 5px;">
                        <div>
                            <img alt="منع ورود کاربران درگاه فیلم ایران" src="files/images/icons/userband.png" /></div>
                        <div style="font-family: Titr; font-size: 20px;">
                            علت عدم درسترسی به این صفحه می تواند موارد زیر باشد
                        </div>
                        <div style="font-family: koodak; font-size: 25px;">
                            عدم تائید پروفایل فیلمساز، با نام کاربری وارد شده توسط کارشناسان درگاه فیلم ایران</div>
                        <div style="font-family: koodak; font-size: 25px;">
                            عدم وجود فیلمسازی با نام کاربری وارد شده</div>
                    </div>
                 
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
