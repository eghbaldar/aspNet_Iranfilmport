<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingServices.aspx.vb" Inherits="kignServices" %>

<%@ Register Src="~/usercontrols/KingComments.ascx" TagPrefix="uc1" TagName="KingComments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side">
            <p>
                «درگاه فیلم ایران»
                جهت تسهیل در امور 
                «پُست پروداکشن»
                و پخش فیلم خدماتی را از
                                جمله، ترجمه زیرنویس، حک کردن زیرنویس روی فیلم، تولید فایل اس آر تی، طراحی پوستر
                                و طراحی تریلر را نیز ارائه می‌دهد.
            </p>
            <p>
                ترجمه، زیرنویس و طراحی پوستر از الزامات و تکمیل کننده پروسه 
                <a href="/%D9%BE%D8%AE%D8%B4-%D9%88-%D8%A7%D8%B1%D8%B3%D8%A7%D9%84-%D9%81%DB%8C%D9%84%D9%85" target="_blank">پخش و ارسال فیلم </a>
                می باشد.
                 از اینرو، ترجمه شدن صحیح، قرار دادن زیرنویس با اعلام صحیح و نیز طراحی درست و بین المللی پوستر امری تخصصی است.
            </p>
        <div style="text-align:center;">
            <img src="files/kingMaterials/imgs/resources/subtitle.jpg" />
        </div>
         <br />
            <p>
                شما می‌توایند از لینک زیر هزینه خدمات فوق را استعلام کنید.                                
                <br />
                <p style="color: red;">
                    توجه فرمائید که هزینه اعلام شده صرفا یک برآورد اولیه خواهد بود و
                تعیین هزینه نهایی پس از مشاوره تخصصی مشخص خواهد شد.
                </p>
                <a href="/استعلام-هزینه-طراحی-پوستر-زیرنویس-ترجمه-فیلم">جهت استعلام هزینه خدمات زیرنویس و پوستر (اینجا) کنید.</a>
            </p>
        <uc1:KingComments runat="server" ID="KingComments" />
    </div>
</asp:Content>

