<%@ Page Title="" Language="VB"
        ValidateRequest="false"
    MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="agents.aspx.vb" Inherits="CMS_Pages_agents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button CssClass="tabBtn" ID="btnFa" runat="server" Text="فا" />
    <asp:Button CssClass="tabBtn" ID="btnEn" runat="server" Text="En" />
    <div class="TITLE" style="color: Black; font-size: 20px;">
     نماینده های درگاه
    </div>
    <div>
        <asp:MultiView ID="M_CV" runat="server" ActiveViewIndex="0">
        <asp:View ID="View_Fa" runat="server">
            <textarea id="txtCV" name="content" class="ckeditor" runat="server"></textarea>
            <asp:Button ID="btn" OnClientClick="confirm('بعد از آپدیت، انگلیسیشم بروز کن! فهمیدی مهندس؟');" runat="server" Text="Update" />
        </asp:View>
        <asp:View ID="View_En" runat="server">
            <textarea id="txtCVEn" name="content" class="ckeditor" runat="server"></textarea>
            <asp:Button ID="btnEnUpdate" OnClientClick="confirm('انشالله که فارسی بروز کرده باشی قبل این؟');" runat="server" Text="Update" />
        </asp:View>
    </asp:MultiView>
        </div>

</asp:Content>

