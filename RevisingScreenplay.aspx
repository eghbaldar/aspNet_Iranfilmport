<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false" CodeFile="RevisingScreenplay.aspx.vb" Inherits="RevisingScreenplay" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/comment.ascx" TagName="comment" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        h5
        {
            font-family: Samim;
            font-size: 14px;
        }
        p
        {
            font-size: 14px;
            font-family: Samim;
            direction: rtl;
            color: #000;
        }
        @media (max-width: 767px)
        {
            .item-holder
            {
                width: 100%;
                padding: 20px;
            }
            .imgRes
            {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_7.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <span style="font-family: Titr;">نگارش و بازنویسی حرفه‌ای فیلمنامه کوتاه و بلند</span>
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
                        <asp:Label ID="lbl" CssClass="lbl" runat="server"></asp:Label>
                        <uc3:comment ID="comment" runat="server" />
                    </div>
                </div>
                <uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>
</asp:Content>

