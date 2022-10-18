<%@ Page Title="" Language="VB" MasterPageFile="~/MasterProfile.master" AutoEventWireup="false"
    CodeFile="profile_project.aspx.vb" Inherits="profile_project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .tdLeft
        {
            width: 70%;
        }
        .tdRight
        {
            vertical-align: top;
            text-align: center;
            width: 30%;
        }
        .divPoster
        {
            float: left;
            margin: 10px;
            position: relative;
        }
        @media (max-width: 700px)
        {
            table, thead, tbody, th, td, tr
            {
                display: block;
                text-align: center;
                width: 100%;
            }
            .tdLeft
            {
                width: 100%;
            }
            .divPoster
            {
                float: inherit;
                margin: 0;
                position: inherit;
            }
            .tdRight
            {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:DataList ID="DataList" runat="server" DataSourceID="SDS">
        <ItemTemplate>
            <table style="width: 100%;" id="poster">
                <tr>
                    <td class="tdRight">
                        <asp:DataList ID="DataListPoster" runat="server" DataSourceID="SDS_Poster" Width="100%">
                            <ItemTemplate>
                                <div class="divPoster">
                                    <div class="topright">
                                        <%--  <asp:Image ID="Image2" ImageUrl="files/images/logos/confidence_logo_small.png" runat="server"
                                    Visible='<%# IIF(Eval("Truth")=True,True,False) %>' Width="50" AlternateText="نماد اعتماد درگاه فیلم ایران"
                                    title="این فیلم دارای نماد اعتماد درگاه فیلم ایران است" />--%>
                                    </div>
                                    <a href='<%# Page.ResolveUrl(String.Format("~/files/uploadFiles/ProjectPhotos/{0}", Eval("File"))) %>' target="_blank">
                                    <asp:Image AlternateText="پوستر" ID="Image1" Width="200px" Style="-moz-border-radius: 5px;
                                        -webkit-border-radius: 5px; border-radius: 5px;"
                                        ImageUrl='<%# Page.ResolveUrl(String.Format("~/files/uploadFiles/ProjectPhotos/{0}", Eval("File"))) %>'
                                        runat="server" />
                                        </a>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SDS_Poster" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                            SelectCommand="SELECT * FROM [tbl_Projects_photos] WHERE (([ProjectID] = @ProjectID) AND type=1 AND ([status] = @status))">
                            <SelectParameters>
                                <asp:RouteParameter Name="ProjectID" RouteKey="idProject" Type="Int64" />
                                <asp:Parameter DefaultValue="true" Name="status" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="tdLeft">
                        <h5>
                            <asp:Label ID="NameFLabel" runat="server" Text='<%# Eval("NameF") %>' />
                            -
                            <asp:Label ID="NameELabel" runat="server" Text='<%# Eval("NameE") %>' />
                        </h5>
                        <br />
                        <br />
                        <strong>خلاصه داستان - Synopsis</strong><br />
                        <br />
                        <div style="text-align: justify;">
                            <asp:Label ID="SynopsisFLabel" runat="server" Text='<%# Eval("SynopsisF") %>' />
                        </div>
                        <br />
                        <div style="direction: ltr; text-align: justify;">
                            <asp:Label ID="SynopsisELabel" runat="server" Text='<%# Eval("SynopsisE") %>' />
                        </div>
                        <hr />
                        <strong>تاریخ تولید:</strong>
                        <asp:Label ID="ProductDateLabel" runat="server" Text='<%# getdate(Eval("ProductDate")) %>' />
                        <br />
                        <strong>صفحه اختصاصی فیلم:</strong>
                        <asp:Label ID="PageLinkLabel" runat="server" Text='<%# Eval("PageLink") %>' />
                        <br />
                        <strong>کارگردان :</strong>
                        <asp:Label ID="DirectorLabel" runat="server" Text='<%# Eval("Director") %>' />
                        <br />
                        <strong>نویسنده :</strong>
                        <asp:Label ID="WriterLabel" runat="server" Text='<%# Eval("Writer") %>' />
                        <br />
                        <strong>تهیه کننده :</strong>
                        <asp:Label ID="ProducerLabel" runat="server" Text='<%# Eval("Producer") %>' />
                        <br />
                        <strong>بازیگران و عوامل :</strong>
                        <asp:Label ID="OtherCastCrewLabel" runat="server" Text='<%# Eval("OtherCastCrew") %>' />
                        <br />
                        <hr />
                    </td>
                </tr>
            </table>
            <div style="width: 100%;">
                <asp:Repeater ID="DataListPhotos" runat="server" DataSourceID="SDS_Photos">
                    <ItemTemplate>
                        <div style="display: inline-block; padding: 5px; border: 1px dotted #ccc; margin: 5px;
                            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
                            <a href='<%# Page.ResolveUrl(String.Format("~/files/uploadFiles/ProjectPhotos/{0}", Eval("File"))) %>'
                                target="_blank">
                                <asp:Image AlternateText="پوستر" ID="Image1" Width="100px" ImageUrl='<%# Page.ResolveUrl(String.Format("~/files/uploadFiles/ProjectPhotos/{0}", Eval("File"))) %>'
                                    runat="server" />
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SDS_Photos" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_Projects_photos] WHERE (([ProjectID] = @ProjectID) AND type<>1 AND ([status] = @status))">
                    <SelectParameters>
                        <asp:RouteParameter Name="ProjectID" RouteKey="idProject" Type="Int64" />
                        <asp:Parameter DefaultValue="true" Name="status" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
        SelectCommand="SELECT * FROM [tbl_Projects] WHERE ([ID] = @ID)">
        <SelectParameters>
            <asp:RouteParameter Name="ID" RouteKey="idProject" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
