<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="posterofcustomer.aspx.vb" Inherits="CMS_Pages_posterofcustomer" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
    <style type="text/css">
        .style13 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE">
        لیست پوسترها
    </div>
    <div>
        <table style="width: 100%; margin-top: 10px; margin-bottom: 10px;">
            <tr>
                <td>
                    <asp:TextBox ID="txtSearchFilmName"
                        placeholder="قسمی از نام فیلم را بصورت فارسی وارد کنید ..."
                        Width="100%"
                        Font-Names="Samim"
                        runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button Font-Names="Samim" Width="100%" ID="btnSearch" runat="server" Text="برو" /></td>
            </tr>
        </table>
    </div>
        <div>
        <asp:GridView ID="DV_Search" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataSourceID="SDS_Search" ForeColor="#333333" GridLines="None" PageSize="5"
            DataKeyNames="id" Width="100%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="photo" SortExpression="photo">
                    <ItemTemplate>
                        <asp:Image ID="Image1" ImageUrl='<%# String.Format("~/files/UploadFiles/PosterOfCustomers/{0}", Eval("photo")) %>'
                            Width="50" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" Visible="False" />
                <asp:BoundField DataField="nameofpage" HeaderText="آدرس صفحه" SortExpression="nameofpage" />
                <asp:TemplateField HeaderText="نام فیلم" SortExpression="nameFa">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("nameFa") & " - " & Eval("nameEn") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="نام کاگردان" SortExpression="directorFa">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("directorFa") & " - " & Eval("directorEn")  %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" Visible="False" />
                <asp:TemplateField ConvertEmptyStringToNull="False" SortExpression="nameEn">
                    <ItemTemplate>
                        <a href='<%# String.Format("posterofcustomer.aspx?id={0}", Eval("id")) %>'>ویرایش</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('sure?');" runat="server"
                            CausesValidation="False" CommandName="Delete" Text="حذف"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Font-Names="Tahoma" Font-Size="10px" BackColor='<%# GetTypeColor(Eval("id") & "|" & "0") %>' CommandArgument='<%# Eval("id") & "|" & "0" %>' OnCommand="SetType" Text="کوتاه" />
                        <asp:Button ID="Button2" runat="server" Font-Names="Tahoma" Font-Size="10px" BackColor='<%# GetTypeColor(Eval("id") & "|" & "1") %>' CommandArgument='<%# Eval("id") & "|" & "1" %>' OnCommand="SetType" Text="بلند" />
                        <asp:Button ID="Button3" runat="server" Font-Names="Tahoma" Font-Size="10px" BackColor='<%# GetTypeColor(Eval("id") & "|" & "2") %>' CommandArgument='<%# Eval("id") & "|" & "2" %>' OnCommand="SetType" Text="فیلمنامه" />
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
        <asp:SqlDataSource ID="SDS_Search" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_PosterOfCustomer] where nameFa like N'%'+@nameFa+'%' "
            DeleteCommand="delete from [tbl_PosterOfCustomer] where id=@id">
            <SelectParameters>
                <asp:QueryStringParameter Type="String" Name="nameFa" QueryStringField="searchName"/>
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div>
        <asp:GridView ID="GV" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataSourceID="SDS" ForeColor="#333333" GridLines="None" PageSize="5"
            DataKeyNames="id" Width="100%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="photo" SortExpression="photo">
                    <ItemTemplate>
                        <asp:Image ID="Image1" ImageUrl='<%# String.Format("~/files/UploadFiles/PosterOfCustomers/{0}", Eval("photo")) %>'
                            Width="50" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" Visible="False" />
                <asp:BoundField DataField="nameofpage" HeaderText="آدرس صفحه" SortExpression="nameofpage" />
                <asp:TemplateField HeaderText="نام فیلم" SortExpression="nameFa">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("nameFa") & " - " & Eval("nameEn") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="نام کاگردان" SortExpression="directorFa">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("directorFa") & " - " & Eval("directorEn")  %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" Visible="False" />
                <asp:TemplateField ConvertEmptyStringToNull="False" SortExpression="nameEn">
                    <ItemTemplate>
                        <a href='<%# String.Format("posterofcustomer.aspx?id={0}",Eval("id")) %>'>ویرایش</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('sure?');" runat="server"
                            CausesValidation="False" CommandName="Delete" Text="حذف"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Font-Names="Tahoma" Font-Size="10px" BackColor='<%# GetTypeColor(Eval("id") & "|" & "0") %>' CommandArgument='<%# Eval("id") & "|" & "0" %>' OnCommand="SetType" Text="کوتاه" />
                        <asp:Button ID="Button2" runat="server" Font-Names="Tahoma" Font-Size="10px" BackColor='<%# GetTypeColor(Eval("id") & "|" & "1") %>' CommandArgument='<%# Eval("id") & "|" & "1" %>' OnCommand="SetType" Text="بلند" />
                        <asp:Button ID="Button3" runat="server" Font-Names="Tahoma" Font-Size="10px" BackColor='<%# GetTypeColor(Eval("id") & "|" & "2") %>' CommandArgument='<%# Eval("id") & "|" & "2" %>' OnCommand="SetType" Text="فیلمنامه" />
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
        <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_PosterOfCustomer] ORDER BY [id] DESC" DeleteCommand="delete from [tbl_PosterOfCustomer] where id=@id">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <div class="TITLE">
        درج پوستر و اطلاعات
    </div>
    <div>
        <asp:Panel ID="Pnl_Insert" runat="server">
            <table class="style1">
                <tr>
                    <td>عنوان صفحه (به هم چسبیده):
                    </td>
                    <td>&nbsp;
                        <asp:TextBox ID="txtPageOfName" CssClass="txtEn" runat="server" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPageOfName"
                            ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>نام کارگردان فارسی:
                    </td>
                    <td>&nbsp;
                        <asp:TextBox ID="txtDirectorFa" CssClass="txtFa" runat="server" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDirectorFa"
                            ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>نام کارگردان انگلیسی:
                    </td>
                    <td>&nbsp;
                        <asp:TextBox ID="txtDirectorEn" CssClass="txtEn" runat="server" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDirectorEn"
                            ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>نام فیلم فارسی:
                    </td>
                    <td>&nbsp;
                        <asp:TextBox ID="txtFilmFa" CssClass="txtFa" runat="server" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFilmFa"
                            ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>نام فیلم انگلیسی:
                    </td>
                    <td>&nbsp;
                        <asp:TextBox ID="txtFilmEn" CssClass="txtEn" runat="server" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFilmEn"
                            ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>کد تریلر از آپارات: <span class="style13"><strong>(دستی وارد نشود)</strong></span></td>
                    <td>
                        <asp:TextBox ID="txtTrailerAparat" runat="server" CssClass="txtEn" Width="60px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>تصویر:
                    </td>
                    <td>&nbsp;
                        <asp:FileUpload ID="FileInsert" runat="server" onchange="checkFileSize()" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FileInsert"
                            ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>متن:
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtText"
                            ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <CKEditor:CKEditorControl ID="txtText" runat="server"></CKEditor:CKEditorControl>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;
                    </td>
                    <td>&nbsp;
                        <asp:Button ID="btnInsert" runat="server" CssClass="tabBtn" Text="ارسال" ValidationGroup="1" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Pnl_Update" runat="server" Visible="false">
            <div class="TITLE">
                بروزرسانی
            </div>
            <div>
                <table class="style1">
                    <tr>
                        <td>عنوان صفحه (به هم چسبیده):
                        </td>
                        <td>&nbsp;
                            <asp:TextBox ID="txtPageofPageUpdate" CssClass="txtEn" runat="server"
                                Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPageofPageUpdate"
                                ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>نام فارسی:
                        </td>
                        <td>&nbsp;
                            <asp:TextBox ID="txtDirectorFaUpdate" CssClass="txtFa" runat="server"
                                Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDirectorFaUpdate"
                                ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>نام انگلیسی:
                        </td>
                        <td>&nbsp;
                            <asp:TextBox ID="txtDirectorEnUpdate" CssClass="txtEn" runat="server"
                                Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtDirectorEnUpdate"
                                ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>نام فیلم فارسی:
                        </td>
                        <td>&nbsp;
                            <asp:TextBox ID="txtFilmFaUpdate" CssClass="txtFa" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtFilmFaUpdate"
                                ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>نام فیلم انگلیسی:
                        </td>
                        <td>&nbsp;
                            <asp:TextBox ID="txtFilmEnUpate" CssClass="txtEn" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtFilmEnUpate"
                                ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>کد تریلر از آپارات: <span class="style13"><strong>(دستی وارد نشود)</strong></span></td>
                        <td>
                            <asp:TextBox ID="txtTrailerAparatUpdate" runat="server" CssClass="txtEn"
                                Width="60px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>تصویر:
                        </td>
                        <td>&nbsp;
                            <asp:Image ID="Image" runat="server" />
                            <asp:FileUpload ID="FileUpdate" runat="server"  onchange="checkFileSize()" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtPageOfName"
                                ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>متن:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtTextUpdate"
                                ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;
                            <CKEditor:CKEditorControl ID="txtTextUpdate" runat="server"></CKEditor:CKEditorControl>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                        </td>
                        <td>&nbsp;
                            <asp:Button ID="btnUpdate" CssClass="tabBtn" runat="server" Text="برورسانی" ValidationGroup="2" />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblNotify" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </asp:Panel>
    </div>


    <script>
        function checkFileSize() {
            var fileUpload = document.getElementById('<%= FileInsert.ClientID %>');
            var file = fileUpload.files[0]; // Get the selected file

            if (file) {
                var fileSize = file.size; // Get the file size in bytes
                var maxSize = 0.5 * 1024 * 1024; // 500 kb (adjust this as needed)

                if (fileSize > maxSize) {
                    swal.fire('File size exceeds the maximum allowed limit (500 kb).');
                    // Clear the file upload control if needed
                    fileUpload.value = '';
                }
            }
        }
</script>
</asp:Content>