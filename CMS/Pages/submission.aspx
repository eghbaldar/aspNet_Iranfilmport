<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="submission.aspx.vb" Inherits="CMS_Pages_submission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div stle="padding:10px;" runat="server" id="Panel_Insert">
<div>
درج submission
</div>
<table class="style1">
        <tr>
            <td>
                ایمیل کاربر:</td>
            <td>
                <asp:Label ID="lblemail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                نام:</td>
            <td>
                <asp:Label ID="lblname" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                نام فستیوال:</td>
            <td>
                <asp:TextBox ID="txtfestival" runat="server" Width="327px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
               آی دی فستیوال:</td>
            <td>
                <asp:TextBox ID="txtfestivalID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
               توضیحات:</td>
            <td>
                <asp:TextBox ID="txtDetail" runat="server" Height="87px" TextMode="MultiLine" 
                    Width="513px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnInsert" runat="server" Text="درج" />
                <asp:Label ID="lblwarning" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</div>
<div>
<div>
<div stle="padding:10px;" runat="server" id="Panel_update">
<div>
    ویرایش و تغییر وضعیت ارسال ها
    </div>
    <table class="style1">
        <tr>
            <td>
               وضعیت ارسال:</td>
            <td>
                <asp:DropDownList ID="cmdSendUpdate" runat="server">
                    <asp:ListItem Value="1"> فیلم آماده ارسال است </asp:ListItem>
                    <asp:ListItem Value="2"> فیلم ارسال شده است </asp:ListItem>
                    <asp:ListItem Value="3"> تائیده توسط فستیوال دریافت شده است. </asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                وضعیت افتخار:</td>
            <td>
                <asp:DropDownList ID="cmdAccoladesUpdate" runat="server">
                    <asp:ListItem Value="1"> در حال بررسی توسط فستیوال </asp:ListItem>
                    <asp:ListItem Value="2"> وارد بخش مسابقه شده است </asp:ListItem>
                    <asp:ListItem Value="3"> وارد بخش مسابقه نشده و OUT است </asp:ListItem>
                    <asp:ListItem Value="4"> فیلم وارد مرحله نیمه نهایی شده است </asp:ListItem>
                    <asp:ListItem Value="5"> فیلم وارد مرحله نهایی شده است </asp:ListItem>
                    <asp:ListItem Value="6"> جایزه گرفته است </asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
               توضیحات:</td>
            <td>
                <asp:TextBox ID="txtDetailUpdate" runat="server" Height="87px" TextMode="MultiLine" 
                    Width="513px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="درج وضعیت جدید" />
            </td>
        </tr>
    </table>
    </div>
</div>

    <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SDS" AllowPaging="True" BackColor="#DEBA84" 
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        CellSpacing="2" PageSize="50">
        <Columns>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="projectID" HeaderText="projectID" 
                SortExpression="projectID" />
            <asp:BoundField DataField="festivalName" HeaderText="festivalName" 
                SortExpression="festivalName" />
            <asp:BoundField DataField="festivalID" HeaderText="festivalID" 
                SortExpression="festivalID" />
            <asp:BoundField DataField="send_status" HeaderText="send_status" 
                SortExpression="send_status" />
            <asp:BoundField DataField="accolades_status" HeaderText="accolades_status" 
                SortExpression="accolades_status" />
            <asp:BoundField DataField="detail" HeaderText="detail" 
                SortExpression="detail" />
            <asp:BoundField DataField="send_date" HeaderText="send_date" 
                SortExpression="send_date" />
            <asp:BoundField DataField="regdate" HeaderText="regdate" 
                SortExpression="regdate" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton
                    OnCommand="delete" CommandArgument='<%# Eval("id","{0}") %>'
                    ImageUrl="~/files/images/icons/delete.png"
                    OnClientClick="return confirm('sure?')"
                    ID="ImageButton1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <asp:SqlDataSource ID="SDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
        SelectCommand="exec sp_show_submission_ByID @ID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="projectid" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>
</asp:Content>

