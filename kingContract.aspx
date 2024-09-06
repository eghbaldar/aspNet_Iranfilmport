<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingContract.aspx.vb" Inherits="kingContract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="item-holder" style="text-align: justify;">
        <asp:Label ID="lbl" CssClass="lbl panel" runat="server"></asp:Label>
    </div>
    <div style="width: 100%; direction: rtl; text-align: right; font-family: Samim;">
        <div style="text-align: center;">
            <asp:Image ID="Image1" Width="100px" runat="server" ImageUrl="~/files/images/icons/contracticon.png"></asp:Image>
        </div>
        <div style="margin: 5px;">
            <div id="NOK" class="alert alert-danger" role="alert" visible="false" runat="server">
                <asp:Label ID="lblwarning" runat="server"></asp:Label>
                <br />
                جهت کسب اطلاعات بیشتر با واحد مالی و قراردادهای شرکت در تماس باشید.
                            <br />
                <a href="../contactus/">تماس با ما</a>
            </div>
            <div id="OK" class="alert alert-success" role="alert" visible="false" runat="server">
                قرارداد/نامه رسمی با مشخصات زیر در سیستم ثبت شده است:
                            <br />
                تاریخ ثبت:
                        <strong>
                            <asp:Label ID="lblTempContractInformation_regDate" runat="server"></asp:Label>
                        </strong>
                <br />
                وضیعت قرارداد:
                            <strong>
                                <asp:Label ID="lblTempContractInformation_status" runat="server"></asp:Label>
                            </strong>
                <br />
                شماره قرارداد:
                                <strong>
                                    <asp:Label ID="lblTempContractInformation_contractNumber" runat="server"></asp:Label>
                                </strong>
            </div>
        </div>

    </div>
</asp:Content>

