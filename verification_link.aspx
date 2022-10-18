<%@ Page Language="VB" AutoEventWireup="false" CodeFile="verification_link.aspx.vb"
    Inherits="verification_link" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<%--////////////////////////// start Menu LOGIN ///////////////////////////--%>
<script src='<%= ResolveUrl("~/files/js/menu_login/jquery-1.12.4.min.js") %>' type="text/javascript"></script>
<link href='<%= ResolveUrl("~/files/css/menu_login/menu.css") %>' rel="stylesheet"
    type="text/css" />
<link href='<%= ResolveUrl("~/files/css/menu_login/main.css") %>' rel="stylesheet"
    type="text/css" />
<script src='<%= ResolveUrl("~/files/js/menu_login/main.js") %>' type="text/javascript"></script>
<style>
    .backdrop
    {
        background: #e6db00;
        filter: alpha(opacity=90);
        opacity: .4;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=90)";
    }
    .background
    {
        background-image: url('files/images/background/bg_venue_1.jpg');
    }
    /* BACKGROUND */
    .background, .backdrop
    {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-size: cover;
    }
    
    /* CONTAINER */
    -container
    {
        max-width: 400px;
        width: 100%;
        z-index: 1;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-left: -200px;
        margin-top: -286px;
    }
    -container a
    {
        text-decoration: none;
    }
    
    /* CONTENT */
    -content
    {
        background-color: #FFFFFF;
        padding: 25px 25px;
    }
    -content i
    {
        width: 30px;
        text-align: center;
        vertical-align: bottom;
    }
    
    /* HEADER */
    -header
    {
        text-align: center;
    }
    -header img
    {
        border: 1px solid #CCCCCC;
        padding: 10px;
        border-radius: 10px;
    }
    -header h3
    {
        font-weight: lighter;
        font-size: 25px;
        margin: 10px 0;
    }
    
    /* FROM INPUT */
    .input-container
    {
        border-bottom: 1px solid #CCCCCC;
        margin-top: 15px;
        font-size: 20px;
        color: #9e9e9e;
        padding-bottom: 5px;
    }
    .input
    {
        border: 0;
        width: 200px;
    }
    .input:focus
    {
        outline: none;
    }
    #show-password
    {
        float: right;
        vertical-align: bottom;
        text-align: center;
        margin-top: 7px;
        cursor: pointer;
    }
    .forgot-password
    {
        float: right;
    }
    .rememberme-container
    {
        margin-top: 15px;
        padding: 0;
    }
    .rememberme-container input
    {
        margin-left: 0;
    }
    .rememberme span
    {
        vertical-align: top;
    }
    .button
    {
        margin-top: 15px;
        width: 100%;
        background: #dbd100;
        border: 0;
        color: #000;
        padding: 10px;
        font-size: 15px;
        cursor: pointer;
        transition: background .3s;
    }
    .button:hover
    {
        background: #9f9800;
        color: #fff;
    }
    .button:focus
    {
        outline: none;
    }
    .register
    {
        margin-top: 5px;
        background: #dadada;
        border: 0;
        color: #676464;
        padding: 9px;
        font-size: 15px;
        display: block;
        text-align: center;
    }
    .register:hover
    {
        background: #d0d0d0;
    }
    
    /* ACTIVATION LINK */
    .resend-activation
    {
        text-align: center;
        margin-top: 15px;
        margin-top: 10px;
        color: #425384;
        line-height: 22px;
    }
    .attibution
    {
        text-align: center;
        margin-top: 7px;
        color: #a5a5a5;
        line-height: 25px;
    }
    
    /* SEPARATOR */
    -content .separator
    {
        margin: 20px 0;
        border-top: 1px solid #CCCCCC;
        position: relative;
    }
    -content .separator-text
    {
        display: block;
        position: absolute;
        top: -10px;
        left: 50%;
        margin-left: -22px;
        padding: 0px 10px;
        background: #FFFFFF;
        color: #8a8a8a;
    }
    
    /* SOCIAL MEDIA LOGIN */
    .socmed-login .socmed-btn
    {
        padding: 10px 25px;
        color: #FFFFFF;
        display: block;
        margin-top: 5px;
        text-align: center;
    }
    .socmed-login .socmed-btn i
    {
        text-align: left;
        border-right: 1px solid #FFFFFF;
        margin-right: 15px;
        width: 25px;
        font-size: 16x;
        vertical-align: middle;
    }
    .socmed-login .socmed-btn span
    {
        display: inline-block;
        margin-top: 8px;
        line-height: 0;
    }
    .socmed-login .facebook-btn
    {
        background: #3b5998;
    }
    .socmed-login .facebook-btn:hover
    {
        background: #324b80;
    }
    .socmed-login .google-btn
    {
        background: #ef0a0a;
    }
    .socmed-login .google-btn:hover
    {
        background: #d40909;
    }
    .socmed-login .yahoo-btn
    {
        background: #940b94;
    }
    .socmed-login .yahoo-btn:hover
    {
        background: #790a79;
    }
    
    /* RESPONSIVE */
    @media screen and (max-height: 800px)
    {
        -container
        {
            margin-top: 0 !important;
            top: 10px !important;
        }
    }
    @media screen and (max-width: 400px)
    {
        -container
        {
            left: 5px;
            margin-left: 5px;
            min-width: 283px;
            right: 10px;
            margin-bottom: 10px;
            width: auto;
        }
        .input
        {
            width: 140px;
        }
        .socmed-login .socmed-btn i
        {
            margin-right: 5px;
            width: 19px;
        }
    }
</style>
<%--////////////////////////// end Menu LOGIN ///////////////////////////--%>
</head>
<body style="background-image:url('files/images/background/bg_venue_1.jpg');text-align:center;">
    <form id="form1" runat="server" style="background-color:Red;">
       <table style="width:100px;">
       <tr style="width:100px;">
       <td>sds</td>
       </tr>
       </table>
    </form>
</body>
</html>
