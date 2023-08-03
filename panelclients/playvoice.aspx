<%@ Page Language="VB" AutoEventWireup="false" CodeFile="playvoice.aspx.vb" Inherits="panelclients_playvoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex, nofollow">
    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="<%= ResolveUrl("~/files/images/icons/icon.png")%>" />
    <title>درگاه فیلم ایران - فایل صوتی</title>
    <style>
        @font-face {
            font-family: Samim;
            src: url('../../../files/font/Samim-FD.eot');
            src: url('../../../files/font/Samim-FD.eot?#iefix') format('FontName-opentype'), url('../../../files/font/Samim-FD.woff') format('woff'), url('../../../files/font/Samim-FD.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        body {
            background-color: #E5DA00;
            font-family: Samim;
            line-height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center; font-size: 11px;">
        <div>
            <img src="../../../files/images/logos/logoSquare.png" width="100px" />
        </div>
        <div>
            برای شنیدن فایل صوتی لطفا روی دکمه پلی کلیک کنید
        </div>
        <div>
            <audio controls>
                <source src='<%= String.Format("../../../files/clientsStaff/ticketVoices/{0}.mp3", Page.RouteData.Values("file")) %>' type="audio/ogg">
                <source src='<%= String.Format("../../../files/clientsStaff/ticketVoices/{0}.ogg", Page.RouteData.Values("file")) %>' type="audio/mpeg">
                Your browser does not support the audio element.
            </audio>
        </div>
        <div>
            «درگاه فیلم ایران»
        </div>
    </form>
</body>
</html>
