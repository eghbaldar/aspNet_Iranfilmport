<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPanel.master" AutoEventWireup="false"
    CodeFile="PanelMain.aspx.vb" Inherits="PanelMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HiddenField_CustomerID" runat="server" />
    <asp:HiddenField ID="HiddenField_FilmID" runat="server" />
    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="View_Films" runat="server">

            <div class="TitleTitle">
                لیست فیلم های شما
            </div>
            <asp:GridView ID="GridView1" Width="100%" Font-Size="12px" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSourceFilms" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="آیدی فیلم" ItemStyle-HorizontalAlign="Center"
                        InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="film" HeaderText="نام فیلم" ItemStyle-HorizontalAlign="Center"
                        SortExpression="Film" />
                    <asp:BoundField DataField="customerId" HeaderText="customerId" SortExpression="customerId"
                        Visible="False" />
                    <asp:CheckBoxField DataField="archive" HeaderText="archive" SortExpression="archive"
                        Visible="False" />
                    <asp:BoundField DataField="synopsis" HeaderText="synopsis" SortExpression="synopsis"
                        Visible="False" />
                    <asp:BoundField DataField="duration" HeaderText="duration" SortExpression="duration"
                        Visible="False" />
                    <asp:BoundField DataField="strategy" HeaderText="strategy" SortExpression="strategy"
                        Visible="False" />
                    <asp:BoundField HeaderStyle-HorizontalAlign="Right" DataField="count" HeaderText="تعداد ارسال ها" />





                    <asp:TemplateField ConvertEmptyStringToNull="False" ItemStyle-HorizontalAlign="left"
                        SortExpression="ID">
                        <ItemTemplate>
                            <asp:Button ID="Button1" Font-Names="Samim" runat="server" OnCommand="ShowSubmissions"
                                Enabled='<%# EnableProfile() %>'
                                CommandArgument='<%# Eval("id", "{0}") %>' Font-Size="11px" Style="cursor: pointer;"
                                Text="مشاهده فستیوال‌ها" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ConvertEmptyStringToNull="False" ItemStyle-HorizontalAlign="left"
                        HeaderText="استراتژی"
                        HeaderStyle-HorizontalAlign="left"
                        SortExpression="ID">
                        <ItemTemplate>

                            <asp:ImageButton ID="ImageButton1" Width="45px" ImageUrl="~/files/images/icons/panel_strategy.png"
                                OnCommand="ShowStrategyReport"
                                Enabled='<%# EnableProfile() %>'
                                CommandArgument='<%# Eval("id", "{0}") %>'
                                runat="server" />


                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceFilms" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
                SelectCommand="SELECT F.*, (select count(*) from [dbo].[tbSubmission] where id_film=F.id and valid=1 and receipt=2) as 'count' FROM [tbFilms] F WHERE (F.[customerId] = @customerId)">
                <SelectParameters>
                    <asp:RouteParameter Name="customerId" RouteKey="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View_Submissions" runat="server">
            <asp:Button ID="btnBacktoFilms" runat="server" Text="بازگشت »»" Style="font-family: Samim;" />
            <hr />
            <div style="direction: rtl; text-align: right; font-family: Titr; font-size: 15px;">
                بروزترین تغییرات فستیوال‌های ثبت شده
                <asp:Button ID="btnNewUpdated" Visible="false" OnClientClick="return confirm('آیا تمام بروزرسانی‌ها را بررسی کرده اید؟');"
                    runat="server" Text="متوجه تغییرات شدم!" CssClass="btnChanging" />
            </div>
            <div style="direction: rtl; text-align: right; font-size: 10px;">
                در این قسمت، فستیوال‌هایی لیست میشوند که جواب پذیرش، ردی و یا کنسلی آنها توسط ایمیل
                رسمی به شرکت اعلام شده باشد.
            </div>
            <br />
            <div style="overflow-x: scroll; width: 100%;">
                <asp:GridView ID="dgNewUpdated" Width="100%" runat="server" EmptyDataRowStyle-CssClass="cssEmpty"
                    Font-Size="12px" AutoGenerateColumns="False" BackColor="White" BorderColor="#848484"
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SDS_NotNewUpdated">
                    <Columns>
                        <asp:BoundField DataField="id_film" HeaderText="id_film" SortExpression="id_film"
                            Visible="False" />
                        <asp:BoundField DataField="recordnumber" HeaderText="recordnumber" SortExpression="recordnumber"
                            Visible="False" />
                        <asp:BoundField DataField="festival" ItemStyle-HorizontalAlign="Center" HeaderText="Festival"
                            HeaderStyle-HorizontalAlign="Center" SortExpression="festival">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="confirm" ItemStyle-HorizontalAlign="Center" HeaderText="confirm"
                            SortExpression="confirm" Visible="False">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Status of Festival" ItemStyle-HorizontalAlign="Center"
                            SortExpression="accept" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetAccept(Eval("accept")) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="platforms" HeaderText="platforms" SortExpression="platforms"
                            Visible="False" />
                        <asp:BoundField DataField="notification" ItemStyle-HorizontalAlign="Center" HeaderText="Notification"
                            SortExpression="notification">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Fee" ItemStyle-HorizontalAlign="Center" SortExpression="Fee">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFee(Eval("fee")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fee of Festival ($)" ItemStyle-HorizontalAlign="Center"
                            SortExpression="Fee">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFeeValue(Eval("FeeValue")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="website" HeaderText="website" SortExpression="website"
                            Visible="False" />
                        <asp:BoundField DataField="country" ItemStyle-HorizontalAlign="Center" HeaderText="Country"
                            HeaderStyle-HorizontalAlign="Left" SortExpression="country">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="date_of_entryData" HeaderText="date_of_entryData" SortExpression="date_of_entryData"
                            Visible="False" />
                        <asp:BoundField DataField="level" HeaderText="Level" SortExpression="level" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="valid" HeaderText="valid" SortExpression="valid" Visible="False" />

                        <asp:CheckBoxField DataField="ChangeAccept" HeaderText="ChangeAccept" SortExpression="ChangeAccept"
                            Visible="False" />
                                                <asp:BoundField DataField="id" ItemStyle-HorizontalAlign="Center" HeaderText="ID"
                            InsertVisible="False" ReadOnly="True" SortExpression="id">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        فستیوالی بروزرسانی نشده است.
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#848484" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_NotNewUpdated" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
                    SelectCommand="SELECT * FROM [tbSubmission] WHERE ChangeAccept=1
                        and [id_film] = @id_film and valid=1 ORDER BY [date_of_entryData] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField_FilmID" Name="id_film" PropertyName="Value"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <br />
            <div style="direction: rtl; text-align: right; font-family: Titr; font-size: 15px;">
                فستیوال‌های ثبت شده
            </div>
            <div style="direction: rtl; text-align: right; font-size: 10px;">
                در این قسمت، لیست تمامی فستیوال‌هایی را خواهید دید که برای فیلم شما به ثبت رسیده
                است.
            </div>
            <br />
            <div style="overflow-x: scroll; width: 100%;">
                <asp:GridView ID="dgAll" Width="100%" runat="server" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#848484" BorderStyle="None" BorderWidth="1px"
                    Font-Size="12px" CellPadding="4" DataSourceID="SqlDataSource_All">
                    <Columns>
                      
                        <asp:BoundField DataField="id_film" HeaderText="id_film" SortExpression="id_film"
                            Visible="False" />
                        <asp:BoundField DataField="recordnumber" HeaderText="recordnumber" SortExpression="recordnumber"
                            Visible="False" />
                        <asp:BoundField DataField="festival" ItemStyle-HorizontalAlign="Center" HeaderText="Festival"
                            HeaderStyle-HorizontalAlign="Center" SortExpression="festival">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="confirm" ItemStyle-HorizontalAlign="Center" HeaderText="confirm"
                            SortExpression="confirm" Visible="False" />
                        <asp:TemplateField HeaderText="Status of Festival" ItemStyle-HorizontalAlign="Center"
                            SortExpression="accept" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetAccept(Eval("accept")) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="platforms" HeaderText="platforms" SortExpression="platforms"
                            Visible="False" />
                        <asp:BoundField DataField="notification" ItemStyle-HorizontalAlign="Center" HeaderText="Notification"
                            SortExpression="notification" />
                        <asp:TemplateField HeaderText="Fee" ItemStyle-HorizontalAlign="Center" SortExpression="Fee">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFee(Eval("fee")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fee of Festival ($)" ItemStyle-HorizontalAlign="Center"
                            SortExpression="Fee">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFeeValue(Eval("FeeValue")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="website" HeaderText="website" SortExpression="website"
                            Visible="False" />
                        <asp:BoundField DataField="country" ItemStyle-HorizontalAlign="Center" HeaderText="Country"
                            HeaderStyle-HorizontalAlign="Left" SortExpression="country">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="date_of_entryData" HeaderText="date_of_entryData" SortExpression="date_of_entryData"
                            Visible="False" />
                        <asp:BoundField DataField="level" HeaderText="Level" SortExpression="level" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="valid" HeaderText="valid" SortExpression="valid" Visible="False" />

                        <asp:CheckBoxField DataField="ChangeAccept" HeaderText="ChangeAccept" SortExpression="ChangeAccept"
                            Visible="False" />  <asp:BoundField DataField="id" ItemStyle-HorizontalAlign="Center" HeaderText="ID"
                            InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#848484" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource_All" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
                SelectCommand="SELECT * FROM [tbSubmission] WHERE [id_film] = @id_film and valid=1 ORDER BY [date_of_entryData] DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenField_FilmID" Name="id_film" PropertyName="Value"
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
