<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="projects.aspx.vb" Inherits="CMS_Pages_projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE">
        اطلاعات کلی پروژه ها
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSstatistical"
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="کل پروژه ها" HeaderText="کل پروژه ها" ReadOnly="True"
                    SortExpression="کل پروژه ها" />
                <asp:BoundField DataField="پروژه های امروز" HeaderText="پروژه های امروز" SortExpression="پروژه های امروز"
                    ReadOnly="True" />
                <asp:BoundField DataField="پروژه های تائید نشده" HeaderText="پروژه های تائید نشده"
                    ReadOnly="True" SortExpression="پروژه های تائید نشده" />
                <asp:BoundField DataField="پروژه های تائید شده" HeaderText="پروژه های تائید شده"
                    ReadOnly="True" SortExpression="پروژه های تائید شده" />
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
        <asp:SqlDataSource ID="SDSstatistical" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [vw_statisticalProjects]"></asp:SqlDataSource>
    </div>
    <div class="TITLE">
        لیست کل پروژه ها
    </div>
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
                        <asp:Panel ID="Paasnel1" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("status")) %>'>
                            <asp:Label ID="Labde2l4" runat="server" Text='<%# getStatus(eval("status")) %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="نماد" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Panel ID="Panel12" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("truth")) %>'>
                            <asp:Label ID="Labe2l42" runat="server" Text='<%# getTrust(eval("truth")) %>'></asp:Label>
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
            SelectCommand="SELECT * FROM [tbl_Projects] ORDER BY [ID] DESC"></asp:SqlDataSource>
    </div>
    <div class="TITLE">
        لیست پروژه های تائید نشده
    </div>
    <div>
        <asp:GridView ID="GV_Not" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="SDSnot" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Type" HeaderText="نوع پروژه" SortExpression="Type" />
                <asp:BoundField DataField="NameE" HeaderText="نام اثر" SortExpression="NameF" />
                <asp:TemplateField HeaderText="وضعیت" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Panel ID="Panel11" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("status")) %>'>
                            <asp:Label ID="Lfabel4" runat="server" Text='<%# getStatus(eval("status")) %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ایمیل" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Label ID="Labgel4" runat="server" Text='<%# eval("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Label ID="Labhel4" runat="server" Text='<%# getfullname(eval("email")) %>'></asp:Label>
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
        <asp:SqlDataSource ID="SDSnot" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_Projects] where status=0 ORDER BY [ID] DESC">
        </asp:SqlDataSource>
    </div>
    <div class="TITLE">
                     لیست پروژه هایی که نماد اعتماد ندارند
    </div>
    <div>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="SDS_NotTruth" ForeColor="#333333" GridLines="None">
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
                        <asp:Panel ID="Pan2el1" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("status")) %>'>
                            <asp:Label ID="L1abe2l4" runat="server" Text='<%# getStatus(eval("status")) %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="نماد" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Panel ID="Pganel1" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("truth")) %>'>
                            <asp:Label ID="Labe32l4" runat="server" Text='<%# getTrust(eval("truth")) %>'></asp:Label>
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
        <asp:SqlDataSource ID="SDS_NotTruth" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_Projects] where truth=0 ORDER BY [ID] DESC"></asp:SqlDataSource>
    </div>
    <div class="TITLE">
        لیست عکس های تائید نشده
    </div>
    <div>
        <asp:GridView ID="gv_not_Photos" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_NotPhotos"
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="NameF" HeaderText="NameF" SortExpression="NameF" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="projectid" HeaderText="projectid" SortExpression="projectid" />
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="NameF" SortExpression="NameF">
                    <ItemTemplate>
                        <div style="padding: 5px; background-color: Teal; color: Black;">
                            <a target="_blank" style="color: White;"
                            href='<%# String.Format("projectEdit.aspx?id={0}&email={1}",Eval("projectid"),Eval("email")) %>'>
                                مشاهده</a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_NotPhotos" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="select p.NameF,p.email,pp.projectid
from dbo.tbl_Projects p,dbo.tbl_Projects_photos pp
where p.ID=pp.ProjectID and pp.status=0"></asp:SqlDataSource>
    </div>
    <div>
    </div>
</asp:Content>
