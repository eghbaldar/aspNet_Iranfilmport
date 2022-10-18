<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="backtowallet.aspx.vb" Inherits="CMS_Pages_wallet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="TITLE">
        مشخص شدن وضعیت مالی این درخواست
    </div>
    <div>
           <table class="style1">
            <tr>
                <td>
                    ارزش مالی این درخواست که کاربر پرداخت کرده است:</td>
                <td>
                    <asp:Label ID="lblPrePrice" style="font-size:20px;font-family:Samim;" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    مقدار پولی که میخواهید به حساب کاربر برگردد (به تومان):</td>
                <td>
                    <asp:TextBox ID="txtNewPrice" CssClass="txtEn" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCurrent" style="color:Red;font-family:Samim;font-size:14px;" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnBackPrice" CssClass="tabBtn" runat="server" Text="برگشت بخورد" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

