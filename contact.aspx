<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="contact.aspx.vb" Inherits="contact" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
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
    <style>
        .txt
        {
            width: 50%;
            margin: 3px;
            padding: 3px;
            border: 1px solid #ccc; /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#fcfff4+0,e9e9ce+100;Wax+3D+%232 */
            background: #eee;
        }
        .txt:hover
        {
            background-color: #DBEAF9;
        }
        table.steelBlueCols
        {
            border: 4px solid #555555;
            background-color: #555555;
            width: 800px;
            text-align: center;
            border-collapse: collapse;
            text-align: right;
        }
        table.steelBlueCols td, table.steelBlueCols th
        {
            border: 1px solid #555555;
            padding: 5px 10px;
        }
        table.steelBlueCols tbody td
        {
            font-size: 14px;
            text-justify: inter-word;
            text-align: justify;
            font-family: tahoma;
            color: #FFFFFF;
        }
        table.steelBlueCols td:nth-child(even)
        {
            background: #398AA4;
        }
        table.steelBlueCols thead
        {
            background: #398AA4;
            border-bottom: 10px solid #398AA4;
        }
        table.steelBlueCols thead th
        {
            font-size: 14px;
            color: #FFFFFF;
            text-align: right;
            border-left: 2px solid #398AA4;
        }
        table.steelBlueCols thead th:first-child
        {
            border-left: none;
        }
        
        table.steelBlueCols tfoot td
        {
            font-size: 14px;
        }
        table.steelBlueCols tfoot .links
        {
            text-align: right;
        }
        table.steelBlueCols tfoot .links a
        {
            display: inline-block;
            background: #FFFFFF;
            color: #398AA4;
            padding: 2px 8px;
            border-radius: 5px;
        }
        li
        {
            list-style-type: circle;
        }
    </style>
    <style>
        .T .fr
        {
            text-align: right;
            font-family: Samim;
        }
        .T
        {
            width: 100%;
            border-collapse: collapse;
            direction: rtl;
        }
        /* Zebra striping */
        .T tr:nth-of-type(odd)
        {
            background: #eee;
        }
        .T th
        {
            background: #333;
            color: white;
            font-weight: bold;
        }
        .T td, .T th
        {
            padding: 6px;
            border: 1px solid #ccc;
            text-align: left;
        }
        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px)
        {
            .txt
            {
                width: 100%;
            }
            /* Force table to not be like tables anymore */
            .T, .T thead, .T tbody, .T th, .T td, .T tr
            {
                display: block;
            }
        
            /* Hide table headers (but not display: none;, for accessibility) */
            .T thead tr
            {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
        
            .T tr
            {
                border: 1px solid #ccc;
            }
        
            .T td
            {
                /* Behave  like a "row" */
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
            }
        
        }
    </style>
    <style>
        .imgFooter
        {
            filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#grayscale"); /* Firefox 3.5+ */
            filter: gray; /* IE6-9 */
            -webkit-filter: grayscale(100%); /* Chrome 19+ & Safari 6+ */
        }
        
        .imgFooter:hover
        {
            filter: none;
            -webkit-filter: grayscale(0%);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_8.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <span style="font-family: Titr;">تماس با ما</span>
                </h1>
            </div>
        </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">

        <!-- The Modal -->
    <style>
        .modal1
        {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 999; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%;
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        /* Modal Content/Box */
        .modal-content1
        {
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            font-family: Samim;
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            direction: rtl;
            font-size: 14px;
        }
        .modalDistributionTitr
        {
            font-family: Titr;
            font-size: 25px;
            color: #0096bf;
        }
        .modalDistributionTitr2
        {
            font-size: 18px;
            color: #32a2a8;
        }
        .modalDistributionCell
        {
            font-size: 20px;
            color: black;
            padding: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin: 4px; /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#fefcea+0,f1da36+100;Gold+3D */
            background: rgb(254,252,234); /* Old browsers */
            background: -moz-linear-gradient(top, rgba(254,252,234,1) 0%, rgba(241,218,54,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, rgba(254,252,234,1) 0%,rgba(241,218,54,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, rgba(254,252,234,1) 0%,rgba(241,218,54,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefcea', endColorstr='#f1da36',GradientType=0 ); /* IE6-9 */
        }
        .modalDistributionCell:hover
        {
            /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#fefcea+0,70b9f4+100 */
            background: rgb(254,252,234); /* Old browsers */
            background: -moz-linear-gradient(top, rgba(254,252,234,1) 0%, rgba(112,185,244,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, rgba(254,252,234,1) 0%,rgba(112,185,244,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, rgba(254,252,234,1) 0%,rgba(112,185,244,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefcea', endColorstr='#70b9f4',GradientType=0 ); /* IE6-9 */
        }
        .close1
        {
            font-size: 20px;
            cursor: pointer;
            color: Black;
        }
        .modalDistributionTClickCell
        {
            color: #c2c2c2;
            font-size: 14px;
        }
    </style>
    <div id="myModalDistribution" class="modal1">
        <!-- Modal content -->
        <div class="modal-content1">
            <span class="close1">&times;</span>
            <div style="text-align: center;">
                <br />
                <span class="modalDistributionTitr2">هم اکنون با یکی از کارشناسان زیر تماس حاصل فرمائید:</span>
                <br />
                <div class="modalDistributionTClickCell">
                    (یکی از شماره‌ها را لمس و یا کلیک کنید)</div>
                <a href="tel:09216343320">
                    <div class="modalDistributionCell">
                        0921-634-3320</div>
                </a><a href="tel:09020763947">
                    <div class="modalDistributionCell">
                        0902-076-3947</div>
                </a><a href="tel:09332300598">
                    <div class="modalDistributionCell">
                        0933-230-0598</div>
                </a>
                <div class="modalDistributionTClickCell">
                    «درگاه فیلم ایران»</div>
                <div class="modalDistributionTClickCell">
                    تخصصی‌ترین مرکز پخش و ارسال فیلم به فستیوال‌های بین‌المللی</div>
            </div>
        </div>
    </div>
    <script>
            // Get the modal
            var modal1 = document.getElementById("myModalDistribution");

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close1")[0];

            // When the user clicks on the button, open the modal
            function loadModalDistribution() {
                modal1.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal1.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal1) {
                    modal1.style.display = "none";
                }
            }
    </script>
    <!-- End of The Modal -->

        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div class="left-side">
                        <div class="item-holder" style="direction: rtl;">
                            <h4 style="font-family: titr;">
                                جهت تماس با تیم پشتیبانی درگاه فیلم ایران از شماره ها و پست الکترونیکی مرتبط با
                                موضوعتان استفاده کنید</h4>
                            <br />
                            <div>
                                <table class="T">
                                    <tr>
                                        <td class="fr">
                                            کارشناس یک درگاه فیلم ایران
                                        </td>
                                        <td style="text-align: left;">
                                            0921-634-3320
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fr">
                                            کارشناس دو درگاه فیلم ایران
                                        </td>
                                        <td style="text-align: left;">
                                            0902-076-3947
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fr">
                                            کارشناس سه و روابط عمومی درگاه فیلم ایران
                                        </td>
                                        <td style="text-align: left;">
                                            0933-230-0598
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fr">
                                            مسئول دفتر تهران
                                            (این شماره جهت مشاوره نمی‌باشد)
                                        </td>
                                        <td style="text-align: left;">
                                            0912-280-3785
                                        </td>
                                    </tr>
                                    
                                    <%--<tr><td>کارشناس بخش پخش فیلم و مشاوره </td><td style="text-align:left;">0911-111-111</td></tr>
                <tr><td>کارشناس بخش پخش و مشاوره </td><td style="text-align:left;">0911-111-111</td></tr>--%>
                                </table>
                                <p style="color: Red; font-size: 12px;">
                                    ساعات مجاز جهت برقراری ارتباط با کارشناسان: 9 صبح الی 14 | 16 الی 21</p>
                                <table class="T">
                                    <tr>
                                        <td class="fr">
                                            پست الکترونیکی بخش پشتیبانی
                                        </td>
                                        <td style="text-align: left;">
                                            support (at) iranfilmport.com
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fr">
                                            پست الکترونیکی بخش فنی
                                        </td>
                                        <td style="text-align: left;">
                                            developing (at) iranfilmport.com
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fr">
                                            پست الکترونیکی بخش مدیریت
                                        </td>
                                        <td style="text-align: left;">
                                            manager (at) iranfilmport.com
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <h4 style="font-family: titr;">
                                شبکه‌های مجازی</h4>
                            <br />
                            <div style="text-align: center; box-shadow: 2px 2px 8px 8px #F4F4F4; padding: 8px;">
                                <a href="http://fb.com/iranfilmport" target="_blank">
                                    <img class="imgFooter" alt="لوگو فسیبوک" src="files/images/icons/fb.png" border="0" /></a>
                                <a href="http://instagram.com/iranfilmport" target="_blank">
                                    <img class="imgFooter" alt="لوگو اینستاگرام" src="files/images/icons/insta.png" border="0" /></a>
                                <a href="http://twitter.com/iranfilmport" target="_blank">
                                    <img class="imgFooter" alt="لوگو توئیتر" src="files/images/icons/tw.png" border="0" /></a>
                                <a href="http://www.t.me/iranfilmport" target="_blank">
                                    <img class="imgFooter" alt="لوگو تلگرام" src="files/images/icons/teleg.png" border="0" /></a>
                                <a href="http://aparat.com/iranfilmport" target="_blank">
                                    <img class="imgFooter" alt="لوگو آپارات" src="files/images/icons/aparat.png" border="0"
                                        width="55" /></a> <a href="http://vimeo.com/iranfilmport" target="_blank">
                                            <img class="imgFooter" alt="لوگو وی می او" src="files/images/icons/vimeo.png" border="0"
                                                width="55" /></a>
                            </div>
                            <br />
                            <h4 style="font-family: titr;">
                                آدرس دفاتر</h4>
                            <br />
                            <div>
                                <table class="T">
                                    <tr>
                                        <td class="fr">
                                           دفتر رشت
                                        </td>
                                        <td class="fr">
                                           مدیر مسئول: طاهره پیوسته - 09020763947
                                        </td>
                                    </tr>
                                                                        <tr>
                                        <td class="fr">
                                           دفتر ترکیه
                                        </td>
                                        <td class="fr">
                                           مدیر مسئول: بهمن رادان فر - شماره تماس: 0905550016006 - Address: Göçerler Mah . 5380 SOK . NO:12 . LOCA Sit . B.Blok . D:5 . Kepez
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fr">
                                            دفتر تهران (مرکزی)
                                        </td>
                                        <td class="fr">
                                            مدیر مسئول: آرش بابکی - آدرس: تهران - میدان آرژانتین - خیابان الوند - کوچه برمک - پلاک 4 - واحد 2 - شماره تماس: 09122803785
                                        </td>
                                    </tr>


                                    <tr>
                                        <td class="fr">
                                            دفتر زنجان
                                        </td>
                                        <td class="fr">
                                          زنجان، دروازه ی ارک ، طبقه ی بالای داروخانه ی رازی، سینماگران جوان (09193453936 - مدیر مسئول: سید حمید کرمانی)
                                        </td>
                                    </tr>


                                    <tr>
                                        <td class="fr">
                                            دفتر کرمانشاه
                                        </td>
                                        <td class="fr">
                                           مدیر مسئول: بنیامین ایثاری - 09216828117
                                        </td>
                                    </tr>


                                    <tr>
                                        <td class="fr">
                                            دفتر یزد
                                        </td>
                                        <td class="fr">
                                            مدیر مسئول: امیر جلالی - 09131524547
                                        </td>
                                    </tr>

                                </table>
                                <p style="color: Red; font-size: 12px;">
                                    دی وی دی فیلم و سایر متریال های مورد نیاز را فقط به آدرس دفتر مرکزی ارسال کنید.</p>
                            </div>
                            <br />
                            <div>
                                <p style="font-family: Titr;">
                                    فرم تماس با ما</p>
                                <div runat="server" id="div_form" style="box-shadow: 2px 2px 8px 8px #F4F4F4; padding: 8px;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="font-family: irsans; width: 10%;">
                                                دپارتمان:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cmd_category" runat="server" CssClass="txt" Width="192" Style="font-family: NazaninB;">
                                                    <asp:ListItem Value="0">دپارتمان پخش</asp:ListItem>
                                                    <asp:ListItem Value="1">دپارتمان تحویل فیلم</asp:ListItem>
                                                    <asp:ListItem Value="2">دپارتمان فنی سایت</asp:ListItem>
                                                    <asp:ListItem Value="3">دپارتمان مدیریت</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: irsans; width: 10%;">
                                                نام:
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="txt" ID="txtName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                                    ErrorMessage="الزامی است" Font-Names="tahoma" Font-Size="X-Small" ForeColor="#FF3300"
                                                    ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: irsans; width: 10%;">
                                                موضوع:
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="txt" ID="txtSubject" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSubject"
                                                    ErrorMessage="الزامی است" Font-Names="tahoma" Font-Size="X-Small" ForeColor="#FF3300"
                                                    ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: irsans; width: 10%;">
                                                همراه:<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                                    ControlToValidate="txtPhone" ErrorMessage="*" ForeColor="#FF3300" ValidationExpression="09(0[0-09(0[0-9]|1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}"
                                                    ValidationGroup="1"></asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPhone" runat="server" CssClass="txt" Style="direction: ltr; text-align: left;"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone"
                                                    ErrorMessage="الزامی است" Font-Names="tahoma" Font-Size="X-Small" ForeColor="#FF3300"
                                                    ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: irsans; width: 10%;">
                                                ایمیل:<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                    ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    ValidationGroup="1"></asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmail" Style="direction: ltr; text-align: left;" runat="server"
                                                    CssClass="txt"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail"
                                                    ErrorMessage="الزامی است" Font-Names="tahoma" Font-Size="X-Small" ForeColor="#FF3300"
                                                    ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: irsans; width: 10%;">
                                                متن:<br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtText"
                                                    ErrorMessage="الزامی است" Font-Names="tahoma" Font-Size="X-Small" ForeColor="#FF3300"
                                                    ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="txt" ID="txtText" runat="server" Height="93px" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: irsans; width: 10%;">
                                                کد امنیتی:
                                            </td>
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
                                            </td>
                                            <td>
                                                <asp:Button ID="btnSubmit" runat="server" Text="ارسال پیام" Style="border: 1px solid #ccc;
                                                    background-color: #06AFFF; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                    border-radius: 5px; color: White;" ValidationGroup="1" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div runat="server" id="div_success" style="color: Green; font-family: Samim;" visible="false">
                                    پیام شما با موفقیت ارسال گردید، در اسرع وقت، دپارتمان مورد نظر جواب مناسب را ارسال
                                    خواهد کرد.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>

</asp:Content>
