<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="invoiceMSG.aspx.vb" Inherits="CMS_Pages_invoiceMSG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Button ID="btnBack" CssClass="tabBtn" runat="server" Text="برگشت به لیست" />
    <div class="TITLE">
        ارسال توضیحات بابت رد شدن
    </div>
    <div style="padding: 5px;">
        توجه: این توضیحات پس از ثبت بصورت ایمیل و بصورت سیستمی برای کاربر ارسال خواهد شد.
        <br />
        توجه: اگر میخواهید مقدار پولی را برگشت بزنید ابتدا برگشت بزنید و سپس درتوضیحات در خصوص این برگشت توضیح دهید.
    </div>
    <div id="Div1" runat="server" style="padding: 10px; border: 1px solid #ccc;">
        <asp:GridView ID="dg" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SDS">
            <Columns>
                <asp:BoundField DataField="detail" HeaderText="توضیحات خود را در جهت علت رد درخواست وارد کنید"
                    SortExpression="detail" />
                <asp:CommandField CancelText="لغو" EditText="باز شدن کادر ویرایش" ShowEditButton="True"
                    UpdateText="بروزرسانی" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT [detail] FROM [tbl_invoice] WHERE ([ID] = @ID)" UpdateCommand="update tbl_invoice
set detail=@detail
where id=@id">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="invoiceID" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="detail" />
                <asp:QueryStringParameter Name="id" QueryStringField="invoiceID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div class="TITLE">
        مشخص شدن وضعیت مالی این درخواست
    </div>
    <div>
           <table class="style1">
            <tr>
                <td>
                    ارزش مالی این درخواست که کاربر پرداخت کرده است:</td>
                <td>
                    <asp:Label ID="lblPrePrice" style="font-size:20px;font-family:Samim;" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    مقدار پولی که میخواهید به حساب کاربر برگردد (به تومان):</td>
                <td>
                    <asp:TextBox ID="txtNewPrice" CssClass="txtEn" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCurrent" style="color:Red;font-family:Samim;font-size:14px;" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnBackPrice" CssClass="tabBtn" runat="server" Text="برگشت بخورد" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
