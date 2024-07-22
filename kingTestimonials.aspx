<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingTestimonials.aspx.vb" Inherits="kingTestimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <style>
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
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <small>بدون شک یکی از مهمترین شاخص های مثبت هر کسب و کار، رضایت مشتریان و نیز عموم جامعه هدف است.
        مفتخریم که در این سالیان، توانستیم براساس اسناد و شواهدی که در ذیل لیست شده است، رضایت حداکثری را بدست آوریم.
    </small>
    <div class="left-side mt-2">
        <div class="item-holder" style="text-align: center;">
            <asp:DataList ID="DataList" runat="server" DataSourceID="SDS" Width="100%" RepeatColumns="1">
                <ItemTemplate>

                    <div>
                        <div class="filmmakerTitle">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("filmmakername", "{0}").Replace("ي", "ی") %>'></asp:Label>
                        </div>
                        <div style="padding: 15px;">
                            <asp:Panel ID="Panel1" runat="server" Visible='<%# IIf(Eval("type", "{0}") = "0", True, False) %>'>
                                <asp:Image ID="Image1"
                                    Width="100%"
                                    ImageUrl='<%# Eval("filename", "~/files/uploadFiles/testimonials/{0}") %>'
                                    runat="server"></asp:Image>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Visible='<%# IIf(Eval("type", "{0}") = "1", True, False) %>'>
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
</asp:Content>

