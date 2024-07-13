<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false"
    CodeFile="kingMovibeta.aspx.vb" Inherits="kingMovibeta" %>

<%@ Register Src="~/usercontrols/KingComments.ascx" TagPrefix="uc4" TagName="KingComments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div style="direction: rtl;">

        <div style="text-align: justify;">

            <img alt="movibeta.com" width="95%" src="files/images/logos/MovibetaLogo.png" />

        </div>
        <div class="content-text" style="text-justify: inter-word; text-align: justify; font-family: Samim;">

            <p style="color: Black; font-size: 14px;">
                شرکت پخش کنندگی فیلم اسپانیایی و معتبر Movibeta که در قالب یکی از 10 پلتفرم برتر جهانی نیز عرض اندام کرده 
                                    است از سال 2006 شروع به فعالیت کرده است. این شرکت اسپانیایی حدودا 500 فستیوال جهانی
                                    را تحت پوشش دارد. این گروه پخش کنندگی که در مدیوم کوتاه و بلند فعال است بیشتر فستیوال
                                    های اروپایی را تحت پوشش خود دارد.
            </p>
            <p style="direction: ltr; text-align: justify;">
                Since 2019, IRAN FILM PORT reaches to common dialogue with a famous distribution film company in the world named "MOVIBETA". According to this accordance, IRAN FILM PORT can use all of the services of MOVIBETA for expanding its distribution.
            </p>
            <div style="text-align: center;">
                <a href="http://iranfilmport.com/files/ckfinder/userfiles/images/%D8%AF%D8%B1%DA%AF%D8%A7%D9%87_%D9%81%DB%8C%D9%84%D9%85_%D8%A7%DB%8C%D8%B1%D8%A7%D9%86_%D9%85%D9%88%D9%88%DB%8C_%D8%A8%D8%AA%D8%A7_%D8%B4%D8%B1%DB%8C%DA%A9_%D8%A7%D8%B3%D9%BE%D8%A7%D9%86%DB%8C%D8%A7%DB%8C%DB%8C_movibeta.jpg" target="_blank">
                    <img alt="movibeta.com" width="400px" src="http://iranfilmport.com/files/ckfinder/userfiles/images/%D8%AF%D8%B1%DA%AF%D8%A7%D9%87_%D9%81%DB%8C%D9%84%D9%85_%D8%A7%DB%8C%D8%B1%D8%A7%D9%86_%D9%85%D9%88%D9%88%DB%8C_%D8%A8%D8%AA%D8%A7_%D8%B4%D8%B1%DB%8C%DA%A9_%D8%A7%D8%B3%D9%BE%D8%A7%D9%86%DB%8C%D8%A7%DB%8C%DB%8C_movibeta.jpg"
                        style="-moz-border-radius: 15px; -webkit-border-radius: 15px; border-radius: 15px; border: 2px solid #2e79ff;" />
                </a>
            </div>
            <p style="color: Black; font-size: 14px;">
                درگاه فیلم ایران (IRAN FILM PORT) طبق توافقی دو جانبه همکاری متقابلی با این شرکت پخش کنندگی
                                    اسپانیایی منعقد کرده است که از جمله مفاد آن میتوان به پوشش فستیوالی و نیز تخفیفاتی
                                    در این زمینه اشاره کرد.
            </p>
        </div>

        <div style="text-align: center;">
            <a href="https://www.instagram.com/p/CdoWxLZO6ub/" target="_blank">
                <img alt="movibeta.com" width="400px" src="files\images\icons\MovibetaIG.jpg"
                    style="-moz-border-radius: 15px; -webkit-border-radius: 15px; border-radius: 15px; border: 2px solid #2e79ff;" />
            </a>
        </div>
        <br />
        <div style="direction: ltr; text-align: left; background-color: #c2e8ea; padding: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
            MOVIBETA's statement:
                        <p style="color: Black; direction: ltr;">
                            Movibeta is a film festival platform that has been in the market since 2008,we know
                        deeply the film festivals that work with us any film festival working with us need to be approved by
                        us to avoid fake film festival.
                        </p>
            <p style="color: Black; direction: ltr;">
                At the moment we just have less than 20 Iranian film directors, by working with IRAN FILM PORT we expect
                        that number to increase.
            </p>
            <p style="color: Black; direction: ltr;">
                We also hope that IRAN FILM PORT will encourage and facilitate and smooth the use 
                        of Movibeta to Iranian directors.
            </p>
        </div>
        <div>
            <p style="color: Black;">
                در صورت داشتن هرگونه سوال می توانید از طریق پست الکترونیکی اختصاصی IFP (درگاه فیلم ایران) در این شرکت
                                اسپانیایی اقدام کنید.
            </p>
            <p style="letter-spacing: 3px; direction: ltr; color: Black;">
                <span>
                    <img alt="پست الکترونیکی ایمیل" src="files/images/icons/email.png" /></span>
                <a href="mailto:iranfilmport@movibeta.com">iranfilmport@movibeta.com
                </a>
            </p>
        </div>

    </div>
    <uc4:KingComments runat="server" ID="KingComments" />
</asp:Content>

