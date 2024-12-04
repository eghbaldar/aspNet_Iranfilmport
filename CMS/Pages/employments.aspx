<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="employments.aspx.vb" Inherits="CMS_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE" style="text-align: center; color: Black; font-size: 20px;">
        <h4>
            درخواست همکاری
        </h4>
    </div>
    <div>        
<asp:GridView ID="dg" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sds" ForeColor="#333333" GridLines="None" Width="100%">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
        <asp:TemplateField HeaderText="Category" SortExpression="Category">
            <ItemTemplate>
                 <asp:DropDownList Enabled="false"  OnDataBinding="cmd_category_DataBinding" Width="100%" ID="cmd_category"  runat="server"
                                    CssClass="form-control">
                                    <asp:ListItem Value="-1">نوع همکاری را مشخص کنید ...</asp:ListItem>
                                    <asp:ListItem Value="0">فیلمنامه‌نویس</asp:ListItem>
                                    <asp:ListItem Value="1">مترجمی: انگلیسی</asp:ListItem>
                                    <asp:ListItem Value="2">مترجمی: اسپانیایی</asp:ListItem>
                                    <asp:ListItem Value="3">مترجمی: فرانسوی </asp:ListItem>
                                    <asp:ListItem Value="4">تدوینگر حرفه‌ای</asp:ListItem>
                                    <asp:ListItem Value="5">گرافیست با نرم افزار فتوشاپ</asp:ListItem>
                                    <asp:ListItem Value="6">بازاریاب تلفنی (فقط خانم)</asp:ListItem>
                                    <asp:ListItem Value="7">علوم کامپیوتر (دارای مدرک ICDL) با مدرک زبان انگلیسی (حداقل 6 آیلس)</asp:ListItem>
                                    <asp:ListItem Value="8">آشنایی با نرم افزار SubTitle Edit و نرم افزار هایVideo Convertor</asp:ListItem>
                                    <asp:ListItem Value="9">برنامه نویس: ASP.NET FORM & VB.NET  + SQL</asp:ListItem>
                                    <asp:ListItem Value="10">برنامه نویس: ASP.NET CORE & C#  + SQL</asp:ListItem>
                                    <asp:ListItem Value="11">برنامه نویس: Kotlin  + SQL</asp:ListItem>
                                    <asp:ListItem Value="12">برنامه نویس: Windows Forms VB.NET + SQL</asp:ListItem>
                                    <asp:ListItem Value="13">متخصصی SEO و آنالیزور شبکه‌های مجازی</asp:ListItem>
                                    <asp:ListItem Value="14">کارشناس تولید محتوا متنی و ویژوال</asp:ListItem>
                                    <asp:ListItem Value="15">تایپیست دو زبانه</asp:ListItem>
                                    <asp:ListItem Value="16">گزارشگر حضوری</asp:ListItem>
                     </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Resume" SortExpression="Resume">
            <ItemTemplate>
                <div style="padding:10px; background-color:aliceblue;">
                    <a data-Resume='<%# Eval("Resume")%>' onclick="showAlert(this)" style="cursor:pointer;">نمایش رزومه</a>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:CheckBoxField DataField="Read" HeaderText="Read" SortExpression="Read" />
        <asp:TemplateField HeaderText="CreateDate" SortExpression="CreateDate">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# getDate(Eval("CreateDate")) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
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
        <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" SelectCommand="SELECT * FROM [tbl_employment] ORDER BY [CreateDate] DESC"></asp:SqlDataSource>
    </div>
        <script>
            function showAlert(element) {
            var resume = element.getAttribute('data-resume').replaceAll('\n','<br/>');
            Swal.fire({
                title: 'رزومه',
                html: resume,
                icon: 'info',
                confirmButtonColor: '#ff9100',
                confirmButtonText: 'متوجه شدم'
            });
        }
    </script>
</asp:Content>