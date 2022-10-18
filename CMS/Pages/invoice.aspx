<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="invoice.aspx.vb" Inherits="CMS_Pages_invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:Button ID="btnReady" CssClass="tabBtn" runat="server" Text="آماده ارسال" />
<asp:Button ID="btnSent" CssClass="tabBtn" runat="server" Text="ارسال شده" />
<asp:Button ID="btnDeny" CssClass="tabBtn" runat="server" Text=" رد  شده توسط ادمین" />
<asp:Button ID="btnAll" CssClass="tabBtn" runat="server" Text="تمام پروژه ها" />
<div runat="server" style="padding: 10px; border: 1px solid #ccc;">

    <asp:MultiView ID="MultiView" runat="server">
        <asp:View ID="V_ReadyForSend" runat="server">
        <div>
<table style="font-family:Samim;">
<tr><td>مراحل بررسی:</td></tr>
<tr><td>1: پروفایل کاربر چک شود</td></tr>
<tr><td>2: ددلاین فستیوال براساس زمان پرداخت هزینه چک شود آیا فرصت باقی است؟ چراکه پول باید به حساب فستیوال واریز شود و این خود زمانبر است</td></tr>
<tr><td>3: آیا پروژه همخوانی با فستیوال دارد؟</td></tr>
<tr><td>4: توجه: هم در صورت ارسال و هم در صورت رد درخواست تاریخ امروز برای کاربر ثبت خواهد شد، دقت کنید</td></tr>
<tr><td>5: رد شدن ارسال باید بصورت کاملا نادر اتفاق بیوفتد</td></tr>
</table>
</div>
            <asp:GridView ID="dgReady" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SDS_Ready" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                        Visible="False" />
                    <asp:TemplateField HeaderText="واریزکننده" SortExpression="name"><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label><br></br><a href='<%# String.Format("profileEdit.aspx?id={0}&email={1}",Eval("userid"),Eval("email")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده پروفایل</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="transaction_code" HeaderText="کد تراکنش" 
                        SortExpression="transaction_code" />
                    <asp:BoundField DataField="payment_code" HeaderText="کد پرداخت" 
                        SortExpression="payment_code" />
                    <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" 
                        SortExpression="ProjectID" Visible="False" />
                    <asp:BoundField DataField="DeadlineID" HeaderText="DeadlineID" 
                        SortExpression="DeadlineID" Visible="False" />
                    <asp:BoundField DataField="price" HeaderText="مبلغ" 
                        SortExpression="price" />
                    <asp:BoundField DataField="festivalID" HeaderText="festivalID" 
                        SortExpression="festivalID" Visible="False" />
                    <asp:TemplateField HeaderText="فستیوال" SortExpression="FestivalName"><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("FestivalName") %>'></asp:Label><br></br><a  href='<%# String.Format("editFest.aspx?id={0}&type=fest",Eval("festivalid")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده فستیوال</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="section" HeaderText="بخش" 
                        SortExpression="section" />
                    <asp:TemplateField HeaderText="نام پروژه" SortExpression="namef"><ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Eval("namef") %>'></asp:Label><br></br><a href='<%# String.Format("projectEdit.aspx?id={0}&email={1}",Eval("projectid"),Eval("email")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده پروژه</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="CreationFactorDate" HeaderText="تاریخ ایجاد فاکتور" 
                        ReadOnly="True" SortExpression="CreationFactorDate" />
                    <asp:BoundField DataField="payment_date" HeaderText="تاریخ پرداخت" ReadOnly="True" 
                        SortExpression="payment_date" />
                    <asp:BoundField DataField="deadline" HeaderText="deadline" ReadOnly="True" 
                        SortExpression="deadline" Visible="False" />
                    
                    <asp:TemplateField HeaderText="ارسال؟" SortExpression="namef" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1"
                            OnClientClick="return confirm('آیا از ارسال این پروژه مطمئن هستید؟ پس از تائید و ارسال پروژه، ایمیلی حاوی بر موفقیت ارسال برای کاربر ارسال خواهد شد بنابراین کمال دقت در ارسال انجام شود در ضمن تاریخ ارسال پس از تائید ثبت خواهد شد');"
                            AlternateText="ارسال شود"
                            OnCommand="GoSend"
                            CommandArgument='<%# Eval("id") & "|" & Eval("email") & "|" & Eval("price") %>'
                            ToolTip="ارسال شود"
                            runat="server" ImageUrl="~/CMS/files/img/submitproject.png" />
                            
                            <asp:ImageButton ID="ImageButton2"
                            AlternateText="رد شود + توضیح"
                            OnCommand="GoDeny"
                            CommandArgument='<%# Eval("id") & "|" & Eval("email") & "|" & Eval("price") %>'
                            ToolTip="رد شود + توضیح"
                            OnClientClick="return confirm('آیا از رد کردن این ارسال مطمئنید؟ با رد کردن این درخواست، باید توضیحاتی را قید کنید که این توضیحات بغیر از ثبت در سامانه، ایمیل هم خواهد شد در ضمن تاریخ رد درخواست ثبت خواهد شد | همچنین در رابطه با وضعیت مبلغ باید تصمیم گیری کنید که آیا برگشت بخورد ویا نه؟.');"
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_deny.png" /></ItemTemplate></asp:TemplateField>

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
            <asp:SqlDataSource ID="SDS_Ready" runat="server" 
                ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
                SelectCommand="SELECT
		i.ID,
		pc.id 'userid',
		i.email,
		pc.Name + ' ' + pc.LastName 'name',
		i.transaction_code,
		i.payment_code,
		i.ProjectID,
		i.DeadlineID,
		i.price,
		i.festivalID,
		(select dbo.MiladiTOShamsi(i.record_date,'/')) 'CreationFactorDate',
		f.title_en+' '+f.title_fa 'FestivalName',
		s.section,
		p.namef,
		(select dbo.MiladiTOShamsi(i.payment_date,'/')) 'payment_date',
		(select dbo.MiladiTOShamsi(d.deadline,'/')) 'deadline'    
    FROM 
		[tbl_invoice] i,
		[tbl_festivals] f,
		[tbl_festivalSections] s,
		[tbl_festivalDeadline] d,
		[tbl_Projects] p,
		[tbl_ProfileCreator] pc
	where
		send_status=1
		AND (payment_code is not null or payment_code <> '')
		AND (transaction_code is not null or transaction_code <> '')
		AND i.festivalID=f.ID 
		AND s.id=d.sectionID 
		AND d.festivalID=f.ID
		AND i.DeadlineID=d.id 
		AND p.ID=i.ProjectID
		AND	 pc.Email=i.email
    ORDER BY i.[ID] DESC

	"></asp:SqlDataSource>
        </asp:View>
        <asp:View ID="V_Sent" runat="server">
            <asp:GridView ID="dgSent" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SDS_Sent" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                        Visible="False" />
                    <asp:TemplateField HeaderText="واریزکننده" SortExpression="name"><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label><br></br><a href='<%# String.Format("profileEdit.aspx?id={0}&email={1}",Eval("userid"),Eval("email")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده پروفایل</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="transaction_code" HeaderText="کد تراکنش" 
                        SortExpression="transaction_code" />
                    <asp:BoundField DataField="payment_code" HeaderText="کد پرداخت" 
                        SortExpression="payment_code" />
                    <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" 
                        SortExpression="ProjectID" Visible="False" />
                    <asp:BoundField DataField="DeadlineID" HeaderText="DeadlineID" 
                        SortExpression="DeadlineID" Visible="False" />
                    <asp:BoundField DataField="price" HeaderText="مبلغ" 
                        SortExpression="price" />
                    <asp:BoundField DataField="festivalID" HeaderText="festivalID" 
                        SortExpression="festivalID" Visible="False" />
                    <asp:TemplateField HeaderText="فستیوال" SortExpression="FestivalName"><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("FestivalName") %>'></asp:Label><br></br><a  href='<%# String.Format("editFest.aspx?id={0}&type=fest",Eval("festivalid")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده فستیوال</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="section" HeaderText="بخش" 
                        SortExpression="section" />
                    <asp:TemplateField HeaderText="نام پروژه" SortExpression="namef"><ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Eval("namef") %>'></asp:Label><br></br><a href='<%# String.Format("projectEdit.aspx?id={0}&email={1}",Eval("projectid"),Eval("email")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده پروژه</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="CreationFactorDate" HeaderText="تاریخ ایجاد فاکتور" 
                        ReadOnly="True" SortExpression="CreationFactorDate" />
                    <asp:BoundField DataField="payment_date" HeaderText="تاریخ پرداخت" ReadOnly="True" 
                        SortExpression="payment_date" />
                    <asp:BoundField DataField="deadline" HeaderText="deadline" ReadOnly="True" 
                        SortExpression="deadline" Visible="False" />
                    
                    <asp:TemplateField HeaderText="داوری" SortExpression="namef" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:ImageButton ID="ImageButton1"
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|0|"  & Eval("email") %>'
                            ToolTip="پروژه ارسال نشده است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_deny.png" /><asp:ImageButton ID="ImageButton2"
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|1|"  & Eval("email") %>'
                            ToolTip="پروژه واجد شرایط ورود به فستیوال نبوده و قبل از مرحله انتخاب رد شده است.	"
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_Disqualified.png" /><asp:ImageButton ID="ImageButton3"
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|2|"  & Eval("email")%>'
                            ToolTip="پروژه در حال بررسی توسط فستیوال است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_Undecided.png" /><asp:ImageButton ID="ImageButton4"
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|3|"  & Eval("email") %>'
                            ToolTip="پروژه وارد بخش مسابقه شده است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_Selected.png" /><asp:ImageButton ID="ImageButton5"
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|4|"  & Eval("email") %>'
                            ToolTip="پروژه وارد بخش مسابقه نشده و OUT است.."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_NotSelected.png" /><asp:ImageButton ID="ImageButton6"
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|5|"  & Eval("email") %>'
                            ToolTip="پروژه وارد مرحله نیمه نهایی شده است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_Semi_Finalist.png" /><asp:ImageButton ID="ImageButton7"
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|6|"  & Eval("email") %>'
                            ToolTip="پروژه وارد مرحله نهایی شده است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_finlist.png" /><asp:ImageButton ID="ImageButton8"
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|7|" & Eval("email") %>'
                            ToolTip="پروژه جایزه گرفته است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_award.png" /></ItemTemplate></asp:TemplateField>

 <asp:TemplateField HeaderText="نتیجه داوری" SortExpression="accolades_status"><ItemTemplate><asp:Image ID="Image1" Width="30" ImageUrl='<%# SetAccoalde(Eval("accolades_status")) %>' runat="server" /></ItemTemplate><HeaderStyle CssClass="ddd"></HeaderStyle><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>

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
            <asp:SqlDataSource ID="SDS_Sent" runat="server" 
                ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
                SelectCommand="SELECT
		i.ID,
		pc.id 'userid',
        i.accolades_status,
		i.email,
		pc.Name + ' ' + pc.LastName 'name',
		i.transaction_code,
		i.payment_code,
		i.ProjectID,
		i.DeadlineID,
		i.price,
		i.festivalID,
		(select dbo.MiladiTOShamsi(i.record_date,'/')) 'CreationFactorDate',
		f.title_en+' '+f.title_fa 'FestivalName',
		s.section,
		p.namef,
		(select dbo.MiladiTOShamsi(i.payment_date,'/')) 'payment_date',
		(select dbo.MiladiTOShamsi(d.deadline,'/')) 'deadline'    
    FROM 
		[tbl_invoice] i,
		[tbl_festivals] f,
		[tbl_festivalSections] s,
		[tbl_festivalDeadline] d,
		[tbl_Projects] p,
		[tbl_ProfileCreator] pc
	where
		send_status=2
		AND (payment_code is not null or payment_code <> '')
		AND (transaction_code is not null or transaction_code <> '')
		AND i.festivalID=f.ID 
		AND s.id=d.sectionID 
		AND d.festivalID=f.ID
		AND i.DeadlineID=d.id 
		AND p.ID=i.ProjectID
		AND	 pc.Email=i.email
    ORDER BY i.[ID] DESC

	"></asp:SqlDataSource>
            <table class="nav-justified" style="font-family: irsans; font-size: 11px;">
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_deny.png")%>' />
                            </td>
                            <td>
                                پروژه ارسال نشده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Disqualified.png")%>' />
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
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Undecided.png")%>' />
                            </td>
                            <td>
                                پروژه در حال بررسی توسط فستیوال است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Selected.png")%>' />
                            </td>
                            <td>
                                پروژه وارد بخش مسابقه شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt=""  src='<%= ResolveUrl("~/dashboard/assets/img/icon_NotSelected.png")%>' />
                            </td>
                            <td>
                                پروژه وارد بخش مسابقه نشده و OUT است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Semi_Finalist.png")%>' />
                            </td>
                            <td>
                                پروژه وارد مرحله نیمه نهایی شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_finlist.png")%>' />
                            </td>
                            <td>
                                پروژه وارد مرحله نهایی شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_award.png")%>' />
                            </td>
                            <td>
                                پروژه جایزه گرفته است.
                            </td>
                        </tr>
                    </table>
        </asp:View>
        <asp:View ID="V_Deny" runat="server">
                <asp:GridView ID="dgDeny" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SDS_Deny" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                        Visible="False" />
                    <asp:TemplateField HeaderText="واریزکننده" SortExpression="name"><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label><br></br><a href='<%# String.Format("profileEdit.aspx?id={0}&email={1}",Eval("userid"),Eval("email")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده پروفایل</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="transaction_code" HeaderText="کد تراکنش" 
                        SortExpression="transaction_code" />
                    <asp:BoundField DataField="payment_code" HeaderText="کد پرداخت" 
                        SortExpression="payment_code" />
                    <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" 
                        SortExpression="ProjectID" Visible="False" />
                    <asp:BoundField DataField="DeadlineID" HeaderText="DeadlineID" 
                        SortExpression="DeadlineID" Visible="False" />
                    <asp:BoundField DataField="price" HeaderText="مبلغ" 
                        SortExpression="price" />
                    <asp:BoundField DataField="festivalID" HeaderText="festivalID" 
                        SortExpression="festivalID" Visible="False" />
                    <asp:TemplateField HeaderText="فستیوال" SortExpression="FestivalName"><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("FestivalName") %>'></asp:Label><br></br><a  href='<%# String.Format("editFest.aspx?id={0}&type=fest",Eval("festivalid")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده فستیوال</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="section" HeaderText="بخش" 
                        SortExpression="section" />
                    <asp:TemplateField HeaderText="نام پروژه" SortExpression="namef"><ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Eval("namef") %>'></asp:Label><br></br><a href='<%# String.Format("projectEdit.aspx?id={0}&email={1}",Eval("projectid"),Eval("email")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده پروژه</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="CreationFactorDate" HeaderText="تاریخ ایجاد فاکتور" 
                        ReadOnly="True" SortExpression="CreationFactorDate" />
                    <asp:BoundField DataField="payment_date" HeaderText="تاریخ پرداخت" ReadOnly="True" 
                        SortExpression="payment_date" />
                    <asp:BoundField DataField="deadline" HeaderText="deadline" ReadOnly="True" 
                        SortExpression="deadline" Visible="False" />
                     <asp:TemplateField HeaderText="ارسال شود؟" SortExpression="accolades_status">
                     <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1s1"
                            OnClientClick="return confirm('آیا از ارسال این پروژه مطمئن هستید؟ پس از تائید و ارسال پروژه، ایمیلی حاوی بر موفقیت ارسال برای کاربر ارسال خواهد شد بنابراین کمال دقت در ارسال انجام شود در ضمن تاریخ ارسال پس از تائید ثبت خواهد شد');"
                            AlternateText="ارسال شود"
                            OnCommand="GoSend"
                            CommandArgument='<%# Eval("id") & "|" & Eval("email") %>'
                            ToolTip="ارسال شود"
                            runat="server" ImageUrl="~/CMS/files/img/submitproject.png" />
                            </ItemTemplate>
                            </asp:TemplateField>

 

