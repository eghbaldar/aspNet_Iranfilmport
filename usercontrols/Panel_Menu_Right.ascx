<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_Menu_Right.ascx.vb"
    Inherits="usercontrols_Panel_Menu_Right" %>
<style>
    /* 
  You want a simple and fancy tooltip?
  Just copy all [data-tooltip] blocks:
*/
    [data-tooltip]
    {
        position: relative;
        /*z-index: 10;*/
    }
    
    /* Positioning and visibility settings of the tooltip */
    [data-tooltip]:before, [data-tooltip]:after
    {
        position: absolute;
        visibility: hidden;
        opacity: 0;
        left: 50%;
        bottom: calc(100% + 5px); /* 5px is the size of the arrow */
        pointer-events: none;
        transition: 0.2s;
        will-change: transform;
    }
    
    /* The actual tooltip with a dynamic width */
    [data-tooltip]:before
    {
        content: attr(data-tooltip);
        padding: 10px 18px;
        min-width: 50px;
        max-width: 300px;
        width: max-content;
        width: -moz-max-content;
        border-radius: 6px;
        font-size: 14px;
        background-color: rgba(59, 72, 80, 0.9);
        background-image: linear-gradient(30deg,
    rgba(59, 72, 80, 0.44),
    rgba(59, 68, 75, 0.44),
    rgba(60, 82, 88, 0.44));
        box-shadow: 0px 0px 24px rgba(0, 0, 0, 0.2);
        color: #fff;
        text-align: center;
        white-space: pre-wrap;
        transform: translate(-50%, -5px) scale(0.5);
    }
    
    /* Tooltip arrow */
    [data-tooltip]:after
    {
        content: '';
        border-style: solid;
        border-width: 5px 5px 0px 5px; /* CSS triangle */
        border-color: rgba(55, 64, 70, 0.9) transparent transparent transparent;
        transition-duration: 0s; /* If the mouse leaves the element, 
                              the transition effects for the 
                              tooltip arrow are "turned off" */
        transform-origin: top; /* Orientation setting for the
                              slide-down effect */
        transform: translateX(-50%) scaleY(0);
    }
    
    /* Tooltip becomes visible at hover */
    [data-tooltip]:hover:before, [data-tooltip]:hover:after
    {
        visibility: visible;
        opacity: 1;
    }
    /* Scales from 0.5 to 1 -> grow effect */
    [data-tooltip]:hover:before
    {
        transition-delay: 0.3s;
        transform: translate(-50%, -5px) scale(1);
    }
    /* 
  Arrow slide down effect only on mouseenter (NOT on mouseleave)
*/
    [data-tooltip]:hover:after
    {
        transition-delay: 0.5s; /* Starting after the grow effect */
        transition-duration: 0.2s;
        transform: translateX(-50%) scaleY(1);
    }
    /*
  That's it for the basic tooltip.

  If you want some adjustability
  here are some orientation settings you can use:
*/
    
    /* LEFT */
    /* Tooltip + arrow */
    [data-tooltip-location="left"]:before, [data-tooltip-location="left"]:after
    {
        left: auto;
        right: calc(100% + 5px);
        bottom: 50%;
    }
    
    /* Tooltip */
    [data-tooltip-location="left"]:before
    {
        transform: translate(-5px, 50%) scale(0.5);
    }
    [data-tooltip-location="left"]:hover:before
    {
        transform: translate(-5px, 50%) scale(1);
    }
    
    /* Arrow */
    [data-tooltip-location="left"]:after
    {
        border-width: 5px 0px 5px 5px;
        border-color: transparent transparent transparent rgba(55, 64, 70, 0.9);
        transform-origin: left;
        transform: translateY(50%) scaleX(0);
    }
    [data-tooltip-location="left"]:hover:after
    {
        transform: translateY(50%) scaleX(1);
    }
    
    
    
    /* RIGHT */
    [data-tooltip-location="right"]:before, [data-tooltip-location="right"]:after
    {
        left: calc(100% + 5px);
        bottom: 50%;
    }
    
    [data-tooltip-location="right"]:before
    {
        transform: translate(5px, 50%) scale(0.5);
    }
    [data-tooltip-location="right"]:hover:before
    {
        transform: translate(5px, 50%) scale(1);
    }
    
    [data-tooltip-location="right"]:after
    {
        border-width: 5px 5px 5px 0px;
        border-color: transparent rgba(55, 64, 70, 0.9) transparent transparent;
        transform-origin: right;
        transform: translateY(50%) scaleX(0);
    }
    [data-tooltip-location="right"]:hover:after
    {
        transform: translateY(50%) scaleX(1);
    }
    
    
    
    /* BOTTOM */
    [data-tooltip-location="bottom"]:before, [data-tooltip-location="bottom"]:after
    {
        top: calc(100% + 5px);
        bottom: auto;
    }
    
    [data-tooltip-location="bottom"]:before
    {
        transform: translate(-50%, 5px) scale(0.5);
    }
    [data-tooltip-location="bottom"]:hover:before
    {
        transform: translate(-50%, 5px) scale(1);
    }
    
    [data-tooltip-location="bottom"]:after
    {
        border-width: 0px 5px 5px 5px;
        border-color: transparent transparent rgba(55, 64, 70, 0.9) transparent;
        transform-origin: bottom;
    }
   
    .example-elements
    {
        flex-grow: 1;
        flex-direction: column;
        align-items: center;
        align-content: center;
        justify-content: center;
        text-align: center;
        padding-right: 4%;
    }
    
    .example-elements p
    {
        padding: 6px;
        display: inline-block;
        margin-bottom: 5%;
        color: #fff;
    }
    .RedCircle
    {
        padding:5px;
        background-color:Red;
        color:White;
 border-radius:50%;
    }
    .unread{
        padding:2px;
        border-radius:50%;
        background-color:red;
        width:10px;
        color:white;
        position:absolute;
    }
