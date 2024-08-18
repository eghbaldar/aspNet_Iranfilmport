<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" 
    ValidateRequest="false"
    AutoEventWireup="false" CodeFile="features.aspx.vb" Inherits="CMS_Pages_features" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE" style="text-align: center; color: Black; font-size: 20px;">
        <h4>
            <a href="http://iranfilmport.com/originality" target="_blank" style="color: Black; font-family: Samim;">مشاهده صفحه وِیژگی‌های ما</a>
        </h4>
    </div>
    <textarea id="txt" name="content" class="ckeditor" runat="server"></textarea>
    <asp:Button ID="btn" runat="server" Text="Update" />
</asp:Content>

