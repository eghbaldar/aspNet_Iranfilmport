<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Header.ascx.vb" Inherits="usercontrols_Header" %>
<%@ Register src="advertiseModal.ascx" tagname="advertiseModal" tagprefix="uc1" %>
<style>
    .imgMainLogoTop
    {
        width: 350px;
    }
    @media only screen and (max-width: 1200px)
    {
        .imgMainLogoTop
        {
            width: 220px;
        }
    }
    @media only screen and (max-width: 991px)
    {
        .imgMainLogoTop
        {
            width: 350px;
        }
    }
    @media only screen and (max-width: 511px)
    {
    
        .contact-info, .item
        {
            padding: 0;
            margin: 0;
            left: 0;
            width: 100%;
        }
    }
</style>




<section class="header-uper" style="/* permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#000000+0,ffee00+100&0+0,0.65+100 */
background: -moz-linear-gradient(top, rgba(0,0,0,0) 0%, rgba(255,238,0,0.65) 100%);
    /* ff3.6-15 */
background: -webkit-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(255,238,0,0.65) 100%);
    /* chrome10-25,safari5.1-6 */
background: linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(255,238,0,0.65) 100%);
    /* w3c, ie10+, ff16+, chrome26+, opera12+, safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a6ffee00',GradientType=0 );
    /* ie6-9 */">


    <uc1:advertiseModal ID="advertiseModal1" runat="server" />

    <div class="container clearfix">
        <div class="logo">
            <figure>
                <a href='<%= Page.ResolveUrl("~/") %>'>
                    <img alt="لوگوی درگاه فیلم ایران" src='<%= Page.ResolveUrl("~/files/images/logos/logo_movibeta.png") %>'
                        class="imgMainLogoTop" />
                </a>
            </figure>
        </div>
        <div class="right-side">
            <div>
            </div>
            <ul class="contact-info">
                <li class="item">
                    <div class="icon-box">
                        <i class="fa fa-envelope-o"></i>
                    </div>
                    <strong>
                        <asp:Label Style="font-size: 12px; font-family: Samim; font-weight: bold;" ID="lblEmailAddress"
                            runat="server"></asp:Label>
                    </strong>
                    <br>
                    <a target="_top" href="mailto:support@iranfilmport.com" style="font-size: 10px;"><span
                        style="font-size: 12px;">support@iranfilmport.com</span> </a></li>
                <li class="item">
                    <div class="icon-box">
                        <i class="fa fa-phone"></i>
                    </div>
                    <strong>
                        <asp:Label Style="font-size: 12px; font-family: Samim; font-weight: bold;" ID="lblRightnow"
                            runat="server"></asp:Label>
                    </strong>
                    <br>
                    <span style="font-size: 12px; font-family: Samim;">+(98) 921 - 634 - 3320</span>
                </li>
            </ul>
            <div class="link-btn">
                <a href='<%= ResolveUrl("~/پخش-و-ارسال-فیلم")%>' class="btn-style-one">
                    <asp:Label ID="lbl_link_btn" runat="server"></asp:Label>
                </a>
            </div>
            <div class="link-btn2">
                <a href='<%= ResolveUrl("~/پخش-و-ارسال-فیلم")%>' class="btn-style-one">
                    <asp:Label ID="lbl_link_btn2" runat="server"></asp:Label>
                </a>
            </div>
        </div>
    </div>
</section>