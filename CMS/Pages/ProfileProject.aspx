<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="ProfileProject.aspx.vb" Inherits="CMS_Pages_ProfileProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="TITLE">لیست پروژه های این کاربر</div>
<div>
 <asp:GridView ID="GV" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="SDS_ALl" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Type" HeaderText="نوع پروژه" SortExpression="Type" />
                <asp:BoundField DataField="NameE" HeaderText="نام اثر" SortExpression="NameF" />
                <asp:TemplateField HeaderText="ایمیل" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Label ID="Label41" runat="server" Text='<%# eval("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Label ID="Lagfbel4" runat="server" Text='<%# getfullname(eval("email")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="وضعیت" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Panel ID="Panel1" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("status")) %>'>
                            <asp:Label ID="Labe2l4" runat="server" Text='<%# getStatus(eval("status")) %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="نماد" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Panel ID="Panel12" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("truth")) %>'>
                            <asp:Label ID="Labe2l14" runat="server" Text='<%# getTrust(eval("truth")) %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="padding: 5px; background-color: Black; color: White;">
                            <a target="_blank" style="color: White;" href='<%# String.Format("projectEdit.aspx?id={0}&email={1}",Eval("id"),Eval("email")) %>'>
                                ویرایش و مشاهده</a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="padding: 5px; background-color: Teal; color: Black;">
                            <a target="_blank" style="color: White;" href='<%# String.Format("submission.aspx?projectid={0}&email={1}",Eval("id"),Eval("email")) %>'>
                                submission</a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton OnCommand="deleteProject" CommandArgument='<%# Eval("id","{0}") %>'
                            ImageUrl="~/files/images/icons/delete.png" OnClientClick="return confirm('sure?')"
                            ID="ImageButton1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_ALl" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            
        SelectCommand="SELECT * FROM [tbl_Projects] where email=@email ORDER BY [ID] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="email" QueryStringField="email" />
            </SelectParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>

