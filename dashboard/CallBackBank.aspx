<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="CallBackBank.aspx.vb" Inherits="dashboard_CallBackBank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HiddenEmail" runat="server" />
     <div class="container" style="direction: rtl; text-align: right;">
    <div class="row">
        <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                   درخواست برگشتی از درگاه بانک</h4>
            </div>
        </div>
            <div class="frame">
                <div style="text-align: center; font-family: Samim;">
                    <asp:Label ID="lblWarning" runat="server" Style="font-family: Titr;"></asp:Label>
                </div>
                <div style="text-align: center; font-family: Samim;">
                    <asp:Button ID="btnGO" runat="server" Text="مشاهده صورت حساب های پرداخته شده و نشده" />
                </div>
            </div>
        </div>
        </div>
    </div>
</asp:Content>
