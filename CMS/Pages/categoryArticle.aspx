<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="categoryArticle.aspx.vb" Inherits="CMS_Pages_categoryArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .txtFa
        {
            padding: 5px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            background-color: #E6E67E;
            direction: rtl;
        }
        .txtFa:hover
        {
            background-color: #cbf1f4;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:GridView ID="GV" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
            DataKeyNames="ID" DataSourceID="SDS_GV" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select"
                            Text="Select"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton OnClientClick="return confirm('are u sure?');" ImageUrl="~/files/images/icons/delete.png"
                            ID="ImageButton1" CommandName="Delete" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_GV" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            DeleteCommand="delete from tbl_articleCategory where id=@id" SelectCommand="SELECT * FROM [tbl_articleCategory] ORDER BY [ID] DESC"
            UpdateCommand="update tbl_articleCategory
set name=@name
where id=@id" InsertCommand="insert into tbl_articleCategory (name) valus (@name)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <asp:TextBox ID="txtInsert" CssClass="txtFa" runat="server" Width="235px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInsert"
            ErrorMessage="الزامیست" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
    </div>
    <div>
        <asp:Button ID="btnInsert" runat="server" Text="درج دسته" ValidationGroup="1" />
    </div>
    <div>
        <asp:Label ID="lblNotify" runat="server" ForeColor="Red"></asp:Label>
    </div>
    <div style="color:Red;">
    توجه: با پاک کردن یک دسته ، قابلیت نمایش بصورت دسته ای (سمت چپ صفحه) آن پست هایی که به این دسته وابسته هستند را از دسته  می دهید. راه حل: پاک شدن تمامی پست هایی که به این دسته واسبته اند.
    </div>
</asp:Content>
