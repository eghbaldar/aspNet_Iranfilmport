<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingAgents.aspx.vb" Inherits="kingAgents" %>

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
            text-align: center;
            color: black;
            padding: 10px;
            /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#000000+0,ffd800+100&0+0,0.65+100 */
            background: -moz-linear-gradient(left, rgba(0,0,0,0) 0%, rgba(255,216,0,0.65) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(left, rgba(0,0,0,0) 0%,rgba(255,216,0,0.65) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to right, rgba(0,0,0,0) 0%,rgba(255,216,0,0.65) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a6ffd800',GradientType=1 ); /* IE6-9 */
            margin: 10px;
        }

        .boxCity {
            font-size: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="item-holder" style="text-align: justify;">
        <asp:Label ID="lbl" CssClass="lbl" runat="server"></asp:Label>
    </div>
</asp:Content>

