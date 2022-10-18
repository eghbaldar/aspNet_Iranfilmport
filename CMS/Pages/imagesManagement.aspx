<%@ Page Language="VB" AutoEventWireup="false" CodeFile="imagesManagement.aspx.vb"
    Inherits="CMS_Pages_imagesManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="robots" content="noindex, nofollow">
    <link href="../files/cssCMS.css" rel="stylesheet" type="text/css" />
    <title>مدیریت تصاویر پست ها</title>
    <style>
        body
        {
            direction: rtl;
            font-family: Samim;
            font-size: 15px;
            padding: 20px;
        }
                .DivOptimize{
            padding:10px;
            background-color:red;
            color:white;
        }
    </style>
    <%--Copy in Clipboard--%>
    <script>
        function CP(id) {

           const elem = document.createElement('textarea');
           elem.value = id;
           document.body.appendChild(elem);
           elem.select();
           document.execCommand('copy');
           document.body.removeChild(elem);
           alert("کپی شد!");

        }
    </script>

    <%--End Copy in Clipboard--%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-family: Titr; font-size: 20px;">مدیریت تصاویر پست ها</span>
        <hr />
        <span>اضافه کردن تصویر</span>
        <hr />
        <div>
            <div>
                <asp:FileUpload ID="FileUpload" runat="server" />
                <asp:Label ID="lblWarning" runat="server"></asp:Label>
            </div>
            <div>
                <asp:CheckBox ID="chkDenyLimitation" runat="server" Text="با تیک زدن این گزینه هر حجمی قابل قبول خواهد بود" />
            </div>
            <div>
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbUniqueNumber" Checked="true" GroupName="ASN" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtUniqueNumber" Width="300px" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbEntryText" runat="server" GroupName="ASN" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtEntryText" Width="300px" Font-Names="Samim" placeholder="عبارت مورد نظر خود را وارد کنید ..."
                                runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div runat="server" id="DivAfterUploaded" visible="false">
                <div>
                    <asp:Image ID="imgAfterUpload" runat="server" /></div>
                <div>
                    <asp:Label ID="lblAfterUpload" runat="server"></asp:Label></div>
            </div>
                                    <div style="padding:20px;">
                            <span class="DivOptimize"><a style="color:white;" href="http://optimizilla.com/" target="_blank">Optimization (1)</a></span>
                            <span class="DivOptimize"><a style="color:white;" href="https://www.imgonline.com.ua/eng/compress-image-size.php" target="_blank">Optimization (2)</a></span>
                                       
                        </div>
            <div>
                <asp:Button ID="btnUpload" runat="server" BackColor="Green" ForeColor="White" Text="آپلود شود"
                    Style="font-size: 20px; font-family: Samim; cursor: pointer;" />
            </div>
        </div>
        <br />
        <span>لیست کامل تصاویر</span>
        <hr />
        <asp:Panel ID="pnlMain" runat="server" Direction="LeftToRight">
        </asp:Panel>
    </div>
    </form>
</body>
</html>
