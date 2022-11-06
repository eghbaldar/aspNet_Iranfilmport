<%@ Page Title="" Language="VB" ValidateRequest="false" MasterPageFile="~/CMS/Pages/CMS.master"
    AutoEventWireup="false" CodeFile="editArticle.aspx.vb" Inherits="CMS_Pages_editArticle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
    <style>
        .ContextBlink {
            padding: 10px;
            border: 1px solid red;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
            background-color: #FFECEC;
        }

        .sDate {
            padding: 5px;
            text-align: center;
            font-size: 14px;
            background-color: Gray;
            font-style: italic;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .txtT {
            padding: 4px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            text-align: center;
            width: 93px;
            margin-bottom: 0px;
        }
                .DivOptimize{
            padding:10px;
            background-color:red;
            color:white;
        }
    </style>
    <%--Copy in Clipboard--%>
    <script>
        function myFunction() {
            /* Get the text field */
            var copyText = document.getElementById("myInput");

            /* Select the text field */
            copyText.select();
            copyText.setSelectionRange(0, 999999999); /* For mobile devices */

            /* Copy the text inside the text field */
            document.execCommand("copy");

            /* Alert the copied text */
            alert("Copied the text: " + copyText.value);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--    <asp:Button ID="Button1" runat="server" Text="Button" />
    <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>--%>
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <asp:Button ID="btnList" CssClass="tabBtn" runat="server" Text="لیست پست ها" />
    <div runat="server" style="padding: 10px; border: 1px solid #ccc;" id="divList">
        <div class="TITLE">
            <h4>جستجو براساس یک کلمه در عنوان و بدنه پست
            </h4>
        </div>
        <div>
            <div>
                <asp:TextBox CssClass="txtT" ID="txtOneWord" runat="server"></asp:TextBox>
                <asp:Button CssClass="tabBtn" ID="btnOneWord" runat="server" Text="بزن بریم!" />
            </div>
            <div>
                <asp:GridView ID="dgOneWord" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#DEDFDE" BorderWidth="1px" CellPadding="4" DataSourceID="SDS_OneWord"
                    GridLines="Vertical" AllowPaging="True" AllowSorting="True" BorderStyle="None"
                    Font-Size="10px" ForeColor="Black" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="کد" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" />
                        <asp:TemplateField SortExpression="CateCode">
                            <ItemTemplate>
                                <asp:Label ID="Labe2l1" runat="server" Text='<%# GetTextCategory(Eval("CateCode")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="type">
                            <ItemTemplate>
                                <asp:Label ID="Lab3el1" runat="server" Text='<%# GetTextType(Eval("type")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="short_feature">
                            <ItemTemplate>
                                <asp:Label ID="Lab4el1" runat="server" Text='<%# GetTextShortFeature(Eval("short_feature")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="title" SortExpression="title" />
                        <asp:BoundField DataField="Authors" HeaderText="نویسندگان" SortExpression="Authors" />
                        <asp:BoundField DataField="reference" HeaderText="منبع" SortExpression="reference" />
                        <asp:BoundField DataField="admin_code" HeaderText="admin_code" SortExpression="admin_code"
                            Visible="False" />
                        <asp:TemplateField SortExpression="date_time">
                            <ItemTemplate>
                                <asp:Label ID="Lab4el1111s1" runat="server" Text='<%# getDate(Eval("date_time")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="visit" HeaderText="بازدید" SortExpression="visit" />
                        <asp:TemplateField SortExpression="id">
                            <ItemTemplate>
                                <a style="color: Red;" href='<%# String.Format("EditPost?type=article&id={0}", Eval("id")) %>'>ویرایش پست </a><a target="_blank" href='<%# ResolveUrl(String.Format("../../{0}", Eval("id"))) %>'>مشاهده پست </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="visible" HeaderText="visible" SortExpression="visible" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton OnCommand="delete" CommandArgument='<%# Eval("id", "{0}") %>' ImageUrl="~/files/images/icons/delete.png"
                                    OnClientClick="return confirm('sure?')" ID="ImageButton1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" ForeColor="White" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_OneWord" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_articles] WHERE [text] like N'%' + @word + '%' OR [title] like N'%' + @word + '%'">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="word" QueryStringField="word" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="TITLE">
            <h4>جستجو براساس کد پست
            </h4>
        </div>
        <div>
            <asp:TextBox CssClass="txtT" ID="txtCodePost" runat="server"></asp:TextBox>
            <asp:Button CssClass="tabBtn" ID="btnSearchCodePost" runat="server" Text="بزن بریم!" />
        </div>
        <div class="TITLE">
            <h4>پست هایی که در آینده به نمایش در خواهند آمدند و یا غیر فعال هستند
            </h4>
        </div>
        <div>
            <asp:GridView ID="GV_Future" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataSourceID="SDS_Future" GridLines="None" AllowPaging="True" AllowSorting="True" ShowHeader="False"
                Width="100%"
                ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="کد" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Labe2l1" runat="server" Text='<%# GetTextCategory(Eval("CateCode")) %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Lab3el1" runat="server" Text='<%# GetTextType(Eval("type")) %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="L1ab4el1" runat="server" Text='<%# GetTextShortFeature(Eval("short_feature")) %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <div style="/* permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#fefcea+0,f1da36+100; gold+3d */
background: rgb(254,252,234); /* old browsers */
background: -moz-linear-gradient(top, rgba(254,252,234,1) 0%, rgba(241,218,54,1) 100%); /* ff3.6-15 */
background: -webkit-linear-gradient(top, rgba(254,252,234,1) 0%,rgba(241,218,54,1) 100%); /* chrome10-25,safari5.1-6 */
background: linear-gradient(to bottom, rgba(254,252,234,1) 0%,rgba(241,218,54,1) 100%); /* w3c, ie10+, ff16+, chrome26+, opera12+, safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefcea', endColorstr='#f1da36',GradientType=0 ); /* ie6-9 */
                                padding: 8px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 2px dashed #ccc; color: Black;">
                                    <asp:Label ID="La11b4el1" runat="server" Text='<%#Eval("title", "{0}") %>'></asp:Label>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="admin_code" HeaderText="admin_code" SortExpression="admin_code"
                        Visible="False" />
                    <asp:TemplateField SortExpression="date_time">
                        <ItemTemplate>
                            <div style="font-size: 9px;">
                                <div>
                                    <asp:Label ID="Ldasabel2" runat="server" Text='<%# Eval("Authors", "{0}") %>'></asp:Label>
                                </div>
                                <div>
                                    <asp:Label ID="Labsasdel1" runat="server" Text='<%# Eval("reference", "{0}") %>'></asp:Label>
                                </div>
                                <div>
                                    <asp:Label ID="Lab4el1111s1" runat="server" Text='<%# getDate(Eval("date_time")) %>'></asp:Label>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="visit" HeaderText="بازدید" SortExpression="visit" />
                    <asp:TemplateField SortExpression="id">
                        <ItemTemplate>
                            <a style="color: Red;" href='<%# String.Format("EditPost?type=article&id={0}", Eval("id")) %>'>ویرایش پست </a>
                            <br />
                            <a target="_blank" href='<%# ResolveUrl(String.Format("../../{0}", Eval("id"))) %>'>مشاهده پست </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox Checked='<%# Eval("visible", "{0}") %>' Enabled="false" ID="CheckBox1"
                                runat="server" />
                            <asp:ImageButton OnCommand="delete" CommandArgument='<%# Eval("id", "{0}") %>' ImageUrl="~/files/images/icons/delete.png"
                                OnClientClick="return confirm('sure?')" ID="ImageButton1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    پستی برای آینده وجود ندارد.
                </EmptyDataTemplate>
                <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SDS_Future" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT * FROM [tbl_articles] WHERE [date_time] > getdate() OR visible = 0 ORDER BY [date_time] DESC"></asp:SqlDataSource>
        </div>
        <div class="TITLE">
            <h4>پست های به نمایش در آمده
            </h4>
        </div>
        <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" BackColor="White"
            Width="100%"
            Font-Names="Samim" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" DataSourceID="SDS_Article"
            GridLines="Horizontal" AllowPaging="True" AllowSorting="True" BorderStyle="None" ShowHeader="False">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="کد" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Labe2l1" runat="server" Text='<%# GetTextCategory(Eval("CateCode")) %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lab3el1" runat="server" Text='<%# GetTextType(Eval("type")) %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="L1ab4el1" runat="server" Text='<%# GetTextShortFeature(Eval("short_feature")) %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <div style="/* permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#fefcea+0,f1da36+100; gold+3d */
background: rgb(254,252,234); /* old browsers */
background: -moz-linear-gradient(top, rgba(254,252,234,1) 0%, rgba(241,218,54,1) 100%); /* ff3.6-15 */
background: -webkit-linear-gradient(top, rgba(254,252,234,1) 0%,rgba(241,218,54,1) 100%); /* chrome10-25,safari5.1-6 */
background: linear-gradient(to bottom, rgba(254,252,234,1) 0%,rgba(241,218,54,1) 100%); /* w3c, ie10+, ff16+, chrome26+, opera12+, safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefcea', endColorstr='#f1da36',GradientType=0 ); /* ie6-9 */
                                padding: 8px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 2px dashed #ccc; color: Black;">
                                <asp:Label ID="La11b4el1" runat="server" Text='<%# eval("title","{0}") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="admin_code" HeaderText="admin_code" SortExpression="admin_code"
                    Visible="False" />
                <asp:TemplateField SortExpression="date_time">
                    <ItemTemplate>
                        <div style="font-size: 9px;">
                            <div>
                                <asp:Label ID="Ldasabel2" runat="server" Text='<%# Eval("Authors","{0}") %>'></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Labsasdel1" runat="server" Text='<%# Eval("reference","{0}") %>'></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Lab4el1111s1" runat="server" Text='<%# getDate(Eval("date_time")) %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="visit" HeaderText="بازدید" SortExpression="visit" />
                <asp:TemplateField SortExpression="id">
                    <ItemTemplate>
                        <a style="color: Red;" href='<%# String.Format("EditPost?type=article&id={0}", Eval("id")) %>'>ویرایش پست </a>
                        <br />
                        <a target="_blank" href='<%# ResolveUrl(String.Format("../../{0}", Eval("id"))) %>'>مشاهده پست </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox Checked='<%# Eval("visible","{0}") %>' Enabled="false" ID="CheckBox1"
                            runat="server" />
                        <asp:ImageButton OnCommand="delete" CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/files/images/icons/delete.png"
                            OnClientClick="return confirm('sure?')" ID="ImageButton1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" ForeColor="#F7F7F7" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Article" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_articles] WHERE [date_time] <= getdate() ORDER BY [date_time] DESC"></asp:SqlDataSource>
    </div>
    <div runat="server" style="padding: 10px; border: 1px solid #ccc;" id="divFestival">
        <asp:Panel ID="Panel" Enabled="false" runat="server">
            <div class="TITLE">
                <h4>مشاهده پست
                </h4>
            </div>
            <div style="font-size: 30px; text-align: center; padding: 10px; font-family: Samim;">
                <a runat="server" id="linkPost" target="_blank" style="color: Black;">کلیک کنید</a>
            </div>

            <div class="TITLE">
                <h4>تعداد بازدیدها
                </h4>
            </div>
            <div style="font-size: 30px; text-align: center; padding: 10px; font-family: Samim;color:red;">
                <asp:Label ID="lblNumberVistors" runat="server"></asp:Label>
            </div>

            <div class="TITLE">
                <h4>ویرایش
                </h4>
            </div>
            <div>
                <table class="style1">
                    <tr>
                        <td style="text-align: center;">
                            <div class="ContextBlink" style="width: 400px; text-align: center;">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Calendar ID="CalDate" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                            BorderWidth="1px" DayNameFormat="Full" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399"
                                            Height="200px" NextPrevFormat="FullMonth" ShowGridLines="True" Width="220px">
                                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <OtherMonthDayStyle ForeColor="#CC9966" />
                                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                            <SelectorStyle BackColor="#FFCC66" />
                                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                        </asp:Calendar>
                                        <div style="font-family: Titr; color: Red; font-size: 17px; padding: 4px; text-align: center;">
                                            این پست در تاریخ و زمان زیر در سایت به نمایش در می آید.
                                        </div>
                                        <div style="padding: 5px;">
                                            <asp:TextBox ID="txtDate" CssClass="sDate" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div style="padding: 5px;">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox CssClass="txtT" ID="txtSS" runat="server" ValidationGroup="1"></asp:TextBox>:SS
                                                        <br />
                                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtSS"
                                                            ErrorMessage="*" MaximumValue="59" MinimumValue="0" ValidationGroup="1" ForeColor="Red"
                                                            Type="Integer"></asp:RangeValidator>
                                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator9" runat="server"
                                                            ControlToValidate="txtSS" ErrorMessage="*" ValidationGroup="1">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="txtT" ID="txtMM" runat="server" ValidationGroup="1"></asp:TextBox>:MM
                                                        <br />
                                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtMM"
                                                            ErrorMessage="*" MaximumValue="59" MinimumValue="0" ValidationGroup="1" ForeColor="Red"
                                                            Type="Integer"></asp:RangeValidator>
                                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator6" runat="server"
                                                            ControlToValidate="txtMM" ErrorMessage="*" ValidationGroup="1">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="txtT" ID="txtHH" runat="server" ValidationGroup="1"></asp:TextBox>:HH
                                                        <br />
                                                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtHH"
                                                            ErrorMessage="*" MaximumValue="24" MinimumValue="0" ValidationGroup="1" ForeColor="Red"
                                                            Type="Integer"></asp:RangeValidator>
                                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator10" runat="server"
                                                            ControlToValidate="txtHH" ErrorMessage="*" ValidationGroup="1">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            تاریخ با فرمت 24 ساعته وارد شود. بعنوان مثال 9 شب بصورت 21 وارد شود
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="cmdVisible" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">فعال</asp:ListItem>
                                <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="padding: 10px; border: 2px dashed Orange; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">

                                   <div style="padding:5px;font-family:Samim;">
                            دسته‌ی اصلی:
                        </div>
                                <div>
                                    <asp:DropDownList ID="cmd_type" runat="server" CssClass="txtFa">
                                        <asp:ListItem Value="1">نقد و مطالب تحلیلی</asp:ListItem>
                                <asp:ListItem Value="2">مقالات آموزشی فیلم و فیلمنامه</asp:ListItem>
                                <asp:ListItem Value="3">شناخت جشنواره ها</asp:ListItem>
                                <asp:ListItem Value="4">اخبار درگاه فیلم ایران</asp:ListItem>
                                <asp:ListItem Value="5">اخبار داخلی</asp:ListItem>
                                <asp:ListItem Value="6">اخبار بین المللی</asp:ListItem>
                                <asp:ListItem Value="7">فراخوان ها</asp:ListItem>
                                <asp:ListItem Value="8">یادداشت های سردبیر</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                 <div style="padding:5px;font-family:Samim;">
                            دسته‌ی فرعی:
                        </div>
                                <div>
                                    <asp:DropDownList ID="cmd_category" runat="server" CssClass="txtFa" DataSourceID="SDS_Cat"
                                        DataTextField="name" DataValueField="ID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDS_Cat" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                        SelectCommand="SELECT * FROM [tbl_articleCategory] ORDER BY [ID] DESC"></asp:SqlDataSource>
                                </div>
                                  <div style="padding:5px;font-family:Samim;">
                            کوتاه و بلند:
                        </div>
                                <div>
                                    <asp:DropDownList ID="cmd_short_feature" runat="server" CssClass="txtFa">
                                        <asp:ListItem Value="1">کوتاه</asp:ListItem>
                                        <asp:ListItem Value="2">بلند</asp:ListItem>
                                        <asp:ListItem Value="3">هر دو</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                               </div>
                                             

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:TextBox ID="txtTitle" runat="server"
                                placeholder="عنوان..." CssClass="txtFa"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtTitleEn"
                                ErrorMessage="Mandatory Field" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtTitleEn" runat="server"
                                placeholder="Title ..."
                                CssClass="txtEn"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="padding:10px;text-align:center;">
                                <a href="imagesManagement/" style="font-family: Samim; font-size: 20px;" target="_blank">... مدیریت تصاویر... </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <CKEditor:CKEditorControl ID="txtText" runat="server">
                            </CKEditor:CKEditorControl>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtText"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <textarea id="txtLid" name="content" class="ckeditor" runat="server"></textarea>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLid"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtAuthors" runat="server" Width="446px" CssClass="txtFa"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAuthors"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox
                                placeholder="منابع ..."
                                ID="txtReference" runat="server" Width="446px" CssClass="txtFa"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtReference"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgPhoto" runat="server" Width="400" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="color: Red; padding: 3px; font-family: Tahoma;">
                                فایل انتخابی نباید بیش از 110 کیلوبایت باشد.
                            </div>
                                                    <div style="padding:20px;">
                            <span class="DivOptimize"><a style="color:white;" href="http://optimizilla.com/" target="_blank">Optimization (1)</a></span>
                            <span class="DivOptimize"><a style="color:white;" href="https://www.imgonline.com.ua/eng/compress-image-size.php" target="_blank">Optimization (2)</a></span>
                        </div>
                            <br />
                            <div>
                                <div>
                                    <asp:FileUpload ID="FilePhoto" runat="server" />
                                </div>
                                <div>
                                    <asp:CheckBox ID="chkPhoto" Checked="false" Text="حجم بالای 110 را نیز قبول کن" runat="server" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <style>
                                .contextTag {
                                    color: Gray;
                                    padding: 5px;
                                    font-style: italic;
                                    border: 1px solid #c1c1c1;
                                    float: right;
                                    margin: 5px;
                                }
                            </style>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTags"
                                ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div style="border: 1px solid #ccc; padding: 5px;">
                                        <div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_1" runat="server">درگاه فیلم ایران</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_2" runat="server">ارسال فیلم به جشنواره های خارجی</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_3" runat="server">پخش و ارسال فیلم کوتاه</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_4" runat="server">فیلم کوتاه</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_5" runat="server">فیلمکوتاه</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_6" runat="server">ارسال فیلم به فستیوال های بین المللی</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_7" runat="server">فیلمنامه</asp:LinkButton>
                                            </div>
                                            <div class="contextTag">
                                                <asp:LinkButton ID="tag_8" runat="server">حضور بین المللی فیلم</asp:LinkButton>
                                            </div>
                                        </div>
<div>
       <asp:TextBox ID="txtPreTag" CssClass="txtFa" runat="server"></asp:TextBox>
                                                    <asp:Button ID="btnPreTag" runat="server" Text="&gt;&gt;" />
                                                    <div style="color: Red; padding: 3px; font-family: Tahoma;">
                                                        اگر کلمات بصورت تک سیلابی باشد و یا چند سیلابی باشد همانطور که هست وارد شود. بعنوان
                                                        مثلا "سینما" و یا "فیلم کوتاه" بنابراین هیچ علامت دیگری از جمله خط تیره و یا فاصله
                                                        اضافی بین و یا بعدشان نباشد باشد
                                                    </div>
                                                    <asp:ListBox ID="listTags" runat="server" CssClass="txtFa" Width="200px"></asp:ListBox>
                                                    <asp:Button ID="deletelist" runat="server" Text="×" BackColor="Red" ForeColor="White"></asp:Button>
                                                    <asp:Button ID="btnGoTags" runat="server" Text="&gt;&gt;" />
</div>

                                        <div>

                                            نتیجه تگ ها:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                                    ControlToValidate="txtTags" ErrorMessage="الزامی است" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                    &nbsp;<hr />
                                                    <asp:TextBox ID="txtTags" runat="server" CssClass="txtFa" Height="93px"
                                                        TextMode="MultiLine" Enabled="False"></asp:TextBox>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnUpdate" runat="server" Height="36px" Text="ویرایش پست" Width="193px"
                                CssClass="tabBtn" ValidationGroup="1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNotify" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    <div>
    </div>
    <div>
        <button onclick="myFunction()" style="font-family: Tahoma;">
            کپی متن هشدار عدم ویرایش و حذف</button>
        <br />
        <textarea name="w3review" id="myInput" rows="4" cols="50">
خواهش میکنم توجه کنید: پس از تائید خبر و پس از قرار گرفتن در وب سایت رسمی شرکت، اینستاگرام و کانال تلگرامی، به دلیل «جرایم گوگل» و «اینستاگرام» در خصوص ویرایش و حذف پست، به هیچ عنوان پست ویرایش و حذف نخواهد شد.
خواهش میکنم در بررسی خودتون دقت کنید.
سپاس
مدیر روابط عمومی درگاه فیلم ایران
غفاری
</textarea>
    </div>
</asp:Content>
