<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="activities.aspx.vb" Inherits="CMS_Pages_activities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .btnContact{
            padding:2px;
            font-family:Samim;
            font-size:15px;
            margin:4px;
            width:35px;
            height:35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="TITLE" style="color: Black; font-size: 20px;">
        گزارش ها
    </div>
    <div>
        <asp:Panel ID="PanelAlphabet" runat="server"></asp:Panel>
        <asp:HiddenField ID="HiddenFieldAlphabet" runat="server" />
        <hr />
        <asp:DropDownList ID="cmdContacts" CssClass="btnContact" Width="100%" 
            runat="server" DataSourceID="SDS_Contacts" DataTextField="name" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="SDS_Contacts" runat="server"
            ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
            SelectCommand="SELECT * FROM [tbPhoneBook] WHERE substring(trim(name),1,1)= @name order by name asc">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldAlphabet" Name="name" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <hr />
        <asp:GridView ShowHeader="False" ID="GridView" 
            runat="server" AutoGenerateColumns="False" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>

                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" />
                <asp:BoundField DataField="datetime" HeaderText="datetime" SortExpression="datetime" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </div>
</asp:Content>

