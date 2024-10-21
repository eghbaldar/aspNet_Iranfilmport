<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="messages.aspx.vb" Inherits="dashboard_messages" %>

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
            font-family: irsans;
            font-weight:bold;
        }
        table tr:hover td
        {
            background-color: #bfe8f9;
            color: Black;
        }
        .RowS
        {
            border-bottom: 1px solid #ccc;
        }
        .RowS:hover
        {
            background-color: #ccc;
        }
        .ItemCode
        {
            width: 5%;
            text-align: right;
        }
        .ItemSubject
        {
            width: 50%;
            text-align: right;
        }
        .ItemDate
        {
            width: 12.5%;
            text-align: right;
        }
        .ItemStatus
        {
            width: 12.5%;
            text-align: right;
        }
        .ItemLetter
        {
            width: 10%;
            text-align: left;
        }
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
        
        
        @media (max-width: 767px)
        {
        
        
        
            .ItemCode
            {
                width: 100%;
                text-align: right;
            }
            .ItemSubject
            {
                width: 100%;
                text-align: right;
            }
            .ItemDate
            {
                width: 100%;
                text-align: right;
            }
            .ItemStatus
            {
                width: 100%;
                text-align: right;
            }
            .ItemLetter
            {
                width: 100%;
                text-align: left;
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
    <script>
        function msgFUN(msgID) {
            //        
            var ss = "user/me/messages/msg/" + msgID;
            window.open('<%= Page.ResolveUrl("' + ss + '") %>', 'پیام', 'width=500,height=400');

            //            window.open('<%= Page.ResolveUrl("' + s + '/جستجو") %>' , "_self");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right;">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                    پیام ها</h4>
            </div>
        </div>
        <asp:HiddenField ID="HiddenEmail" runat="server" />
        <div class="row">
            <div class="col-md-12">
                <div>
                    <asp:GridView HeaderStyle-CssClass="THeader" ID="GV" runat="server" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                        CellPadding="4" DataSourceID="SDS" GridLines="None" AllowPaging="True" RowStyle-CssClass="RowS">
                        <Columns>
                            <asp:TemplateField HeaderText="کد" ItemStyle-CssClass="ItemCode" SortExpression="date"
                                HeaderStyle-CssClass="ddd">
                                <ItemTemplate>
                                    <div style="padding-right: 5px;">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("id")%>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle Width="300px" />
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="type" HeaderText="type" SortExpression="type" Visible="False" />
                            <asp:BoundField DataField="adminID" HeaderText="adminID" SortExpression="adminID"
                                Visible="False" />
                            <asp:BoundField DataField="useremail" HeaderText="useremail" SortExpression="adminID"
                                HeaderStyle-CssClass="ddd" Visible="False">
                                <HeaderStyle CssClass="ddd"></HeaderStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="موضوع" ItemStyle-CssClass="ItemSubject" SortExpression="date"
                                HeaderStyle-CssClass="ddd">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" Style="font-family: Samim; font-size: 12px;" runat="server"
                                        Text='<%# Eval("subject").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="تاریخ" ItemStyle-CssClass="ItemDate" SortExpression="date"
                                HeaderStyle-CssClass="ddd">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# getDate(Eval("date")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="130px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="وضعیت" ItemStyle-CssClass="ItemStatus" SortExpression="flag"
                                HeaderStyle-CssClass="ddd">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" Style="font-family: Samim; font-size: 12px;" runat="server"
                                        Text='<%# getFlag(Eval("flag")).Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="130px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="icon" HeaderText="icon" HeaderStyle-CssClass="ddd" SortExpression="icon"
                                Visible="False" />
                            <asp:TemplateField SortExpression="text" ItemStyle-CssClass="ItemLetter">
                                <ItemTemplate>
                                    <a onclick="return msgFUN('<%# Eval("id") %>');" style="cursor: pointer;">
                                        <asp:Image ID="ImageButton1" Width="35" ImageUrl='<%# getimgmsg(Eval("flag")) %>'
                                            runat="server" />
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         <EmptyDataTemplate>
                            <span style="font-family: irsans;">پیامی ثبت نشده است. </span>
                        </EmptyDataTemplate>
                        <EditRowStyle BackColor="#999999" />                        
                        <PagerStyle CssClass="gridview" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#539FA0" />
                        <HeaderStyle BackColor="#ECCE01" Font-Bold="True" HorizontalAlign="Right" ForeColor="#000"
                            Font-Names="irsans" Font-Size="10px" />
                        <PagerStyle BackColor="#E7E7FF" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="SELECT * FROM [tbl_messages] WHERE ([useremail] = @useremail) ORDER BY [ID] DESC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HiddenEmail" Name="useremail" PropertyName="Value"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-warning" style="font-family: Samim;">
                    پیام هایی که در جدول فوق مشاهده میکنید سیستمی هستند و نسخه ای از آن به ایمیل شما
                    ارسال گردیده است.
                </div>
            </div>
        </div>
    </div>
</asp:Content>
