<%@ Page Title="" Language="VB" 
        ValidateRequest="false" 
    MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="participationplan.aspx.vb" Inherits="CMS_Pages_participationplan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="TITLE" style="text-align: center; color: Black; font-size: 20px;">
        <h4>
            <a href="../../participationplan" target="_blank" style="color: Black; font-family: Samim;">مشاهده صفحه مشارکت درگاه </a>
        </h4>
    </div>
    <div>
        <textarea id="txtParticipationPlan" name="content" class="ckeditor" runat="server"></textarea>
        <asp:Button ID="btn"
            runat="server" Text="Update" />

    </div>
</asp:Content>

