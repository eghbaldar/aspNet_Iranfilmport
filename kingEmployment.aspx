<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingEmployment.aspx.vb" Inherits="kingEmployment" %>

<%@ Register Src="~/usercontrols/KingComments.ascx" TagPrefix="uc1" TagName="KingComments" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side">
        <div class="item-holder panel first-level" style="text-align: justify;">
            «درگاه فیلم ایران» به عنوان بزرگترین و با سابقه‌ترین پخش کننده حقوقی فعال با کارنامه‌ای قابل توجه،
            با توجه به جایگاه خود، نیازمند همکاری با افراد متخصص و حرفه‌ای در زمینه حرفه‌ای خود، یعنی سینماست.
            <br />
            از اینرو، برحسب نیاز، در برهه‌هایی از زمان، نیازمند جذب کارمند بصورت تمام وقت، پاره وقت و نیز پروژه‌ای است.
            <br />
            از افراد واجد شرایط در زمینه‌های تخصصی ذیل که دارای رزومه تخصصی هستند، دعوت به همکاری می‌شود.
            <br />
            لازم به ذکر است که پر شدن فرم زیر تنها به معنای پذیرش ابتدایی و جمع‌آوری اطلاعات متقاضیان است.
            <br />
            شرکت «درگاه فیلم ایران»
             برحسب نیازمندی در زمان مشخص، با متقاضی تماس خواهد گرفت.
             <br />
            لطفا در این زمینه، با کارشناسان شرکت تماس حاصل نفرمائید.
             <br />
            <asp:Image runat="server" alt="استخدام و موقعیت شغلی در درگاه فیلم ایران"
                ImageUrl="~/files/kingMaterials/imgs/resources/jobs.png" />
            <br />
            <span style="color: red; font-weight: bold">شرایط عمومی</span>
            متقاضیان:
             <br />
            <ul>
                <li>مدرک تحصیلی: لیسانس به بالا</li>
                <li>دارای سه معرف کاری و یا از اقوام دور</li>
                <li>توانایی قرار دادن وثیقه بصورت سفته</li>
                <li>روابط عمومی: مسلط و فعال</li>
                <li>آشنایی ابتدایی با زبان انگلیسی</li>
                <li>سن: 20 تا 60 سال</li>
                <li>محل زندگی: سراسر ایران و یا خارج از ایران</li>
                <li>جنسیت: مرد و زن</li>
                <li>عدم فعالیت با هیچ پخش کننده‌ی فیلم دیگر و یا شرکت یا موسسه فیلمسازی</li>
            </ul>
            <br />
            <br />
            <span style="color: red; font-weight: bold">رشته‌ها و مهارت‌ها </span>
            مورد نیاز:
             <br />
            <ul>
                <li>فیلمنامه‌نویس</li>
                <li>مترجمی انگلیسی، اسپانیایی، فرانسوی و ایتالیایی</li>
                <li>تدوینگر مسلط به پریمیر و فاینال کات</li>
                <li>طراح گرافیست با نرم افزار فتوشاپ</li>
                <li>بازاریاب تلفنی 
                      <span style="color: red; font-weight: bold">(فقط خانم)</span>
                </li>
                <li>علوم کامپیوتر (دارای مدرک ICDL) با مدرک زبان انگلیسی (حداقل 6 آیلس)</li>
                <li>آشنایی با نرم افزار SubTitle Edit و نرم افزار هایVideo Convertor</li>
                <li>برنامه نویس با تخصص ASP.NET FORMS - APPLICATION WIN FORMS - KOTLIN - ASP.NET CORE و مسلط به SQL
                    و زبان‌های C# & VB.NET
                </li>
                <li>متخصصی SEO و آنالیزور شبکه‌های مجازی</li>
                <li>کارشناس تولید محتوا متنی و ویژال</li>
                <li>تایپیست دو زبانه</li>
                <li>گزارشگر حضوری</li>
            </ul>
            <br />
            <span style="color: red; font-weight: bold">متقضایانی که «شرایط عمومی» را دارا نمی‌باشند، پرونده‌شان بررسی نخواهد شد.</span>
            <br />
            <span style="color: red; font-weight: bold">پس از اعلام نیازمندی، با متقاضیان مصاحبه حضوری و یا آنلاین خواهد شد.</span>
            <br />
            <span style="color: red; font-weight: bold">برحسب مدل همکاری، تمام وقت، پاره وقت و یا پروژه‌ای، قرارداد رسمی و حقوقی منعقد خواهد شد.</span>
            <br />
            <span style="color: red; font-weight: bold">برحسب مدل همکاری، تمام وقت، پاره وقت و یا پروژه‌ای، قرارداد می‌تواند برپایه حقوق ثابت و یا درصدی تعیین گردد.</span>
            <br />
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div runat="server" id="div_form" style="box-shadow: 2px 2px 8px 8px #F4F4F4; padding: 8px;">
                    <div class="title-text mt-3 mb-3">
                        <h1>فرم پذیرش
                        </h1>
                    </div>
                    <table style="width: 100%;">
                        <tr>
                            <td class="pb-4">
                                <asp:DropDownList Width="100%" ID="cmd_category" runat="server"
                                    CssClass="form-control">
                                    <asp:ListItem Value="-1">نوع همکاری را مشخص کنید ...</asp:ListItem>
                                    <asp:ListItem Value="0">فیلمنامه‌نویس</asp:ListItem>
                                    <asp:ListItem Value="1">مترجمی: انگلیسی</asp:ListItem>
                                    <asp:ListItem Value="2">مترجمی: اسپانیایی</asp:ListItem>
                                    <asp:ListItem Value="3">مترجمی: فرانسوی </asp:ListItem>
                                    <asp:ListItem Value="4">تدوینگر حرفه‌ای</asp:ListItem>
                                    <asp:ListItem Value="5">گرافیست با نرم افزار فتوشاپ</asp:ListItem>
                                    <asp:ListItem Value="6">بازاریاب تلفنی (فقط خانم)</asp:ListItem>
                                    <asp:ListItem Value="7">علوم کامپیوتر (دارای مدرک ICDL) با مدرک زبان انگلیسی (حداقل 6 آیلس)</asp:ListItem>
                                    <asp:ListItem Value="8">آشنایی با نرم افزار SubTitle Edit و نرم افزار هایVideo Convertor</asp:ListItem>
                                    <asp:ListItem Value="9">برنامه نویس: ASP.NET FORM & VB.NET  + SQL</asp:ListItem>
                                    <asp:ListItem Value="10">برنامه نویس: ASP.NET CORE & C#  + SQL</asp:ListItem>
                                    <asp:ListItem Value="11">برنامه نویس: Kotlin  + SQL</asp:ListItem>
                                    <asp:ListItem Value="12">برنامه نویس: Windows Forms VB.NET + SQL</asp:ListItem>
                                    <asp:ListItem Value="13">متخصصی SEO و آنالیزور شبکه‌های مجازی</asp:ListItem>
                                    <asp:ListItem Value="14">کارشناس تولید محتوا متنی و ویژوال</asp:ListItem>
                                    <asp:ListItem Value="15">تایپیست دو زبانه</asp:ListItem>
                                    <asp:ListItem Value="16">گزارشگر حضوری</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="form-control"
                                    placeholder="نام و نام خانوادگی متقاضی ..."
                                    ID="txtName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="الزامی است" Font-Names="tahoma" Font-Size="X-Small" ForeColor="#FF3300"
                                    ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtPhone" runat="server" placeholder="شماره همراه" CssClass="form-control" Style="direction: ltr; text-align: left;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone"
                                    ErrorMessage="الزامی است" Font-Names="tahoma" Font-Size="X-Small" ForeColor="#FF3300"
                                    ValidationGroup="1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="txtPhone" ErrorMessage="*" ForeColor="#FF3300" ValidationExpression="09(0[0-09(0[0-9]|1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}"
                                    ValidationGroup="1"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtEmail" placeholder="Email" Style="direction: ltr; text-align: left;" runat="server"
                                    CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="الزامی است" Font-Names="tahoma" Font-Size="X-Small" ForeColor="#FF3300"
                                    ValidationGroup="1"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                        ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ValidationGroup="1"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox placeholder="رزومه کامل متقاضی ..." CssClass="form-control" ID="txtResume" runat="server" Height="293px" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtResume"
                                    ErrorMessage="الزامی است" Font-Names="tahoma" Font-Size="X-Small" ForeColor="#FF3300"
                                    ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
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
                                <div class="mt-5">
                                    <asp:Button ID="btnSubmit" runat="server"
                                        Text="ارسال فرم پذیرش"
                                        class="button"
                                        ValidationGroup="1" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <uc1:KingComments runat="server" ID="KingComments" />
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        منتظر بمانید ...
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script>
        function showAlert(title, cost) {
            Swal.fire({
                title: title,
                text: cost,
                icon: 'info',
                confirmButtonColor: '#ff9100',
                confirmButtonText: 'متوجه شدم'
            });
        }
    </script>
</asp:Content>

