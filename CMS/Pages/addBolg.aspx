<%@ Page Title="" Language="VB" ValidateRequest="false" MasterPageFile="~/CMS/Pages/CMS.master"
    AutoEventWireup="false" CodeFile="addBolg.aspx.vb" Inherits="CMS_Pages_addBolg" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
    <style>
        .autocomplete_completionListElement {
            line-height: 30px;
        }
    </style>
    <style>
        .blink {
            -webkit-animation-name: blink;
            -webkit-animation-iteration-count: infinite;
            -webkit-animation-timing-function: cubic-bezier(1.0,0,0,1.0);
            -webkit-animation-duration: 1s;
            color: #FF3300;
            font-size: 20px;
            font-family: koodak;
        }

        .sDate {
            padding: 5px;
            text-align: center;
            font-size: 14px;
            background-color: Gray;
            font-style: italic;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .txtT {
            padding: 4px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            text-align: center;
            width: 93px;
            margin-bottom: 0px;
        }

        .DivOptimize {
            padding: 10px;
            background-color: red;
            color: white;
        }

        .rbFristSelection {
            zoom: 300%;
            font-family: Samim;
        }

        .spanRed {
            color: red;
            font-style: oblique;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewTag" runat="server">
            <div class="TITLE" style="font-size: 20px;">
                وارد کردن مشخصات کلیدی پست ...
        </h4>
            </div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div style="padding: 10px; font-family: Samim;">
                        اگر پستی که قصد گذاشتن آن را دارید مورد یک
                <span class="spanRed">فیلم</span>
                        است اسم
                <span class="spanRed">کارگردان یا کارگردان ها، تهیه کننده یا تهیه کنندگان
                </span>
                        و در نهایت نام
                <span class="spanRed">فیلم را بصورت فارسی و انگلیسی</span>
                        گزینه فیلم/فیلمنامه را انتخاب کنید
                                 و در صورتی که در خصوص فستیوالی است گزینه
                        <span class="spanRed">فستیوال
                        </span>
                        و اگر موضوع پست سایر مطالب است گزینه 
                                 <span class="spanRed">سایر</span> را انتخاب کنید.
                    </div>
                    <div>
                        <asp:RadioButton GroupName="rbSelection" ID="rbFilm" Text="فیلم/فیلمنامه" CssClass="rbFristSelection" AutoPostBack="true" runat="server" />
                        <asp:RadioButton GroupName="rbSelection" ID="rbFestival" Text="فستیوال" CssClass="rbFristSelection" AutoPostBack="true" runat="server" />
                        <asp:RadioButton GroupName="rbSelection" ID="rbOther" Text="سایر" CssClass="rbFristSelection" AutoPostBack="true" runat="server" />
                    </div>

                    <div style="padding: 30px;">
                        <asp:Panel ID="PanelFilm" runat="server" Visible="false">
                            <div>
                                اجباری
                                <asp:TextBox CssClass="txtFa" ID="txtTagFilm" placeholder="نام فیلم بصورت کامل: مثال : «نمایش 54»" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                اجباری
                                <asp:TextBox CssClass="txtFa" ID="txtTagDirectors1" placeholder="نام کارگردان شماره یک : مثال: «علیمحمد اقبالدار»" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <asp:TextBox CssClass="txtFa" ID="txtTagDirectors2" placeholder="نام کارگردان شماره دو اگر بود" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                اجباری
                                <asp:TextBox CssClass="txtEn" ID="txtTagFilmEng" placeholder="English Title of Film: 'Performance 54' " runat="server"></asp:TextBox>
                            </div>
                            <div>
                                اجباری
                                <asp:TextBox CssClass="txtEn" ID="txtTagDirector1_Eng" placeholder="Name of First Director: 'Alimohammad Eghbaldar'" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <asp:TextBox CssClass="txtEn" ID="txtTagDirector2_Eng" placeholder="Name of Second Director, if applicable ..." runat="server"></asp:TextBox>
                            </div>

                        </asp:Panel>
                        <asp:Panel ID="PanelFestival" runat="server" Visible="false">
                            <div>
                                <asp:TextBox CssClass="txtFa" ID="txtTagFestivalFa" placeholder="نام فستیوال بصورت کامل: مثال : «جشنواره فیلم کن»" runat="server"></asp:TextBox>
                            </div>

                            <div>
                                <asp:TextBox CssClass="txtEn" ID="txtTagFestivalEng" placeholder="English Title of Festival: 'Cannes Internatioanl Film Festival' " runat="server"></asp:TextBox>
                            </div>

                        </asp:Panel>
                        <asp:Panel ID="PanelOther" runat="server" Visible="false">
                            Other
                        </asp:Panel>
                    </div>
                    <div>
                        <asp:Button ID="btnNextTag" CssClass="tabBtn" Visible="false" runat="server" Text="مرحله بعد - پست گذاری" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="rbOther" />
                    <asp:PostBackTrigger ControlID="btnNextTag" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                <ProgressTemplate>
                    Ladoing...
                </ProgressTemplate>
            </asp:UpdateProgress>
        </asp:View>
        <asp:View ID="ViewPost" runat="server">


            <div>
                <table class="style1">
                    <tr>
                        <td style="text-align: center;">
                            <div class="ContextBlink" style="text-align: center;">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div style="padding: 4px;">

                                            <asp:Calendar ID="CalDate" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                                BorderWidth="1px" Font-Names="Verdana" Font-Size="8pt"
                                                ForeColor="#663399"
                                                Height="200px" ShowGridLines="True" Width="95%" NextPrevFormat="ShortMonth">
                                                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                                <OtherMonthDayStyle ForeColor="#CC9966" />
                                                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                                <SelectorStyle BackColor="#FFCC66" />
                                                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                            </asp:Calendar>
                                        </div>
                                        <div style="font-family: Titr; color: Red; font-size: 17px; padding: 4px; text-align: center;">
                                            این پست در تاریخ و زمان زیر در سایت به نمایش در میآید.
                                        </div>
                                        <div style="padding: 5px;">
                                            <asp:TextBox ID="txtDate" CssClass="sDate" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div style="padding: 5px;">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>SS
                                                <br />
                                                        <asp:TextBox CssClass="txtT" ID="txtSS" runat="server" ValidationGroup="1"></asp:TextBox>
                                                        <br />

                                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtSS"
                                                            ErrorMessage="*" MaximumValue="59" MinimumValue="0" ValidationGroup="1" ForeColor="Red"
                                                            Type="Integer"></asp:RangeValidator>
                                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidat1or9" runat="server"
                                                            ControlToValidate="txtSS" ErrorMessage="*" ValidationGroup="1">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>MM
                                                <br />
                                                        <asp:TextBox CssClass="txtT" ID="txtMM" runat="server" ValidationGroup="1"></asp:TextBox>
                                                        <br />
                                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtMM"
                                                            ErrorMessage="*" MaximumValue="59" MinimumValue="0" ValidationGroup="1" ForeColor="Red"
                                                            Type="Integer"></asp:RangeValidator>
                                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldVal2idator9" runat="server"
                                                            ControlToValidate="txtMM" ErrorMessage="*" ValidationGroup="1">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>HH
                                                <br />
                                                        <asp:TextBox CssClass="txtT" ID="txtHH" runat="server" ValidationGroup="1"></asp:TextBox>
                                                        <br />
                                                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtHH"
                                                            ErrorMessage="*" MaximumValue="24" MinimumValue="0" ValidationGroup="1" ForeColor="Red"
                                                            Type="Integer"></asp:RangeValidator>
                                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFie4ldValidator10" runat="server"
                                                            ControlToValidate="txtHH" ErrorMessage="*" ValidationGroup="1">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="padding: 10px; border: 2px dashed Orange; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>


                                        <div style="padding: 5px; font-family: Samim;">
                                            دسته‌ی اصلی:
                                        </div>
                                        <div>
                                            <asp:DropDownList ID="cmd_type" runat="server" AutoPostBack="true" CssClass="txtFa">
                                                <asp:ListItem Value="1">نقد و مطالب تحلیلی</asp:ListItem>
                                                <asp:ListItem Value="2">مقالات آموزشی فیلم و فیلمنامه</asp:ListItem>
                                                <asp:ListItem Value="3">شناخت جشنواره ها</asp:ListItem>
                                                <asp:ListItem Value="4">اخبار درگاه فیلم ایران</asp:ListItem>
                                                <asp:ListItem Value="5">اخبار داخلی</asp:ListItem>
                                                <asp:ListItem Value="6">اخبار بین المللی</asp:ListItem>
                                                <asp:ListItem Value="7">فراخوان ها</asp:ListItem>
                                                <asp:ListItem Value="8">یادداشت‌های مدیران درگاه</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div style="padding: 5px; font-family: Samim;">
                                            دسته‌ی فرعی:
                                        </div>
                                        <div>
                                            <asp:DropDownList ID="cmd_category" runat="server" CssClass="txtFa" DataSourceID="SDS_Cat"
                                                DataTextField="name" DataValueField="ID">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SDS_Cat" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                                SelectCommand="SELECT * FROM [tbl_articleCategory]
                                        WHERE mainCat = @mainCat
                                        ORDER BY [ID] DESC">

                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="cmd_type" Name="mainCat"
                                                        PropertyName="Text" Type="String" />
                                                </SelectParameters>

                                            </asp:SqlDataSource>
                                        </div>
                                        <div style="padding: 5px; font-family: Samim;">
                                            کوتاه و بلند:
                                        </div>
                                        <div>
                                            <asp:DropDownList ID="cmd_short_feature" runat="server" CssClass="txtFa">
                                                <asp:ListItem Value="1">کوتاه</asp:ListItem>
                                                <asp:ListItem Value="2">بلند</asp:ListItem>
                                                <asp:ListItem Value="3">هر دو</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel3" runat="server">
                                            <ProgressTemplate>
                                                <asp:Image ID="Image1" Width="50px" ImageUrl="~/files/images/icons/loading.gif" runat="server" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>


                            <asp:TextBox onkeyup="countCharFa(this)"
                                ID="txtTitle" placeholder="عنوان ..." runat="server" CssClass="txtFa"></asp:TextBox>
                            <cc1:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                                CompletionListCssClass="autocomplete_completionListElement"
                               
                                ServiceMethod="SearchTitleFa"
                                ServicePath="addBolg.aspx"
                                MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                TargetControlID="txtTitle" FirstRowSelected="false">
                            </cc1:AutoCompleteExtender>
                            <div class="numbersofChartFa"></div>
                            <script>
                                function countCharFa(val) {
                                    var len = val.value.length;
                                    if (len >= 95) {
                                        val.value = val.value.substring(0, 95);
                                        $('.numbersofChartFa').text('تعداد کارکترهای مجاز باقیمانده: ' + '0');
                                    } else {
                                        $('.numbersofChartFa').text('تعداد کارکترهای مجاز باقیمانده: ' + (95 - len));
                                    }
                                };
                            </script>
                            <style>
                                .numbersofChartFa {
                                    color: red;
                                    text-align: center;
                                    font-size: 20px;
                                    padding: 10px;
                                    font-family: Samim;
                                }
                            </style>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>

                            <asp:TextBox ID="txtTitleEn" onkeyup="countCharEn(this)" placeholder="Title ..." runat="server"
                                CssClass="txtEn"></asp:TextBox>
                            <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServiceMethod="SearchTitleEn"
                                CompletionListCssClass="autocomplete_completionListElement"
                                ServicePath="addBolg.aspx"
                                MinimumPrefixLength="2" CompletionInterval="10" EnableCaching="false" CompletionSetCount="10"
                                TargetControlID="txtTitleEn" FirstRowSelected="false">
                            </cc1:AutoCompleteExtender>

                            <div class="numbersofChartEn"></div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtTitleEn"
                                ErrorMessage="Mandatory Field" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <script>
                                function countCharEn(val) {
                                    var len = val.value.length;
                                    if (len >= 95) {
                                        val.value = val.value.substring(0, 95);
                                        $('.numbersofChartEn').text('Left Valid Count: ' + '0');
                                    } else {
                                        $('.numbersofChartEn').text('Left Valid Count: ' + (95 - len));
                                    }
                                };
                            </script>
                            <style>
                                .numbersofChartEn {
                                    color: red;
                                    text-align: center;
                                    font-size: 20px;
                                    padding: 10px;
                                    font-family: Tahoma;
                                }
                            </style>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="imagesManagement/" style="font-family: Samim; font-size: 20px;" target="_blank">... مدیریت تصاویر ... </a>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <%-- <textarea id="txtText" name="content" class="ckeditor" runat="server"></textarea>--%>
                            <CKEditor:CKEditorControl ID="txtText" runat="server"></CKEditor:CKEditorControl><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtText"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLid"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <CKEditor:CKEditorControl ID="txtLid" runat="server"></CKEditor:CKEditorControl>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtAuthors" placeholder="نویسنده ..." runat="server" CssClass="txtFa"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAuthors"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtReference" placeholder="منبع ..." runat="server" CssClass="txtFa"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtReference"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="border: 3px dashed #ccc; padding: 10px; text-align: right;">
                                <div>
                                    <asp:FileUpload ID="FilePhoto" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FilePhoto"
                                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                </div>
                                <div>
                                    <asp:CheckBox ID="chkPhoto" Checked="false" Text="حجم بالای 110 را نیز قبول کن" runat="server" />
                                </div>
                                <div style="padding: 20px;">
                                    <span class="DivOptimize"><a style="color: white;" href="http://optimizilla.com/" target="_blank">Optimization (1)</a></span>
                                    <span class="DivOptimize"><a style="color: white;" href="https://www.imgonline.com.ua/eng/compress-image-size.php" target="_blank">Optimization (2)</a></span>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTags"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div style="border: 5px solid #2b7cff; padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
                                        <div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_1" runat="server">درگاه فیلم ایران</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_2" runat="server">ارسال فیلم به جشنواره های خارجی</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_3" runat="server">پخش و ارسال فیلم کوتاه</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_4" runat="server">فیلم کوتاه</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_5" runat="server">فیلمکوتاه</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_6" runat="server">ارسال فیلم به فستیوال های بین المللی</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_7" runat="server">فیلمنامه</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_8" runat="server">حضور بین المللی فیلم</asp:LinkButton>
                                            </div>
                                        </div>

                                        <div>
                                            <asp:TextBox ID="txtPreTag" CssClass="txtFa" runat="server"></asp:TextBox>
                                            <asp:Button ID="btnPreTag" runat="server" Text="&gt;&gt;" />

                                            <br />
                                            <div style="color: Red; padding: 3px; font-family: Tahoma;">
                                                اگر کلمات بصورت تک سیلابی باشد و یا چند سیلابی باشد همانطور که هست وارد شود. بعنوان
                                                مثلا "سینما" و یا "فیلم کوتاه" بنابراین هیچ علامت دیگری از جمله خط تیره و یا فاصله
                                                اضافی بین و یا بعدشان نباشد باشد
                                            </div>
                                            <asp:ListBox ID="listTags" runat="server" CssClass="txtFa" Width="200px"></asp:ListBox>
                                            <asp:Button ID="deletelist" runat="server" Text="×" BackColor="Red" ForeColor="White"></asp:Button>
                                            <asp:Button ID="btnGoTags" runat="server" Text="&gt;&gt;" />

                                        </div>
                                        <div>
                                            نتیجه تگ ها:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                                ControlToValidate="txtTags" ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            &nbsp;<hr />
                                            <asp:TextBox ID="txtTags" runat="server" CssClass="txtFa" Height="93px"
                                                TextMode="MultiLine" Enabled="False"></asp:TextBox>

                                        </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnInsert" runat="server" Text="درج پست" Width="100%" Font-Names="Samim"
                                CssClass="tabBtn" Style="padding: 20px;"
                                ValidationGroup="1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="ContextBlink" id="ContextBlink" runat="server" visible="false">
                                <asp:Label ID="lblNotify" runat="server" CssClass="blink"></asp:Label>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
