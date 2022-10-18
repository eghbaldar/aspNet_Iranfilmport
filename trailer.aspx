<%@ Page Language="VB" AutoEventWireup="false" CodeFile="trailer.aspx.vb" Inherits="trailer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <style>
        .h_iframe-aparat_embed_frame
        {
            position: relative;
        }
        .h_iframe-aparat_embed_frame .ratio
        {
            display: block;
            width: 100%;
            height: auto;
        }
        .h_iframe-aparat_embed_frame iframe
        {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
    </style>
    <div class="h_iframe-aparat_embed_frame">
        <span style="display: block; padding-top: 57%"></span>
        <iframe id="frTrailer" runat="server" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
    </div>
    </form>
</body>
</html>
