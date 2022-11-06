<%@ Page Language="VB" AutoEventWireup="false"
    ValidateRequest="false" 
    CodeFile="resumeEdit.aspx.vb" Inherits="CMS_Pages_resumeEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit This Resume ...</title>
        <link href="../files/cssCMS.css" rel="stylesheet" type="text/css" />
    <style>
        body{
            padding:10px;
        }
    </style>
    <script src="../../../files/ckeditor/ckeditor.js"></script>
    <script src="../../../files/ckeditor/samples/js/sample.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button CssClass="tabBtn" Width="100%" ID="btnUpdateAccolade" runat="server" Text="بروزرسانی" />
        </div>
        <div>
            <textarea id="txtAccolade_fa" name="content" class="ckeditor" runat="server"></textarea>
        </div>
        <div>
            <textarea id="txtAccolade_en" name="content" class="ckeditor" runat="server"></textarea>
        </div>
    </form>
</body>
</html>
