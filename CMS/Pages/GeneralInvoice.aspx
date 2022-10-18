<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="GeneralInvoice.aspx.vb" Inherits="CMS_Pages_GeneralInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="TITLE">
                پرداخت های امروز
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_Today" ForeColor="#333333" GridLines="None" 
                    AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="DollarToRial" HeaderText="DollarToRial" SortExpression="DollarToRial" />
                        <asp:BoundField DataField="Commission" HeaderText="Commission" SortExpression="Commission" />
                        <asp:BoundField DataField="PayType" HeaderText="PayType" ReadOnly="True" SortExpression="PayType" />
                        <asp:BoundField DataField="payment_code" HeaderText="payment_code" SortExpression="payment_code" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Today" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="select [id],[email],[price],[DollarToRial],[Commission],
	case 
		when [payment_code] = -1 then 'Wallet'
		else 'BANK'
	end as 'PayType',payment_code
from dbo.tbl_invoice
where
	transaction_code is not null
	AND
	payment_code is not null
	AND
	payment_date=GETDATE()
order by payment_date desc"></asp:SqlDataSource>
            </div>
            <div class="TITLE">
                کل پرداختی ها
            </div>
            <div>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_All" ForeColor="#333333" GridLines="None" 
                    AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="DollarToRial" HeaderText="DollarToRial" SortExpression="DollarToRial" />
                        <asp:BoundField DataField="Commission" HeaderText="Commission" SortExpression="Commission" />
                        <asp:BoundField DataField="PayType" HeaderText="PayType" ReadOnly="True" SortExpression="PayType" />
                        <asp:BoundField DataField="payment_code" HeaderText="payment_code" SortExpression="payment_code" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_All" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="select [id],[email],[price],[DollarToRial],[Commission],
	case 
		when [payment_code] = -1 then 'Wallet'
		else 'BANK'
	end as 'PayType',payment_code
from dbo.tbl_invoice
where
	transaction_code is not null
	AND
	payment_code is not null
order by payment_date desc"></asp:SqlDataSource>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="TITLE">
                کل پرداخت نشده ها
            </div>
            <div>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_NoPiad" ForeColor="#333333" GridLines="None" 
                    AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="DollarToRial" HeaderText="DollarToRial" SortExpression="DollarToRial" />
                        <asp:BoundField DataField="Commission" HeaderText="Commission" SortExpression="Commission" />
                        <asp:BoundField DataField="PayType" HeaderText="PayType" ReadOnly="True" SortExpression="PayType" />
                        <asp:BoundField DataField="payment_code" HeaderText="payment_code" SortExpression="payment_code" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_NoPiad" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="select [id],[email],[price],[DollarToRial],[Commission],
	case 
		when [payment_code] = -1 then 'Wallet'
		else 'BANK'
	end as 'PayType',payment_code
from dbo.tbl_invoice
where
	transaction_code is null
	AND
	payment_code is null
order by payment_date desc"></asp:SqlDataSource>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
