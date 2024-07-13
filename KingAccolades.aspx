<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" 
    CodeFile="KingAccolades.aspx.vb" Inherits="KingAccolades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div style="text-align: justify;">
        <asp:Label ID="lbl" CssClass="lbl" runat="server"></asp:Label>
    </div>
    <div>

        <asp:DataList Visible="true" ID="DataListFilm" Width="100%" runat="server" DataSourceID="SDS_FILM" Style="margin-top: 0px">
            <ItemTemplate>

                <asp:Label ID="id_film_accolade" Visible="false" runat="server" Text='<%# Eval("id") %>' />
                <strong style="color: black;">
                    <div style="direction: rtl;" runat="server" visible='<%# FaEn %>'>
                        &#x2726;
                                        <asp:Label ID="Label1" runat="server"
                                            Text='<%# GetFilmName(Eval("id"), "FA") %>' />
                    </div>

                    <div runat="server" visible='<%# Not FaEn %>'>
                        &#x2726;
                                    <asp:Label ID="Label2" runat="server"
                                        Text='<%# GetFilmName(Eval("id"), "FA") %>' />
                    </div>
                </strong>

                <asp:DataList ID="DataListAccolades" runat="server" Width="100%" DataSourceID="SDS_Accolades">
                    <ItemTemplate>



                        <div style="direction: rtl;" runat="server" visible='<%# FaEn %>'>


                            <table class="tbFa">
                                <tr>
                                    <%-- <td style="padding-right:25px;color:red;">&#9679;</td>--%>
                                    <td style="padding-right: 10px; list-style-type: none;">

                                        <asp:Label ID="Label1" runat="server"
                                            Text='<%# GetAccolade(Eval("id_film"), "FA") %>' />
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div runat="server" visible='<%# Not FaEn %>'>


                            <table>
                                <tr>
                                    <%-- <td>&#x276F;</td>--%>
                                    <td>

                                        <asp:Label ID="Labe1l3" runat="server"
                                            Text='<%# GetFilmName(Eval("id_film"), "EN") %>' />
                                    </td>
                                </tr>
                            </table>
                        </div>





                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SDS_Accolades" runat="server"
                    ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_accolades] WHERE ([id_film] = @id_film)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="id_film_accolade" Name="id_film" PropertyName="Text" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>


            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SDS_FILM" runat="server"
            ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="select distinct(id_film) 'id', 
                                (select [nameFa] from [dbo].[tbl_PosterOfCustomer] where id=a.id_film) 'fa', 
                                (select [nameEn] from [dbo].[tbl_PosterOfCustomer] where id=a.id_film) 'en',
                                [priority]
                                from [dbo].[tbl_accolades] a 
                                order by a.[priority] asc"></asp:SqlDataSource>
    </div>
</asp:Content>

