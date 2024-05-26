<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="requestedfestivalsclient.aspx.vb" Inherits="CMS_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .btn{
            font-family:Samim;
            padding:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="TITLE" style="color: Black; font-size: 20px;">
        درخواست های نهایی (پول پرداخت شده)
    </div>
    <div>
        <asp:GridView ID="dgPaid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SDS_Paid" ForeColor="Black" GridLines="Vertical" Width="100%">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="festivalName" HeaderText="festivalName" SortExpression="festivalName" />
                <asp:BoundField DataField="festivalFee" HeaderText="festivalFee" SortExpression="festivalFee" />
                <asp:BoundField DataField="deadline" HeaderText="deadline" SortExpression="deadline" />
                <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname" />
                <asp:BoundField DataField="insertdate" HeaderText="insertdate" SortExpression="insertdate" />
                <asp:TemplateField SortExpression="receiptfilename">
                    <ItemTemplate>
                        <a target="_blank" href='<%# String.Format("..\..\..\files\uploadFiles\clientfestivalsuggestedreceipt\{0}", Eval("receiptfilename")) %>'>مشاهده رسید مالی</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="receiptfilename">
                    <ItemTemplate>
                        <div>
                            <asp:Panel runat="server" BackColor='<%# GetAgree(Eval("agree")) %>' Style="padding: 2px;">
                                <asp:Button ID="Butt4on4" CssClass="btn" CommandArgument='<%# Eval("Id") & "|1" %>' OnCommand="UpdateAgree" runat="server" BackColor="Yellow" Text="تغییر به درخواست شده" />
                                <asp:Button ID="Bu3t4ton5"  CssClass="btn" CommandArgument='<%# Eval("Id") & "|2" %>' OnCommand="UpdateAgree" runat="server" BackColor="Green" Text="تغییر به پرداخت شده" />
                                <asp:Button ID="Butto2n6" CssClass="btn" CommandArgument='<%# Eval("Id") & "|3" %>' OnCommand="UpdateAgree" runat="server" BackColor="LightGray" Text="تغییر به انجام شده" />
                                <asp:Button ID="Butto1n9" CssClass="btn" CommandArgument='<%# Eval("Id") & "|4" %>' OnCommand="UpdateAgree" runat="server" BackColor="Pink" Text="تغییر به کنسل شده" />
                            </asp:Panel>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Paid" runat="server"
            ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
            SelectCommand="SELECT *, (select [name] from tbCustomers where [username]=fs.[targetUserUsername]) 'fullname' 
            FROM [tbFestivalSuggestion] fs WHERE ([agree] = @agree) ORDER BY [insertdate] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="agree" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div class="TITLE" style="color: Black; font-size: 20px;">
        درخواست های نهایی نشده (درخواست شده ولی پول پرداخت نشده)
    </div>
    <div>
        <asp:LinkButton ID="btnRequested" runat="server">بارگزاری ...</asp:LinkButton>
        <br />
        <br />
        <asp:GridView ID="DG_Requested" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="festivalName" HeaderText="festivalName" SortExpression="festivalName" />
                <asp:BoundField DataField="festivalFee" HeaderText="festivalFee" SortExpression="festivalFee" />
                <asp:BoundField DataField="countryId" HeaderText="countryId" SortExpression="countryId" />
                <asp:BoundField DataField="deadline" HeaderText="deadline" SortExpression="deadline" />
                <asp:BoundField DataField="targetUserUsername" HeaderText="targetUserUsername" SortExpression="targetUserUsername" />
                <asp:CheckBoxField DataField="seen" HeaderText="seen" SortExpression="seen" />
                <asp:BoundField DataField="insertdate" HeaderText="insertdate" SortExpression="insertdate" />
                <asp:BoundField DataField="agree" HeaderText="agree" SortExpression="agree" />
                <asp:BoundField DataField="receiptfilename" HeaderText="receiptfilename" SortExpression="receiptfilename" />
                                <asp:TemplateField SortExpression="receiptfilename">
                    <ItemTemplate>
                        <div>
                            <asp:Panel runat="server" BackColor='<%# GetAgree(Eval("agree")) %>' Style="padding: 2px;">
                                <asp:Button ID="Butt4on4" CssClass="btn" CommandArgument='<%# Eval("Id") & "|1" %>' OnCommand="UpdateAgree" runat="server" BackColor="Yellow" Text="تغییر به درخواست شده" />
                                <asp:Button ID="Bu3t4ton5"  CssClass="btn" CommandArgument='<%# Eval("Id") & "|2" %>' OnCommand="UpdateAgree" runat="server" BackColor="Green" Text="تغییر به پرداخت شده" />
                                <asp:Button ID="Butto2n6" CssClass="btn" CommandArgument='<%# Eval("Id") & "|3" %>' OnCommand="UpdateAgree" runat="server" BackColor="LightGray" Text="تغییر به انجام شده" />
                                <asp:Button ID="Butto1n9" CssClass="btn" CommandArgument='<%# Eval("Id") & "|4" %>' OnCommand="UpdateAgree" runat="server" BackColor="Pink" Text="تغییر به کنسل شده" />
                            </asp:Panel>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Requested" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" SelectCommand="SELECT * FROM [tbFestivalSuggestion] WHERE ([agree] = @agree) ORDER BY [insertdate] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="agree" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div class="TITLE" style="color: Black; font-size: 20px;">
        درخواست های ارسال شده (تمام شده)
    </div>
    <div>
        <asp:LinkButton ID="btnDone" runat="server">بارگزاری ...</asp:LinkButton>
        <br />
        <br />
        <asp:GridView ID="Dg_Done" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="festivalName" HeaderText="festivalName" SortExpression="festivalName" />
                <asp:BoundField DataField="festivalFee" HeaderText="festivalFee" SortExpression="festivalFee" />
                <asp:BoundField DataField="countryId" HeaderText="countryId" SortExpression="countryId" />
                <asp:BoundField DataField="deadline" HeaderText="deadline" SortExpression="deadline" />
                <asp:BoundField DataField="targetUserUsername" HeaderText="targetUserUsername" SortExpression="targetUserUsername" />
                <asp:CheckBoxField DataField="seen" HeaderText="seen" SortExpression="seen" />
                <asp:BoundField DataField="insertdate" HeaderText="insertdate" SortExpression="insertdate" />
                <asp:BoundField DataField="agree" HeaderText="agree" SortExpression="agree" />
                <asp:BoundField DataField="receiptfilename" HeaderText="receiptfilename" SortExpression="receiptfilename" />
                                <asp:TemplateField SortExpression="receiptfilename">
                    <ItemTemplate>
                        <div>
                            <asp:Panel runat="server" BackColor='<%# GetAgree(Eval("agree")) %>' Style="padding: 2px;">
                                <asp:Button ID="Butt4on4" CssClass="btn" CommandArgument='<%# Eval("Id") & "|1" %>' OnCommand="UpdateAgree" runat="server" BackColor="Yellow" Text="تغییر به درخواست شده" />
                                <asp:Button ID="Bu3t4ton5"  CssClass="btn" CommandArgument='<%# Eval("Id") & "|2" %>' OnCommand="UpdateAgree" runat="server" BackColor="Green" Text="تغییر به پرداخت شده" />
                                <asp:Button ID="Butto2n6" CssClass="btn" CommandArgument='<%# Eval("Id") & "|3" %>' OnCommand="UpdateAgree" runat="server" BackColor="LightGray" Text="تغییر به انجام شده" />
                                <asp:Button ID="Butto1n9" CssClass="btn" CommandArgument='<%# Eval("Id") & "|4" %>' OnCommand="UpdateAgree" runat="server" BackColor="Pink" Text="تغییر به کنسل شده" />
                            </asp:Panel>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Done" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" SelectCommand="SELECT * FROM [tbFestivalSuggestion] WHERE ([agree] = @agree) ORDER BY [insertdate] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="agree" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div class="TITLE" style="color: Black; font-size: 20px;">
        درخواست های کنسل شده        
    </div>
    <div>
        <asp:LinkButton ID="btnCanceled" runat="server">بارگزاری ...</asp:LinkButton>
        <br />
        <br />
        <asp:GridView ID="Dg_Canceled" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="festivalName" HeaderText="festivalName" SortExpression="festivalName" />
                <asp:BoundField DataField="festivalFee" HeaderText="festivalFee" SortExpression="festivalFee" />
                <asp:BoundField DataField="countryId" HeaderText="countryId" SortExpression="countryId" />
                <asp:BoundField DataField="deadline" HeaderText="deadline" SortExpression="deadline" />
                <asp:BoundField DataField="targetUserUsername" HeaderText="targetUserUsername" SortExpression="targetUserUsername" />
                <asp:CheckBoxField DataField="seen" HeaderText="seen" SortExpression="seen" />
                <asp:BoundField DataField="insertdate" HeaderText="insertdate" SortExpression="insertdate" />
                <asp:BoundField DataField="agree" HeaderText="agree" SortExpression="agree" />
                <asp:BoundField DataField="receiptfilename" HeaderText="receiptfilename" SortExpression="receiptfilename" />
                                <asp:TemplateField SortExpression="receiptfilename">
                    <ItemTemplate>
                        <div>
                            <asp:Panel runat="server" BackColor='<%# GetAgree(Eval("agree")) %>' Style="padding: 2px;">
                                <asp:Button ID="Butt4on4" CssClass="btn" CommandArgument='<%# Eval("Id") & "|1" %>' OnCommand="UpdateAgree" runat="server" BackColor="Yellow" Text="تغییر به درخواست شده" />
                                <asp:Button ID="Bu3t4ton5"  CssClass="btn" CommandArgument='<%# Eval("Id") & "|2" %>' OnCommand="UpdateAgree" runat="server" BackColor="Green" Text="تغییر به پرداخت شده" />
                                <asp:Button ID="Butto2n6" CssClass="btn" CommandArgument='<%# Eval("Id") & "|3" %>' OnCommand="UpdateAgree" runat="server" BackColor="LightGray" Text="تغییر به انجام شده" />
                                <asp:Button ID="Butto1n9" CssClass="btn" CommandArgument='<%# Eval("Id") & "|4" %>' OnCommand="UpdateAgree" runat="server" BackColor="Pink" Text="تغییر به کنسل شده" />
                            </asp:Panel>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Canceled" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" SelectCommand="SELECT * FROM [tbFestivalSuggestion] WHERE ([agree] = @agree) ORDER BY [insertdate] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="agree" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

