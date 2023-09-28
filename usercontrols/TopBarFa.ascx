<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TopBarFa.ascx.vb" Inherits="usercontrols_TopBar" %>
<style>
    .TopBarTd
    {
        width: 35px;
    }
    .iconTopFlag
    {
        width: 22px;
    }
    .tbHeadDescriptionTop
    {
        font-weight: bold;
        font-family: Samim;
    }
    .tbHeadDescriptionDown
    {
        padding-right: 5px;
    }
    .tbHeadDescriptionDown
    {
        color: #999999;
        font-family: Samim;
        font-size: 11px;
        font-style: italic;
    }
    /****************************//****************************//****************************/
    /*در اصل جای این کد در این صفحه نبود و در صفحه ی styleEn.css بود ولی بخاطر تفکیک و باگ نمایش در سافاری و ورژن های قدیمی مرورگرهای گوشی اینجا آوردم*/
    .containerMother
    {
        direction: rtl;
        margin-top: 2%;
    }
    .header-uper .contact-info
    {
        float: left;
        text-align: right;
    }
    @media (max-width: 991px)
    {
        .header-uper .contact-info
        {
            padding-left: 0;
            float: unset;
            margin-bottom: 30px;
            text-align: center;
        }
    }
    @media only screen and (max-width: 767px)
    {
        .header-uper .contact-info .item
        {
            text-align: center !important;
            margin-left: 40px !important;
            margin-right: 0px !important;
        }
    }
    /****************************//****************************//****************************/
    @media only screen and (max-width: 760px)
    {
        .fa-search, .fa-facebook, .fa-twitter, .fa-instagram, .fa-lock
        {
            font-size: 35px;
        }
        .iconTopFlag
        {
            width: 50px;
        }
        .tbHeadDescriptionDown, .tbHeadDescriptionTop
        {
            display: block !important;
            text-align: center;
        }
        .tbHeadDescriptionTop
        {
            padding-bottom: 10px;
            font-size: 25px;
        }
        .tbHeadDescriptionDown
        {
            font-size: 12px;
            color: #999999;
        }
        .tbHeadDescriptionDown
        {
            padding-left: 0;
        }
    }
</style>
<div class="header-top">
    <div class="container clearfix">
        <div class="top-left">
            <table style="width: 100%;">
                <tr>
                    <td class="TopBarTd">
                        <a href="#"><i class="fa fa-lock" id="myBtn" aria-hidden="true"></i></a>
                    </td>
                    <td class="TopBarTd">
                        <a target="_blank" href="http://instagram.com/iranfilmport"><i class="fa fa-instagram"
                            aria-hidden="true"></i></a>
                    </td>
                    <td class="TopBarTd">
                        <a target="_blank" href="http://twitter.com/iranfilmport"><i class="fa fa-twitter"
                            aria-hidden="true"></i></a>
                    </td>
                    <td class="TopBarTd">
                        <a target="_blank" href="http://fb.com/iranfilmport"><i class="fa fa-facebook" aria-hidden="true">
                        </i></a>
                    </td>
                    <td class="TopBarTd">
                        <a target="_blank" onclick="return SearchBox();"><i class="fa fa-search" aria-hidden="true">
                        </i></a>
                    </td>
                    <td class="TopBarTd">
                        <asp:LinkButton ID="btnEn" runat="server" OnClick="btnEn_Click">
                     <img  class="iconTopFlag" alt="لوگو تغییر زبان" src='<%= Page.ResolveUrl("~/files/images/icons/langen.png") %>'
                            />
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
        <div class="top-right">
            <table style="width: 100%;">
                <tr>
                    <td class="tbHeadDescriptionDown">
                        تخصصی‌ترین مرکز پخش و ارسال فیلم به فستیوال‌های بین‌المللی
                    </td>
                    <td class="tbHeadDescriptionTop">
                        درگاه فیلم ایران
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
