<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="festivalEach.aspx.vb" Inherits="festivalEach" %>

<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .IMG
        {
            border: 1px solid #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right; padding-top: 20px;">
        <div style="padding-top: 5px; padding-bottom: 5px;">
            <div class="col-md-9 col-sm-12 col-xs-12" style="padding: 20px; color: Black; -moz-border-radius: 5px;
                -webkit-border-radius: 5px; border-radius: 5px; background-color: #f1f1f1; border: 2px solid #ead744;">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS">
                    <ItemTemplate>
                        <div style="text-align: right;">
                            <p style="font-family: Titr;color:Black;">
                                <asp:Label ID="title_enLabel" runat="server" Text='<%# Eval("title_fa") %>' />
                                <span style="font-family: Tahoma; font-size: 12px;">
                                    <asp:Label ID="title_faLabel" runat="server" Text='<%# "["+Eval("title_en")+"]" %>' />
                                </span>
                            </p>
                        </div>
                        <table style="width: 100%;">
                            <tr>
                                <td style="width: 20%;">
                                    <asp:Image CssClass="IMG" ID="Image1" AlternateText='<%# Bind("title_fa") %>' ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                        runat="server" />
                                </td>
                                <td style="width: 80%;">
                                    <div style="padding: 10px;">
                                        <div>
                                            <asp:Label ID="short_featureLabel" runat="server" Text='<%# getshortfeature(Eval("short_feature")) %>' /></div>
                                        <div>
                                            <asp:Label ID="genreLabel" runat="server" Text='<%# getgenre(Eval("genre")) %>' /></div>
                                        <div>
                                            <asp:Label ID="LevelLabel" runat="server" Text='<%# getLevel(Eval("Level")) %>' /></div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div style="font-family: koodak;color:Black;text-justify:inter-word;     text-align: justify;font-size:12px;">
                            <asp:Label ID="detailLabel" runat="server" Text='<%# Eval("detail") %>' />
                        </div>
                        <div style="font-family: koodak;color:Black;text-justify:inter-word;     text-align: justify;font-size:12px;">
                            <asp:Label ID="attributeLabel" runat="server" Text='<%# Eval("attribute") %>' />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_festivals] WHERE ([ID] = @ID)">
                    <SelectParameters>
                        <asp:RouteParameter Name="ID" RouteKey="id" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <uc1:banners_right ID="banners_right1" runat="server" />
        </div>
    </div>
</asp:Content>
