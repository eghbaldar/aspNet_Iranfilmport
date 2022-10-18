<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<%@ Register Src="usercontrols/Login.ascx" TagName="Loginascx" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/MenuTopLeft.ascx" TagName="MenuTopLeft" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ورود به درگاه فیلم ایران</title>
    <meta name="robots" content="noindex, nofollow">
    <meta charset="utf-8">
    <link rel="shortcut icon" href="<%= ResolveUrl("~/files/images/icons/icon.png")%>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body style="direction:rtl;">
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <uc2:MenuTopLeft ID="MenuTopLeft1" runat="server" />
    <div class="background">
    </div>
    <div class="backdrop">
    </div>
    <uc1:Loginascx ID="Loginascx1" runat="server" />
    </form>
</body>
</html>
