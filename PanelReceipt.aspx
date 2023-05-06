<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPanel.master" AutoEventWireup="false" CodeFile="PanelReceipt.aspx.vb" Inherits="PanelReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .warning {
            padding: 10px;
            background-color: #f2fff6;
            border: 1px solid #8affab;
            border-radius: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
            color: #2f8f4d;
            font-size: 12px;
        }

        #receipt {
            text-align: center;
        }

        .divReceiptPage {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .btnReceiptPage {
            border: 0;
            background-color: cadetblue;
            width: 100%;
            height: 100%;
            font-size: 15px;
            font-family: Samim;
            cursor: pointer;
            padding: 10px;
            color: white;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TitleTitle">
        رسید ارسالی فیلم به فستیوال (قابل دانلود)
    </div>
    <div class="warning">
        <ul>
            <li>جهت دانلود رسید روی دکمه‌ی
                <strong>(DOWNLOAD)</strong>
                کلیک کنید
            </li>
            <li>این رسید همیشگی است و در هر لحظه از طریق همین سامانه قابل دسترس شما خواهد بود.
            </li>
            <li>
                اگر به هر دلیلی، رسید قابل دانلود نبود و یا اگر لود نشد، مورد از طریق گذاشتن تیکت پیگیری کنید.
            </li>


        </ul>
    </div>
    <div id="receipt">
        <div>
            <div>
                <asp:LinkButton ID="btnDownload"
                    CssClass="btnReceiptPage"
                    runat="server" ToolTip="دانلود این رسید">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/files/images/icons/downloadEn.png" />

                </asp:LinkButton>

            </div>
            <div>
                <input id="Button1" class="btnReceiptPage" type="button" onclick="window.close();" value="[بستن این صفحه]" />
            </div>
        </div>
        <div style="padding:50px;background-color:khaki;">
            <asp:Image Width="100%" ID="imgReceipt" runat="server" />
        </div>
    </div>
</asp:Content>

