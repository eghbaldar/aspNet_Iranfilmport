<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Header.ascx.vb" Inherits="usercontrols_Header" %>
<%@ Register Src="advertiseModal.ascx" TagName="advertiseModal" TagPrefix="uc1" %>
<style>
    .imgMainLogoTop {
        width: 350px;
    }

    @media only screen and (max-width: 1200px) {
        .imgMainLogoTop {
            width: 220px;
        }
    }

    @media only screen and (max-width: 991px) {
        .imgMainLogoTop {
            width: 350px;
        }
    }

    @media only screen and (max-width: 767px) {
        .contact-info-item {
            display: none;
        }

        .contact-info-item-call-and-email {
            width: 100px;
            height: 100px;
             padding-bottom: 15px !important;
        }

        .header-uper .contact-info .item {
            padding: 5px !important;
            margin: 0 !important;
        }
    }
</style>




<section class="header-uper">

    <uc1:advertiseModal ID="advertiseModal" runat="server" />

    <div class="container clearfix">
        <div class="logo">
            <figure>
                <a href='<%= Page.ResolveUrl("~/") %>'>
                    <img alt="لوگوی درگاه فیلم ایران" src='<%= Page.ResolveUrl("~/files/images/logos/iranfilmport_logo.png") %>'
                        class="imgMainLogoTop" />
                </a>
            </figure>            
        </div>
        <div class="right-side">
            <div class="contact-info">
                <div class="item">
                    <div class="contact-info-item">
                        <img height="30" width="30"
                            src='<%= Page.ResolveUrl("~/files/images/icons/envelope.svg") %>'/>
                    </div>
                    <div class="contact-info-item">
                        <strong>
                            <asp:Label Style="font-size: 12px; font-family: Samim; font-weight: bold;" ID="lblEmailAddress"
                                runat="server"></asp:Label>
                        </strong>
                        <br>
                        <div style="font-size: 12px; font-family: Samim; line-height: 1.4;">
                            <a target="_top" href="mailto:support@iranfilmport.com">support@iranfilmport.com </a>
                            <br />
                            <a target="_top" href="mailto:info@iranfilmport.com">info@iranfilmport.com</a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div>
                         <a href="tel:+989216343320">
                        <img height="30" width="30"
                            src='<%= Page.ResolveUrl("~/files/images/icons/call.svg") %>'
                            class="contact-info-item-call-and-email" />
                             </a>
                    </div>
                    <div class="contact-info-item">
                        <strong>
                            <asp:Label Style="font-size: 12px; font-family: Samim; font-weight: bold;" ID="lblRightnow"
                                runat="server"></asp:Label>
                        </strong>
                        <br>
                        <div style="font-size: 12px; font-family: Samim; line-height: 1.4;">
                            <a href="tel:+989216343320">+(98) 921 - 634 - 3320 
                            </a>
                            <br />
                            <a href="tel:+989359300460">+(98) 935 - 930 - 0460
                            </a>
                        </div>

                    </div>
                </div>
            </div>
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
    <asp:Literal ID="litMarquee" runat="server"></asp:Literal>
</section>
