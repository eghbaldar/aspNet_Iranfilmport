<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingCostInquiry.aspx.vb" Inherits="kingCostInquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
            <p>هزینه اعلام شده بصورت تقریبی و براساس پیشبینی و انتخاب‌های شما خواهد بود. بنابراین جهت استعلام قطعی با کارشناسان
                شرکت در ارتباط باشید.
            </p>
                        <div class="alert alert-primary" role="alert" style="direction: rtl; text-align: right;padding-right:30px;">
                <ul class="first-level">
                    <li><a href="tel:+989216343320">0921-634-3320</a></li>
                    <li><a href="tel:+989020763947">0902-076-3947</a></li>
                    <li><a href="tel:+989332300598">0933-230-0598</a></li>
                    <li><a href="tel:+989359300460">0935-930-0460</a></li>
                </ul>
            </div>
    </div>
    <div class="left-side">
        <div class="item-holder" style="direction: rtl;">
            <asp:UpdatePanel UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <h4>طراحی پوستر</h4>
                    <div>
                        <asp:RadioButton ID="rbDimenation2D" Checked="true"  GroupName="1" Text="&nbspدو بعدی" runat="server" />
                        <asp:RadioButton ID="rbDimenation3D" GroupName="1"  Text="&nbspسه بعدی" runat="server" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rbStyleFullPaint" GroupName="2"  Text="&nbspفول دیجیال-پینت" runat="server" />
                        <asp:RadioButton ID="rbStyleHandCollage" GroupName="2"  Text="&nbspکولاژ دستی" runat="server" />
                        <asp:RadioButton ID="rbStyleDigitalCollage" GroupName="2"  Text="&nbspکولاژ دیجیتالی" runat="server" />
                        <asp:RadioButton ID="rbStyleStill" GroupName="2"  Checked="true"  Text="&nbspاستفاده از عکس صحنه" runat="server" />
                    </div>
                    <div>
                        <asp:CheckBox ID="chkLogoType" Text="&nbspلوگوتایپ سفارشی" runat="server" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rbLangFa"  Checked="true"  GroupName="4" Text="&nbspفقط فارسی" runat="server" />
                        <asp:RadioButton ID="rbLangEn"  GroupName="4" Text="&nbspفقط انگلیسی" runat="server" />
                        <asp:RadioButton ID="rbLangBoth"  GroupName="4" Text="&nbspهم فارسی و هم انگلیسی (دونسخه)" runat="server" />
                    </div>
                    <div>
                        <asp:CheckBox ID="chkLogoMotion" Text="&nbspپوستر به همراه لوگوموشن" runat="server" />
                    </div>
                    <div>
                        <asp:CheckBox ID="chkClient" Text="&nbspمشتری درگاه فیلم ایران" runat="server" />
                    </div>
                    <div class="mt-5">
                                <asp:Button ID="btnPoster" runat="server"
                                Text="استعلام"
                                class="button"
                                ValidationGroup="1" />
                            </div>
                    <br /><br />
                    <h4>حک و اس آر تی برای فیلم</h4>
                    <div>
                        <asp:RadioButton ID="rbBurnt"  Checked="true"  GroupName="11" Text="&nbspزیرنویس چسبیده - حک روی فیلم - SubHard - Burnt " runat="server" />
                        <br />
                        <asp:RadioButton ID="rbSrt"  GroupName="11" Text="&nbspزیرنویس نچسبیده - SRT" runat="server" />
                        <br />
                        <asp:RadioButton ID="rbBurntSrt"  GroupName="11" Text="&nbspهر دو" runat="server" />
                        <br />
                        <asp:TextBox ID="txtWordsCount" runat="server" CssClass="form-control" placeholder="تعداد کلمات دیالوگ‌‌های فارسی را وارد کنید ..."></asp:TextBox>
                    </div>
                    <div>
                        <asp:CheckBox ID="chkSrtClient" Text="&nbspمشتری درگاه فیلم ایران" runat="server" />
                    </div>
                      <div class="mt-5">
                                <asp:Button ID="btnSubtitle" runat="server"
                                Text="استعلام"
                                class="button"
                                ValidationGroup="1" />
                            </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>  
    <script>
        function showCost(cost) {
            Swal.fire({
                title: 'استعلام هزینه!',
                text: cost,
                icon: 'info',
                confirmButtonColor: '#ff9100',
                confirmButtonText: 'متوجه شدم'
            });
        }
    </script>
</asp:Content>

