<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="SMS.aspx.vb" Inherits="CMS_Pages_SMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE" style="font-size: 20px;">
        تست آزمایشی ارسال اس ام اس
    </div>
    <div>
        <table>
            <tr>
                <td>pattern:</td>
                <td>
                    <asp:DropDownList ID="cmdPattern" runat="server" AutoPostBack="true">
                        <asp:ListItem Value="l8tmdvdb1rx11un">%name% عزیز تیکت جدیدی از طرف «درگاه فیلم ایران» برایتان باز شده است. لطفا از سامانه شخصی خود آن را مشاهده کنید.</asp:ListItem>
                        <asp:ListItem Value="5ve4avg3xk9ebx2">%name% عزیز تخفیف ویژه تا 50% برای فیلم اولی‌ها آغاز شد. https://iranfilmport.com «درگاه فیلم ایران»</asp:ListItem>
                        <asp:ListItem Value="2tok5ynb3ufhikk">%name% عزیز جهت بررسی و دانلود رسیدهای فستیوال‌ها، از پنل اختصاصی خود به نشانی زیر اقدام کنید: https://iranfilmport.com/panel «درگاه فیلم ایران»</asp:ListItem>
                        <asp:ListItem Value="re9x2dh9u0sar1x">%name% عزیز فستیوال (هایی) جدید برای اثر شما ثبت شده است. جهت «رویت» و «دانلود» رسید(ها) وارد پنل خود شوید. «درگاه فیلم ایران»</asp:ListItem>
                        <asp:ListItem Value="9du2xqln8hj2rct">کاربر: %name% تیکت جدید ثبت کرده است. «درگاه فیلم ایران»</asp:ListItem>
                        <asp:ListItem Value="6b7tgkdocub8rew">کد عبور: %code% می باشد. «درگاه فیلم ایران»</asp:ListItem>
                        <asp:ListItem Value="bw7a0w8vp9hgwyj">%name% عزیز کامنت جدید شما ثبت و بزودی پاسخ داده خواهد شد. «درگاه فیلم ایران»</asp:ListItem>
                        <asp:ListItem Value="d4hbplkt4pgeceq">%name% عزیز تیکت شما پاسخ داده شد. «درگاه فیلم ایران»</asp:ListItem>
                        <asp:ListItem Value="462y1bta3vthw47">%name% عزیز زادروزتان فرخنده باد. «درگاه فیلم ایران»</asp:ListItem>
                    </asp:DropDownList> 
                    </td>
            </tr>
            <tr>
                <td>
                    selected pattern:
                </td>
                <td>
                    <asp:TextBox ID="txtpattern" style="background-color:gray" ReadOnly="true" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>username:</td>
                <td>
                    <asp:Label ID="lblUsername" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>password:</td>
                <td>
                    <asp:Label ID="lblpas" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>from:</td>
                <td>
                    <asp:Label ID="lblfrom" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>to:</td>
                <td>
                    <asp:TextBox ID="txtTo" Text="09216343320" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>parametere:</td>
                <td>
                    <asp:TextBox ID="txtPar" text="name" runat="server"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td>value:</td>
                <td>
                    <asp:TextBox ID="txtValue" Text="سلام" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnSendTest" runat="server" Text="Button" />
        <asp:Label ID="lblResult" runat="server" Text="waiting..."></asp:Label>
    </div>
</asp:Content>

