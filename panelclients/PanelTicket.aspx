<%@ Page Title="" Language="VB" MasterPageFile="~/panelclients/MasterPanel.master" AutoEventWireup="false" CodeFile="PanelTicket.aspx.vb" Inherits="PanelTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .warning {
            padding: 10px;
            background-color: #f2fff6;
            border: 1px solid #8affab;
            border-radius: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
            color: #2f8f4d;
            font-size: 12px;
        }

        .btn {
            font-family: Samim;
            font-size: 13px;
            padding: 1px;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="warning">
        <ul>
            <li>توجه فرمائید تنها با گذاشتن تیکت می‌توانید مواردی چون
        «پیشنهادات فستیوالی»
        ،
        «پیگیری جواب فستیوال‌ها»
        ،
        «ابهامات و سوالات متفرقه»
        و
        «ارتباط با مدیریت»
        را پیگیری کنید.
            </li>
            <li>به موارد فوق و یا پرسش هایی از این قبیل
        <strong>به هیچ عنوان</strong>
                از طریق تماس تلفنی و یا شبکه های مجازی پاسخ داده نخواهد شد.
            </li>
            <li>اهمیت استفاده از «تیکت» پیگیری توسط مدیریت شرکت، ماندگاری پیام‌ها و پاسخگویی سریع می‌باشد.
            </li>
            <li>تیکت‌ها در بازه‌ی 6 ساعت تا 12 ساعت پاسخ داده خواهند شد.
            </li>
        </ul>
    </div>
    <div style="padding-bottom: 10px;">
        <asp:Button CssClass="cmdCss" ID="btnNewTicket" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;"
            Text="تیکت جدید ..." />
    </div>
    <div class="TitleTitle">
        تیکت‌های شما
    </div>
    <div style="padding-top: 10px;">

        <asp:GridView ID="dgComments" runat="server"
            Font-Size="13px"
            AutoGenerateColumns="False" DataSourceID="SDS_Comments" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" PageSize="20" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="شماره تیکت" InsertVisible="False" SortExpression="Id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="بخش" SortExpression="Sections">
                    <ItemTemplate>
                        <div>
                            <asp:Label ID="La1b1el4" runat="server" Text='<%# GetSection(Eval("Sections")) %>'></asp:Label>
                        </div>
                        <div runat="server" visible='<%#IIf(Eval("Sections") = 0, True, False) %>'
                            style="direction:ltr;color:gray;">
                            <asp:Label ID="L1ab3el2" runat="server" Text='<%# GetFilmFestival(Eval("id_submission")) %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="وضعیت" SortExpression="read">
                    <ItemTemplate>

                        <asp:Panel
                            Style="padding: 10px; color: white; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                            ID="Panel1" runat="server" BackColor='<%# GetFlagBackground(Eval("flag")) %>'>
                            <asp:Label ID="Label4" runat="server" Text='<%# GetFlag(Eval("flag")) %>'></asp:Label>
                        </asp:Panel>

                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ درج تیکت" SortExpression="date">
                    <ItemTemplate>
                        <div>
                            <asp:Label ID="Lab1el4" runat="server" Text='<%# GetDate(Eval("date")) %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="" SortExpression="date">
                    <ItemTemplate>
                        <div>
                            <asp:Button ID="Button1"
                                CommandArgument='<%# Eval("Id") & "|" & Eval("flag") %>'
                                OnCommand="Ticket"
                                CssClass="btn" runat="server" Text="مشاهده" Width="100%" />
                        </div>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" />
                </asp:TemplateField>

            </Columns>
            <EmptyDataTemplate>
                <div style="padding: 10px;">
                    تیکتی به ثبت نرسیده است.
                    <br />
                    جهت ایجاد تیکت از دکمه‌ی «تیکت جدید» اقدام کنید.
                </div>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Comments" runat="server"
            ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_Comment_clients] WHERE ([Id_client] = @Id_client) 
            and id_parent=0 ORDER BY flag asc,[date] DESC">
            <SelectParameters>
                <asp:RouteParameter Name="Id_client" RouteKey="id" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

