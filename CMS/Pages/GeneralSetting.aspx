<%@ Page Title="" Language="VB" ValidateRequest="false" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="GeneralSetting.aspx.vb" Inherits="CMS_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="TITLE">
        <h4>
            وضعیت ثبت نام در وب سایت
        </h4>
    </div>
    <div>
        <asp:GridView ID="dgRegister" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellPadding="3" CellSpacing="1" DataSourceID="SDS_Register" GridLines="None">
            <Columns>
                <asp:CheckBoxField DataField="StatusOfRegister" 
                    HeaderText="وضعیت ثبت نام در وب سایت" SortExpression="StatusOfRegister" />
                <asp:CommandField ShowEditButton="True" />
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
        <asp:SqlDataSource ID="SDS_Register" runat="server" 
            ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
            SelectCommand="SELECT [StatusOfRegister] FROM [tbl_setting]" UpdateCommand="update tbl_setting
set StatusOfRegister=@StatusOfRegister">
            <UpdateParameters>
                <asp:Parameter Name="StatusOfRegister" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
     <div class="TITLE">
        <h4>
            نمایش ورژن و یا پیام صفحه ورودی فیلمسازان
        </h4>
    </div>
    <div>
    <div style="direction:ltr;text-align:left;">
    Please, before any manipulated, copy and keep the below sample!
    <br />
    <a href="http://iranfilmport.com/panel" target="_blank">Open the url of panel</a>
    </div>
        <asp:TextBox ID="txtVersion" style="direction:ltr;text-align:left;" runat="server" Height="200px" TextMode="MultiLine" 
            Width="100%"></asp:TextBox>
        <asp:Button ID="btnUpdateVersion" runat="server" Text="Update" />
        </div>
</asp:Content>

