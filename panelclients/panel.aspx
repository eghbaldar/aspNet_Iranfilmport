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

    <link href="../files/sweetalert/sweetalert2.min.css" />
    <script type="text/javascript" src="../files/sweetalert/sweetalert2.all.min.js"></script>
    <script type="text/javascript" src="../files/sweetalert/sweetalert2.min.js"></script>

    <style>
        @font-face {
            font-family: 'NazaninB';
            src: url(../../files/font/NAZANB.TTF);
        }

        @font-face {
            font-family: 'Titr';
            src: url(../../files/font/TITRBD.TTF);
        }

        @font-face {
            font-family: 'koodak';
            src: url(../../files/font/KoodakBold.ttf);
        }

        @font-face {
            font-family: 'traffic';
            src: url(../../files/font/TRAFFIC.TTF);
        }

        @font-face {
            font-family: 'irsans';
            src: url(../../files/font/irsans.ttf);
        }

        @font-face {
            font-family: Samim;
            src: url('../../files/font/Samim-FD.eot');
            src: url('../../files/font/Samim-FD.eot?#iefix') format('FontName-opentype'), url('../../files/font/Samim-FD.woff') format('woff'), url('../../files/font/Samim-FD.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: Samim;
            font-size: 10px;
        }

        .txtLogin {
            padding: 10px;
            margin: 3px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-family: Samim;
            text-align: center;
        }

        .txtPhone {
            padding: 10px;
            margin: 3px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-family: Samim;
            text-align: center;
            width: 30px;
            height: 30px;
            font-size: 30px;
        }

        #dvCaptcha {
            margin: 15px auto !important;
            width: auto !important;
            height: auto !important;
            text-align: -webkit-center;
            text-align: -moz-center;
            text-align: -o-center;
            text-align: -ms-center;
        }

        .buttonEnter {
            font-family: Samim;
            display: inline-block;
            padding: 15px 25px;
            font-size: 24px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #F9DF46;
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #999;
        }

            .buttonEnter:hover {
                background-color: #FFC278
            }

            .buttonEnter:active {
                background-color: #E5DA00;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }

        .buttonPhone {
            font-family: Samim;
            display: inline-block;
            padding: 7px 14px;
            font-size: 12px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #848484;
            background-color: #f8f8f8;
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #999;
        }

            .buttonPhone:hover {
                background-color: #ededed
            }

            .buttonPhone:active {
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }
    </style>
    <style>
        /* The Modal (background) */
        .modal {
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
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            direction: rtl;
            font-size: 14px;
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover, .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
    </style>

    <script type="text/javascript">

        function myAlert(text) {
            Swal.fire({
                title: 'پیام سیستمی!',
                text: text,
                icon: 'error',
                confirmButtonColor: '#ffa200',
                confirmButtonText: 'متوجه شدم!',
            });
        }
    </script>
    

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
                        referrerpolicy="no-referrer-when-downgrade"></a>
            </div>
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
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a6f2ff00',GradientType=0 ); /* ie6-9 */">
                <img src="<%= ResolveUrl("~/files/images/logos/logo_1.png")%>" width="100" />
                <br />
                <br />
                Online Status System of Submissions  - سیستم آنلاین وضعیت فستیوال‌های پخش شده
            <br />
                <asp:Label ID="lblPanelVersion" runat="server"></asp:Label>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div style="padding: 10px;">
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                            <asp:View ID="View1" runat="server">
                                <div style="text-align: center; direction: rtl;">
                                    <div>
                                        <asp:TextBox ID="txtUser" Style="direction: ltr;" placeholder="نام کاربری" CssClass="txtLogin" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                            ControlToValidate="txtUser" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtPass" placeholder="کلمه عبور" CssClass="txtLogin" runat="server"
                                            Style="direction: ltr;"
                                            TextMode="Password"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                            ControlToValidate="txtPass" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </div>
                                    <div>
                                        <div>
                                            <asp:Image ID="ImageCaptacha" runat="server" />
                                        </div>
                                        <div>
                                            <asp:TextBox ID="txtCaptcha" placeholder="عدد 7 رقمی امنیتی" CssClass="txtLogin"
                                                runat="server" Style="direction: ltr;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <asp:Button CssClass="buttonEnter" ID="btnLogin" runat="server"
                                        Text="ورود با نام کاربری" ValidationGroup="1" />
                                    <br />
                                    <br />
                                    <asp:Button CssClass="buttonPhone" ID="btnChangeToPhone" runat="server"
                                        Text="ارسال نام کاربری و کلمه عبور" ValidationGroup="1" />
                                    <br />
                                </div>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <div style="text-align: center; direction: ltr;">
                                    <a onclick="get()">asd</a>
                                    <div>
                                        <asp:TextBox ID="txtPhone1" Style="direction: ltr; background-color: #f8f8f8;"
                                            Text="0"
                                            ReadOnly="true"
                                            CssClass="txtPhone" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtPhone2" Style="direction: ltr; background-color: #f8f8f8;"
                                            Text="9"
                                            ReadOnly="true"
                                            CssClass="txtPhone" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="txtPhone3" name="txtPhone3" Style="direction: ltr;"
                                                CssClass="txtPhone" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="txtPhone4" Style="direction: ltr;"
                                                CssClass="txtPhone" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="txtPhone5" Style="direction: ltr;"
                                                CssClass="txtPhone" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtPhone6" Style="direction: ltr;"
                                            CssClass="txtPhone" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtPhone7" Style="direction: ltr;"
                                            CssClass="txtPhone" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtPhone8" Style="direction: ltr;"
                                            CssClass="txtPhone" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtPhone9" Style="direction: ltr;"
                                            CssClass="txtPhone" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtPhone10" Style="direction: ltr;"
                                            CssClass="txtPhone" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtPhone11" Style="direction: ltr;"
                                            CssClass="txtPhone" runat="server"></asp:TextBox>

                                        <div style="color: red; font-size: 15px;">
                                            توجه فرمائید: اطلاعات تنها به شماره ای ارسال میگردد که در سامانه ثبت و شخص به عنوان نماینده رسمی اثر معرفی شده باشد.
                                        </div>
                                        <br />
                                    </div>
                                    <div>
                                        <div>
                                            <asp:Image ID="ImageCaptchaPhone" runat="server" />
                                        </div>
                                        <div>
                                            <asp:TextBox ID="TextBox3" placeholder="عدد 7 رقمی امنیتی" CssClass="txtLogin"
                                                runat="server" Style="direction: ltr;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <asp:Button CssClass="buttonEnter" ID="Button1" runat="server"
                                        Text="دریافت" ValidationGroup="1" />
                                    <br />
                                    <br />
                                    <asp:Button CssClass="buttonPhone" ID="Button2" runat="server"
                                        Text="بازگشت به بخش ورود" ValidationGroup="1" />
                                    <br />
                                </div>
                            </asp:View>
                        </asp:MultiView>
                        <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel" ID="updateProgress" runat="server">
                            <ProgressTemplate>
                                <div style="position: fixed; text-align: center; height: 100%; justify-content: center; align-items: center; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                    <asp:Image ID="imgUpdateProgress" runat="server"
                                        ImageUrl="~/files/images/icons/iranfilmportLoading.gif" AlternateText="Loading ..."
                                        CssClass="imgLoading"
                                        ToolTip="Loading ..." />
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <br />
        <br />
        <div style="padding: 10px; text-align: center; background: -moz-linear-gradient(top, rgba(242,255,0,0.65) 0%, rgba(0,0,0,0) 100%); background: -webkit-linear-gradient(top, rgba(242,255,0,0.65) 0%,rgba(0,0,0,0) 100%); background: linear-gradient(to bottom, rgba(242,255,0,0.65) 0%,rgba(0,0,0,0) 100%); filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6f2ff00', endColorstr='#00000000',GradientType=0 );">
            با درگاه فیلم ایران به روز و حرفه ای بمانید
        <br />
            <a href="http://iranfilmport.com">W W W . I R A N F I L M P O R T . C O M </a>
            <br />
            support@iranfilmport.com
        <br />
            <img src="..\files\images\logos\logoSquare.png" width="50" />
        </div>

                    <script type="text/javascript">
                        function txtInputChanged(inputValue) {
                            alert(inputValue);
                        }
        </script>
    </form>
</body>
</html>
