<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="comment.aspx.vb" Inherits="CMS_Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Button ID="btnList" CssClass="tabBtn" runat="server" Text="لیست کامنت ها" />
    <div runat="server" style="padding: 10px; border: 1px solid #ccc;" id="divList">
        <asp:GridView ID="dgList" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SDS"
            ShowHeader="false" Width="100%"
            GridLines="Horizontal" AllowPaging="True" DataKeyNames="id">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:TemplateField HeaderText="Admin" SortExpression="Admin">
                    <ItemTemplate>
                        <asp:Panel ID="Panel1" runat="server" Style="padding: 5px;" BackColor='<%# IIF(Eval("Admin")="True",System.Drawing.Color.Green,System.Drawing.Color.Red) %>'>
                            <asp:Label ID="Label1" Style="color: White;" runat="server" Text='<%# IIf(Eval("Admin") = "True", "ادمین", "کاربر") %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Id_post" HeaderText="Id_post" SortExpression="Id_post"
                    Visible="False" />
                <asp:BoundField DataField="Id_parent" HeaderText="Id_parent" SortExpression="Id_parent"
                    Visible="False" />
                <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" Visible="False" />


                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <ItemTemplate>
                        <asp:Label ID="L77abel2" runat="server" Text='<%# IIf(Eval("name") = "", "*** A D M I N ***", Eval("name")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:TemplateField HeaderText="Sections" SortExpression="Sections">
                    <ItemTemplate>
                        <asp:Label ID="La97979bel2" runat="server" Text='<%# getSection(Eval("Sections"), Eval("id_post")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Panel ID="Panel3" runat="server">
                            <a href='<%# String.Format("comments?type=comment&id={0}&idPost={1}&Sections={2}&Email={3}&id_parent={4}", Eval("id"), Eval("Id_post"), Eval("sections"), Eval("email"), Eval("id_parent")) %>'>نمایش و پاسخ ادمین </a>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>




                <asp:TemplateField HeaderText="flag" SortExpression="flag">
                    <ItemTemplate>

                        <asp:Panel ID="Panel1112" runat="server" Style="padding: 5px;"
                            BackColor='<%# ReadUnread(Eval("unread_count")) %>'>
                            <span style="color: white">STATUS</span>

                        </asp:Panel>

                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="date" SortExpression="date">
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# getDate(Eval("date")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('آیا مطمئن هستید؟');"
                            CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT c.Id, c.Id_parent, c.id_post, c.[read], c.[date], c.[admin], c.[name], c.[email], COUNT(sub.Id_parent) AS unread_count, c.Sections FROM dbo.tbl_Comment c LEFT JOIN dbo.tbl_Comment sub ON c.Id = sub.Id_parent AND sub.[read] = 0 WHERE c.Id_parent = 0 AND c.id_post != -1 GROUP BY c.Id, c.Id_parent, c.id_post, c.[read], c.[date], c.Sections, c.[admin], c.[name], c.[email] ORDER BY c.[read] ASC, c.[date] DESC;"
            DeleteCommand="delete from tbl_Comment where id=@id">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <div runat="server" style="padding: 10px; border: 1px solid #ccc;" id="divFestival">
        <table class="style1">
            <tr>
                <td>
                    <asp:Label ID="lblText" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCommentAdmin" runat="server" Height="79px" Width="525px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnInsertAdminComment" runat="server" Font-Names="Tahoma" Text="ثبت نظر ادمین برای این کامنت کاربر" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="DataListSubComment" runat="server" BackColor="White" BorderColor="#E7E7FF"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SDS_Sub" GridLines="Horizontal" Width="100%">
                        <AlternatingItemStyle BackColor="#F7F7F7" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <ItemTemplate>
                            <br />
                            نام فرستنده:
                            <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            <br />
                            تاریخ:
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                            <br />
                            متن:
                            <br />
                            <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' />
                            <br />
                            <asp:Button ID="Bu1111111tton3" runat="server" OnCommand="DeleteSubComment"
                                CommandArgument='<%# Eval("id") %>'
                                Text="Delete" OnClientClick="return confirm('sure?');" />
                            <hr />
                            <asp:Panel ID="Pan543534el2" runat="server" Style="padding: 5px;" BackColor='<%# IIf(Eval("flag") = "True", System.Drawing.Color.Green, System.Drawing.Color.Red) %>'>


                                <asp:CheckBox ID="Che22ckBox1" runat="server" Checked='<%# Bind("flag") %>' Enabled="false" />
                                <asp:Button ID="But5to3n1" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="SetEnable"
                                    Text="E" ForeColor="Green" />
                                <asp:Button ID="Bu2tton22" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="SetDsiable"
                                    Text="D" ForeColor="Red" />

                            </asp:Panel>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SDS_Sub" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="
                        if (@Id_parent=0) set @Id_parent=@id
                        SELECT * FROM [tbl_Comment] WHERE  
                        (Id_parent = @Id_parent or id=@Id_parent)
                        ORDER BY [date] ASC
                        ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int64" />
                            <asp:QueryStringParameter Name="Id_parent" QueryStringField="id_parent" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
