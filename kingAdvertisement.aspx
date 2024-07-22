<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingAdvertisement.aspx.vb" Inherits="kingAdvertisement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .item-holder p {
            font-size: 14px;
            color: #000;
        }

        .item-holder li {
            color: #000;
            padding-right: 10px;
        }

        @media (max-width: 767px) {
            .item-holder .item-holder {
                width: 100%;
                padding: 20px;
            }
        }

        .item-holder ul ul li {
            list-style-type: circle;
            padding-right: 20px;
        }

        .item-holder ul li {
            list-style-type: disc;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side">
        <div class="item-holder" style="text-align: justify;">
            <asp:Label ID="lbl" CssClass="lbl" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>

