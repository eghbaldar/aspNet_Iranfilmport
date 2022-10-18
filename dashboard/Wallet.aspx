<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="Wallet.aspx.vb" Inherits="dashboard_Wallet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function ClickforSearch() {
            var s = document.getElementById('txtSearch').value;
            if (s != "مقدار خود را به تومان وارد کنید")
                window.open('festivalSearch.aspx?text=' + s, "_self");
        }
    </script>
    <style>
        .txtSearch
        {
            text-align: center;
            margin: 5px;
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <div class="container" style="direction: rtl; text-align: right;">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                    کیف پول</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" style="font-family: tahoma;">
                    <ul>
                        <li>این مقدار غیر قابل انتقال و غیر قابل برداشت است.</li>
                        <li>از این مقدار پولی، تنها میتوانید به منظور ارسال پروژه به فستیوال ها استفاده شود.</li>
                        <li>این مقدار میتواند برگشت درخواست ارسال پروژه به فستیوال توسط کارشناسان پخش و یا از
                            مابه تفاوت پرداخت شما جمع آوری شده باشد.</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="frame" style="text-align: center; font-family: Samim; padding-left: 30%;
            padding-right: 30%;">
            <div>
                <img src="../../assets/img/wallet.png" />
            </div>
            <div>
                <asp:Label ID="lblWallet" runat="server" Style="font-size: 20px;"></asp:Label></div>
            <asp:UpdatePanel ID="UP" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div style="border: 1px solid #3AA2A5; width: 100%; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                        border-radius: 5px; padding: 5px;">
                        <table style="width: 100%; text-align: center;">
                            <tr>
                                <td>
                                    افزایش کیف پول
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input runat="server" type="text" value="مقدار خود را به تومان وارد کنید" id="txtSearch"
                                        onblur="if(this.value == '') { this.value = 'مقدار خود را به تومان وارد کنید'; }"
                                        onfocus="if (this.value == 'مقدار خود را به تومان وارد کنید') { this.value = ''; }"
                                        class="txtSearch" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%--<input type="button" value="" onclick="ClickforSearch()" />--%>
                                    <asp:Button ID="btnGotoBank" runat="server" class="btnSearch" Text="اتصال به بانک" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblWarning" runat="server" Style="font-family: irsans;"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:UpdateProgress runat="server">
                        <ProgressTemplate>
                            در حال بارگزاری ...</ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
