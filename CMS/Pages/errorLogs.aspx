<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="errorLogs.aspx.vb" Inherits="CMS_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE" style="color: Black; font-size: 20px;">
        لاگ خطاها
    </div>
    <div>
        بخش های فعال: ایمیل و اس ام اس
        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource" GridLines="Horizontal" Width="100%">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="user" HeaderText="user" SortExpression="user" />
                <asp:BoundField DataField="sectionTitle" HeaderText="sectionTitle" SortExpression="sectionTitle" />
                <asp:BoundField DataField="errornumber" HeaderText="errornumber" SortExpression="errornumber" />
                <asp:BoundField DataField="errormsg" HeaderText="errormsg" SortExpression="errormsg" />
                <asp:BoundField DataField="insertdate" HeaderText="insertdate" SortExpression="insertdate" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" SelectCommand="SELECT * FROM [tbl_ErrorLogs] ORDER BY [insertdate] DESC"></asp:SqlDataSource>
    </div>
</asp:Content>

