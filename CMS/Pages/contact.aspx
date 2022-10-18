<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="contact.aspx.vb" Inherits="CMS_Pages_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background-color: #ccc; padding: 10px;">
        <asp:Label ID="lblText" runat="server"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="gv" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#CC9966" Width="100%" BorderStyle="None" BorderWidth="1px"
            CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" />
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <ItemTemplate>
                        <div>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" /> 
                <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" Visible="false" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:CheckBoxField DataField="Flag" HeaderText="Flag" SortExpression="Flag" />
                <asp:BoundField DataField="AdminId" HeaderText="AdminId" SortExpression="AdminId" />
                <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
                <asp:BoundField DataField="ReplyDate" HeaderText="ReplyDate" SortExpression="ReplyDate" />
                <asp:TemplateField HeaderText="flag" SortExpression="flag">
                    <ItemTemplate>
                      <asp:ImageButton OnCommand="show" CommandArgument='<%# Eval("text","{0}") %>' ImageUrl="~/files/images/icons/contract.png"
                            ID="ImageButton1" runat="server" />
                        <asp:Panel ID="Panel1112" runat="server" Style="padding: 5px;" BackColor='<%# IIF(Eval("read")="True",System.Drawing.Color.White,System.Drawing.Color.Gray) %>'>
                            <asp:CheckBox ID="Chec1111kBox1" runat="server" Checked='<%# Bind("read") %>' Enabled="false" />
                            <asp:Button ID="Bu111tton1" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="SetReadEnable"
                                Text="Read" ForeColor="Green" />
                            <asp:Button ID="B11utton2" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="SetReadDsiable"
                                Text="UnRead" ForeColor="Red" />
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            DeleteCommand="delete from tbl_Contact where id=@id"
             SelectCommand="SELECT * FROM [tbl_Contact] ORDER BY [read] asc,[createdate] DESC">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <div>
    </div>
</asp:Content>
