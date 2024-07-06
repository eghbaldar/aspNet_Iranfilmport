<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingNavigator.ascx.vb" Inherits="usercontrols_KingNavigator" %>
<style>
    .kingNavigator{
        font-family:IranYekan;font-size:11px;padding-bottom:5px;
    }
    .link{
        color:#848484;
    }
    .textSign{
        color:#ccc;
        font-size:14px;
    }
</style>
<div class="kingNavigator">
    <asp:Literal ID="litNavigation" runat="server"></asp:Literal>
</div>