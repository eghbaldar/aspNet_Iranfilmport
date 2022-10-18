<%@ Page Title="" Language="VB" ValidateRequest="false" MasterPageFile="~/CMS/Pages/CMS.master"
    AutoEventWireup="false" CodeFile="editFest.aspx.vb" Inherits="CMS_Pages_editFest" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
    <style type="text/css">
        .style13
        {
            width: 142px;
        }
        .DivCal
        {
            border: 2px solid #76C8E9;
            padding: 10px;
            width: 380px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>

    <div class="TITLE">
        <h4>
            جستجو فستیوال
        </h4>
    </div>

    <div>
        <div>
            <asp:TextBox ID="txtSearchFestival" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="جستجو ..." />
        </div>
        <div>
        <asp:GridView ID="DgSearch" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
            AutoGenerateColumns="False" DataSourceID="SDS_Search" ShowHeader="False" AllowPaging="True"
            DataKeyNames="id">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:Label ID="Labe_l14" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:CheckBox ID="Label141" runat="server" Checked='<%# Eval("flag") %>'></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:Image Width="20" ID="Image1" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("title_fa") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:Label ID="Label121" runat="server" Text='<%# Bind("title_en") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <a style="color: Red;" href='<%# String.Format("EditFestival?id={0}&type=fest", Eval("id")) %>'>
                            ویرایش فستیوال </a><a style="color: black;" href='<%# String.Format("EditFestival?id={0}&type=section", Eval("id")) %>'>
                                بخش ها </a><a style="color: green;" href='<%# String.Format("EditFestival?id={0}&type=dead", Eval("id")) %>'>
                                    ددلاین و فی </a><a target="_blank" style="color: blue;"
                                     href='<%# String.Format("..\..\..\festival\{0}\{1}\{2}", Eval("id"),Eval("title_en").Replace(" ","-"),getLink(Eval("title_fa").Replace("ي", "ی")).Replace(" ","-")) %>'>
                                        مشاهده فستیوال </a>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Image
                            ImageUrl="~/files/images/icons/eye.png" 
                            ID="ImasgeBu0tton1" runat="server" />
                            <div>
                               <asp:Label ID="Lab1el12" runat="server" Text='<%# Eval("counter") %>'></asp:Label>
                            </div>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Image
                            ImageUrl="~/files/images/icons/submitted.png" 
                            ID="Ima0sgeButton1" runat="server" />
                            <div>
                               <asp:Label ID="Labe1l12" runat="server" Text='<%# Eval("submitted") %>'></asp:Label>
                            </div>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton Width="15" OnClientClick="return confirm('توجه بسیار مهم: اگر این فستیوال حذف شود تمامی کاربرانی که از این فستیوال فیلم ارسال کرده اند و همچنین تمامی صورت حساب های متصل به این فستیوال حذف خواهد شد؟ آیــــــــــا مطمئن هستید؟');"
                            ImageUrl="~/files/images/icons/delete.png" CommandArgument='<%# Eval("id") %>'
                            OnCommand="DeleteFestival" ID="ImageButton1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>   
        <asp:SqlDataSource ID="SDS_Search" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="select id,title_en,title_fa,logo,flag,counter
            ,(select COUNT(*) 'submitted' from dbo.tbl_invoice where (payment_code<>'' or payment_code is not null) AND festivalID=f.id) as 'submitted'
             from dbo.tbl_festivals f              where title_en like '%' + @SearchFestival + '%' order by id desc">
                                    <SelectParameters>
                            <asp:ControlParameter ControlID="txtSearchFestival" Type="String" Name="SearchFestival" />
                        </SelectParameters>      
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>  
        </asp:SqlDataSource>             
        </div>
    </div>

    <div class="TITLE">
        <h4>
            فستیوال مشخص
        </h4>
    </div>

    <asp:Button ID="btnList" CssClass="tabBtn" runat="server" Text="لیست فستیوال ها" />

    <asp:Button ID="btnBacktoFest" CssClass="tabBtn" Visible="false"  runat="server" Text="ویرایش همین فستیوال" />
    <asp:Button ID="btnBacktoDeadline" CssClass="tabBtn" Visible="false"  runat="server" Text="ویرایش ددلاین همین فستیوال" />
    <asp:Button ID="btnBacktoSection" CssClass="tabBtn"  Visible="false"  runat="server" Text="ویرایش بخش‌های همین فستیوال" />

    <div runat="server" style="padding: 10px; border: 1px solid #ccc;" id="divList">
        <asp:GridView ID="GV" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
            AutoGenerateColumns="False" DataSourceID="SDS_View" ShowHeader="False" AllowPaging="True"
            DataKeyNames="id">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:Label ID="Labe_l14" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:CheckBox ID="Label141" runat="server" Checked='<%# Eval("flag") %>'></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:Image Width="20" ID="Image1" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("title_fa") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:Label ID="Label121" runat="server" Text='<%# Bind("title_en") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <a style="color: Red;" href='<%# String.Format("EditFestival?id={0}&type=fest", Eval("id")) %>'>
                            ویرایش فستیوال </a><a style="color: black;" href='<%# String.Format("EditFestival?id={0}&type=section", Eval("id")) %>'>
                                بخش ها </a><a style="color: green;" href='<%# String.Format("EditFestival?id={0}&type=dead", Eval("id")) %>'>
                                    ددلاین و فی </a><a target="_blank" style="color: blue;"
                                     href='<%# String.Format("..\..\..\festival\{0}\{1}\{2}", Eval("id"),Eval("title_en").Replace(" ","-"),getLink(Eval("title_fa").Replace("ي", "ی")).Replace(" ","-")) %>'>
                                        مشاهده فستیوال </a>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Image
                            ImageUrl="~/files/images/icons/eye.png" 
                            ID="ImasgeBu0tton1" runat="server" />
                            <div>
                               <asp:Label ID="Lab1el12" runat="server" Text='<%# Eval("counter") %>'></asp:Label>
                            </div>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Image
                            ImageUrl="~/files/images/icons/submitted.png" 
                            ID="Ima0sgeButton1" runat="server" />
                            <div>
                               <asp:Label ID="Labe1l12" runat="server" Text='<%# Eval("submitted") %>'></asp:Label>
                            </div>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton Width="15" OnClientClick="return confirm('توجه بسیار مهم: اگر این فستیوال حذف شود تمامی کاربرانی که از این فستیوال فیلم ارسال کرده اند و همچنین تمامی صورت حساب های متصل به این فستیوال حذف خواهد شد؟ آیــــــــــا مطمئن هستید؟');"
                            ImageUrl="~/files/images/icons/delete.png" CommandArgument='<%# Eval("id") %>'
                            OnCommand="DeleteFestival" ID="ImageButton1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_View" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="select id,title_en,title_fa,logo,flag,counter
            ,(select COUNT(*) 'submitted' from dbo.tbl_invoice where
             (payment_code<>'' or payment_code is not null) AND festivalID=f.id) as 'submitted'
             from dbo.tbl_festivals f order by id desc"
            DeleteCommand="delete from tbl_festivals where id=@id">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <div runat="server" style="padding: 10px; border: 1px solid #ccc;" id="divFestival">
        <asp:Panel ID="Panel" Enabled="false" runat="server">
            <table class="style1">
            <tr>
            <td>وضعیت نمایش:</td>
            <td>
            <asp:RadioButtonList ID="rbEnableDisable" runat="server" CssClass="txtEn">
                            <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                            <asp:ListItem Value="1">فعال</asp:ListItem>
                        </asp:RadioButtonList>
            </td>
            </tr>
                <tr>
                    <td>
                        سطح فستیول:
                    </td>
                    <td>
                        <asp:DropDownList ID="cmd_level" runat="server" CssClass="txtEn">
                            <asp:ListItem Value="1">A+</asp:ListItem>
                            <asp:ListItem Value="2">A</asp:ListItem>
                            <asp:ListItem Value="3">B</asp:ListItem>
                            <asp:ListItem Value="4">C</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        ژانر:
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cmd_genre" runat="server" RepeatColumns="3" CssClass="txtEn">
                            <asp:ListItem Value="1">Animation</asp:ListItem>
                            <asp:ListItem Value="2">Documentary</asp:ListItem>
                            <asp:ListItem Value="3">Experimental</asp:ListItem>
                            <asp:ListItem Value="4">Music Video</asp:ListItem>
                            <asp:ListItem Value="5">Fiction - Live Action - Narrative</asp:ListItem>
                            <asp:ListItem Value="6">Television</asp:ListItem>
                            <asp:ListItem Value="7">Virtual Reality</asp:ListItem>
                            <asp:ListItem Value="8">Advertisement</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td>
                        گونه:
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cmd_shortfeature" runat="server" CssClass="txtEn">
                            <asp:ListItem Value="1">Short</asp:ListItem>
                            <asp:ListItem Value="2">Feature</asp:ListItem>
                            <asp:ListItem Value="3">Both</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        عنوان انگلیسی:
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitleEn" runat="server" Width="393px" CssClass="txtEn"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitleEn"
                            ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        عنوان فارسی:
                    </td>
                    <td>
                        <asp:TextBox CssClass="txtFa" ID="txtTitleFa" runat="server" Width="393px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTitleFa"
                            ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        آدرس:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Width="393px" CssClass="txtEn"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        کشور:
                    </td>
                    <td>
                        <asp:DropDownList ID="cmd_country" runat="server" CssClass="txtEn" DataSourceID="SDS_Country"
                            DataTextField="name_en" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SDS_Country" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                            SelectCommand="SELECT * FROM [tbl_country] ORDER BY [name_en]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        شروع مراسم:
                    </td>
                    <td>
                        <asp:UpdatePanel id="UP" runat="server" UpdateMode="Conditional">
                            <contenttemplate>
                        <div class="DivCal">
                        <%--<asp:Calendar ID="CalStartTakePlace" runat="server"></asp:Calendar>--%>

                                                      <telerik:RadCalendar ID="CalStartTakePlace" 
                         
                        ShowColumnHeaders="true" ShowDayCellToolTips="true" 
                        AutoPostBack="true"
                        EnableMultiSelect="false" EnableKeyboardNavigation="true"
                        Runat="server">
                         <FastNavigationSettings EnableTodayButtonSelection="true">
                    </FastNavigationSettings>
                        </telerik:RadCalendar>

                        <br />
                        <asp:TextBox ID="txtCalStartTakePlace" runat="server" ValidationGroup="1" MaxLength="10"
                            CssClass="txtEn" ReadOnly="True"></asp:TextBox>
                        <span style="color: Red; border: 1px solid #ccc;">MM / DD / YYYY</span>
                        <asp:RegularExpressionValidator ID="regexpDate" runat="server" ControlToValidate="txtCalStartTakePlace"
                            ErrorMessage="فرمت صحیح (09/12/2006) را وارد کنید." ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"
                            ValidationGroup="1"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCalStartTakePlace"
                            ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                        </div>
                    </contenttemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        پایان مراسم:
                    </td>
                    <td>
                        <asp:UpdatePanel id="UP2" runat="server" UpdateMode="Conditional">
                            <contenttemplate>
                        <div class="DivCal">

                         <%--<asp:Calendar ID="CallEndTakePlace" runat="server"></asp:Calendar>--%>
                         <telerik:RadCalendar ID="CallEndTakePlace" 
                         
                        ShowColumnHeaders="true" ShowDayCellToolTips="true" 
                        AutoPostBack="true"
                        EnableMultiSelect="false" EnableKeyboardNavigation="true"
                        Runat="server">
                         <FastNavigationSettings EnableTodayButtonSelection="true">
                    </FastNavigationSettings>
                        </telerik:RadCalendar>

                        <br />
                        <asp:TextBox ID="txtCalEndTakePlace" runat="server" ValidationGroup="2" MaxLength="10"
                            CssClass="txtEn" ReadOnly="True"></asp:TextBox>
                        <span style="color: Red; border: 1px solid #ccc;">MM / DD / YYYY</span>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCalEndTakePlace"
                            ErrorMessage="فرمت صحیح (09/12/2006) را وارد کنید." ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"
                            ValidationGroup="2"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCalEndTakePlace"
                            ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                        </div>
                    </contenttemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        وبسایت:
                    </td>
                    <td>
                        <asp:TextBox CssClass="txtEn" ID="txtWeb" runat="server" Width="247px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtWeb"
                            ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        توضیحات:
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDetail"
                            ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <textarea id="txtDetail" name="content" class="ckeditor" runat="server"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        مشخصات خاص:
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAttribute"
                            ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <textarea id="txtAttribute" name="content" class="ckeditor" runat="server"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        لوگو:
                    </td>
                    <td>
                        <asp:FileUpload ID="FileLogo" runat="server" />
                        <br />
                        <asp:Image ID="imgLogo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        تاریخ اعلان:
                    </td>
                    <td>
                        <asp:UpdatePanel id="UP3" runat="server" UpdateMode="Conditional">
                            <contenttemplate>
                        <div class="DivCal">
                                                      <%--<asp:Calendar ID="CalNotification" runat="server"></asp:Calendar>--%>
                                                      <telerik:RadCalendar ID="CalNotification" 
                         
                        ShowColumnHeaders="true" ShowDayCellToolTips="true" 
                        AutoPostBack="true"
                        EnableMultiSelect="false" EnableKeyboardNavigation="true"
                        Runat="server">
                         <FastNavigationSettings EnableTodayButtonSelection="true">
                    </FastNavigationSettings>
                        </telerik:RadCalendar>
                        <br />
                        <asp:TextBox ID="txtNotification" runat="server" ValidationGroup="3" MaxLength="10"
                            CssClass="txtEn" ReadOnly="True"></asp:TextBox>
                        <span style="color: Red; border: 1px solid #ccc;">MM / DD / YYYY</span>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNotification"
                            ErrorMessage="فرمت صحیح (09/12/2006) را وارد کنید." ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"
                            ValidationGroup="3"></asp:RegularExpressionValidator>
                        </div>
                    </contenttemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        پریمیر:
                    </td>
                    <td>
                        &nbsp;
                        <asp:DropDownList ID="cmd_premiere" runat="server" CssClass="txtEn">
                            <asp:ListItem Value="0">ندارد</asp:ListItem>
                            <asp:ListItem Value="1">World</asp:ListItem>
                            <asp:ListItem Value="2">International</asp:ListItem>
                            <asp:ListItem Value="3">Continental </asp:ListItem>
                            <asp:ListItem Value="4">National</asp:ListItem>
                            <asp:ListItem Value="5">Regional</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        نوع پریمیر:
                    </td>
                    <td>
                        &nbsp;
                        <asp:TextBox CssClass="txtFa" ID="TxtPremeire" runat="server" Width="212px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        زمان شروع فراخوان:
                    </td>
                    <td>
                        <asp:UpdatePanel id="UP4" runat="server" UpdateMode="Conditional">
                            <contenttemplate>
                        <div class="DivCal">
                                                    <%--<asp:Calendar ID="Cal_date_opening" runat="server"></asp:Calendar>--%>
                                                    <telerik:RadCalendar ID="Cal_date_opening" 
                         
                        ShowColumnHeaders="true" ShowDayCellToolTips="true" 
                        AutoPostBack="true"
                        EnableMultiSelect="false" EnableKeyboardNavigation="true"
                        Runat="server">
                         <FastNavigationSettings EnableTodayButtonSelection="true">
                    </FastNavigationSettings>
                        </telerik:RadCalendar>
                        <br />
                        <asp:TextBox ID="txt_date_opening" runat="server" ValidationGroup="9" MaxLength="10"
                            CssClass="txtEn" ReadOnly="True"></asp:TextBox>
                        <span style="color: Red; border: 1px solid #ccc;">MM / DD / YYYY</span>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txt_date_opening"
                            ErrorMessage="فرمت صحیح (09/12/2006) را وارد کنید." ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"
                            ValidationGroup="9"></asp:RegularExpressionValidator>
                        </div>
                    </contenttemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        از این تاریخ به بعد فیلم پذیرفته می شود:
                    </td>
                    <td>
                        <asp:UpdatePanel id="UP5" runat="server" UpdateMode="Conditional">
                            <contenttemplate>
                        <div class="DivCal">
                                                     <%--<asp:Calendar ID="Cal_date_completiondate" runat="server"></asp:Calendar>--%>
                                                     <telerik:RadCalendar ID="Cal_date_completiondate" 
                         
                        ShowColumnHeaders="true" ShowDayCellToolTips="true" 
                        AutoPostBack="true"
                        EnableMultiSelect="false" EnableKeyboardNavigation="true"
                        Runat="server">
                         <FastNavigationSettings EnableTodayButtonSelection="true">
                    </FastNavigationSettings>
                        </telerik:RadCalendar>
                        <br />
                        <asp:TextBox ID="txt_date_completiondate" runat="server" ValidationGroup="10" MaxLength="10"
                            CssClass="txtEn" ReadOnly="True"></asp:TextBox>
                        <span style="color: Red; border: 1px solid #ccc;">MM / DD / YYYY</span>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txt_date_completiondate"
                            ErrorMessage="فرمت صحیح (09/12/2006) را وارد کنید." ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"
                            ValidationGroup="10"></asp:RegularExpressionValidator>
                        </div>
                    </contenttemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        قوانین (می تواند لینک باشد):
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtRules"
                            ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <textarea id="txtRules" name="content" class="ckeditor" runat="server"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        پلتفرم:
                    </td>
                    <td>
                        &nbsp;
                        <asp:DropDownList ID="cmdPlatform" runat="server" CssClass="txtEn">
                            <asp:ListItem Value="1">FilmFreeway</asp:ListItem>
                            <asp:ListItem Value="2">Withoutabox</asp:ListItem>
                            <asp:ListItem Value="3">Reelport </asp:ListItem>
                            <asp:ListItem Value="4">Shortfilmdepot</asp:ListItem>
                            <asp:ListItem Value="5">Clickforfestivals</asp:ListItem>
                            <asp:ListItem Value="6">Festhome</asp:ListItem>
                            <asp:ListItem Value="7">Movibeta</asp:ListItem>
                            <asp:ListItem Value="8">Uptofest</asp:ListItem>
                            <asp:ListItem Value="9">Filmfestivallife</asp:ListItem>
                            <asp:ListItem Value="10">Filmfestplatform</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        راه ثبت نام:
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtSubmitWay"
                            ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <textarea id="txtSubmitWay" name="content" class="ckeditor" runat="server"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        &nbsp;
                        <asp:Button ID="btnUpdate" runat="server" Text="بروزرسانی فستیوال" Height="26px"
                            ValidationGroup="btn" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                        <asp:Label ID="lblNotify" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div runat="server" style="padding: 10px; border: 1px solid #ccc;" id="divSection">
        <table class="style1">
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td class="style13">
                                بخش: (به فارسی تایپ شود)
                            </td>
                            <td>
                                <asp:TextBox CssClass="txtFa" ID="txtSection" runat="server" Style="margin-right: 0px"
                                    Width="252px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button CssClass="txtFa" ID="btnSection" runat="server" Text="درج" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="dgSection" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                        CellPadding="3" DataSourceID="SDS_Section" GridLines="Horizontal" ShowHeader="False"
                        Height="96px" DataKeyNames="id">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                                SortExpression="id" />
                            <asp:BoundField DataField="festivalId" HeaderText="festivalId" SortExpression="festivalId" />
                            <asp:BoundField DataField="section" HeaderText="section" SortExpression="section" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Delete" OnClientClick="return confirm('مطمئن هستید؟');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
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
                    <asp:SqlDataSource ID="SDS_Section" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="SELECT * FROM [tbl_FestivalSections] WHERE ([festivalId] = @festivalId) ORDER BY [id] DESC"
                        UpdateCommand="update [tbl_FestivalSections] 
set section=@section
where id=@id" DeleteCommand="delete from [tbl_FestivalSections]  where id=@id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="festivalId" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="section" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    <div runat="server" style="padding: 10px; border: 1px solid #ccc;" id="divDead">
     <div class="TITLE">
        <h4>
            درج
        </h4>
    </div>
        <table class="style1">
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td>
                                تاریخ ددلاین:
                            </td>
                            <td>
                                
                                <telerik:RadCalendar ID="Calendar" 
                         
                        ShowColumnHeaders="true" ShowDayCellToolTips="true" 
                        AutoPostBack="true"
                        EnableMultiSelect="false" EnableKeyboardNavigation="true"
                        Runat="server">
                         <FastNavigationSettings EnableTodayButtonSelection="true">
                    </FastNavigationSettings>
                        </telerik:RadCalendar>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                بخش فستیوال:
                            </td>
                            <td>
                                <asp:DropDownList CssClass="txtFa" ID="cmdSection" runat="server" DataSourceID="SDS_Section"
                                    DataTextField="section" DataValueField="id">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                مقدار ورودی: (به دلار)
                            </td>
                            <td>
                                <asp:TextBox CssClass="txtFa" ID="txtFee" runat="server" Style="margin-right: 0px"
                                    Width="55px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button CssClass="txtFa" ID="btnDead" runat="server" Text="درج" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                 <div class="TITLE">
        <h4>
            ویرایش
        </h4>
    </div>
    
                                            <asp:UpdatePanel id="UP8" runat="server" UpdateMode="Conditional">
                            <contenttemplate>
                    <asp:GridView ID="dgFee" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                        CellPadding="3" DataKeyNames="id" DataSourceID="SDS_Dead" GridLines="Horizontal"
                        ShowHeader="False" Height="96px" AllowPaging="True">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="section" HeaderText="section" SortExpression="section" ReadOnly="True" />
                            <asp:BoundField DataField="fee" HeaderText="fee" SortExpression="fee" />
                            <asp:TemplateField HeaderText="deadline" SortExpression="deadline">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("deadline") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("deadline") %>'></asp:TextBox>
                               </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="festivalID" HeaderText="festivalID" SortExpression="festivalID" Visible="False" />
                            <asp:BoundField DataField="sectionID" HeaderText="sectionID" SortExpression="sectionID" Visible="False" />
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" 
                                    CommandArgument='<%# Eval("id","{0}") & "|" & Eval("deadline","{0}") & "|" & Eval("fee","{0}") %>'
                                    OnCommand="Edit"
                                    Text="Edit" />
                                </ItemTemplate>
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
                    <asp:SqlDataSource ID="SDS_Dead" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        DeleteCommand="delete from tbl_festivalDeadline where id=@id" SelectCommand="SELECT *,(select section from dbo.tbl_festivalSections where id=d.sectionID) as 'section'
                         FROM [tbl_festivalDeadline] d WHERE ([festivalId] = @festivalId) ORDER BY [id] DESC"
                        UpdateCommand="UPDATE tbl_festivalDeadline SET fee = @fee WHERE (id = @id)">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="festivalId" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="fee" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <div runat="server" id="DivEdit" visible="false" style="padding:10px;border:1px solid blue;font-family:Tahoma;width:300px;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;">


                        <asp:Label ID="lblDeadID" runat="server" Visible="false"></asp:Label>

                         <telerik:RadCalendar ID="CalcDeadEdit" 
                         
                        ShowColumnHeaders="true" ShowDayCellToolTips="true" 
                        AutoPostBack="true"
                        EnableMultiSelect="false" EnableKeyboardNavigation="true"
                        Runat="server">
                         <FastNavigationSettings EnableTodayButtonSelection="true">
                    </FastNavigationSettings>
                        </telerik:RadCalendar>
                        <asp:TextBox ID="txtEditFee" runat="server"></asp:TextBox>
                        <asp:Button ID="btnUpdateDead" runat="server" Text="بروزرسانی" />

                    </div>

                                                                </contenttemplate>
                        </asp:UpdatePanel>

                </td>
            </tr>
        </table>
    </div>
</asp:Content>
