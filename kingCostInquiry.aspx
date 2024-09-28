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
                        <asp:CheckBox ID="CheckBox1" Text="دو بعدی" runat="server" />
                        <asp:CheckBox ID="CheckB1ox1" Text="سه بعدی" runat="server" />
                    </div>
                    <div>
                        <asp:CheckBox ID="Check2Box1" Text="فول دیجیال-پینت" runat="server" />
                        <asp:CheckBox ID="Ch3eckBox1" Text="اسکرچ (دستی)" runat="server" />
                        <asp:CheckBox ID="Chec4kBox1" Text="کولاژ دیجیتالی" runat="server" />
                        <asp:CheckBox ID="Che5ckBox1" Text="تلفیقی" runat="server" />
                    </div>
                    <div>
                        <asp:CheckBox ID="Chec12kBox1" Text=" با لوگوتایپ سفارشی" runat="server" />
                        <asp:CheckBox ID="Check12Box1" Text="بدون لوگوتایپ" runat="server" />
                    </div>
                    <div>
                        <asp:CheckBox ID="Chec2kBox1" Text="فقط فارسی" runat="server" />
                        <asp:CheckBox ID="Chec3kBox1" Text="فقط انگلیسی" runat="server" />
                        <asp:CheckBox ID="Che12ckBox1" Text="هم فارسی و هم انگلیسی (دونسخه)" runat="server" />
                    </div>
                    <div>
                        <asp:CheckBox ID="CheckBox2" Text="پوستر به همراه لوگوموشن" runat="server" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>  
</asp:Content>

