<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<%@ Register Src="usercontrols/MenuTopLeft.ascx" TagName="MenuTopLeft" TagPrefix="uc2" %>
<%@ Register Src="~/usercontrols/KingLoginModal.ascx" TagPrefix="uc1" TagName="KingLoginModal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ورود به درگاه فیلم ایران</title>
    <meta name="robots" content="noindex, nofollow">
    <%--==================================================--%>
    <style>
        body{
            background-color:#E6DD44 !important;
        }
    </style>
        <!-- NewsViral CSS  -->
    <link rel="stylesheet" href="files/kingMaterials/css/style.css">
    <link rel="stylesheet" href="files/kingMaterials/css/widgets.css">
    <link rel="stylesheet" href="files/kingMaterials/css/color.css">
    <link rel="stylesheet" href="files/kingMaterials/css/responsive.css">
    <link rel="stylesheet" href="files/kingMaterials/css/custome.css" />
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
            });
    </script>
</body>
</html>
