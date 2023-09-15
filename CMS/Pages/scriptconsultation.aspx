<%@ Page Title="" Language="VB"
      ValidateRequest="false" 
    MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="scriptconsultation.aspx.vb" Inherits="CMS_Pages_scriptconsultation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
          <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="TITLE" style="text-align: center; color: Black; font-size: 20px;">
        <h4>
            <a href="https://iranfilmport.com/%D9%85%D8%B4%D8%A7%D9%88%D8%B1%D9%87-%D9%BE%D8%AE%D8%B4-%D8%A8%DB%8C%D9%86-%D8%A7%D9%84%D9%85%D9%84%D9%84%DB%8C-%D9%81%DB%8C%D9%84%D9%85" target="_blank" style="color: Black; font-family: Samim;">مشاوره ارسال  و پخش فیلم</a>
            <br /><br />
            <a href="https://iranfilmport.com/%D9%85%D8%B4%D8%A7%D9%88%D8%B1%D9%87-%D9%81%DB%8C%D9%84%D9%85%D9%86%D8%A7%D9%85%D9%87-%DA%A9%D9%88%D8%AA%D8%A7%D9%87-%D9%85%D8%B4%D8%A7%D9%88%D8%B1%D9%87-%D9%81%DB%8C%D9%84%D9%85%D9%86%D8%A7%D9%85%D9%87-%D8%A8%D9%84%D9%86%D8%AF" target="_blank" style="color: Black; font-family: Samim;">صفحه تکراری</a>
            <br /><br />
            <a href="https://iranfilmport.com/%D9%86%DA%AF%D8%A7%D8%B1%D8%B4-%D8%A8%D8%A7%D8%B2%D9%86%D9%88%DB%8C%D8%B3%DB%8C-%D9%81%DB%8C%D9%84%D9%85%D9%86%D8%A7%D9%85%D9%87-%DA%A9%D9%88%D8%AA%D8%A7%D9%87-%D8%A8%D9%84%D9%86%D8%AF" target="_blank" style="color: Black; font-family: Samim;">نگارش و بازنویسی</a>
        </h4>
    </div>
    <div>
        <textarea id="txtScriptConsultation" name="content" class="ckeditor" runat="server"></textarea>
        <asp:Button ID="btn"
            runat="server" Text="Update" />

    </div>
</asp:Content>

