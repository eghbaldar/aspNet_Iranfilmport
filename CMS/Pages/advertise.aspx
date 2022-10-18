<%@ Page Title="" Language="VB"
    ValidateRequest="false" 
    MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="advertise.aspx.vb" Inherits="CMS_Pages_advertise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE" style="text-align: center; color: Black; font-size: 20px;">
        <h4>
            <a href="../../advertise" target="_blank" style="color: Black; font-family: Samim;">مشاهده صفحه تبلیغات درگاه </a>
        </h4>
    </div>
    <div>
        <textarea id="txtAdvertise" name="content" class="ckeditor" runat="server"></textarea>
        <asp:Button ID="btn"
            runat="server" Text="Update" />

    </div>
</asp:Content>

