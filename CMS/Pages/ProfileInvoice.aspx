<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="ProfileInvoice.aspx.vb" Inherits="CMS_Pages_ProfileInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.style
{
    width:10px;
}
.btnSearch
{
text-align:center;
    font-family:Samim;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="TITLE">
        مقدار کیف پول کاربر
        
        </div>
    <div style="width: 100%; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                border-radius: 5px; padding: 5px;">
                <table style="width: 100%; text-align: center;">
                                    <tr>
                    <td>
                    <asp:Label ID="lblWarning" ForeColor="Red" Font-Size="Large" runat="server" Style="font-family: irsans;"></asp:Label>
                    <br />
                    <br />
                    </td>
                    </tr>
                    <tr style="font-family:titr;font-size:17px;">
                        <td>
                            افزایش کیف پول
                            <br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtBack" class="btnSearch"  runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--<input type="button" value="" onclick="ClickforSearch()" />--%>
                            <asp:Button ID="btnBank" runat="server" class="btnSearch"  Text="برگشت مالی" />
                        </td>
                    </tr>

                </table>
            </div>
   <div class="TITLE">
        صورت حساب های این کاربر</div>
    <div>

                        <asp:GridView ID="dg" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SDS_All" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" Visible="False" />
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

 <asp:TemplateField HeaderText="وضعیت ارسال" SortExpression="accolades_status">
                     <ItemTemplate>
                    
                            <asp:Image ID="Image11" ImageUrl='<%# SetSend(Eval("send_status")) %>' runat="server" />

                            <asp:ImageButton ID="ImageButton1s1"
                    Visible='<%# iif(Eval("send_status")=3,True,False) %>'
                            OnClientClick="return confirm('آیا از ارسال این پروژه مطمئن هستید؟ پس از تائید و ارسال پروژه، ایمیلی حاوی بر موفقیت ارسال برای کاربر ارسال خواهد شد بنابراین کمال دقت در ارسال انجام شود در ضمن تاریخ ارسال پس از تائید ثبت خواهد شد');"
                            AlternateText="ارسال شود"
                            OnCommand="GoSend"
                            CommandArgument='<%# Eval("id") & "|" & Eval("email") %>'
                            ToolTip="ارسال شود؟"
                            runat="server" ImageUrl="~/CMS/files/img/submitproject.png" />

                            </ItemTemplate>
                            </asp:TemplateField>
                    
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



 <asp:TemplateField HeaderText="نتیجه داوری" SortExpression="accolades_status">
 <ItemTemplate>
 <asp:Image ID="Image1" Width="30" ImageUrl='<%# SetAccoalde(Eval("accolades_status")) %>' runat="server" />
 </ItemTemplate><HeaderStyle CssClass="ddd"></HeaderStyle>
 <ItemStyle HorizontalAlign="Center" />
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
    i.email=@email
    AND
         (payment_code is not null or payment_code <> '')
		AND (transaction_code is not null or transaction_code <> '')
		AND i.festivalID=f.ID 
		AND s.id=d.sectionID 
		AND d.festivalID=f.ID
		AND i.DeadlineID=d.id 
		AND p.ID=i.ProjectID
		AND	 pc.Email=i.email
    ORDER BY i.[ID] DESC

	">
    <SelectParameters>
                <asp:QueryStringParameter Name="email" QueryStringField="email" />
            </SelectParameters>
    </asp:SqlDataSource>
    </div>
       <div class="TITLE">
                    مراحل ارسال فیلم و فیلمنامه</div>
                <div>
                    <table class="nav-justified" style="font-family: Samim; font-size: 11px;">
                        <tr>
                            <td style="width:3%;">
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
                <div class="TITLE">
                    مراحل داوری فیلم و فیلمنامه</div>
                <div>
                    <table class="nav-justified" style="font-family: Samim; font-size: 11px;">
                        <tr>
                            <td style="width:3%;">
                                <img alt="" class="style1" src='<%= ResolveUrl("~/dashboard/assets/img/icon_deny.png")%>' />
                            </td>
                            <td>
                                پروژه ارسال نشده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" 
                                src='<%= ResolveUrl("~/dashboard/assets/img/icon_Disqualified.png")%>' />
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
                                <img alt=""  src='<%= ResolveUrl("~/dashboard/assets/img/icon_Selected.png")%>' />
                            </td>
                            <td>
                                پروژه وارد بخش مسابقه شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src='<%= ResolveUrl("~/dashboard/assets/img/icon_NotSelected.png")%>' />
                            </td>
                            <td>
                                پروژه وارد بخش مسابقه نشده و OUT است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt=""  src='<%= ResolveUrl("~/dashboard/assets/img/icon_Semi_Finalist.png")%>' />
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
                </div>
</asp:Content>

