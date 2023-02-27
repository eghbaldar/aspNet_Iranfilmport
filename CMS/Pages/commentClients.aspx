﻿<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="commentClients.aspx.vb" Inherits="CMS_Pages_commentClients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE">
        <h4>تیکت های مشتریان
        </h4>
    </div>
    <div>
        <div style="padding-top: 10px;">

            <asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
                <asp:View ID="View1" runat="server">

                    <asp:GridView ID="dgComments" runat="server"
                        Font-Size="13px"
                        AutoGenerateColumns="False" DataSourceID="SDS_Comments" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" PageSize="20" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="شماره تیکت" InsertVisible="False" SortExpression="Id">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="آی دی مشتری" InsertVisible="False" SortExpression="Id">
                                <ItemTemplate>
                                    <asp:Label ID="Lab11el3" runat="server" Text='<%# Bind("Id_client") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="L1111abel1" runat="server" Text='<%# GetNameClient(Eval("Id_client")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="بخش" SortExpression="Sections">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="La1b1el4" runat="server" Text='<%# GetSection(Eval("Sections")) %>'></asp:Label>
                                    </div>
                                    <div runat="server" visible='<%#IIf(Eval("Sections") = 0, True, False) %>'
                                        style="direction: ltr; color: gray;">
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
                                        <asp:ImageButton ID="ImageButton1"
                                            ImageUrl="~\files\images\icons\delete.png"
                                            CommandArgument='<%# Eval("Id") %>' OnCommand="DeleteComment"
                                            OnClientClick="return confirm('sure?');"
                                            runat="server" />
                                    </div>
                                    <div>
                                        <asp:Button ID="Button1"
                                            CommandArgument='<%# Eval("Id") & "|" & Eval("flag") & "|" & Eval("Id_client") %>'
                                            OnCommand="Ticket"
                                            CssClass="btn" BorderColor="Green" Font-Names="Samim" runat="server" Text="مشاهده" Width="100%" />
                                    </div>
                                    <hr />
                                    <div>
                                        <asp:Panel runat="server" BackColor='<%# GetReadBackground(Eval("read")) %>' Style="padding: 2px;">
                                            <asp:Button ID="Button2" CommandArgument='<%# Eval("Id") & "|1|1" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="Red" Text="Read" />
                                            <asp:Button ID="Button3" CommandArgument='<%# Eval("Id") & "|1|0" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="Green" Text="unRead" />
                                        </asp:Panel>
                                    </div>
                                    <hr />
                                    <div>
                                        <asp:Button ID="Button4" CommandArgument='<%# Eval("Id") & "|0|1" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="Yellow" Text="Under Consideration" />
                                        <asp:Button ID="Button5" CommandArgument='<%# Eval("Id") & "|0|2" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="Green" Text="Responsed" />
                                        <asp:Button ID="Button6" CommandArgument='<%# Eval("Id") & "|0|3" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="LightGray" Text="Closed" />
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>

                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding: 10px;">
                                تیکتی به ثبت نرسیده است.
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
                        SelectCommand="SELECT * FROM [tbl_Comment_clients] WHERE id_client<>0 and id_parent=0 ORDER BY flag asc,[date] DESC"></asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div id="PnlWarning" class="warning" runat="server" visible="false" style="text-align: center;">
                        <asp:Label ID="lblResult" runat="server" Font-Size="20px"></asp:Label>
                    </div>
                    <hr />
                    <asp:Button ID="btnBacktoTickets" CssClass="tabBtn" runat="server" Text="بازگشت به تیکت ها" />
                    <hr />
                    <div style="padding: 8px; color: white; background-color: darkblue; margin: 5px; font-size: 11px; width: 150px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
                        <span>وضعیت تیکت:
                        </span>
                        <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                    </div>
                    <hr />
                    <asp:DataList ID="DataListResponses" runat="server"
                        Width="100%"
                        DataSourceID="sds_responses">

                        <ItemTemplate>



                            <asp:Panel ID="Panel1" runat="server"
                                BackColor='<%# GetAdminClientBackground(Eval("id_client")) %>'
                                Style="padding: 10px; color: white; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; color: black;">

                                <div style="padding: 15px; border: 2px dotted gray; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
                                    <div style="padding: 5px; background-color: #545454; color: white; font-style: italic; font-size: 12px; width: 150px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; margin-bottom: 10px;">

                                        <asp:Label ID="Id_clientLabel" runat="server" Text='<%# GetWhich(Eval("Id_client")) %>' />

                                    </div>
                                    <div style="padding-right: 15px;">
                                        <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' />
                                    </div>
                                </div>
                                <br />

                                <asp:Label Style="font-size: 12px; color: #a3a3a3;" ID="dateLabel" runat="server" Text='<%# "تاریخ ثبت: " & GetDate(Eval("date")) %>' />


                                <br />
                                <br />

                                <div>
                                    <asp:ImageButton ID="ImageButt2on1"
                                        ImageUrl="~\files\images\icons\delete.png"
                                        CommandArgument='<%# Eval("Id") %>' OnCommand="DeleteCommentEach"
                                        OnClientClick="return confirm('sure?');"
                                        runat="server" />
                                </div>
                            </asp:Panel>

                        </ItemTemplate>

                    </asp:DataList>
                    <asp:SqlDataSource ID="sds_responses" runat="server"
                        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="SELECT * FROM [tbl_Comment_clients] WHERE [Id] = @Id_parent or [Id_parent] = @Id_parent order by [date] desc">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id_parent" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div style="margin-top: 20px;">
                        <div style="font-size: 19px; padding-bottom: 15px;">
                            ارسال کامنت جدید ...
                        </div>
                        <div>
                            <asp:TextBox ID="txtResponse" Font-Names="Samim" Style="padding: 10px; font-size: 15px;" runat="server" TextMode="MultiLine"
                                placeholder="متن خود را وارد کنید ..." Height="250px" Width="100%"></asp:TextBox>
                        </div>
                        <div style="padding-top: 15px;">
                            <asp:Button CssClass="cmdCss" ID="btnResponse" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;" Text="ثبت" />
                            <asp:Button CssClass="cmdCss" ID="btnSendSmsAgain" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;" Text="تکرار ارسال اس ام اس برای این کاربر" />
                        </div>
                    </div>
                </asp:View>

            </asp:MultiView>
        </div>
    </div>
</asp:Content>

