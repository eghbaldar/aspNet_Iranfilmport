<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="calendar.aspx.vb" Inherits="CMS_Pages_calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../content/calendar/CSS/calendar.css" rel="stylesheet" />
                <script src="../content/calendar/JScripts/JsFarsiCalendar.js"></script>
    <style>
        .cmd{
            width:100%;
            padding:10px;
            font-family:Samim;
            text-align:center;
            background-color:lightblue;
        }
        * {
  box-sizing:border-box;  
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE" style="color: Black; font-size: 20px;">
        تقویم خبرها
    </div>
     <div style="text-align:center;font-size:25px;background-color:darksalmon;font-family:Samim;
padding:3%;">
        <a href="https://drive.google.com/drive/u/1/folders/1uJutv0vjInWQULYash-ZRD295flLvcZ8" target="_blank">
            دریافت متریال اخبار - لینک گوگل درایو
        </a>
    </div>
<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
                <table style="width:100%;">
        <tr>
            <td>
                <asp:DropDownList ID="cmdDays" CssClass="cmd" runat="server" AutoPostBack="True"></asp:DropDownList></td>
            <td><asp:DropDownList  CssClass="cmd" ID="cmdMonths" runat="server" AutoPostBack="True">
                <asp:ListItem Value="1">فروردین</asp:ListItem>
                <asp:ListItem Value="2">اردیبهشت</asp:ListItem>
                <asp:ListItem Value="3">خرداد</asp:ListItem>
                <asp:ListItem Value="4">تیر</asp:ListItem>
                <asp:ListItem Value="5">مرداد</asp:ListItem>
                <asp:ListItem Value="6">شهریور</asp:ListItem>
                <asp:ListItem Value="7">مهر</asp:ListItem>
                <asp:ListItem Value="8">آبان</asp:ListItem>
                <asp:ListItem Value="9">آذر</asp:ListItem>
                <asp:ListItem Value="10">دی</asp:ListItem>
                <asp:ListItem Value="11">بهمن</asp:ListItem>
                <asp:ListItem Value="12">اسفند</asp:ListItem>
                </asp:DropDownList></td>
            <td><asp:DropDownList  CssClass="cmd" ID="cmdyears" runat="server" AutoPostBack="True"></asp:DropDownList></td>
        </tr>
    </table>
    <asp:Button ID="btnGoToDate" style="background-color:aquamarine;width:100%;font-family:Samim;border:0;padding:15px;" runat="server" Text="نمایش این تاریخ" />
    <div>
        <div>
            <asp:Label ID="lblShamsiToMiladi" runat="server" Text="Label"></asp:Label>
        </div>
</div>

    <div>
        <asp:GridView Width="100%" style="font-family:Samim;font-size:20px;" ID="dgCalendar" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" Visible="False" />
                <asp:TemplateField HeaderText="date" SortExpression="date">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# GetShamsiHtml(Eval("date")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="note" HeaderText="note" SortExpression="note" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="dddd"
                            OnCommand="DeleteCal"
                            OnClientClick="return confirm('sure?');"
                            CommandArgument='<%# Eval("id", "{0}") %>'
                            runat="server" Text="DELETE IT" />
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="SqlDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" 
            SelectCommand="SELECT * FROM [tbCalendar] WHERE (CONVERT(date, [date]) = @date) ORDER BY [date] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblShamsiToMiladi" Name="date" PropertyName="Text" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

                        <div runat="server" id="pnlAdd" visible="false" style="border:5px dotted #ccc;margin:10px;">
                <div>
                    <asp:TextBox ID="txtAdd" style="font-family:Samim;font-size:15px;margin-bottom:5px;
padding:10px;width:100%;
" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Button ID="btnAdd" runat="server" style="background-color:palevioletred;width:100%;font-family:Samim;border:0;padding:15px;"  Text="اضافه شود" />
                </div>
            </div>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    Loading....
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>

