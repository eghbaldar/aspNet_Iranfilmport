<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sendinformation.aspx.vb" Inherits="sendinformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>فرم‌های پیش از قرارداد - نسخه آنلاین</title>
    <meta name="robots" content="noindex, nofollow" />
    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- mobile Color and Status -->
    <meta name="theme-color" content="#E5DA00" />
    <%--Andriod--%>
    <meta name="apple-mobile-web-app-status-bar-style" content="#ffffff" />
    <meta name="msapplication-navbutton-color" content="#ffffff" />
    <meta name="mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link rel="apple-touch-icon" sizes="128x128" href="<%= ResolveUrl("~/files/images/icons/iconScreen.png")%>" />
    <style type="text/css">
        @font-face {
            font-family: Titr;
            src: url(../content/font/TITR.TTF);
        }

        @font-face {
            font-family: koodak;
            src: url(files/font/KoodakBold.ttf);
        }

        @font-face {
            font-family: irsans;
            src: url(files/font/irsans.ttf);
        }

        @font-face {
            font-family: Samim;
            src: url(files/font/Samim-FD.ttf);
        }

        html {
            margin: 0;
        }

        body {
            direction: rtl;
            padding: 0;
            margin: 0;
            font-family: Samim;
            width: 100%;
        }

        #body {
            text-align: center;
            width: 400px;
            position: center;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            margin-top: 20px;
        }


        .txtFa {
            padding: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 2px solid #ffb700;
            text-align: center;
            font-family: Samim;
            direction: ltr;
            width: 300px;
            color:black;
        }

        .txtEn {
            color:black;
            padding: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 2px solid #ffb700;
            text-align: center;
            font-family: Samim;
            direction: rtl;
            width: 300px;
        }

        .btn {
            margin: 0px;
            padding: 10px;
            background-color: #ffb700;
            border: 0;
            cursor: pointer;
            width: 100%;
            font-family: Samim;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: yellow;
        }
        .divForms {
            text-align: center;
            font-size: 13px;
            line-height: 300%;
        }
        .Warning {
            color: red;
            line-height: initial;
        }
        .rb {
            zoom: 500%
        }
        .footer {
            height: 100%;
            font-family: Samim;
            font-size: 10px;
            padding: 10px;
            text-align: center; /* permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#fefcea+0,efe07a+51,ffffff+100 */
            background: #fefcea; /* old browsers */
            background: -moz-linear-gradient(top, #fefcea 0%, #efe07a 51%, #ffffff 100%); /* ff3.6-15 */
            background: -webkit-linear-gradient(top, #fefcea 0%,#efe07a 51%,#ffffff 100%); /* chrome10-25,safari5.1-6 */
            background: linear-gradient(to bottom, #fefcea 0%,#efe07a 51%,#ffffff 100%); /* w3c, ie10+, ff16+, chrome26+, opera12+, safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefcea', endColorstr='#ffffff',GradientType=0 ); /* ie6-9 */
        }

        @media (max-width: 400px) {
            #body {
                padding: 20px;
                width: 300px;
            }
            .txtFa {
                width: 250px;
                font-size:30px;
            }            
            .txtEn {
                width: 250px;
                font-size:30px;
            }
            .btn {
                padding-top:20px;
                padding-bottom:20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="body">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:HiddenField ID="HiddenFieldStep" Value="0" runat="server" />
                    <div>

                        <img src="files/images/logos/logoSquare.png"
                            width="100" />
                        <div>
                            فرم‌های پیش از قرارداد
                </br>
                <span style="font-size: 10px;">
                    <asp:Label ID="lblSteps" runat="server" Text="(نسخه آنلاین)"></asp:Label></span>
                        </div>
                    </div>

                    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                        <asp:View ID="V_First" runat="server">
                            <div>

                                <div style="font-family: Samim;">

                                    <div>
                                        توجه فرمائید که به منظور سرعت و راحتی حال کارشناسان امور قراردادهای درگاه فیلم ایران، پر شدن
                    فرم‌ها بصورت فایلی (ورد) مناسب تر است. بنابراین در صورت امکان بجای روش آنلاین، بصورت فیزیکی
                    فایل‌ها را از لینک‌های زیر دانلود و پس از پر کردن برای کارشناسان شرکت ارسال کنید. در غیر این صورت، میتوانید
                    از فرم آنلاین استفاده کنید.
                                    </div>
                                    <div style="">
                                        <a href="http://iranfilmport.com/files/uploadFiles/form_film.docx" target="_blank"
                                            style="text-decoration: none; font-size: 11px;">(دانلود فایل ورد مشخصات فیلم)</a>
                                        <br />
                                        <a href="http://iranfilmport.com/files/uploadFiles/form_crew.docx" target="_blank"
                                            style="text-decoration: none; font-size: 11px;">(دانلود فایل ورد عوامل فیلم)</a>
                                    </div>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Name" runat="server">
                            <div class="divForms">
                                <div>
                                    نام فارسی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtNameFa" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    نام فینگلیش:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtNameFinglish" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    نام انگلیسی:
                                    <br />
                                    <span class="Warning">(انتخاب این نام، به منزله ثبت در فرم های فستیوال بوده و پس از ثبت نام به هیچ عنوان قابل ویرایش نمی باشد. در انتخاب و ترجمه صحیح نام اثر خود دقت لازم را داشته باشید)
                                    </span>
                                </div>
                                <div>
                                    <asp:TextBox ID="txtNameEn" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>

                                <div>
                                    داستانی، مستند، انیمیشن یا تجربی:
                                    <br />
                                </div>
                                <div>
                                    <asp:DropDownList ID="cmdGenre" CssClass="txtFa" runat="server">
                                        <asp:ListItem Selected="True" Text="داستانی" Value="داستانی" />
                                        <asp:ListItem Text="مستند" Value="مستند" />
                                        <asp:ListItem Text="انیمیشن" Value="انیمیشن" />
                                        <asp:ListItem Text="تجربی" Value="تجربی" />
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </asp:View>

                        <asp:View ID="V_Time" runat="server">
                            <div class="divForms">
                                <span class="Warning">فیلم های بالای 30 دقیقه ملزم به پر کردن رضایتنامه فیلم های بالای 30 دقیقه هستند.
                                </span>
                                <div>
                                    دقیقه:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtTime_Minutes" Text="00" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    ثانیه:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtTIme_Seconds" Text="00" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_MainSpecificaations" runat="server">
                            <div class="divForms">
                                <div>
                                    زبان اصلی:                               
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_Language" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    زبان زیرنویس:                            
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmSubtitle" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    کشور فیلمبرداری شده:                             
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_Country" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    تاریخ ساخت (سال روز ماه):                              
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmProductionDate" 
                                        text="0000/00/00"
                                        CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    ورژن تدوین: (نهایی یا راف):                           
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmVersion" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    Aspect ratio:                             
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmAscept" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    رزولوشن:                          
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmResolution" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    فرمت و کدک:                            
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmFormat" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    برند دوربین:                         
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmCamera" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    رنگی یا سیاه سفید:                          
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmColor" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    وضعیت صدا: (5.1 - stereo- mono):                            
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmSound" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    بیت ریت:                              
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmBitrates" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    استاندارد، اسکوپ یا سینمامورفیک:                              
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmScope" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    تم یا سبک:                           
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmTheme" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    گونه یا ژانر:                              
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmGenre" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    سایت رسمی فیلم:                           
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmWebsite" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    فیسبوک فیلم:                               
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmFacebook" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    توئیتر فیلم:                             
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmTwitter" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    اینستاگرام فیلم:                            
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMainSpecifications_FilmInstagram" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>

                            </div>
                        </asp:View>

                        <asp:View ID="V_Method" runat="server">
                            <div class="divForms">
                                <div style="line-height: normal; text-align: justify;">

                                    <ul>

                                        <li>با توجه به تخصصی بودن حوزه ی پخش و ارسال اثر (فیلم و یا فیلمنامه)، صاحبان مادی و معنوی اثر (تهیه کنندگان و یا کارگردانان) با آگاهی و رضایت کامل، مایل هستند تا حق پخش و ارسال اثر خود را به شرکت «درگاه فیلم ایران» واگذار کنند. این واگذاری به معنای اعتماد در تصمیم گیری ها و انتخاب جشنواره ها و رویدادهای بین المللی است، از این رو؛ کارشناسان «درگاه فیلم ایران» مختار هستند طبق استراتژی مشخص شده، اثر را به هر جشنواره و رویداد بین المللی ای که صلاح اثر در آن  باشد، ارسال کنند.
                                            <ul>

                                                <li>صاحبان مادی و معنوی اثر تنها میتوانند پیشنهاد خود را در خصوص جشنواره ها مطرح کنند که میتواند توسط کارشناسان «درگاه فیلم ایران» تائید و یا رد گردد.</li>
                                                <li style="color: red;">صاحبان مادی و معنوی اثر آگاهند که هیچ تضمینی در موفقیت اثر، در جشنواره‌ها و رویدادهای بین المللی وجود نخواهد داشت. اثر(فیلم یا فیلمنامه) محصولی هنری و نسبی است که بدون شک، قضاوت اثر را در قالب سلیقه و نسبی گرایی محک خواهد زد. از اینرو؛ افرادی که تضمین ارائه می‌دهند؛ یا کلاهبردارند و یا بی دانش! گفتنی است که این امر، مانعی برای تلاش «درگاه فیلم ایران» در راستای موفقیت حداکثری اثر نخواهد بود.</li>
                                            </ul>

                                        </li>

                                    </ul>

                                </div>
                                <div>
                                    <table style="width: 100%; border: 5px dashed #ccc; -moz-border-radius: 15px; -webkit-border-radius: 15px; border-radius: 15px; font-size: 18px;">
                                        <tr>
                                            <td>•	موافق با روند پخش و ارسال اثر با توجه به مطالب فوق هستم</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb" GroupName="rbMethod" ID="rbMethod_True" Text="" Checked="true" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>•	موافق با روند پخش و
                                             ارسال اثر با توجه به مطالب فوق نبوده و <span style="font-weight: bolder; color: red;">مایل به منعقد شدن قرارداد نیستم</span></td>


                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton GroupName="rbMethod" CssClass="rb"
                                                    ID="rbMethod_False" Text="" runat="server" /></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_represented" runat="server">
                            <div class="divForms">
                                <span class="Warning">**این قسمت اختیاری است**
                                    <br />
                                </span>
                                <span>تهیه کننده (فیلمساز و یا نماینده فیلم) این کُد را از شخص فیلمسازی که وی را به شرکت «درگاه فیلم ایران» معرفی کرده است، دریافت و وارد کند. وارد شدن این کُد الزامی نیست و صرفا در قراردادهای بعدی مُعرف با «درگاه فیلم ایران» تاثیر خواهد گذاشت.
                                </span>
                                <div>
                                    کد مُعرف:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtRepresented_Code" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>

                            </div>
                        </asp:View>

                        <asp:View ID="V_Festival_D" runat="server">
                            <div class="divForms">
                                <div style="line-height: normal; text-align: justify;">
                                    <div>
                                        «درگاه فیلم ایران» بطور قطع، با ارسال فیلم به این دسته از فستیوال ها مخالف است. علت این مخالفت بی اعتباری فستیوال ها می باشد. منتها، از آنجایی که پذیرش فیلم در این فستیوال ها بسیار ساده تر است، گاها فیلمساز علاقه به شرکت در این فستیوال ها داشته، چرا که با استفاده از این حضور و جوایز میتواند بعنوان رزومه کاری خود استفاده کند.

                                    </div>
                                    <div>
                                        این فستیوال ها شامل فستیوال های آنلاین، ماهانه و یک ساله‌ی بی اعتبار می باشد.
                                    </div>

                                </div>
                                <div>
                                    <table style="width: 100%; border: 5px dashed #ccc; -moz-border-radius: 15px; -webkit-border-radius: 15px; border-radius: 15px; font-size: 18px;">
                                        <tr>
                                            <td>•	 موافق ارسال فیلمم به این دسته از فستیوال ها هستم</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb" GroupName="rbFestivalD"
                                                    ID="rbFestivalD_True" Text="" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                            •	مخالف ارسال فیلمم به این دسته از فستیوال ها هستم

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton Checked="true" GroupName="rbFestivalD" CssClass="rb"
                                                    ID="rbFestivalD_False" Text="" runat="server" /></td>
                                        </tr>
                                    </table>
                                    <div class="Warning">
                                        در صورت موافقت، فیلمساز و یا تهیه کننده، ملزم به پر کردن رضایت نامه جهت ارسال به این دست از فستیوال‌ها می باشد.
                                    </div>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Fees" runat="server">
                            <div class="divForms">
                                <div style="line-height: normal; text-align: justify;">
                                    <div>
                                        «درگاه فیلم ایران» به عنوان پخش کننده‌ای حقوقی و بین المللی که در سازمان های بین  المللی چون سیناندوی فرانسه عضویت دارد، تمام تلاش خود در راستای صفر کردن ورودی فستیوال ها انجام خواهد داد. اما از آنجایی که بسیاری از فستیوال ها به دلایل و ضوابط خود، امکان صفر کردن ورودی خود را ندارند، مجبور به پرداخت ورودی ها هستیم.
                                    </div>
                                    <div>
                                        از اینرو؛ در جدول زیر وضعیت و توان مالی خود را در خصوص پرداخت ورودی فستیوال ها اظهار فرمائید:
                                    </div>

                                </div>
                                <div>
                                    <table style="width: 100%; border: 5px dashed #ccc; -moz-border-radius: 15px; -webkit-border-radius: 15px; border-radius: 15px; font-size: 18px;">
                                        <tr>
                                            <td>•	<span style="font-family: Titr; color: green;">توان پرداخت تمامی ورودی ها را دارم

                                            </span></td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb" GroupName="rbFees" ID="rbFees_Full" Text="" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                            •	توان پرداخت ورودی های بین 1 دلار تا 150 دلار را دارم

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton GroupName="rbFees" CssClass="rb"
                                                    ID="rbFees_150" Text="" runat="server" /></td>
                                        </tr>



                                        <tr>
                                            <td>•	 توان پرداخت ورودی های بین 1 دلار تا 100 دلار را دارم</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb" GroupName="rbFees" ID="rbFees_100" Text="" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                            •	توان پرداخت ورودی های بین 1 دلار تا 50 دلار را دارم

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton GroupName="rbFees" CssClass="rb"
                                                    ID="rbFees_50" Text="" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>•	 توان پرداخت ورودی های بین 1 دلار تا 30 دلار را دارم</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb" GroupName="rbFees" ID="rbFees_30" Text="" runat="server" /></td>
                                        </tr>


                                        <tr>
                                            <td>•	 توان پرداخت ورودی های بین 1 دلار تا 10 دلار را دارم</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb"
                                                    Checked="true"
                                                    GroupName="rbFees" ID="rbFees_10" Text="" runat="server" /></td>
                                        </tr>

                                        <tr>
                                            <td>•	 توان پرداخت ورودی های بین 1 دلار تا 5 دلار را دارم</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb" GroupName="rbFees" ID="rbFees_5" Text="" runat="server" /></td>
                                        </tr>

                                        <tr>
                                            <td>•	 <span style="font-family: Titr; color: red;">به هیچ عنوان توان پرداخت ندارم و درخواست دارم که «درگاه فیلم ایران» تنها از راه مکاتبه تلاش به صفر کردن ورودی و ثبت نام نماید
                                                .
                                            </span>
                                                <br />
                                                <span class="Warning">*** توجه فرمائید ***
با انتخاب این گزینه، احتمال ارسال و پخش حداکثری منتفی خواهد شد، چرا که تمام فستیوال ها جواب مثبت نخواهند دارد.

                                                </span>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb" GroupName="rbFees" ID="rbFees_0" Text="" runat="server" />

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Synopsis" runat="server">
                            <div class="divForms">
                                <span class="Warning">**این قسمت اجباری است**
                                    <br />
                                </span>
                                <div>
                                    خلاصه:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtSynopsis"
                                        TextMode="MultiLine"
                                        Height="250px"
                                        CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Statement" runat="server">
                            <div class="divForms">
                                <span class="Warning">**این قسمت اجباری است**
                                    <br />
                                </span>
                                <div>
                                    بیانیه ویژه کارگردان:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtStatement"
                                        TextMode="MultiLine" Height="250px"
                                        CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Director" runat="server">
                            <div class="divForms">
                                <div>
                                    نام:                             
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_name" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    نام خانوادگی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_family" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    نام پدر:                    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_father" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>



                                <div>
                                    نام و نام خانوادگی مادر:                    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_mother" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>


                                <div>
                                    شماره ی شناسنامه:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_shsh" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    شماره ملی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_codemeli" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    وضعیت تاهل:              
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_marriage" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    صادره از:                    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_borncity" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    آدرس دقیق پستی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_address" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    کد پستی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_codepost" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    تلفن ثابت:                    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_phone" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    تلفن  همراه:                  
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_cell" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    ایمیل:                     
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_email" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    آی دی اینستاگرام:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_instagram" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    تاریخ تولد (دقیق):         
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_birthdate"  Text="0000/00/00" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    آیا کارگردان دانشجو و یا هنرجوی سینما است؟

                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_student" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    نام دانشگاه و یا موسسه سینمایی:                     
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_studentLocation" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    کد دانشجویی و یا هنرجویی:                          
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_studentID" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    آیا این فیلم اولین فیلم کارگردان است؟                               
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_debut" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    شغل و حرفه کارگردان:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirector_job" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_DirectorFilmpography" runat="server">
                            <div class="divForms">
                                <div>
                                    بیوگرافی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirectorFilmpography_Bio"
                                        TextMode="MultiLine"
                                        Height="250px"
                                        CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    فیلموگرافی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtDirectorFilmpography_Film"
                                        TextMode="MultiLine"
                                        Height="250px"
                                        CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Producer" runat="server">
                            <div class="divForms">
                                <div>
                                    نام:                             
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_name" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    نام خانوادگی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_family" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>

                                <div>
                                    نام پدر:                    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_father" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>


                                <div>
                                    نام و نام خانوادگی مادر:                    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_mother" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>


                                <div>
                                    شماره ی شناسنامه:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_shsh" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    شماره ملی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_codemeli" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    وضعیت تاهل:              
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_marriage" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    صادره از:                    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_borncity" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    آدرس دقیق پستی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_address" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    کد پستی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_codepost" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    تلفن ثابت:                    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_phone" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    تلفن  همراه:                  
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_cell" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    ایمیل:                     
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_email" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    آی دی اینستاگرام:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_instagram" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    تاریخ تولد (دقیق):         
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_birthdate" Text="0000/00/00" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    آیا تهیه کننده دانشجو و یا هنرجوی سینما است؟

                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_student" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    نام دانشگاه و یا موسسه سینمایی:                     
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_studentLocation" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    کد دانشجویی و یا هنرجویی:                          
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_studentID" CssClass="txtEn" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    آیا این فیلم اولین فیلم تهیه کننده است؟                               
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_debut" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    شغل و حرفه تهیه کننده:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducer_job" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_ProducerFilmpography" runat="server">
                            <div class="divForms">
                                <div>
                                    بیوگرافی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducerFilmpography_Bio"
                                        TextMode="MultiLine"
                                        Height="250px"
                                        CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    فیلموگرافی:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtProducerFilmpography_Film"
                                        TextMode="MultiLine"
                                        Height="250px"
                                        CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Crew" runat="server">
                            <div class="divForms">
                                <div>
                                    فیلمنامه نویس:                  
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_writer" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    فیلمبردار:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_dop" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    صدابردار:                
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_sound" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    صداگذار:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_soundmixing" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    گریم:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_makeup" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    طراح لباس:    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_custom" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    تدوینگر:          
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_editor" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    سرمایه گذار:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_investor" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    اقتباس از:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_adpation" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    انیماتور:      
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_animator" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    جلوه های ویژه:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_vfx" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    طراح پوستر:           
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCrew_poster" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>

                            </div>
                        </asp:View>

                        <asp:View ID="V_Music" runat="server">
                            <div class="divForms">
                                <span class="Warning">**این قسمت اجباری است**
                                    <br />
                                </span>
                                <span class="Warning">در صورتی که فیلم دارای موسیقی است، 100% وضعیت حقوقی آن باید مشخص باشد:
                                    <ul>
                                        <li>•	اگه موسیقی اصل (Original) باشد، یعنی توسط آهنگساز ساخته شده باشد، نام آهنگساز را در قسمت زیر پر کند.
                                        </li>
                                        <li>•	اگه موسیقی خریداری شده است و یا رضایت آهنگساز (چه ایرانی و چه خارجی) گرفته شده است، باید نامه و یا ایمیل رسمی به «درگاه فیلم ایران» تحویل داده شود.
                                        </li>
                                        <li>•	اگه از موسیقی Public Domain استفاده شده است، نام آهنگساز و مشخصات موسیقی در قسمت زیر پر شود.
                                        </li>
                                    </ul>
                                </span>
                                <div>
                                    <span style="color: red; font-family: Samim;">در غیر این صورت، هرگونه مسئولتی متوجه تهیه کنندگان و کارگردانان خواهد بود؛ که از جمله آن میتوان به رد شدن در فستیوال ها و یا شکایت صاحب اثر اشاره کرد.
                                    </span>
                                </div>
                                <div>
                                    وضعیت موسیقی فیلم:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMusic"
                                        CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Cast" runat="server">
                            <div class="divForms">
                                <div>
                                    بازیگر نقش اصلی مرد
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCast_1" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    بازیگر نقش اصلی زن
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCast_2" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    بازیگر:                    
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCast_3" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    بازیگر: 
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCast_4" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    بازیگر: 
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCast_5" CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>


                            </div>
                        </asp:View>





                        <asp:View ID="V_WhereFrom" runat="server">
                            <div class="divForms">
                                <div style="line-height: normal; text-align: center;font-size:16px;padding:10px;color:red;">
                                    
                                       چگونه با «درگاه فیلم ایران» آشنا شده اید؟
                                    
                                </div>
                                <div>
                                    <table style="width: 100%; border: 5px dashed #ccc; -moz-border-radius: 15px; -webkit-border-radius: 15px; border-radius: 15px; font-size: 18px;">
                                        <tr>
                                            <td>•	معرفی دوستان و آشنایان

                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb" GroupName="rbIntroduction" ID="rbIntroduction_friends" Text="" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                            •	از طریق جستجو در گوگل

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton Checked="true" GroupName="rbIntroduction" CssClass="rb"
                                                    ID="rbIntroduction_google" Text="" runat="server" /></td>
                                        </tr>



                                        <tr>
                                            <td>•	 از طریق اینستاگرام</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton
                                                    CssClass="rb" GroupName="rbIntroduction" ID="rbIntroduction_instagram" 
                                                    Text="" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                            •	از طریق سایر شبکه های مجازی مانند فیسبوک، توئیتر و ...

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton GroupName="rbIntroduction" CssClass="rb"
                                                    ID="rbIntroduction_other" Text="" runat="server" /></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_PreviousDistribution" runat="server">
                            <div class="divForms">
                                <div>
                                   اگر فیلم در زمان گذشته، پخش کننده‌ی دیگری داشته است، نام و مشخصات حقیقی و یا حقوقی آن را ثبت کنید:
                                </div>
                                <div>
                                    <asp:TextBox ID="txtPreviousDistribution"
                                        TextMode="MultiLine"
                                        Height="150px"
                                        CssClass="txtFa" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </asp:View>



                        <asp:View ID="V_Preview" runat="server">
                            <div>

                                <div style="font-family: Samim;">

                                    <div>
                                        <span style="color: green; font-family: Titr">فرم شما تکمیل شده است.

                                        </span>
                                        <br />
                                        ابتدا مواردی را که وارد کردید بررسی کنید:
                                    </div>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Validation" runat="server">
                            <div>

                                <div style="font-family: Samim;">

                                    <div>

                                        <asp:GridView ID="GridViewFinal" runat="server"></asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="V_Successful" runat="server">
                            <div>

                                <div style="font-family: Samim; font-size: 20px; color: green;">

                                    <div>

                                        <asp:Label ID="lblSuccessful" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </asp:View>

                    </asp:MultiView>
                    <div style="margin-top: 10px;">

                        <table style="width: 100%;">
                            <tr style="padding: 0; margin: 0;">

                                <td style="padding: 0; margin: 0;">
                                    <asp:Button ID="btnNextStep"
                                        CssClass="btn"
                                        runat="server" Text="مرحله بعد" /></td>
                                <td style="padding: 0; margin: 0;">
                                    <asp:Button ID="BtnPreviousStep"
                                        CssClass="btn"
                                        runat="server" Text="مرحله قبل" /></td>
                            </tr>
                        </table>


                    </div>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <asp:Image ID="Image1"
                                Width="100"
                                ImageUrl="~/files/images/icons/loading.gif" runat="server" />
                            <br />
                            <span style="color: gray; font-family: Samim; font-size: 10px;">... لطفا منتظر بمانید ...</span>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>



            </asp:UpdatePanel>



        </div>
        <br />
        <br />
        <div class="footer">
            با درگاه فیلم ایران به روز و حرفه ای بمانید
        <br />
            <a style="font-size: 10px; text-decoration: none; color: Gray;"
                href="http://iranfilmport.com">W W W . I R A N F I L M P O R T . C O M </a>
            <br />
            <span style="font-size: 10px; color: Gray;">support@iranfilmport.com</span>
            <br />
            <img src="<%= ResolveUrl("~/files/images/logos/logoSquare.png")%>" width="50" />
        </div>
    </form>
</body>
</html>
