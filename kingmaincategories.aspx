<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingmaincategories.aspx.vb" Inherits="kingmaincategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:PlaceHolder runat="server" ID="pc"></asp:PlaceHolder>
    <link href="/files/kingMaterials/css/pagging.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="item-holder" style="text-align: justify;">
        <asp:Label ID="lbl" CssClass="lbl panel" runat="server"></asp:Label>
    </div>
    <asp:GridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Master"
        AllowPaging="True" GridLines="None" ShowHeader="False" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                <ItemTemplate>
                    <div style="text-align: right; padding: 15px;">
                        <div style="text-align: right; direction: rtl;">
                            <h5>
                                <a style="text-decoration: none;"
                                    href='<%# ResolveUrl(getLink(Eval("id"), Eval("title")))%>'>
                                    <asp:Label CssClass="TitleL" ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                </a>
                            </h5>
                        </div>
                        <div>
                            <a style="text-decoration: none;"
                                href='<%# ResolveUrl(getLink(Eval("id"), Eval("title")))%>'>
                                <asp:Image Width="100%" AlternateText='<%# Bind("title") %>' ID="Image1"
                                    runat="server" ImageUrl='<%# String.Format("~\files\uploadFiles\article\{0}", Eval("photo")) %>' />
                            </a>
                        </div>
                    </div>
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
        SelectCommand="SELECT * FROM [tbl_articles] WHERE ([visible] = @visible) and (type=@TYPE) and [date_time] <= getdate() ORDER BY [date_time] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="visible" Type="Boolean" />
            <asp:RouteParameter Name="type" RouteKey="type" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

