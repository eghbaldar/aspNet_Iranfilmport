<%@ Page Language="VB" AutoEventWireup="false" CodeFile="msg.aspx.vb" Inherits="dashboard_msg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex, nofollow">
    <style>
        @font-face
        {
            font-family: 'Titr';
            src: url('<%= ResolveUrl("~/files//font/TITRBD.TTF")%>');
        }
        @font-face
        {
            font-family: 'NazaninB';
            src: url('<%= ResolveUrl("~/files//font/NAZANB.TTF")%>');
        }
        @font-face
        {
            font-family: 'Samim';
            src: url('<%= ResolveUrl("~/files//font/Samim-FD.ttf")%>');
        }
    </style>
    <title>سیستم پیام رسان درگاه فیلم ایران</title>
    <link rel="shortcut icon" href="<%= ResolveUrl("~/files/images/icons/icon.png")%>" />
</head>
<body style="direction: rtl; text-align: right; font-family: Samim; font-size: 12px;">
    <form id="form1" runat="server">
    <div style="background-color: #e4d900; padding: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
        margin-top: 10px; margin-bottom: 10px; border-radius: 5px; text-justify: inter-word;
        text-align: justify; text-align: center; font-family: Titr; font-size: 20px;">
        سیستم پیام رسان درگاه فیلم ایران
    </div>
    <div style="padding: 20px; border: 2px solid #ccc; -moz-border-radius: 5px; -webkit-border-radius: 5px;
        padding: 5px; border-radius: 5px;">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS">
            <ItemTemplate>
                <table style="width: 100%;">
                    <td>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <div style="padding: 5px; border-left: 2px solid #ccc;">
                                        <div>
                                            موضوع:
                                        </div>
                                        <div style="font-family: Titr;">
                                            <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' /></div>
                                    </div>
                                </td>
                                <td>
                                    <div style="padding: 5px;">
                                        <div>
                                            شماره تراکنش:
                                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' /></div>
                                        <div>
                                            تاریخ:
                                            <asp:Label ID="dateLabel" runat="server" Text='<%# getDate(Eval("date")) %>' /></div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    </tr>
                    <tr>
                        <td>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="padding: 5px; font-family: NazaninB; font-size: 18px;text-align:justify;">
                                <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' />
                            </div>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_messages] WHERE ([ID] = @ID)">
            <SelectParameters>
                <asp:RouteParameter Name="id" RouteKey="id" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div style="background-color: #e4d900; padding: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
        margin-top: 10px; border-radius: 5px; text-justify: inter-word; text-align: justify">
        پیامی که مشاهده میکنید سیستمی ارسال گردیده و نسخه ای از آن به ایمیل شما ارسال شده
        است.
    </div>
    <hr />
    <div style="font-family: Samim; text-align: center; padding: 10px; font-size: 11px;
        color: #848484;">
        درگاه فیلم ایران | Iran Film Port</div>
    </form>
</body>
</html>
