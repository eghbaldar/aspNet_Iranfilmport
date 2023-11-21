<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="apk.aspx.vb" Inherits="CMS_Pages_apk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


        <div class="TITLE" style="color: Black; font-size: 20px;">
        آدرس آخرین ورژن نرم افزار داخلی شرکت
    </div>
    <div>
        <div>
            <asp:GridView ID="GridView1" runat="server" 
                DataSourceID="SqlDataSourceWinApp" BackColor="White" BorderColor="White" 
                BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
                GridLines="None" ShowHeader="False">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:TemplateField HeaderText="winApp" SortExpression="winApp">
                        <ItemTemplate>
                            <a href='<%# Eval("winApp") %>'>

                                <asp:Label ID="Lab131el1" runat="server"
                                    Text="Download Staff's WinApp"></asp:Label>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
 
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceWinApp" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT [winApp] FROM [tbl_setting]" UpdateCommand="UPDATE tbl_setting SET winApp = @winApp">
                <UpdateParameters>
                    <asp:Parameter Name="winApp" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>
    <div class="TITLE" style="color: Black; font-size: 20px;">
        ورژن اندروید کارمندان
    </div>
    <div>
        <div>
            <asp:GridView ID="dgStaff" runat="server" AutoGenerateColumns="true" 
                DataSourceID="SDS_StaffVersion" BackColor="White" BorderColor="White" 
                BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
                GridLines="None" ShowHeader="False">
                <Columns>
                    <asp:TemplateField HeaderText="apkStaff" SortExpression="apkStaff">
                        <ItemTemplate>
                            <a href='<%# String.Format("../../files/uploadFiles/apk/staff/{0}", Eval("apkStaff")) %>'>

                                <asp:Label ID="Label1" runat="server"
                                    Text="Download Staff's APK"></asp:Label>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="apkStaff" SortExpression="apkStaff">
                                            <ItemTemplate>

                            <asp:Label ID="Label12" runat="server"
                                Text='<%# Eval("apkStaff") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SDS_StaffVersion" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT [apkStaff] FROM [tbl_setting]"></asp:SqlDataSource>
        </div>
        <div>
            <div>
                <br />
                <asp:TextBox 
                    style="direction:ltr;"
                    ID="txtStaff" placeholder="Sample: v-2.4.3.apk" runat="server"></asp:TextBox>

            </div>
            <div>
            <asp:FileUpload ID="FileUploadStaffVersion" runat="server" />
            </div>
            <div>
                <asp:Button ID="BtnStaffVersion" runat="server" Text="Upload New Version" />
            </div>
        </div>
    </div>
    <div class="TITLE" style="color: Black; font-size: 20px;">
        ورژن اندروید مشتریان
    </div>
    <div>
        <asp:GridView ID="dgClients" runat="server" AutoGenerateColumns="true" DataSourceID="SDS_ClientVersion" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" ShowHeader="False">
            <Columns>
                <asp:TemplateField HeaderText="apkClients" SortExpression="apkStaff">
                    <ItemTemplate>
                        <a href='<%# String.Format("../../files/uploadFiles/apk/clients/{0}", Eval("apkClients")) %>'>

                            <asp:Label ID="Label1" runat="server"
                                Text="Download Client's APK"></asp:Label>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                                     <asp:TemplateField HeaderText="apkStaff" SortExpression="apkStaff">
                                            <ItemTemplate>

                            <asp:Label ID="Lab1el12" runat="server"
                                Text='<%# Eval("apkClients") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_ClientVersion" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT [apkClients] FROM [tbl_setting]"></asp:SqlDataSource>
    </div>
    <div>
        <div>
                            <br />
                <asp:TextBox 
                    style="direction:ltr;"
                    ID="txtClient" placeholder="Sample: v-2.4.3.apk" runat="server"></asp:TextBox>
        </div>
        <div>
                <asp:FileUpload ID="FileUploadClientVersion" runat="server" />
        </div>
        <div>
            <asp:Button ID="BtnClientsVersion" runat="server" Text="Upload New Version" />
        </div>
        
    </div>
</asp:Content>

