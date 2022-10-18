<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    ValidateRequest="false" CodeFile="addFest.aspx.vb" Inherits="CMS_Pages_addFest" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
    <style>
        .DivCal
        {
            padding: 10px; /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#000000+0,66b7cc+100&0+0,0.65+100 */
            background: -moz-linear-gradient(left, rgba(0,0,0,0) 0%, rgba(102,183,204,0.65) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(left, rgba(0,0,0,0) 0%,rgba(102,183,204,0.65) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to right, rgba(0,0,0,0) 0%,rgba(102,183,204,0.65) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a666b7cc',GradientType=1 ); /* IE6-9 */
        }
        .tb
        {
            width: 100%;
        }        
    </style>
    <style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <div class="TITLE">
        آخرین فستیوال ایجاد شده
    </div>
    <div>
        <asp:GridView ID="GV" runat="server" BackColor="White" BorderColor="#999999" BorderWidth="1px"
            CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="SDS_View"
            ShowHeader="False" BorderStyle="None">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <asp:Image ID="Image1" Width="50" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
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
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("title_en") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <a target="_blank" href='<%# String.Format("..\..\..\festival\{0}", Eval("id")) %>'>
                            آخرین فستیوال ایجاد شده را ببینید و بررسی کنید </a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_View" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="select top 1 id,title_en,title_fa,logo from dbo.tbl_festivals order by id desc">
        </asp:SqlDataSource>
    </div>
        <div class="TITLE">
        ایجاد فستیوال
    </div>
    <div style="color:Red;font-family:titr;text-align:center;padding:5px;font-size:14px;">
    <blink>
    ادمین محترم، پس از درج فستیوال، فستیوال را باید از قسمت ویرایش فعال کنید وگرنه کاربر آن را نخواهد دید.
    </blink>
    </div>
    <div>
        <table class="tb">
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
                        <asp:ListItem Value="1" Selected="True">Short</asp:ListItem>
                        <asp:ListItem Value="2">Feature</asp:ListItem>
                        <asp:ListItem Value="3">Both</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    عنوان انگلیسی:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitleEn"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <div class="DivCal">
                        <asp:UpdatePanel id="UPAuto1" runat="server" UpdateMode="Conditional">
                            <contenttemplate>

                        

                                

                                    <asp:GridView runat="server" ID="dgAutoFa" AutoGenerateColumns="False" 
                                DataSourceID="SDS_AutoFa" CellPadding="4" ForeColor="#333333" GridLines="None" 
                                ShowHeader="False">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                <asp:BoundField DataField="title_fa" HeaderText="title_fa" 
                                SortExpression="title_fa" />
                                <asp:BoundField DataField="title_en" HeaderText="title_en" 
                                SortExpression="title_en" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                           <asp:LinkButton runat="server">
                                           (بروزرسانی این فستیوال بجای درج مجدد)
                                           </asp:LinkButton>
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
                               <asp:TextBox ID="txtTitleEn"  runat="server" Width="393px" CssClass="txtEn" 
                                    AutoPostBack="True"></asp:TextBox> 
                                    <asp:UpdateProgress runat="server">
             <ProgressTemplate>
             در حال بارگزاری ...</ProgressTemplate>
            </asp:UpdateProgress>
                            <asp:SqlDataSource ID="SDS_AutoFa" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
                                SelectCommand="SELECT [title_en], [title_fa]
                                FROM [tbl_festivals] WHERE [title_en] like '%'+ @title_en + '%' ORDER BY [ID] DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtTitleEn" Name="title_en" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </contenttemplate>
                            <triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtTitleEn" EventName="TextChanged" />
                </triggers>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    عنوان فارسی:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTitleFa"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <div class="DivCal">
                        <asp:UpdatePanel id="UPAuto2" runat="server" UpdateMode="Conditional">
                            <contenttemplate>
                <asp:GridView runat="server" ID="dgAutoEn" AutoGenerateColumns="False" 
                                DataSourceID="SDS_AutoEn" CellPadding="4" ForeColor="#333333" GridLines="None" 
                                ShowHeader="False">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                <asp:BoundField DataField="title_fa" HeaderText="title_fa" 
                                SortExpression="title_fa" />
                                <asp:BoundField DataField="title_en" HeaderText="title_en" 
                                SortExpression="title_en" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                           <asp:LinkButton ID="LinkButton1" runat="server">
                                           (بروزرسانی این فستیوال بجای درج مجدد)
                                           </asp:LinkButton>
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
                                <asp:SqlDataSource ID="SDS_AutoEn" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
                                SelectCommand="SELECT [title_en], [title_fa]
                                FROM [tbl_festivals] WHERE [title_fa] like N'%'+ @title_fa + '%' ORDER BY [ID] DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtTitleFa" Name="title_fa" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                    <asp:TextBox CssClass="txtFa"   AutoPostBack="True" ID="txtTitleFa" runat="server" Width="393px"></asp:TextBox>
                                <asp:UpdateProgress runat="server">
             <ProgressTemplate>
             در حال بارگزاری ...</ProgressTemplate>
            </asp:UpdateProgress>
                                            </contenttemplate>
                            <triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtTitleFa" EventName="TextChanged" />
                </triggers>
                        </asp:UpdatePanel>
                    </div>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCalStartTakePlace"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:UpdatePanel id="UP" runat="server" UpdateMode="Conditional">
                        <contenttemplate>
                        <div class="DivCal">

                        <telerik:RadCalendar ID="CalStartTakePlace" 
                         
                        ShowColumnHeaders="true" ShowDayCellToolTips="true" 
                        AutoPostBack="true"
                        EnableMultiSelect="false" EnableKeyboardNavigation="true"
                        Runat="server">
                         <FastNavigationSettings EnableTodayButtonSelection="true">
                    </FastNavigationSettings>
                        </telerik:RadCalendar>

                    <%--<asp:Calendar ID="CalStartTakePlace" runat="server"></asp:Calendar>--%>
                    <asp:TextBox ID="txtCalStartTakePlace" runat="server" ValidationGroup="1" MaxLength="10"
                        CssClass="txtEn" ></asp:TextBox>
                    <span style="color: Red; border: 1px solid #ccc;">MM / DD / YYYY</span>
                    <asp:RegularExpressionValidator ID="regexpDate" runat="server" ControlToValidate="txtCalStartTakePlace"
                        ErrorMessage="فرمت صحیح (09/12/2006) را وارد کنید." ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"
                        ValidationGroup="1"></asp:RegularExpressionValidator>
                        </div>
                    </contenttemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    پایان مراسم:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCalEndTakePlace"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:UpdatePanel id="UP1" runat="server" UpdateMode="Conditional">
                        <contenttemplate>
                        <div class="DivCal">
                                                 <%--<asp:Calendar ID="CalEndTakePlace" runat="server"></asp:Calendar>--%>

                       <telerik:RadCalendar ID="CalEndTakePlace" 
                         
                        ShowColumnHeaders="true" ShowDayCellToolTips="true" 
                        AutoPostBack="true"
                        EnableMultiSelect="false" EnableKeyboardNavigation="true"
                        Runat="server">
                         <FastNavigationSettings EnableTodayButtonSelection="true">
                    </FastNavigationSettings>
                        </telerik:RadCalendar>

                    <asp:TextBox ID="txtCalEndTakePlace" runat="server" ValidationGroup="2" MaxLength="10"
                        CssClass="txtEn"></asp:TextBox>
                    <span style="color: Red; border: 1px solid #ccc;">MM / DD / YYYY</span>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCalEndTakePlace"
                        ErrorMessage="فرمت صحیح (09/12/2006) را وارد کنید." ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"
                        ValidationGroup="2"></asp:RegularExpressionValidator>
                        </div>
                    </contenttemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    وبسایت:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtWeb"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox CssClass="txtEn" ID="txtWeb" runat="server" Width="247px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    توضیحات:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDetail"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    <br />
                </td>
                <td>
                    <textarea id="txtDetail" name="content" class="ckeditor" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    مشخصات خاص:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAttribute"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    <br />
                </td>
                <td>
                    <textarea id="txtAttribute" name="content" class="ckeditor" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    لوگو:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="FileLogo"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:FileUpload ID="FileLogo" runat="server" />
                    &nbsp;عکس باید در ابعاد 150 در 150 پیکسل باشد.
                </td>
            </tr>
            <tr>
                <td>
                    تاریخ اعلان:
                </td>
                <td>
                    <asp:UpdatePanel id="UP2" runat="server" UpdateMode="Conditional">
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

                    <asp:TextBox ID="txtNotification" runat="server" ValidationGroup="3" MaxLength="10"
                        CssClass="txtEn"></asp:TextBox>
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
                    
                    <asp:TextBox ID="txt_date_opening" runat="server" ValidationGroup="9" MaxLength="10"
                        CssClass="txtEn" ></asp:TextBox>
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

                    <asp:TextBox ID="txt_date_completiondate" runat="server" ValidationGroup="10" MaxLength="10"
                        CssClass="txtEn" ></asp:TextBox>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtRules"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    <br />
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtSubmitWay"
                        ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="btn"></asp:RequiredFieldValidator>
                    <br />
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
                    <asp:Button ID="BtnInsert" Font-Names="Samim" runat="server" Text="درج فستیوال" Height="26px"
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
    </div>
</asp:Content>