<asp:TemplateField HeaderText="توضیحات" SortExpression="total">
                                <ItemTemplate>
                                <a target="_blank" href='<%# String.Format("invoiceMSG.aspx?invoiceID={0}&email={1}&price={2}",Eval("id"), Eval("email"),Eval("price")) %>'>
                                    <img id="ImageButton2" src='<%= ResolveUrl("~/files/images/icons/contract.png") %>'
                                        style="cursor: pointer;"  />
                                        </a>
                                </ItemTemplate>
                                <ItemStyle ForeColor="Red" HorizontalAlign="Center" />
                            </asp:TemplateField>

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
            <asp:SqlDataSource ID="SDS_Deny" runat="server" 
                ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
                SelectCommand="SELECT
		i.ID,
		pc.id 'userid',
        i.accolades_status,
		i.email,
		pc.Name + ' ' + pc.LastName 'name',
		i.transaction_code,
		i.payment_code,
		i.ProjectID,
		i.DeadlineID,
		i.price,
		i.festivalID,
		(select dbo.MiladiTOShamsi(i.record_date,'/')) 'CreationFactorDate',
		f.title_en+' '+f.title_fa 'FestivalName',
		s.section,
		p.namef,
		(select dbo.MiladiTOShamsi(i.payment_date,'/')) 'payment_date',
		(select dbo.MiladiTOShamsi(d.deadline,'/')) 'deadline'    
    FROM 
		[tbl_invoice] i,
		[tbl_festivals] f,
		[tbl_festivalSections] s,
		[tbl_festivalDeadline] d,
		[tbl_Projects] p,
		[tbl_ProfileCreator] pc
	where
		send_status=3
		AND (payment_code is not null or payment_code <> '')
		AND (transaction_code is not null or transaction_code <> '')
		AND i.festivalID=f.ID 
		AND s.id=d.sectionID 
		AND d.festivalID=f.ID
		AND i.DeadlineID=d.id 
		AND p.ID=i.ProjectID
		AND	 pc.Email=i.email
    ORDER BY i.[ID] DESC

	"></asp:SqlDataSource>
            
        </asp:View>
        <asp:View ID="V_ALL" runat="server">
                        <asp:GridView ID="dgAll" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SDS_All" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                        Visible="False" />
                    <asp:TemplateField HeaderText="واریزکننده" SortExpression="name"><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label><br></br><a href='<%# String.Format("profileEdit.aspx?id={0}&email={1}",Eval("userid"),Eval("email")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده پروفایل</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="transaction_code" HeaderText="کد تراکنش" 
                        SortExpression="transaction_code" />
                    <asp:BoundField DataField="payment_code" HeaderText="کد پرداخت" 
                        SortExpression="payment_code" />
                    <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" 
                        SortExpression="ProjectID" Visible="False" />
                    <asp:BoundField DataField="DeadlineID" HeaderText="DeadlineID" 
                        SortExpression="DeadlineID" Visible="False" />
                    <asp:BoundField DataField="price" HeaderText="مبلغ" 
                        SortExpression="price" />
                    <asp:BoundField DataField="festivalID" HeaderText="festivalID" 
                        SortExpression="festivalID" Visible="False" />
                    <asp:TemplateField HeaderText="فستیوال" SortExpression="FestivalName"><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("FestivalName") %>'></asp:Label><br></br><a  href='<%# String.Format("editFest.aspx?id={0}&type=fest",Eval("festivalid")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده فستیوال</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="section" HeaderText="بخش" 
                        SortExpression="section" />
                    <asp:TemplateField HeaderText="نام پروژه" SortExpression="namef"><ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Eval("namef") %>'></asp:Label><br></br><a href='<%# String.Format("projectEdit.aspx?id={0}&email={1}",Eval("projectid"),Eval("email")) %>'
                            target="_blank"
                            style="color:Red;">مشاهده پروژه</a></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="CreationFactorDate" HeaderText="تاریخ ایجاد فاکتور" 
                        ReadOnly="True" SortExpression="CreationFactorDate" />
                    <asp:BoundField DataField="payment_date" HeaderText="تاریخ پرداخت" ReadOnly="True" 
                        SortExpression="payment_date" />
                    <asp:BoundField DataField="deadline" HeaderText="deadline" ReadOnly="True" 
                        SortExpression="deadline" Visible="False" />
                    
                    <asp:TemplateField HeaderText="داوری" SortExpression="namef" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:ImageButton ID="ImageButton1"
                    Visible='<%# iif(Eval("send_status")=2,"True","False") %>'
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|0|"  & Eval("email") %>'
                            ToolTip="پروژه ارسال نشده است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_deny.png" />
                            <asp:ImageButton ID="ImageButton2"
                            Visible='<%# iif(Eval("send_status")=2,"True","False") %>'
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|1|"  & Eval("email") %>'
                            ToolTip="پروژه واجد شرایط ورود به فستیوال نبوده و قبل از مرحله انتخاب رد شده است.	"
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_Disqualified.png" />
                            <asp:ImageButton ID="ImageButton3"
                            Visible='<%# iif(Eval("send_status")=2,"True","False") %>'
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|2|"  & Eval("email")%>'
                            ToolTip="پروژه در حال بررسی توسط فستیوال است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_Undecided.png" />
                            <asp:ImageButton ID="ImageButton4"
                            Visible='<%# iif(Eval("send_status")=2,"True","False") %>'
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|3|"  & Eval("email") %>'
                            ToolTip="پروژه وارد بخش مسابقه شده است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_Selected.png" />
                            <asp:ImageButton ID="ImageButton5"
                            Visible='<%# iif(Eval("send_status")=2,"True","False") %>'
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|4|"  & Eval("email") %>'
                            ToolTip="پروژه وارد بخش مسابقه نشده و OUT است.."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_NotSelected.png" />
                            <asp:ImageButton ID="ImageButton6"
                            Visible='<%# iif(Eval("send_status")=2,"True","False") %>'
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|5|"  & Eval("email") %>'
                            ToolTip="پروژه وارد مرحله نیمه نهایی شده است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_Semi_Finalist.png" />
                            <asp:ImageButton ID="ImageButton7"
                            Visible='<%# iif(Eval("send_status")=2,"True","False") %>'
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|6|"  & Eval("email") %>'
                            ToolTip="پروژه وارد مرحله نهایی شده است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_finlist.png" />
                            <asp:ImageButton ID="ImageButton8"
                            Visible='<%# iif(Eval("send_status")=2,"True","False") %>'
                            OnCommand="ChangeAccolades"
                            CommandArgument='<%# Eval("id") & "|7|" & Eval("email") %>'
                            ToolTip="پروژه جایزه گرفته است."
                            runat="server" ImageUrl="~/dashboard/assets/img/icon_award.png" />
                            </ItemTemplate></asp:TemplateField>

 <asp:TemplateField HeaderText="نتیجه داوری" SortExpression="accolades_status"><ItemTemplate><asp:Image ID="Image1" Width="30" ImageUrl='<%# SetAccoalde(Eval("accolades_status")) %>' runat="server" /></ItemTemplate><HeaderStyle CssClass="ddd"></HeaderStyle><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>

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
            <asp:SqlDataSource ID="SDS_All" runat="server" 
                ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
                SelectCommand="SELECT
		i.ID,
		pc.id 'userid',
        i.send_status,
        i.accolades_status,
		i.email,
		pc.Name + ' ' + pc.LastName 'name',
		i.transaction_code,
		i.payment_code,
		i.ProjectID,
		i.DeadlineID,
		i.price,
		i.festivalID,
		(select dbo.MiladiTOShamsi(i.record_date,'/')) 'CreationFactorDate',
		f.title_en+' '+f.title_fa 'FestivalName',
		s.section,
		p.namef,
		(select dbo.MiladiTOShamsi(i.payment_date,'/')) 'payment_date',
		(select dbo.MiladiTOShamsi(d.deadline,'/')) 'deadline'    
    FROM 
		[tbl_invoice] i,
		[tbl_festivals] f,
		[tbl_festivalSections] s,
		[tbl_festivalDeadline] d,
		[tbl_Projects] p,
		[tbl_ProfileCreator] pc
	where
        (payment_code is not null or payment_code <> '')
		AND (transaction_code is not null or transaction_code <> '')
		AND i.festivalID = f.ID
		AND i.DeadlineID = d.id 
		AND i.ProjectID = p.ID
        AND s.id=d.sectionID
		--AND i.festivalID = d.festivalID         		 
		--AND pc.Email=i.email
    ORDER BY i.[ID] DESC

	"></asp:SqlDataSource>
            <table class="nav-justified" style="font-family: irsans; font-size: 11px;">
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_deny.png")%>' />
                            </td>
                            <td>
                                پروژه ارسال نشده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Disqualified.png")%>' />
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
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Undecided.png")%>' />
                            </td>
                            <td>
                                پروژه در حال بررسی توسط فستیوال است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Selected.png")%>' />
                            </td>
                            <td>
                                پروژه وارد بخش مسابقه شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt=""  src='<%= ResolveUrl("~/dashboard/assets/img/icon_NotSelected.png")%>' />
                            </td>
                            <td>
                                پروژه وارد بخش مسابقه نشده و OUT است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_Semi_Finalist.png")%>' />
                            </td>
                            <td>
                                پروژه وارد مرحله نیمه نهایی شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_finlist.png")%>' />
                            </td>
                            <td>
                                پروژه وارد مرحله نهایی شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_award.png")%>' />
                            </td>
                            <td>
                                پروژه جایزه گرفته است.
                            </td>
                        </tr>
                    </table>
        </asp:View>
    </asp:MultiView>
</div>

</asp:Content>

