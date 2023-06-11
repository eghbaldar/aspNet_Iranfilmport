<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false" CodeFile="testimonial.aspx.vb" Inherits="testimonial" %>

<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        p {
            font-size: 14px;
            font-family: Samim;
            direction: rtl;
            color: #000;
        }

        .filmmakerTitle {
            padding: 10px;
            font-family: Samim;
            color: black;
            font-size: 17px;
            /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#f2f6d0+1,ffe800+86,ffe800+86,e0eff9+87,e2e2e2+88,e2e2e2+88&0+0,1+100 */
            background: -moz-linear-gradient(-45deg, rgba(242,246,208,0) 0%, rgba(242,246,208,0.01) 1%, rgba(255,232,0,0.86) 86%, rgba(224,239,249,0.87) 87%, rgba(226,226,226,0.88) 88%, rgba(226,226,226,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(-45deg, rgba(242,246,208,0) 0%,rgba(242,246,208,0.01) 1%,rgba(255,232,0,0.86) 86%,rgba(224,239,249,0.87) 87%,rgba(226,226,226,0.88) 88%,rgba(226,226,226,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(135deg, rgba(242,246,208,0) 0%,rgba(242,246,208,0.01) 1%,rgba(255,232,0,0.86) 86%,rgba(224,239,249,0.87) 87%,rgba(226,226,226,0.88) 88%,rgba(226,226,226,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00f2f6d0', endColorstr='#e2e2e2',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
        }

        @media (max-width: 767px) {
            .item-holder {
                width: 100%;
                padding: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_9.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
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
                        <div class="item-holder" style="text-align: center;">
                             <asp:DataList ID="DataList" runat="server" DataSourceID="SDS" Width="100%" RepeatColumns="1">
                    <ItemTemplate>
                        
                        <div >
                        <div class="filmmakerTitle">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("filmmakername", "{0}").Replace("ي", "ی") %>'></asp:Label>
                        </div>
                        <div style="padding:15px;">
                        <asp:Panel ID="Panel1" runat="server" Visible='<%# IIf(Eval("type", "{0}") = "0", True, False) %>'>
                                <asp:Image ID="Image1"
                                    Width="100%"
                                    ImageUrl='<%# Eval("filename", "~/files/uploadFiles/testimonials/{0}") %>'
                                    runat="server"></asp:Image>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server"  Visible='<%# IIf(Eval("type", "{0}") = "1", True, False) %>'>
                                <audio controls>
                                <source src='<%# ResolveUrl("~/files/uploadFiles/testimonials/" + Eval("filename", "{0}")) %>' type="audio/ogg">
                                <source src='<%# ResolveUrl("~/files/uploadFiles/testimonials/" + Eval("filename", "{0}")) %>' type="audio/mpeg">
                                    Your browser does not support the audio element.
                                </audio>
                            </asp:Panel>
                               </div> 
                        </div>

                    </ItemTemplate>

                </asp:DataList>
                <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" SelectCommand="SELECT * FROM [tbl_testimonial] ORDER BY [ID] DESC"></asp:SqlDataSource>
            
                        </div>
                    </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>
</asp:Content>

