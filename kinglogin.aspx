<%@ Page Language="VB" AutoEventWireup="false" CodeFile="kinglogin.aspx.vb" Inherits="kinglogin" %>
<%@ Register Src="~/usercontrols/KingLoginModal.ascx" TagPrefix="uc1" TagName="KingLoginModal" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ورود به درگاه فیلم ایران</title>
    <meta name="robots" content="noindex, nofollow">
        <meta name="description" content="اخبار ، نقد و تحلیل فیلم کوتاه و بلند و چگونگی پخش و ارسال فیلم کوتاه و بلند به فستیوال های خارجی و بین المللی" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- mobile Color and Status -->
    <meta name="theme-color" content="#E5DA00">
    <%--Andriod--%>
    <meta name="apple-mobile-web-app-status-bar-style" content="#ffffff">
    <meta name="msapplication-navbutton-color" content="#ffffff">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="apple-touch-icon" sizes="128x128" href="<%= ResolveUrl("~/files/kingMaterials/imgs/logos/iconScreen.png")%>">
    <link rel="shortcut icon" type="image/x-icon" href="<%= ResolveUrl("~/files/kingMaterials/imgs/logos/iconScreen.png")%>">
    <%--==================================================--%>
    <style>
        body{
            background-color:#E6DD44 !important;
        }
    </style>
        <!-- NewsViral CSS  -->
    <link rel="stylesheet" href="/files/kingMaterials/css/style.css">
    <link rel="stylesheet" href="/files/kingMaterials/css/widgets.css">
    <link rel="stylesheet" href="/files/kingMaterials/css/color.css">
    <link rel="stylesheet" href="/files/kingMaterials/css/responsive.css">
    <link rel="stylesheet" href="/files/kingMaterials/css/custome.css" />
    <!-- General Modal -->
    <link href="files/kingMaterials/plugins/modal/modal.css" rel="stylesheet" />
    <!-- Login Modal -->
    <link href="files/kingMaterials/pagecssjs/loginModal/css.css" rel="stylesheet" />
</head>
<body style="direction: rtl;">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
        </asp:ScriptManager>

        <uc1:KingLoginModal runat="server" ID="KingLoginModal" />
    </form>

    <script src="/files/kingMaterials/js/vendor/jquery-3.6.0.min.js"></script>
    <script src="/files/kingMaterials/js/vendor/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#loginModal').modal("show");
            });
            $(function () {
                $(".close").hide();
            });
    </script>
</body>
</html>
