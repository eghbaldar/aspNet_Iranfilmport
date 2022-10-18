<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="slider.aspx.vb" Inherits="CMS_Pages_slider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 148px;
        }
    </style>
    <style>
        .txtEn
        {
            padding: 5px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            background-color: #E6E67E;
            direction: ltr;
        }
        .txtEn:hover
        {
            background-color: #cbf1f4;
        }
        .txtFa
        {
            padding: 5px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            background-color: #f9f9f9;
            direction: rtl;
        }
        .txtFa:hover
        {
            background-color: #cbf1f4;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        درج اسلایدر</div>
    <div>
        <table class="style1">
            <tr>
                <td class="style13">
                    تصویر<br />
                    اندازه: 1920*1080
                </td>
                <td>
                    <asp:FileUpload ID="FileInsert" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileInsert"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="I"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    متن اصلی
                </td>
                <td>
                    <asp:TextBox CssClass="txtFa" ID="txtMain_Insert" runat="server" Width="501px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMain_Insert"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="I"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    Title to English:</td>
                <td>
                    <asp:TextBox CssClass="txtEn" ID="txtEnMain_Insert" runat="server" 
                        Width="501px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEnMain_Insert"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="I"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    زیرمتن
                </td>
                <td>
                    <asp:TextBox CssClass="txtFa" ID="txtSubText_insert" runat="server" Width="582px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSubText_insert"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="I"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    لینک:<br />
                    ابتدا باید در بلاگ پستی ایجاد شود تا لینک آن در این فیلد کپی شود و یا لینک باید
                    از سایت دیگری برداشته شود.<br />
                    با HTTP وارد کنید.
                </td>
                <td>
                    <asp:TextBox ID="txtLink_Insert" CssClass="txtEn" runat="server" Width="474px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLink_Insert"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="I"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btnInsert" runat="server" Text="درج" ValidationGroup="I" />
                </td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="NotifyInsert" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <hr />
    <div>
        <asp:GridView ID="GV" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#DEDFDE" BorderWidth="1px" CellPadding="4"
            DataKeyNames="ID" DataSourceID="SDS_View" ForeColor="Black" 
            GridLines="Vertical" Width="100%" BorderStyle="None" ShowHeader="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="text" SortExpression="text">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("text") %>'></asp:Label>
                        <br /><br />
                        <asp:Label style="color:blue" ID="Label2" runat="server" Text='<%# Bind("textEn") %>'></asp:Label>
                        <br /><br />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("text") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="visible" HeaderText="visible" SortExpression="visible" />
                <asp:BoundField DataField="date_time" HeaderText="date_time" 
                    SortExpression="date_time" />
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <ItemTemplate>
                        <a style="color: Red;" href='<%# String.Format("slider.aspx?id={0}", Eval("id")) %>'>
                            ویرایش اسلایدر </a>
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
        <asp:SqlDataSource ID="SDS_View" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            DeleteCommand="delete from tbl_slider where id=@id" SelectCommand="SELECT * FROM [tbl_slider] ORDER BY [visible] desc,[date_time] desc"
            UpdateCommand="update tbl_slider
set text=@text,subtext=@subtext,visible=@visible
where id=@id">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="photo" />
                <asp:Parameter Name="text" />
                <asp:Parameter Name="subtext" />
                <asp:Parameter Name="visible" />
                <asp:Parameter Name="link" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <hr />
        <asp:Panel ID="Panel" runat="server" Enabled="false">
            <div>
                <asp:Image ID="imgSlider" runat="server" Width="500"/>
            </div>
            <table class="style1">
                <tr>
                    <td class="style13">
                        تصویر<br />
                        اندازه: 1920*1080
                    </td>
                    <td>
                        <asp:FileUpload ID="FilePhoto" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style13">
                        متن اصلی
                    </td>
                    <td>
                        <asp:TextBox ID="txtUpdateText" CssClass="txtFa" runat="server" Width="501px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtUpdateText"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style13">
                        Title to English :</td>
                    <td>
                        <asp:TextBox ID="txtUpdateTextEn" runat="server" CssClass="txtEn" Width="501px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="txtUpdateText" ErrorMessage="*" ForeColor="Red" 
                            ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style13">
                        زیرمتن
                    </td>
                    <td>
                        <asp:TextBox ID="txtUpdateSubText" CssClass="txtFa" runat="server" 
                            Width="582px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUpdateSubText"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style13">
                        لینک:<br />
                        ابتدا باید در بلاگ پستی ایجاد شود تا لینک آن در این فیلد کپی شود و یا لینک باید
                        از سایت دیگری برداشته شود.<br />
                        با HTTP وارد کنید.
                    </td>
                    <td>
                        <asp:TextBox ID="txtUpdateLink" CssClass="txtEn" runat="server" Width="474px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUpdateLink"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style13">
                        &nbsp;</td>
                    <td>
                        <asp:RadioButtonList ID="cmd_visible" runat="server">
                            <asp:ListItem Value="1">فعال</asp:ListItem>
                            <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="style13">
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="btnUpdate" runat="server" Text="بروزرسانی" 
                            ValidationGroup="2" />
                    </td>
                </tr>
                <tr>
                    <td class="style13">
                        &nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lblNotify" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
