<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="sendinfo.aspx.vb" Inherits="CMS_Pages_sendinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="TITLE">
        اطلاعات
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SDS" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID"  Font-Size="10px"
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" Visible="false" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Num" HeaderText="Num" 
                    SortExpression="Num" />
                <asp:BoundField DataField="How" HeaderText="How" 
                    SortExpression="How" />
                <asp:TemplateField HeaderText="Link" SortExpression="Link">
                    <ItemTemplate>
                    <a href='<%# eval("Link") %>' target="_blank">
                        <asp:Label ID="Label1" runat="server" Text='<%# iif(eval("Link") <> "", "LINK", "") %>'></asp:Label>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="datetime" SortExpression="datetime">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# getdate(eval("datetime")) %>'></asp:Label>
                    </ItemTemplate>
 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="datetime" SortExpression="datetime">
                    <ItemTemplate>
                            <asp:Panel ID="Pan543534el2" runat="server" Style="padding: 5px;" BackColor='<%# IIf(Eval("flag") = "True", System.Drawing.Color.Green, System.Drawing.Color.Red) %>'>

                                <asp:Button ID="But5to3n1" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="SetSeen" Text='<%# IIf(Eval("flag"), "Seen", "Unseen") %>' ForeColor="Green" />

                            </asp:Panel>
                    </ItemTemplate>
 
                </asp:TemplateField>
                <asp:BoundField DataField="flag" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
        <asp:SqlDataSource ID="SDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
            SelectCommand="SELECT * FROM [tbl_SendInformation] order by flag,datetime desc" 
            DeleteCommand="delete from tbl_SendInformation where id=@id" UpdateCommand="update [tbl_SendInformation]
set flag=@flag
where id=@id">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="flag" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

