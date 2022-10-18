<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="submission.aspx.vb" Inherits="dashboard_submission" %>

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
        .rowText
        {
            font-family: Samim;
            padding: 12px;
            color: Black;
            border-bottom: 1px solid #ccc;
        }
        .centerHeaderText th
        {
            text-align: right;
            padding-left: 5px;
        }
        .centerHeaderCenter th
        {
            text-align: center ;
        }
        table tr:hover td
        {
            background-color: #bfe8f9;
            color: Black;
        }
        .nav-justified tr:hover td
        {
            background-color: White;
            color: Black;
        }
        .ItemFestivalName
        {
            width: 45%;
        }
        .ItemProjectName
        {
            width: 15%;
            text-align: center;
        }
        .ItemSection
        {
            width: 10%;
        }
        .ItemDate
        {
            width: 10%;
        }
        .ItemDateSend
        {
            width: 15%;
        }
    </style>
    <style>
        @media (max-width: 767px)
        {
        
        .centerHeaderCenter{display:none;}
        
        .ItemFestivalName
        {
            width: 100%;
        }
        .ItemProjectName
        {
            width: 100%;
            text-align: right;
        }
        .ItemSection
        {
            width: 100%;
        }
        .ItemDate
        {
            width: 100%;
        }
        .ItemDateSend
        {
            width: 100%;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right;">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                    فستیوال های شرکت کرده</h4>
            </div>
        </div>
        <asp:HiddenField ID="HiddenEmail" runat="server" />
        <div class="row">
            <div class="col-md-12">
                <div>
                    <asp:GridView ID="GridView1" DataSourceID="SDS" runat="server" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" CellPadding="3" GridLines="None"
                        HeaderStyle-CssClass="centerHeaderCenter"
                        RowStyle-CssClass="rowText" AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="نام فستیوال" ItemStyle-CssClass="ItemFestivalName"
                                SortExpression="festivalName" HeaderStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("festivalName").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="اسم پروژه"
                             HeaderStyle-CssClass="centerHeaderCenter"
                                SortExpression="namef" ItemStyle-CssClass="ItemProjectName">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("namef").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>



                            <asp:TemplateField HeaderText="بخش فستیوال" SortExpression="section" ItemStyle-CssClass="ItemSection">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("section").Replace("ي", "ی") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="deadline" ItemStyle-CssClass="ItemDate" HeaderText="تاریخ ددلاین"
                                SortExpression="deadline" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="festivalID" HeaderText="festivalID" SortExpression="festivalID"
                                Visible="False" />
                            <asp:TemplateField HeaderText="تاریخ ارسال" SortExpression="send_date" ItemStyle-CssClass="ItemDateSend">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# getDate(Eval("send_date")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" SortExpression="send_status" HeaderStyle-CssClass="ddd">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" ImageUrl='<%# SetSend(Eval("send_status")) %>' runat="server" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="ddd" SortExpression="accolades_status">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" ImageUrl='<%# SetAccoalde(Eval("accolades_status")) %>' runat="server" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="ddd"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" SortExpression="detail">
                                <ItemTemplate>
                                    <img id="ImageButton2" src='<%= ResolveUrl("~/files/images/icons/text.png") %>' style="cursor: pointer;"
                                        onclick="return confirm('<%# iif(Eval("detail").ToString.Trim()="","توضیحاتی درج نشده است.",Eval("detail").ToString.Trim()) %>','s','sd')" />
                                </ItemTemplate>
                                <ItemStyle ForeColor="Red" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <span style="font-family: irsans;">فستیوالی ثبت نشده است. </span>
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="gridview" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#539FA0" />
                        <HeaderStyle BackColor="#539FA0" Font-Bold="True" HorizontalAlign="Right" ForeColor="#000"
                            Font-Names="irsans" Font-Size="12px" />
                        <PagerStyle BackColor="#E7E7FF" HorizontalAlign="Right" />
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
i.*,
f.title_fa +' - '+f.title_en 'festivalName',
s.section,
p.namef,
(select dbo.MiladiTOShamsi(d.deadline,'/')) 'deadline'
FROM [tbl_invoice] i,[tbl_festivals] f ,[tbl_festivalSections] s,[tbl_festivalDeadline] d,[dbo].[tbl_Projects] p
WHERE
	i.[email] = @email
	and (transaction_code is not null or transaction_code != '')
	and (payment_code is not null or payment_code != '')
	and f.id=i.festivalID
    and s.id=d.sectionID 
    and d.festivalID=f.ID
    and i.DeadlineID=d.id
	and p.ID=i.ProjectID
ORDER BY [ID] DESC
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HiddenEmail" Name="email" PropertyName="Value" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <hr />
                <div>
                </div>
                <div style="font-family: NazaninB; font-size: 18px;">
                    مراحل ارسال فیلم و فیلمنامه</div>
                <div>
                    <table class="nav-justified" style="font-family: Samim; font-size: 11px;">
                        <tr>
                            <td style="width: 3%;">
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Consideration.png")%>' />
                            </td>
                            <td>
                                پروژه آماده ارسال است
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_sent.png")%>' />
                            </td>
                            <td>
                                پروژه ارسال شده است
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_deny.png")%>' />
                            </td>
                            <td>
                                این ارسال به دلایلی توسط کارشناس پخش درگاه فیلم ایران لغو شده است و شما میتوانید
                                دلیل آن را در بخش توضیحات بخوانید.
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
                <hr />
                <div style="font-family: NazaninB; font-size: 18px;">
                    مراحل داوری فیلم و فیلمنامه</div>
                <div>
                    <table class="nav-justified" style="font-family: Samim; font-size: 11px;">
                        <tr>
                            <td style="width: 3%;">
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_deny.png")%>' />
                            </td>
                            <td>
                                پروژه ارسال نشده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Disqualified.png")%>' />
                            </td>
                            <td>
                                پروژه واجد شرایط ورود به فستیوال نبوده و قبل از مرحله انتخاب رد شده است.
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Undecided.png")%>' />
                            </td>
                            <td>
                                پروژه در حال بررسی توسط فستیوال است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Selected.png")%>' />
                            </td>
                            <td>
                                پروژه وارد بخش مسابقه شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_NotSelected.png")%>' />
                            </td>
                            <td>
                                پروژه وارد بخش مسابقه نشده و OUT است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Semi_Finalist.png")%>' />
                            </td>
                            <td>
                                پروژه وارد مرحله نیمه نهایی شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" class="style2" src='<%= ResolveUrl("~/dashboard/assets/img/icon_finlist.png")%>' />
                            </td>
                            <td>
                                پروژه وارد مرحله نهایی شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" class="style2" src='<%= ResolveUrl("~/dashboard/assets/img/icon_award.png")%>' />
                            </td>
                            <td>
                                پروژه جایزه گرفته است.
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
