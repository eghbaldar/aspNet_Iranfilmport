<%@ Page Language="VB" AutoEventWireup="false" CodeFile="panel.aspx.vb" Inherits="panel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex, nofollow">
    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- mobile Color and Status -->
    <meta name="theme-color" content="#E5DA00">
    <%--Andriod--%>
    <meta name="apple-mobile-web-app-status-bar-style" content="#ffffff">
    <meta name="msapplication-navbutton-color" content="#ffffff">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="apple-touch-icon" sizes="128x128" href="<%= ResolveUrl("~/files/images/icons/iconScreen.png")%>">
    <!-- -->
    <link rel="shortcut icon" href="<%= ResolveUrl("~/files/images/icons/icon.png")%>" />
    <title>درگاه فیلم ایران - پنل گزارش وضعیت فستیوال ها</title>
    <style>
        @font-face
        {
            font-family: 'NazaninB';
            src: url(../../files/font/NAZANB.TTF);
        }
        @font-face
        {
            font-family: 'Titr';
            src: url(../../files/font/TITRBD.TTF);
        }
        @font-face
        {
            font-family: 'koodak';
            src: url(../../files/font/KoodakBold.ttf);
        }
        @font-face
        {
            font-family: 'traffic';
            src: url(../../files/font/TRAFFIC.TTF);
        }
        @font-face
        {
            font-family: 'irsans';
            src: url(../../files/font/irsans.ttf);
        }
        @font-face
        {
            font-family: Samim;
            src: url('../../files/font/Samim-FD.eot');
            src: url('../../files/font/Samim-FD.eot?#iefix') format('FontName-opentype'), url('../../files/font/Samim-FD.woff') format('woff'), url('../../files/font/Samim-FD.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }
        body
        {
            font-family: Samim;
            font-size: 10px;
        }
        .txtLogin
        {
            padding: 10px;
            margin: 3px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-family: Samim;
            text-align: center;
        }
        #dvCaptcha
        {
            margin: 15px auto !important;
            width: auto !important;
            height: auto !important;
            text-align: -webkit-center;
            text-align: -moz-center;
            text-align: -o-center;
            text-align: -ms-center;
        }
    </style>
    <style>
        /* The Modal (background) */
        .modal
        {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        
        /* Modal Content/Box */
        .modal-content
        {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            direction: rtl;
            font-size: 14px;
        }
        
        /* The Close Button */
        .close
        {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        
        .close:hover, .close:focus
        {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Default Statcounter code for Dedicated Panel of IRAN
FILM POR https://iranfilmport.com/panel -->
    <script type="text/javascript">
        var sc_project = 12681235;
        var sc_invisible = 1;
        var sc_security = "f7266365"; 
    </script>
    <script type="text/javascript" src="https://www.statcounter.com/counter/counter.js"
        async></script>
    <noscript>
        <div class="statcounter">
            <a title="Web Analytics" href="https://statcounter.com/" target="_blank">
                <img class="statcounter" src="https://c.statcounter.com/12681235/0/f7266365/1/" alt="Web Analytics"
                    referrerpolicy="no-referrer-when-downgrade"></a></div>
    </noscript>
    <!-- End of Statcounter Code -->
    <!-- The Modal -->
    <asp:Literal ID="lblVersion" runat="server"></asp:Literal>
    <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on the button, open the modal
        function loadMODAL() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
    <!-- End of The Modal -->
    <div>
        <div style="padding: 10px; text-align: center; /* permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#000000+0,f2ff00+100&0+0,0.65+100 */
background: -moz-linear-gradient(top, rgba(0,0,0,0) 0%, rgba(242,255,0,0.65) 100%); /* ff3.6-15 */
background: -webkit-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(242,255,0,0.65) 100%); /* chrome10-25,safari5.1-6 */
background: linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(242,255,0,0.65) 100%); /* w3c, ie10+, ff16+, chrome26+, opera12+, safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a6f2ff00',GradientType=0 );
            /* ie6-9 */">
            <img src="<%= ResolveUrl("~/files/images/logos/logo_1.png")%>" width="100" />
            <br />
            <br />
            Online System of Status of Submissions - سیستم آنلاین وضعیت فستیوال‌های پخش شده
            <br />
            Version 2.3
        </div>
        <div style="padding: 10px;">
            <div style="text-align: center; direction: rtl;">
                <div>
                    <asp:TextBox ID="txtUser" style="direction:ltr;" placeholder="نام کاربری" CssClass="txtLogin" runat="server"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                        ControlToValidate="txtUser" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="txtPass" placeholder="کلمه عبور" CssClass="txtLogin" runat="server"
                        style="direction:ltr;"
                        TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                        ControlToValidate="txtPass" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <div>
                        <asp:Image ID="ImageCaptacha" runat="server" /></div>
                    <div>
                        <asp:TextBox ID="txtCaptcha" placeholder="عدد 7 رقمی امنیتی" CssClass="txtLogin"
                            runat="server" Style="direction: ltr;"></asp:TextBox>
                    </div>
                </div>
                <br />
                <asp:Button Style="padding: 12px;font-family:Koodak;cursor:pointer;border:1px solid #3457b6;
-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;background-color:#a6e0dc" CssClass="btn btn-warning" ID="btnLogin" runat="server"
                    Text="ورود " ValidationGroup="1"/>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div style="padding: 10px; text-align: center; background: -moz-linear-gradient(top, rgba(242,255,0,0.65) 0%, rgba(0,0,0,0) 100%);
        background: -webkit-linear-gradient(top, rgba(242,255,0,0.65) 0%,rgba(0,0,0,0) 100%);
        background: linear-gradient(to bottom, rgba(242,255,0,0.65) 0%,rgba(0,0,0,0) 100%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6f2ff00', endColorstr='#00000000',GradientType=0 );">
        با درگاه فیلم ایران به روز و حرفه ای بمانید
        <br />
        <a href="http://iranfilmport.com">W W W . I R A N F I L M P O R T . C O M </a>
        <br />
        support@iranfilmport.com
        <br />
        <img src="..\files\images\logos\logoSquare.png" width="50" />
    </div>
    </form>
</body>
</html>
