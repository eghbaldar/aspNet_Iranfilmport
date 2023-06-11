<%@ Page Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="CV.aspx.vb" Inherits="movibeta" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        p {
            font-size: 14px;
            color: #000;
        }

        li {
            color: #000;
        }

        @media (max-width: 767px) {
            .item-holder {
                width: 100%;
                padding: 20px;
            }
        }

        ul ul li {
            list-style-type: circle;
        }

        ul li {
            list-style-type: disc;
        }
    </style>
    <style>
        .tbFa p {
            font-family: Samim;
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/MovibetaBG.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal></h1>
            </div>
        </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div class="left-side">
                        <div class="item-holder" style="text-align: justify;">
                            <asp:Label ID="lbl" CssClass="lbl" runat="server"></asp:Label>
                        </div>
                        <div>
                            
                            <asp:DataList ID="DataListFilm" Width="100%" runat="server" DataSourceID="SDS_FILM" style="margin-top: 0px">
                                <ItemTemplate>

                                    <asp:Label ID="id_film_accolade" Visible="false" runat="server" Text='<%# Eval("id") %>' />
                                     <strong style="color:black;"> 
                                    <div style="direction:rtl;"  runat="server" visible='<%# FaEn %>'>
                                        &#x2726;
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("fa") %>' />
                                    </div>

                                    <div runat="server" visible='<%# Not FaEn %>'>
                                    &#x2726;
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("en") %>' />
                                        </div>
                                    </strong>
                                     <asp:DataList ID="DataListAccolades" runat="server" Width="100%" DataSourceID="SDS_Accolades">
                                <ItemTemplate>

                                   

                                        <div style="direction:rtl;"  runat="server" visible='<%# FaEn %>'>

                                          
                                    <table class="tbFa">
                                        <tr>
                                            <td style="padding-right:25px;color:red;">&#9679;</td>
                                            <td style="padding-right:10px;>

                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("fa") %>' />
                                            </td>
                                        </tr>
                                    </table>
                                            
                                            </div>

                                        <div  runat="server" visible='<%# Not FaEn %>'>

                                        
                                                                            <table>
                                        <tr>
                                            <td>&#x276F;</td>
                                            <td>

                                                <asp:Label ID="Labe1l3" runat="server" Text='<%# Eval("en") %>' />
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
                                SelectCommand="select distinct(id_film) 'id', (select [nameFa] from [dbo].[tbl_PosterOfCustomer] where id=a.id_film) 'fa', (select [nameEn] from [dbo].[tbl_PosterOfCustomer] where id=a.id_film) 'en' from [dbo].[tbl_accolades] a"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>
</asp:Content>
