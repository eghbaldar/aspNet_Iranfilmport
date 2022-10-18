<%@ Control Language="VB" AutoEventWireup="false" CodeFile="sendmsg.ascx.vb" Inherits="CMS_sendmsg" %>
<div style="direction: rtl;">
<div>

</div>
<div>
پیام و ایمیل به: <asp:Label ID="lblemail" runat="server"></asp:Label>
</div>
    <div>
        
        </div>
        <div>موضوع:</div>
    <div>
        
        <asp:TextBox  CssClass="txtFa" ID="txtsubject" runat="server"></asp:TextBox></div>
    <div>
        متن شما:
    </div>
    <div>
        <asp:TextBox ID="txttext" CssClass="txtFa"  runat="server" Height="147px" TextMode="MultiLine" Width="429px"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="btnsend" CssClass="tabBtn"  runat="server" Text="ارسال شود" /></div>
                    <div>
        
            <asp:GridView ID="dg" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <Columns>
                    <asp:BoundField DataField="useremail" HeaderText="ایمیل" 
                        SortExpression="useremail" />
                    <asp:BoundField DataField="subject" HeaderText="موضوع" 
                        SortExpression="subject" />
                    <asp:BoundField DataField="date" HeaderText="تاریخ" 
                        SortExpression="date" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
                SelectCommand="SELECT top 1 * FROM [tbl_messages] WHERE ([useremail] = @useremail) ORDER BY [id] DESC">
                <SelectParameters>
                    <asp:QueryStringParameter Name="useremail" QueryStringField="email" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        
        </div>
</div>
