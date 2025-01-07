<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="dollars.aspx.vb" Inherits="CMS_Pages_setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SDS_Dollars" Font-Size="Small" 
        GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="DollarToRial" 
                HeaderText="دلار به ریال" SortExpression="DollarToRial" />
<%--            <asp:BoundField DataField="CommissionForFree" 
                HeaderText="کارمزد برای فستیوال های رایگان به تومان" 
                SortExpression="CommissionForFree" />
            <asp:BoundField DataField="CommissionForFee" 
                HeaderText="کارمزد ارسال فیلم به فستیوال های پولی به تومان" 
                SortExpression="CommissionForFee" />--%>
            <asp:CommandField ShowEditButton="True" />
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
    <asp:SqlDataSource ID="SDS_Dollars" runat="server" 
        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
        SelectCommand="SELECT * FROM [tbl_setting]" UpdateCommand="update tbl_setting
set DollarToRial=@DollarToRial,CommissionForFree=@CommissionForFree,CommissionForFee=@CommissionForFee">
        <UpdateParameters>
            <asp:Parameter Name="DollarToRial" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

