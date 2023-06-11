<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false" CodeFile="agents.aspx.vb" Inherits="agents" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .boxAgent {
            padding: 10px;
            border: 2px solid #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin: 5px;
            direction: rtl;
            /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#ededed+0,000000+34&0.65+0,0+13,0+13 */
background: -moz-linear-gradient(top, rgba(237,237,237,0.65) 0%, rgba(146,146,146,0) 13%, rgba(0,0,0,0) 34%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgba(237,237,237,0.65) 0%,rgba(146,146,146,0) 13%,rgba(0,0,0,0) 34%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgba(237,237,237,0.65) 0%,rgba(146,146,146,0) 13%,rgba(0,0,0,0) 34%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6ededed', endColorstr='#00000000',GradientType=0 ); /* IE6-9 */
        }

        .boxAgentAvatar {
            -moz-border-radius: 15px;
            -webkit-border-radius: 15px;
            border-radius: 15px;
            width: 200px;
        }

        .boxPhotos {
            -moz-border-radius: 15px;
            -webkit-border-radius: 15px;
            border-radius: 15px;
            width: 100%;
            margin: 10px;
        }

        .boxBody {
            text-align:center;
            font-family: Samim;
            color: black;
            padding: 10px;
            /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#000000+0,ffd800+100&0+0,0.65+100 */
            background: -moz-linear-gradient(left, rgba(0,0,0,0) 0%, rgba(255,216,0,0.65) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(left, rgba(0,0,0,0) 0%,rgba(255,216,0,0.65) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to right, rgba(0,0,0,0) 0%,rgba(255,216,0,0.65) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a6ffd800',GradientType=1 ); /* IE6-9 */
            margin: 10px;
        }
        .boxCity{
            font-family:'Koodak';
            font-size:45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_9.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
                </h1>
            </div>
        </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div class="left-side">
                        <div class="item-holder" style="text-align: justify;">

                            <asp:Label ID="lbl" CssClass="lbl" runat="server"></asp:Label>

<%--<div  class="boxAgent">
    <div style="text-align:center;">
        <span class="boxCity">زنجان</span>
        <br /> <br />
        <img class="boxAgentAvatar" src="files/uploadFiles/mutual/kermani.jpg" width="" />
    </div>
    <div class="boxBody">
        نام: حمید کرمانی
        <br />
        استان و شهر: زنجان - زنجان
        <br />
        شماره تماس: 09193453936
        <br />
        آدرس: زنجان
        <br />
        مدل نمایندگی: رسمی و غیرانحصاری
    </div>
    <img class="boxPhotos" src="files/uploadFiles/mutual/agreement_kermani.jpg" />
    <img class="boxPhotos" src="files/uploadFiles/mutual/photo_kermani.jpg" />
    <img class="boxPhotos" src="files/uploadFiles/mutual/kermaniLicense.jfif" />
</div>
<div  class="boxAgent">
    <div style="text-align:center;">
        <span class="boxCity">کرمانشاه</span>
        <br /> <br />
        <img class="boxAgentAvatar" src="files/uploadFiles/mutual/isari.jpg" width="" />
    </div>
    <div class="boxBody">
        نام: بنیامین ایثاری
        <br />
        استان و شهر: کرمانشاه - کرمانشاه
        <br />
        شماره تماس: 09030310966
        <br />
        آدرس: کرمانشاه
        <br />
        مدل نمایندگی: رسمی و غیرانحصاری
    </div>
    <img class="boxPhotos" src="files/uploadFiles/mutual/agreement_isari.jpg" />
    <img class="boxPhotos" src="files/uploadFiles/mutual/photo_isari.jpg" />
</div>--%>
                        </div>
                    </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>



</asp:Content>

