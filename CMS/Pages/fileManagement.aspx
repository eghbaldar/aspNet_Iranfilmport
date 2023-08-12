<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"      
EnableEventValidation="false"
    CodeFile="fileManagement.aspx.vb" Inherits="CMS_Pages_fileManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>EFiler</title>
    <style type="text/css">
        .style7
        {
            width: 100%;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style8
        {
            font-size: 25pt;
            font-weight: bold;
        }
        .style9
        {
            font-family: Tahoma;
            font-size: 11px;
        }
        .style10
        {
            width: 153px;
        }
        .style1
        {
            width: 264px;
        }
        .style2
        {
            width: 100%;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style5
        {
            width: 29px;
        }
        .style4
        {
            width: 167px;
        }
        .style11
        {
            width: 100%;
        }
        .style6
        {
            width: 34px;
        }
        .style3
        {
            width: 153px;
            text-align: right;
        }
        .style12
        {
            width: 133px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

<%--    <asp:UpdatePanel ID="UP" UpdateMode="Conditional" runat="server"  >
        <contenttemplate>--%>



    <div class="TITLE">
        لیست فولدرهای شاخه: iranfilmport.com/files/uploadFiles/
    </div>
    <div>
        <div style="direction: ltr; font-size: 17px;">
            Current Directory:
            <asp:Label ID="lblCurrentDirectory" runat="server"></asp:Label>
        </div>
        <asp:TreeView ID="ETree" runat="server" ShowLines="True">
            <NodeStyle ImageUrl="~/cms/files/img/Images/Folder.jpg" />
        </asp:TreeView>
        <table class="style7">
            <tr>
                <td class="style10">
                    حجم کل شاخه اصلی:
                </td>
                <td>
                    <asp:Label ID="lbl_SizeSolution" runat="server" Style="font-weight: 700; color: #CC0000"
                        Text="0"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    <span class="style9">شاخه انتخاب شده :</span>
                </td>
                <td>
                    <asp:Label ID="lbl_currentBranch" runat="server" Style="font-family: Tahoma; font-size: 11px;
                        font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    &nbsp;حجم استفاده شده از این پوشه:
                </td>
                <td>
                    <asp:Label ID="lblSizeDirectory" runat="server" Style="font-weight: 700; font-family: Tahoma;
                        font-size: 11px; color: #CC0000">0</asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div class="TITLE">
        ایجاد پوشه
    </div>
    <div>
        <asp:Button ID="btn_createDir" runat="server" Style="font-family: Tahoma; font-size: 11px"
            Text="ایجاد" />
        <asp:TextBox ID="nameDirectory" runat="server" Width="160px"></asp:TextBox>
        &nbsp;:نام پوشه [Directory]</div>
    <div class="TITLE">
        آپلود فایل
    </div>
    <div>
        <div style="direction:ltr;color:red;text-align:center;">
            Virtual Path:
            <asp:Label ID="lblPathForUpload" runat="server"></asp:Label>
            <br />Real Path:
            <asp:Label ID="lblRealPathForUpload" runat="server"></asp:Label>
        </div>
        <br />  <br />
        <asp:Button ID="btn_UpFile" runat="server" Style="font-family: Tahoma; font-size: 11px"
            Text="ارسال" />
        <asp:TextBox ID="txtUploadFileName" placeholder="نام فایل را وارد کنید ** به انتهای این فایل شماره ای یونیک اضافه میشود** " 
            runat="server" Width="50%"></asp:TextBox>
        <asp:FileUpload ID="FileUpload" runat="server" />
        <br />
         <div style="text-align:center;font-size:20px;padding:20px;background-color:darkkhaki;">
             <asp:Label ID="lblAfterUploading" runat="server"></asp:Label>
         </div>
    </div>
    <hr />
    <div>
        :حذف پوشه
        <asp:ImageButton ID="Del_Dir" OnClientClick="return confirm('آیا از حذف این پوشه مطمئن هستید؟');"
            runat="server" ImageUrl="~/cms/files/img/delete.gif" Style="width: 16px" />
        :تغییر نام پوشه
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name_dir"
            ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
        <asp:TextBox ID="name_dir" runat="server" Style="text-align: left; font-family: Tahoma;
            font-size: 11px;" Width="126px"></asp:TextBox>
        <asp:Button ID="btn_update_nameDir" runat="server" Style="font-family: Tahoma; font-size: 11px;
            height: 21px;" Text="اصلاح" ValidationGroup="1" /></div>
    <div class="TITLE">
        لیست فایل های این شاخه
    </div>
    <div>
        <asp:GridView ID="DG" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None"
            BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Style="font-family: Tahoma;
            font-size: 12px" AllowPaging="True">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:TemplateField HeaderText="دانلود">
                    <ItemTemplate>
                        <asp:ImageButton ID="Image112" OnCommand="Download" CommandArgument='<%# Eval("اسم فایل","{0}") %>'
                            runat="server" ImageUrl="~/cms/files/img/download.gif" />
                    </ItemTemplate>
                    <HeaderStyle Font-Names="tahoma" Font-Size="11px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="حذف">
                    <ItemTemplate>
                        <asp:ImageButton ID="Image1" OnCommand="Delete" CommandArgument='<%# Eval("اسم فایل","{0}") %>'
                            OnClientClick="return confirm('آیا از حذف این فایل مطمئن هستید؟');" runat="server"
                            ImageUrl="~/cms/files/img/delete.gif" />
                    </ItemTemplate>
                    <HeaderStyle Font-Names="tahoma" Font-Size="11px" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <EmptyDataTemplate>
                <table class="style7">
                    <tr>
                        <td>
                            Not Exists Files
                        </td>
                        <td style="text-align: right">
                            |
                        </td>
                        <td style="text-align: right">
                            فایلی وجود ندارد
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
    </div>
    <div class="TITLE">
        لیست فایل های بلا استفاده ی کل سایت
        
    </div>
    <div style="font-size:18px;text-align:center;">
    Count of files: <asp:Label ID="lblNotUseFiles" runat="server"></asp:Label>
        <br>
        <br></br>
        ALL Volume of files:<asp:Label ID="lblCountVolumeNotFileUsed" runat="server" 
            Text="0"></asp:Label>
            </br>  </br>
        <asp:Button ID="btnDeleteAllNotUsedFiles" runat="server" Text="Delete all below files" />
    </br>  </br>
    </div>
    <div>
        <asp:GridView ID="DGNotUsedFiles" runat="server" BackColor="White" AllowPaging="true"
            OnPageIndexChanging="DGNotUsedFiles_PageIndexChanging" BorderColor="#999999"
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Style="font-family: Tahoma;
            font-size: 12px" ForeColor="Black" PageSize="20">
            <FooterStyle BackColor="#CCCCCC" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="دانلود">
                    <ItemTemplate>
                        <asp:ImageButton ID="Image112" OnCommand="Download" CommandArgument='<%# Eval("اسم فایل","{0}") %>'
                            runat="server" ImageUrl="~/cms/files/img/download.gif" />
                    </ItemTemplate>
                    <HeaderStyle Font-Names="tahoma" Font-Size="11px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="حذف">
                    <ItemTemplate>
                        <asp:ImageButton ID="Image1" OnCommand="DeleteNotUsedFile" CommandArgument='<%# Eval("اسم فایل","{0}") %>'
                            OnClientClick="return confirm('آیا از حذف این فایل مطمئن هستید؟');" runat="server"
                            ImageUrl="~/cms/files/img/delete.gif" />
                    </ItemTemplate>
                    <HeaderStyle Font-Names="tahoma" Font-Size="11px" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                <table class="style7">
                    <tr>
                        <td>
                            Not Exists Files
                        </td>
                        <td style="text-align: right">
                            |
                        </td>
                        <td style="text-align: right">
                            فایلی وجود ندارد
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </div>

    
<%-- <asp:UpdateProgress runat="server">
             <ProgressTemplate>
             در حال بارگزاری ...</ProgressTemplate>
            </asp:UpdateProgress>
        </contenttemplate>
    </asp:UpdatePanel>--%>

</asp:Content>
