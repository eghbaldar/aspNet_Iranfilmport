<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="invoice.aspx.vb" Inherits="dashboard_invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 22px;
            height: 23px;
        }
        .style2
        {
            width: 16px;
            height: 16px;
        }
        .ddd
        {
            direction: rtl;
            text-align: right;
            font-weight: normal;
            font-size: 11px;
            width: 70px;
            padding-right: 5px;
            font-family: Samim;
        }
        .rowText
        {
            font-family: Samim;
            padding: 12px;
            color: Black;
            font-size:11px;
        }
        .centerHeaderText th
        {
            text-align: right;
            padding-left: 5px;
        }
        table tr:hover td
        {
            background-color: #bfe8f9;
            color: Black;
        }
        .ItemCode
        {
            width: 7%;
        }
        .ItemFestival
        {
            width: 15%;
        }
        .ItemFestival2
        {
            width: 19%;
        }        
        .ItemProject
        {
            width:10%;
        }
        .ItemSection
        {
            width:10%;
        }
    </style>
     <style>
        @media (max-width: 767px)
        {              
            
        .ItemCode
        {
            width: 100%;
        }
        .ItemFestival
        {
            width: 100%;
        }
        .ItemFestival2
        {
            width: 100%;
        }        
        .ItemProject
        {
            width:100%;
        }
        .ItemSection
        {
            width:100%;
        }
        
            .centerHeaderText
            {
                display:none;
            }
            table tr:hover td
            {
                background-color: #F7F6F3;
                color: Black;
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
     <style>
         .gridview a
        {
            horizontal-align: right;
            margin: auto 6%;
            /*border-radius: 50%;*/
            background-color: #C0B700;
            padding: 5px 10px 5px 10px;
            color: #fff;
            text-decoration: none;
            -o-box-shadow: 1px 1px 1px #111;
            -moz-box-shadow: 1px 1px 1px #111;
            -webkit-box-shadow: 1px 1px 1px #111;
            box-shadow: 1px 1px 1px #111;
        }
        .gridview a:hover
        {
            background-color: #E9DC01;
            color: #fff;
        }
        
        .gridview span
        {
            background-color: #E9DC01;
            color: #fff;
            -o-box-shadow: 1px 1px 1px #111;
            -moz-box-shadow: 1px 1px 1px #111;
            -webkit-box-shadow: 1px 1px 1px #111;
            box-shadow: 1px 1px 1px #111;
            /*border-radius: 50%;*/
            padding: 5px 10px 5px 10px;
        }
        
    </style>
    <script>
        function contractFUN(factID) {
            var ss = "user/me/contract/factor/" + factID;
            window.open('<%= Page.ResolveUrl("' + ss + '") %>', '', 'width=500,resizable=no');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right;">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                    فاکتورهای پرداخت نشده</h4>
            </div>
        </div>


        <asp:Panel ID="DivWarning" Visible="false" runat="server"  style="background-color: #ffd1d1; color: Red; font-size: 11px; padding: 5px;
            text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
            border: 1px solid red;margin-bottom:5px;">
            <asp:Label ID="lblWarning" runat="server" Style="font-family: irsans;"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="DivConfirm"  Visible="false" runat="server"  style="background-color: #B4E391; color: Red; font-size: 11px; padding: 5px;
            text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
            border: 1px solid green;margin-bottom:5px;">
            <asp:Label ID="lblConfirm" runat="server" Style="font-family: irsans;"></asp:Label>
        </asp:Panel>


        <div class="frame">
            <asp:GridView ID="dgCheckout" DataSourceID="SDS_NOT" runat="server" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" CellPadding="3" GridLines="Horizontal"
                HeaderStyle-CssClass="centerHeaderText" RowStyle-CssClass="rowText">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="ID" ItemStyle-CssClass="ItemCode" HeaderText="شماره فاکتور" 
                    InsertVisible="False" ReadOnly="True"
                        SortExpression="ID">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="شناسه تراکنش" InsertVisible="False" 
                        SortExpression="transaction_code">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# IIf(Eval("transaction_code").ToString.Trim() = "", "ندارد", Eval("transaction_code").ToString.Trim())%>'></asp:Label>                            
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="فستیوال" ItemStyle-CssClass="ItemFestival2" SortExpression="FestivalName">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("FestivalName").Replace("ي", "ی") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="پروژه" ItemStyle-CssClass="ItemProject" SortExpression="namef">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("namef").Replace("ي", "ی") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="بخش فستیوال" ItemStyle-CssClass="ItemSection" SortExpression="section">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("section").Replace("ي", "ی") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="deadline" HeaderText="تاریخ ددلاین" ReadOnly="True"
                        SortExpression="deadline">
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

                                                <asp:TemplateField HeaderText="تاریخ ایجاد فاکتور" SortExpression="CreationFactorDate">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("CreationFactorDate") %>'></asp:Label>
                                </ItemTemplate>                                
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                    <asp:TemplateField ConvertEmptyStringToNull="False" SortExpression="ID">
                        <ItemTemplate>

                            <asp:ImageButton ID="ImageButton1" OnCommand="PaymentFactorBank"
                            CommandArgument='<%# Eval("id") & "|" & Eval("total") & "|" & Eval("FestivalName") & "|" & Eval("DeadlineID") %>'
                            ToolTip="پرداخت از طریق درگاه بانکی"
                                ImageUrl="~/dashboard/assets/img/icon_payment_Factor.png" runat="server" />

                             <asp:ImageButton ID="ImageButton3" OnCommand="PaymentFactorWallet"
                            CommandArgument='<%# Eval("id") & "|" & Eval("total") %>'
                            ToolTip="پرداخت از کیف پول"
                                ImageUrl="~/dashboard/assets/img/walletPay.png" runat="server" />


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
                    <span style="font-family: irsans;">فاکتور پرداخت نشده ای وجود ندارد. </span>
                </EmptyDataTemplate>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#539FA0" />
                <HeaderStyle BackColor="#539FA0" Font-Bold="True" HorizontalAlign="Right" ForeColor="#000"
                    Font-Names="irsans" Font-Size="10px" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#539FA0" HorizontalAlign="Right" />
                <PagerStyle CssClass="gridview" />
                <RowStyle CssClass="rowText"></RowStyle>
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="SDS_NOT" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="
SELECT
i.ID,
i.transaction_code,
i.payment_code,
i.payment_date,
i.email,
i.ProjectID,
p.namef,
i.DeadlineID,
CASE WHEN [fee] = 0	THEN (select [CommissionForFree] from tbl_setting) WHEN d.[fee] <> 0 THEN (select [CommissionForFee] from tbl_setting)	END 'Commission',
i.price - (CASE WHEN [fee] = 0	THEN (select [CommissionForFree] from tbl_setting) WHEN d.[fee] <> 0 THEN (select [CommissionForFee] from tbl_setting)	END) 'PriceMinusCommission',
i.price 'total',
(select dbo.MiladiTOShamsi(i.record_date,'/')) 'CreationFactorDate',
f.title_fa 'FestivalName',
s.section,
(select dbo.MiladiTOShamsi(d.deadline,'/')) 'deadline'
FROM [tbl_invoice] i,[tbl_festivals] f,[tbl_festivalSections] s,[tbl_festivalDeadline] d ,[dbo].[tbl_Projects] p
WHERE
i.email=@email
and i.festivalID=f.ID 
and s.id=d.sectionID
and s.festivalId=f.ID 
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
            <ul>
            <li>توجه:
                <ul>
                <li>
                     حق کمسیون شامل تبادل ارز و همچنین کارمزد درگاه فیلم ایران می باشد.
                </li>
                <li>
                ارزش خالص فاکتور عبارتنداز تبدیل مقدار ورودی فستیوال به ارز که روزانه ممکن است تغییر کند.
                </li>
                <li>
                در صورت دیر کرد در پرداخت و تغییر ارز، هزینه دوباره محاسبه خواهد شد، بنابراین هر چه سریعتر نسبت به پرداخت فاکتورهای پرداخت نشده اقدام کنید.
                </li>
                </ul>
            </li>
            </ul>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                    صورت حساب های مالی و قراردادها</h4>
            </div>
        </div>
        <asp:HiddenField ID="HiddenEmail" runat="server" />
        <div class="row">
            <div class="col-md-12">
                <div class="frame">
                    <asp:GridView ID="dgPaid" DataSourceID="SDS" runat="server" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" CellPadding="3" GridLines="Horizontal"
                        HeaderStyle-CssClass="centerHeaderText" RowStyle-CssClass="rowText" 
                        AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:BoundField DataField="ID" ItemStyle-CssClass="ItemCode" HeaderText="شماره فاکتور" InsertVisible="False" ReadOnly="True"
                                SortExpression="ID">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                             <asp:TemplateField HeaderText="شناسه تراکنش" InsertVisible="False" 
                                SortExpression="transaction_code">
                                 <ItemTemplate>
                                     <asp:Label ID="Label2" runat="server" Text='<%# iif(Eval("transaction_code")="-1","پرداخت از کیف",Eval("transaction_code")) %>'></asp:Label>
                                 </ItemTemplate>                            
                                 <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="شناسه پرداخت" InsertVisible="False" 
                                SortExpression="payment_code">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server"
                                    Text='<%# iif(Eval("payment_code")="-1","پرداخت از کیف",Eval("payment_code")) %>'
                                    ></asp:Label>
                                </ItemTemplate>                                
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField ItemStyle-CssClass="ItemFestival" HeaderText="فستیوال" SortExpression="FestivalName">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FestivalName").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="پروژه" ItemStyle-CssClass="ItemProject" SortExpression="namef">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("namef").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="بخش فستیوال" ItemStyle-CssClass="ItemSection"  SortExpression="section">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("section").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="deadline" HeaderText="تاریخ ددلاین" SortExpression="deadline">
                            </asp:BoundField>
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
                           
                            <asp:TemplateField HeaderText="تاریخ ایجاد فاکتور" SortExpression="CreationFactorDate">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("CreationFactorDate") %>'></asp:Label>
                                </ItemTemplate>                                
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="تاریخ پرداخت" SortExpression="payment_date">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("payment_date") %>'></asp:Label>
                                </ItemTemplate>                                
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                            <asp:TemplateField HeaderText="تک فاکتور" SortExpression="total">
                                <ItemTemplate>
                                    <img id="ImageButton2" src='<%= ResolveUrl("~/files/images/icons/contract.png") %>'
                                        style="cursor: pointer;" onclick="return contractFUN('<%# Eval("id").ToString.Trim() %>')" />
                                </ItemTemplate>
                                <ItemStyle ForeColor="Red" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <EmptyDataTemplate>
                            <span style="font-family: irsans;">فاکتوری وجود ندارد. </span>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#539FA0" />
                        <HeaderStyle BackColor="#539FA0" Font-Bold="True" HorizontalAlign="Right" ForeColor="#000"
                            Font-Names="irsans" Font-Size="10px" />
                        <PagerStyle CssClass="gridview" />
                        <RowStyle CssClass="rowText"></RowStyle>
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="
SELECT
i.ID,
i.transaction_code,
i.payment_code,
(select dbo.MiladiTOShamsi(i.payment_date,'/')) 'payment_date',
i.email,
i.ProjectID,
p.namef,
i.DeadlineID,
i.Commission 'Commission',
i.price - i.Commission 'PriceMinusCommission',
i.price 'total',
(select dbo.MiladiTOShamsi(i.record_date,'/')) 'CreationFactorDate',
f.title_fa 'FestivalName',
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
            and (payment_code is not null or payment_code != '')
			and (transaction_code is not null or transaction_code != '')
    ORDER BY i.[ID] DESC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HiddenEmail" Name="email" PropertyName="Value" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-warning" style="font-family: Samim;">
                    فیلمسازانی که مایل به داشتن نسخه چاپی صورت حساب ها بعلاوه ی قرارداد بهمراه مهر رسمی
                    درگاه فیلم ایران هستند می توانند درخواست خود را از طریق ایمیل مطرح کرده و در اسرع
                    وقت برایشان پست گردد.
                </div>
            </div>
        </div>
    </div>
</asp:Content>
