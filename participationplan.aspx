﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false" CodeFile="participationplan.aspx.vb" Inherits="participationplan" %>

<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

        ul li {
            list-style-type: decimal;
        }

        ol li {
            list-style-type: decimal;
        }
        ol ol li {
            list-style-type: decimal;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>
</asp:Content>

