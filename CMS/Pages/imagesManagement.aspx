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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
            <div style="padding:15px;text-align:center;">
                <asp:CheckBox ID="chkDenyLimitation"  ForeColor="Red" Font-Size="Large" runat="server" Text="با تیک زدن این گزینه حجم های بین 110 تا 200 کیلوبایت قابل قبول خواهد بود" />
            </div>
            <div>
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbUniqueNumber" GroupName="ASN" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtUniqueNumber" Width="300px" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbEntryText" Checked="true"  runat="server" GroupName="ASN" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtEntryText" Width="300px" Font-Names="Samim" placeholder="عبارت مورد نظر خود را وارد کنید ..."
                                runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div runat="server" id="DivAfterUploaded" visible="false" style="text-align:center;border:2px dotted gray;padding:10px;">
                <div>
                    <asp:Image ID="imgAfterUpload" runat="server" /></div>
                <div>
                    <asp:Label ID="lblAfterUpload" runat="server"></asp:Label></div>
                <div>
                    <asp:Button ID="btnImageAfterUpload" style="padding:5px;background-color:red;color:white;font-family:Samim;" runat="server" Text="حذف این فایل" />
                    <asp:Button ID="btnNextUpload" style="padding:5px;background-color:green;color:white;font-family:Samim;" runat="server" Text="درسته برو بعدی" />
                </div>
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
       
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                 <br />
        <span>
            <asp:CheckBox ID="chkShowImages" runat="server" AutoPostBack="True" />
            لیست کامل تصاویر
        </span>
        <hr />
        <span style="color:red">جهت نمایش تصاویر تیک بالا را بزنید</span>
        <hr/>
                  <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        Loading ...
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:Panel ID="pnlMain" runat="server" Direction="LeftToRight" Visible="false">
        </asp:Panel>
              
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
