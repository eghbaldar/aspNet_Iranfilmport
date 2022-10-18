<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Management_Login_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ورود به صفحه مدیریت</title>
    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- mobile Color and Status -->
    <meta name="theme-color" content="#E5DA00">
    <%--Andriod--%>
    <meta name="apple-mobile-web-app-status-bar-style" content="#ffffff">
    <meta name="msapplication-navbutton-color" content="#ffffff">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="apple-touch-icon" sizes="128x128" href="<%= ResolveUrl("~/files/images/icons/iconScreen.png")%>">
    <!-- -->
    <style type="text/css">
        @font-face {
            font-family: Titr;
            src: url(../content/font/TITR.TTF);
        }

        @font-face {
            font-family: koodak;
            src: url(../content/font/KoodakBold.ttf);
        }

        @font-face {
            font-family: irsans;
            src: url(../content/font/irsans.ttf);
        }

        @font-face {
            font-family: Samim;
            src: url(../content/font/Samim-FD.ttf);
        }

        .Ar {
            direction: ltr;
            padding: 5px;
            background-color: #DBEAF9;
            text-decoration: none;
            margin: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            font-family: titr;
        }

            .Ar:hover {
                background-color: #ED1E24;
                color: White;
            }

        body {
            direction: rtl;
            padding: 0px;
            margin: 0;
            background: url('../content/imgs/back.gif');
            overflow: hidden;
        }

        #body {
            margin: 0px auto 0px auto;
            width: 500px;
            text-align: center;
            /*background-color: #fff085;*/
            padding: 20px;
            -moz-border-radius: 20px;
            -webkit-border-radius: 20px;
            border-radius: 20px;
            margin-top: 20px;
        }

        #form1 {
            text-align: center;
        }

        .L {
            border: 3px solid #67B1DF;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .txt {
            padding: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 2px solid #ffb700;
            text-align: center;
            font-family: Samim;
            width: 168px;
        }

        .btn {
            padding: 10px;
            background-color: #ffb700;
            border: 0;
            cursor: pointer;
            width: 182px;
            font-family: Samim;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        @media only screen and (max-width: 400px) {

            #body {
                width: 100%;
                margin: 0;
                padding-top: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="body" style="font-family: Tahoma; text-align: center;">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                        <asp:View ID="ViewDataEntry" runat="server">
                            <table style="width: 100%; text-align: center;">
                                <tr>
                                    <td>
                                        <asp:ImageButton Width="200px"
                                            ImageUrl="~/files/images/logos/logoSquare.png"
                                            ID="btnChange" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtuser" placeholder="نام کاربری"
                                            CssClass="txt"
                                            Style="font-family: Samim; text-align: center;"
                                            runat="server"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div>
                                            <div>
                                                <asp:Image ID="ImageCaptacha" runat="server" />
                                            </div>
                                            <div>
                                                <asp:TextBox ID="txtCaptcha" placeholder="عدد 7 رقمی امنیتی" CssClass="txt"
                                                    runat="server" Style="direction: ltr;"></asp:TextBox>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSubmit" CssClass="btn" runat="server" Text="ارسال کد" ValidationGroup="1" />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="ViewSMS" runat="server">
                            <table style="width: 100%; text-align: center;">
                                <tr>
                                    <td>
                                        <img src="../../files/images/logos/logoSquare.png"
                                            width="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtSMS" placeholder="کد شش رقمی    "
                                            CssClass="txt"
                                            Style="font-family: Samim; text-align: center;"
                                            runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnValidation" CssClass="btn" runat="server" Text="ورود" ValidationGroup="1" />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="ViewOtherWay" runat="server">
                            <div>
                                <asp:ImageButton Width="200px"
                                    ImageUrl="~/files/images/logos/logoSquare.png"
                                    ID="ImageButton1" runat="server" />
                            </div>
                            <div>
                                <asp:TextBox ID="txtSpecialUsername" placeholder="USERNAME"
                                    CssClass="txt"
                                    Style="font-family: Samim; text-align: center;"
                                    runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <asp:TextBox ID="txtSpecialPassword" placeholder="PASSWORD"
                                    CssClass="txt"
                                    TextMode="Password"
                                    Style="font-family: Samim; text-align: center;"
                                    runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <div>
                                    <asp:Image ID="ImageCaptachaSpecial" runat="server" />
                                </div>
                                <div>
                                    <asp:TextBox ID="txtSpecialCaptcha" placeholder="6 Security Digits ..." CssClass="txt"
                                        runat="server" Style="direction: ltr;"></asp:TextBox>
                                </div>
                            </div>
                            <div>

                                <asp:Button CssClass="btn"  ID="btnSpecialLogin" runat="server" Text="ENTER" />
                            </div>
                        </asp:View>
                    </asp:MultiView>

                    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                        <ProgressTemplate>
                            Loading...
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
