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
        <div style="direction: rtl; font-family: NazaninB; text-align: justify; padding: 5px;">
            <p>
                درگاه فیلم ایران (IFP) جهت تسهیل در امور Post-Production و پخش فیلم خدماتی را از
                                جمله، ترجمه زیرنویس، حک کردن زیرنویس روی فیلم، تولید فایل اس آر تی، طراحی پوستر
                                و طراحی تریلر را نیز ارائه میدهد.
            </p>
        </div>
        <uc1:KingComments runat="server" ID="KingComments" />
    </div>
</asp:Content>

