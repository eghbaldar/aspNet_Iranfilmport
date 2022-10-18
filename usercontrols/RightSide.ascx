<%@ Control Language="VB" AutoEventWireup="false" CodeFile="RightSide.ascx.vb" Inherits="usercontrols_Left" %>
                 <div style="text-align:right;direction:rtl;padding:10px;border-right:5px solid #e5da00;">
                    <h3>
                        <span style="font-family: traffic;font-size:20px;">طبقه بندی</span></h3>
                    <div>
                        <asp:GridView ID="gv_count" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_ArticleCatCount"
                            GridLines="None" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="name" SortExpression="name">
                                    <ItemTemplate>
                                        <li><a style="text-decoration: none; font-family: traffic; color: #000;" href='<%# Page.ResolveUrl(String.Format("{2}/{1}/{0}","دسته-محتوایی",  Eval("name").Replace(" ","-").Replace("ي", "ی"),Eval("CateCode"))) %>'>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("name").Replace("ي", "ی") %>'></asp:Label>
                                        </a>(<asp:Label ID="Label2" runat="server" Text='<%# Bind("count") %>'></asp:Label>)</li>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:SqlDataSource ID="SDS_ArticleCatCount" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="SELECT * FROM [vw_articleCatCount]"></asp:SqlDataSource>
             
                 <div style="text-align:right;direction:rtl;padding:8px;border-right:5px solid #48bdc5;">
                    <h3>
                        <span style="font-family: traffic;font-size:20px;">پست‌های پربازدید</span>
                    </h3>
                    <div>
                    
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Popular"
                            GridLines="None" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="name" SortExpression="name">
                                    <ItemTemplate>
                                      <div style="padding:3px;">
                                        <table>
                                        <tr>
                                        <td>
                                        <asp:Image AlternateText='<%# Eval("title") %>' Width="80" Height="50"  
                                        style="-moz-border-radius: 3px;	-webkit-border-radius: 3px;	 border-radius:3px;"
                                        ID="Image1" runat="server" ImageUrl='<%# String.Format("~\files\uploadFiles\article\{0}", Eval("photo")) %>' />
                                        </td>
                                        <td style="text-align:right;padding:3px;"">
                                        <a style="text-decoration: none;color:Black;"
                                        href='<%# ResolveUrl(getLink(Eval("id"),Eval("title")))%>'>
                                            <asp:Label ID="Label1"  style="font-family: traffic;font-size:13px;" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                        </td>
                                        </tr>
                                        </table>
                                      </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SDS_Popular" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                            SelectCommand="SELECT top 7 * FROM [tbl_articles] WHERE ([visible] = @visible) ORDER BY [visit] DESC">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="visible" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>