<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master"
    AutoEventWireup="false" CodeFile="KingAboutUs.aspx.vb" Inherits="KingAboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->

    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>

    <!--End Page Title-->

    <div class="left-side">
        <div class="item-holder" style="text-align: justify;">
            <asp:Label ID="lbl" CssClass="lbl" runat="server"></asp:Label>
        </div>
    </div>

</asp:Content>

