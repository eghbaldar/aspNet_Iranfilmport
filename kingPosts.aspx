<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingPosts.aspx.vb" Inherits="kingPosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:PlaceHolder runat="server" ID="pc"></asp:PlaceHolder>
    <link href="/files/kingMaterials/css/pagging.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:GridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Master"
        Width="100%"
        AllowPaging="True" GridLines="None" ShowHeader="False">
        <Columns>
            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                <ItemTemplate>
                    <div class="col">
                        <div style="text-align: center; direction: rtl;padding:5px;">
                            <h6>
                                <a style="text-decoration: none;"
                                    href='<%# ResolveUrl(getLink(Eval("id"), Eval("title")))%>'>
                                    <asp:Label CssClass="TitleL" ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                </a>

                            </h6>
                        </div>
                        <div>
                            <a style="text-decoration: none;"
                                href='<%# ResolveUrl(getLink(Eval("id"), Eval("title")))%>'>
                                <asp:Image Width="100%" AlternateText='<%# Bind("title") %>' ID="Image1"
                                    CssClass="img-fluid"
                                    Style="border-radius: 10px;"
                                    runat="server" ImageUrl='<%# String.Format("~\files\uploadFiles\article\{0}", Eval("photo")) %>' />
                            </a>
                        </div>
                    </div>
                    <!-- end entry -->
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#848484" />
        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SDS_Master" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
        SelectCommand="SELECT * FROM [tbl_articles] WHERE [visible] = 1 and [date_time] <= getdate() ORDER BY [date_time] DESC"></asp:SqlDataSource>

</asp:Content>