</style>
<style>
.button {
  color: white;
  display: inline-block;
  position: relative;
}
.button__badge {
  background-color: #fa3e3e;
  border-radius: 5px;
  color: white;
  padding: 1px 5px;
  font-size: 15px;
  position: absolute;
  top: 0;
  right: 0;
}
</style>
<div>
    <div class="example-elements">


        <p data-tooltip="صفحه اصلی">
            <asp:ImageButton ID="btnMnuHome" ImageUrl="~/files/images/icons/panel_home.png" runat="server" />
        </p>
        <p data-tooltip="پرونده مالی">
            <asp:ImageButton ID="btnMnuMoney" Width="45px" ImageUrl="~/files/images/icons/panel_money.png"
                runat="server" />
        </p>
       
        <p data-tooltip="تیکت‌ها">
            <sapn class="button">
                <asp:ImageButton ID="btnMnuTicket" Width="45px" ImageUrl="~/files/images/icons/panel_ticket.png"
              runat="server" />
                 <span class="button__badge" runat="server" id="HolderLblCountUnread" >
                     <asp:Label ID="lblCountUnread" runat="server" ></asp:Label>
                 </span>
            </sapn>            
        </p>


        <p data-tooltip="خروج">
            <asp:ImageButton ID="btnMnuExit" Width="45px" ImageUrl="~/files/images/icons/panel_exit.png"
                runat="server" />
        </p>
    </div>
</div>
<hr />
<table>
    <tr>
        <td>
            نام:
        </td>
        <td>
            <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            تعداد ورود:
        </td>
        <td>
            <span style="background-color: Gray; border-radius: 50%; padding: 5px; width: 20px;
                text-align: center; color: White;">
                <asp:Label ID="lblCustomerVisitCounter" runat="server"></asp:Label>
            </span>&nbsp بار
        </td>
    </tr>
    <tr>
        <td>
            شماره همراه:
        </td>
        <td>
            <asp:Label ID="lblCustomerPhone" runat="server"></asp:Label>
        </td>
    </tr>
</table>
<asp:Panel ID="PnlWarningInstallment" Visible="false" runat="server">
    <hr />
    <div style="text-align:justify;color:Black;">
        <asp:Label ID="lblWarningInstallments" runat="server"></asp:Label>
    </div>
</asp:Panel>
