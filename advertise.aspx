<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false" CodeFile="advertise.aspx.vb" Inherits="advertise" %>
<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/last_articles.ascx" TagName="last_articles" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <style>
        p {
            font-size: 14px;
            color: #000;
        }

        li {
            color: #000;
        }

        @media (max-width: 767px) {
            .item-holder {
                width: 100%;
                padding: 20px;
            }
        }

        ul ul li {
            list-style-type: circle;
        }

        ul li {
            list-style-type: disc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/MovibetaBG.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal></h1>
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
                        </div>
                    </div>
                </div>
                <uc1:banners_right ID="banners_right1" runat="server" />
                <%--<uc2:last_articles ID="last_articles1" runat="server" />--%>
            </div>
        </div>
    </section>
</asp:Content>

