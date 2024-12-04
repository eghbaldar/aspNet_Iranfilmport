<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingSendPreInformation.aspx.vb" Inherits="kingSendPreInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer></script>
    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('dvCaptcha', {
                'sitekey': '<%=ReCaptcha_Key %>',
                'callback': function (response) {
                    $.ajax({
                        type: "POST",
                        url: "contact.aspx/VerifyCaptcha",
                        data: "{response: '" + response + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var captchaResponse = jQuery.parseJSON(r.d);
                            if (captchaResponse.success) {
                                $("[id*=txtCaptcha]").val(captchaResponse.success);
                                $("[id*=rfvCaptcha]").hide();
                            } else {
                                $("[id*=txtCaptcha]").val("");
                                $("[id*=rfvCaptcha]").show();
                                var error = captchaResponse["error-codes"][0];
                                $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                            }
                        }
                    });
                }
            });
        };
    </script>
    <style type="text/css">
        .tbSend {
            width: 100%;
        }

            .tbSend td {
                padding: 5px;
            }

        .context {
            padding: 2px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            background-color: White;
        }

        .T .fr {
            text-align: right;
        }

        .T {
            width: 100%;
            border-collapse: collapse;
            direction: rtl;
        }
            /* Zebra striping */
            .T tr:nth-of-type(odd) {
                background: #eee;
            }

            .T th {
                background: #333;
                color: white;
                font-weight: bold;
            }

            .T td, .T th {
                padding: 6px;
                border: 1px solid #ccc;
                text-align: left;
            }

        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px) {
            .context {
                width: 100%;
            }
            /* Force table to not be like tables anymore */
            .T, thead, .T tbody, .T th, .T td, .T tr {
                display: block;
            }

                /* Hide table headers (but not display: none;, for accessibility) */
                .T thead tr {
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

                .T tr {
                    border: 1px solid #ccc;
                }

                .T td {
                    /* Behave  like a "row" */
                    border: none;
                    border-bottom: 1px solid #eee;
                    position: relative;
                }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side">
        <div class="item-holder" style="direction: rtl;">
            <asp:UpdatePanel UpdateMode="Conditional" runat="server" ID="noCaptcha">
                <ContentTemplate>
                    <div runat="server" id="div_form">
                        <div style="padding: 5px; text-align: justify;">
                            <div style="display:flex;text-align:center;width:100%;justify-content:center;margin-bottom:10px;margin-top:10px;">
                                <a href="https://t.me/Iranfilmportsupport" target="_blank">
                                    <img src="files/images/resource/send-via-telegram.jpg" width="300"/>
                                </a>
                                <a href="mailto:support@iranfilmport.com" target="_blank">
                                <img src="files/images/resource/send-via-email.jpg" width="300"/>
                                    </a>
                            </div>
                            <span style="color: Black; font-weight: normal;">کارگردان
                                                تهیه کننده، نویسنده و یا نماینده محترم اثر، در صورت تمایل 
                                می‌توانید از طریق فرم زیر نسخه بازبینی فیلم و یا فیلمنامه خود
                                                را جهت «پتانسیل سنجی ابتدایی» در اختیار «درگاه فیلم ایران» قرار دهید. همچنین اگر
                                پیش از این، لینک فیلم و یا فیلمنامه را در اختیار کارشناسان شرکت قرار داده اید، با پر کردن فرم زیر فرآیند را تکمیل کنید. 
                                <br />
                                پس از ارسال فرم، کارشناسان شرکت در اسرع وقت با شما در تماس خواهند بود.

                            </span>
                            <br>
                            <span style="color: red; font-weight: normal; font-size: 12px;">توجه (1): اگر پس
                                                از ارسال لینک فیلم یا فیلمنامه از طریق شبکه های مجازی مانند تلگرام، واتس‌اپ و یا
                                                ایمیل فرم را پر نکرده باشید، اثر شما بررسی نخواهد شد. </span>
                            <br />
                            <span style="color: red; font-weight: normal; font-size: 12px;">توجه (2): اگر از طریق
                                                    ارسال پستی فیلم خود را ارسال کرده اید لطفا تصویر برگه‌ی پستی را از طریق شماره‌های
                                                    شرکت ارسال کنید. </span>
                            <br>
                        </div>
                        <div class="Bg">
                            <table class="tbSend">
                                <tr>
                                    <td>
                                        <asp:TextBox CssClass="form-control"
                                            placeholder="نام کاملتان ..."
                                            ID="txtName" runat="server"></asp:TextBox>
                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(اجباری)"
                                            ForeColor="Red" ValidationGroup="1" ControlToValidate="txtNum"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtNum" runat="server"
                                            placeholder="شماره تماس فعال ..."
                                            CssClass="form-control" style="direction:ltr;text-align:left"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(اجباری)"
                                            ForeColor="Red" ValidationGroup="1" ControlToValidate="txtNum"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:DropDownList AutoPostBack="true" CssClass="form-control" Style="padding: 8px; font-size: 12px;"
                                                    ID="cmdHow" runat="server">
                                                    <asp:ListItem Value="0">... یک گزینه را انتخاب کنید ...</asp:ListItem>
                                                    <asp:ListItem>از طریق لینک زیر</asp:ListItem>
                                                    <asp:ListItem> ارسال شده به ایمیل شرکت به نشانی support@iranfilmport.com</asp:ListItem>
                                                    <asp:ListItem>ارسال شده به تلگرام به شماره‌ی 09216343320</asp:ListItem>
                                                    <asp:ListItem Value="واتس‌‍‌اپ به شماره‌ی 09216343320">ارسال شده به واتس‌اپ به شماره‌ی 09216343320</asp:ListItem>
                                                    <asp:ListItem>ارسال شده به تلگرام به شماره‌ی 09020763947</asp:ListItem>
                                                    <asp:ListItem>ارسال شده به واتس‌اپ به شماره‌ی 09020763947</asp:ListItem>
                                                    <asp:ListItem>ارسال شده به تلگرام به شماره‌ی 09332300598</asp:ListItem>
                                                    <asp:ListItem>ارسال شده به واتس‌اپ به شماره‌ی 09332300598</asp:ListItem>
                                                    <asp:ListItem> ارسال شده به دایرکت به پیج اینستاگرام شرکت (@iranfilmport)</asp:ListItem>
                                                    <asp:ListItem>ارسال از طریق پست به نشانی دفتر مرکزی (رشت)</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="1" ForeColor="Red"
                                                    runat="server" ErrorMessage="(اجباری)" ControlToValidate="cmdHow" InitialValue="0"></asp:RequiredFieldValidator>
                                                <div runat="server" id="DivLink" visible="false">
                                                    <table class="style1">
                                                        <tr>
                                                            <td style="font-size: 12px; color: Red;">لینک (Google Drive - Mega - Mediafire) فیلم و یا لینک فیلمنامه خود را در کادر زیر وارد کنید:
                                                                <ul>
                                                                    <li><a href="https://drive.google.com" target="_blank">لینک گوگل درایو: Google Drive</a></li>
                                                                    <li><a href="https://mediafire.com" target="_blank">لینک مدیافایر: MediaFire</a></li>
                                                                    <li><a href="https://mega.io" target="_blank">لینک مگا: Mega</a></li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox CssClass="form-control" placeholder="لینک اثرتان در صورت وجود ..." ID="txtLink" runat="server"></asp:TextBox>
                                                                <asp:Label ID="lblWrongLink" runat="server" ForeColor="Red"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="0" ForeColor="Red"
                                                                    runat="server" ErrorMessage="(اجباری)" ControlToValidate="txtLink"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                    ErrorMessage="(لینک اینترنتی اثرتان را صحیح وارد کنید)" ValidationGroup="0" ForeColor="Red"
                                                                    ControlToValidate="txtLink"
                                                                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 12px; color: Red;">در صورت وجود، کلمه عبور یا پسورد لینک را وارد کنید:
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox CssClass="form-control" placeholder="کلمه عبور در صورت وجود ..." ID="txtPassword" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                    <ProgressTemplate>
                                                        منتظر بمانید ...
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                            <table class="tbSend">
                                <tr>
                                    <td>
                                        <div id="dvCaptcha">
                                        </div>
                                        <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                                        <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="آیا ربات هستید؟" ControlToValidate="txtCaptcha"
                                            runat="server" ForeColor="Red" Display="Dynamic" ValidationGroup="1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Text="ارسال اطلاعات"
                                            CssClass="button"
                                            ValidationGroup="1" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="alert alert-warning" role="alert" runat="server" visible="false" id="Div_success">
                        اطلاعات اثر شما با موفقیت ارسال گردید، در اسرع وقت، کارشناسان پخش درگاه فیلم ایران
                                        با شما تماس خواهند گرفت.
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script>
        function showAlert(title, msg) {
            Swal.fire({
                title: title,
                text: msg,
                icon: 'info',
                confirmButtonColor: '#ff9100',
                confirmButtonText: 'متوجه شدم'
            });
        }
    </script>
</asp:Content>

