<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="checkout.aspx.vb" Inherits="dashboard_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .TXT
        {
            padding: 10px;
            font-family: irsans;
            margin: 4px;
            background-color: #e8e8e8;
            cursor: pointer;
        }
        .centerHeaderText th
        {
            text-align: right;
            padding-left: 5px;
        }
        .rowText
        {
            font-family: Samim;
            padding: 12px;
            color: Black;
        }
    </style>
       <style>
        @media (max-width: 767px)
        {
       
            .centerHeaderText
            {
                display:none;
            }
            table tr:hover td
            {
                background-color: #F7F6F3;
                color: Black;
            }
            .THeader
            {
                display: none;
            }
            table .fr
            {
                text-align: right;
                font-family: Samim;
                direction: rtl;
                color: Black;
            }
            table
            {
                width: 100%;
                border-collapse: collapse;
                direction: rtl;
                text-align: right;
                color: Black;
            }
            /* Zebra striping */
            table tr:nth-of-type(odd)
            {
                background: #eee;
                color: Black;
            }
            table th
            {
                background: #333;
                color: white;
                font-weight: bold;
            }
            table td, th
            {
                padding: 6px;
                border: 1px solid #ccc;
                text-align: right;
                font-family: irsans;
            }
            table td
            {
                text-align: right;
                direction: rtl;
            }
        }
        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px)
        {
            
            
            /* Force table to not be like tables anymore */
            table, thead, tbody, th, td, tr
            {
                display: block;
            }
        
            /* Hide table headers (but not display: none;, for accessibility) */
            table thead tr
            {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
        
            table tr
            {
                border: 1px solid #ccc;
            }
        
            table td
            {
                /* Behave  like a "row" */
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                font-family: irsans;
            }
        
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right;">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                    فاکتورهای پرداخت نشده</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" style="font-family: Samim; text-align: justify;">
                    هزینه محاسبه شده براساس قیمت دلار روز می باشد، بنابراین اگر هم اکنون اقدام به پرداخت
                    نکنید، ممکن است هنگام ارسال به بانک، مبلغ کم و یا زیاد شود. که در صورت کم بودن مقدار
                    تراکنش برگشت خواهد خورد و در صورت زیاد بودن مبلغ درگاه فیلم ایران مسئولیتی در خصوص
                    برگشت مبلغ نخواهد داشت.
                </div>
            </div>
        </div>
        <asp:HiddenField ID="HiddenEmail" runat="server" />
        <div class="row">
            <div class="col-md-12">
                <asp:Panel ID="DivWarning" runat="server" Style="background-color: #ffd1d1; color: Red;
                    font-size: 11px; padding: 5px; text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                    border-radius: 5px; border: 1px solid red; margin-bottom: 5px;">
                    <asp:Label ID="lblWarning" runat="server" Style="font-family: irsans;"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="DivConfirm" runat="server" Style="background-color: #B4E391; color: Red;
                    font-size: 11px; padding: 5px; text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                    border-radius: 5px; border: 1px solid green; margin-bottom: 5px;">
                    <asp:Label ID="lblConfirm" runat="server" Style="font-family: irsans;"></asp:Label>
                </asp:Panel>
                <div class="frame">
                    <asp:GridView ID="dgCheckout" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SDS_Checkout"
                        GridLines="Vertical" HeaderStyle-CssClass="centerHeaderText" RowStyle-CssClass="rowText">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="شماره فاکتور" InsertVisible="False" ReadOnly="True"
                                SortExpression="ID">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="اسم فستیوال" SortExpression="FestivalName">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FestivalName").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="اسم پروژه" SortExpression="namef">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("namef").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="بخش فستیوال" SortExpression="section">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("section").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="deadline" HeaderText="تاریخ ددلاین" SortExpression="deadline"
                                ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False">
                            </asp:BoundField>
                            <asp:BoundField DataField="DeadlineID" HeaderText="DeadlineID" SortExpression="DeadlineID"
                                Visible="False" />
                            <asp:TemplateField HeaderText="حق کمسیون" SortExpression="Commission">
                                <ItemTemplate>
                                    <asp:Label ID="La2bel12" runat="server" Text='<%# Val(Eval("Commission")).ToString("N0") & " تومان " %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle ForeColor="Red" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ارزش خالص فاکتور" SortExpression="PriceMinusCommission">
                                <ItemTemplate>
                                    <asp:Label ID="Label122" runat="server" Text='<%# Val(Eval("PriceMinusCommission")).ToString("N0") & " تومان " %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle ForeColor="Red" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ارزش کل فاکتور" SortExpression="total">
                                <ItemTemplate>
                                    <asp:Label ID="Lab31el2" runat="server" Text='<%# Val(Eval("total")).ToString("N0") & " تومان " %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle ForeColor="Red" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="CreationFactorDate" HeaderText="تاریخ ایجاد فاکتور" SortExpression="CreationFactorDate"
                                ReadOnly="True" />
                            <asp:TemplateField ConvertEmptyStringToNull="False" SortExpression="ID">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" OnCommand="PaymentFactorBank" CommandArgument='<%# Eval("id") & "|" & Eval("total") & "|" & Eval("FestivalName") & "|" & Eval("DeadlineID") %>'
                                        ToolTip="پرداخت از طریق درگاه بانکی" Width="25" ImageUrl="~/dashboard/assets/img/icon_payment_Factor.png"
                                        runat="server" />
                                    <asp:ImageButton ID="ImageButton3" OnCommand="PaymentFactorWallet" CommandArgument='<%# Eval("id") & "|" & Eval("total") %>'
                                        ToolTip="پرداخت از کیف پول" Width="25" ImageUrl="~/dashboard/assets/img/walletPay.png"
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ConvertEmptyStringToNull="False" SortExpression="ID">
                                <ItemTemplate>
                                    <asp:ImageButton OnClientClick="return confirm('آیا از حذف این فاکتور مطمئن هستید؟');"
                                        ID="ImageButton12" Width="80" ImageUrl="~/dashboard/assets/img/icon_delete_Factor.png"
                                        OnCommand="deleteFactor" CommandArgument='<%# Eval("id") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="font-family: Samim;">
                                <span style="font-family: irsans;">فاکتور پرداخت نشده ای وجود ندارد. </span>
                                <asp:Button ID="btnGoToInvoice" runat="server" Text="مشاهده صورت حساب ها" OnClick="btnGoToInvoice_Click" />
                            </div>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#539FA0" />
                        <HeaderStyle BackColor="#539FA0" Font-Bold="True" HorizontalAlign="Right" ForeColor="#000"
                            Font-Names="irsans" Font-Size="10px" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#539FA0" HorizontalAlign="Right" />
                        <RowStyle CssClass="rowText"></RowStyle>
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SDS_Checkout" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="
SELECT
i.ID,
i.email,
i.ProjectID,
p.namef,
i.DeadlineID,
i.Commission 'Commission',
i.price - i.Commission 'PriceMinusCommission',
i.price 'total',
(select dbo.MiladiTOShamsi(i.record_date,'/')) 'CreationFactorDate',
f.title_en+' '+f.title_fa 'FestivalName',
s.section,
(select dbo.MiladiTOShamsi(d.deadline,'/')) 'deadline'
FROM [tbl_invoice] i,[tbl_festivals] f,[tbl_festivalSections] s,[tbl_festivalDeadline] d ,[dbo].[tbl_Projects] p
WHERE
i.email=@email
and i.festivalID=f.ID 
and s.id=d.sectionID 
and d.festivalID=f.ID
and i.DeadlineID=d.id 
and p.ID=i.ProjectID
and (payment_code is null or payment_code = '')
ORDER BY i.[ID] DESC
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HiddenEmail" Name="email" PropertyName="Value" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
