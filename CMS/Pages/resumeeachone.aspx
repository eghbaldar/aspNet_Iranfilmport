<%@ Page Language="VB" AutoEventWireup="false" CodeFile="resumeeachone.aspx.vb" Inherits="CMS_Pages_resumeeachone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        @font-face{font-family:Samim;src: url(../../../files/font/Samim-FD.ttf);}
        body{
            direction:rtl;
            font-family:Samim;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                            <div style="direction: rtl; padding: 20px; font-family: Samim; font-size: 20px;">
                    لیست افتخارات این اثر:
                </div>
                <div>
                    <asp:GridView ID="dgAccolades" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceAccolades" ForeColor="#333333" GridLines="None" ShowHeader="False" Width="100%" DataKeyNames="id">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="id_film" HeaderText="id_film" Visible="false" SortExpression="id_film" />
                            <asp:TemplateField HeaderText="fa" SortExpression="fa">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Font-Size="Small" Text='<%# Bind("fa") %>'></asp:Label>
                                    <hr />
                                   <div style="direction:ltr;font-size:13px;">
                                         <asp:Label ID="Label2" runat="server" Text='<%# Bind("en") %>'></asp:Label>
                                   </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>

                                    <a target="_blank" 
                                        style="cursor:pointer;"
                                        onClick="window.open('<%# Eval("id", "resumeEdit/{0}") %>','pagename','resizable,height=600,width=800'); 
                                        return false;">
                                        <img src="..\..\..\files\images\icons\edit.png" />

                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1"
                                        OnClientClick="return confirm('Are you sure?x`');" runat="server" CausesValidation="False" CommandName="Delete">
                                <img src="..\..\..\files\images\icons\delete.png" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <EmptyDataTemplate>
                            <div style="text-align: center; font-family: Samim; color: blue; font-size: 25px;">
                                افتخاری برای این اثر هنوز ثبت نشده است.
                            </div>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceAccolades" runat="server"
                        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
                        SelectCommand="SELECT * FROM [tbl_accolades] WHERE ([id_film] = @id_film)" DeleteCommand="delete from [tbl_accolades] where id=@id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                           <SelectParameters>
                                    <asp:RouteParameter Name="id_film" RouteKey="id_film" Type="Int64" />
                                </SelectParameters>
                    </asp:SqlDataSource>
                </div>
        </div>
    </form>
</body>
</html>
