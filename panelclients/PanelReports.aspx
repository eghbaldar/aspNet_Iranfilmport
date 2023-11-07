<%@ Page Title="" Language="VB" MasterPageFile="~/panelclients/MasterPanel.master" AutoEventWireup="false" CodeFile="PanelReports.aspx.vb" Inherits="panelclients_PanelReports" %>

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

        .my-text {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
        }
    </style>
    <%--JQuery--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <%--Sweet ALert--%>
    <script src="../../../files/sweetalert/sweetalert2.all.min.js"></script>
    <link href="../../../files/sweetalert/sweetalert2.min.css" rel="stylesheet" />
    <script src="../../../files/sweetalert/sweetalert2.min.js"></script>
    <%--Modal--%>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    <link href="<%= ResolveUrl("~/files/plugins/persianCalendar/CSS/calendar.css")%>" rel="stylesheet" type="text/css" />
    <script src="<%= ResolveUrl("~/files/plugins/persianCalendar/JScripts/JsFarsiCalendar.js")%>"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelNewestUpdated" runat="server">

        <ContentTemplate>

            <asp:HiddenField ID="HiddenField_CustomerID" runat="server" />
            <asp:HiddenField ID="HiddenField_FilmID" runat="server" />
            <div class="warning">
                <ul>
                    <li>جهت دانلود فایل آموزشی
                <strong>(تیکت گذاری)</strong>
                        روی لینک زیر کلیک کنید:
                <ul>
                    <li>
                        <a href="http://www.iranfilmport.com/files/uploadFiles/tickets.pdf">www.iranfilmport.com/files/uploadfiles/tickets.pdf
                        </a>
                    </li>
                </ul>

                    </li>



                </ul>
            </div>
            <div class="TitleTitle">
                گزارش گیری
            </div>

            <div>
                <div>
                    <asp:TextBox
                        CssClass="my-text" ID="txtSearchFestivalName"
                        placeholder="نام فستیوال به انگلیسی"
                        Width="100%"
                        runat="server"></asp:TextBox>
                    <img src="../../../files/plugins/persianCalendar/Images/calendar.JPG" onclick="displayDatePicker('AnotherDate1');" />
        <input name="AnotherDate1" onclick="displayDatePicker('AnotherDate1');" style="width: 100px">

                    <img src="../../../files/plugins/persianCalendar/Images/calendar.JPG" onclick="displayDatePicker('AnotherDate2');" />
        <input name="AnotherDate2" onclick="displayDatePicker('AnotherDate2');" style="width: 100px">
                </div>
            </div>

            <asp:GridView ID="dgNewUpdated" Width="100%" runat="server" EmptyDataRowStyle-CssClass="cssEmpty"
                EnableViewState="False"
                Font-Size="12px" AutoGenerateColumns="False" BackColor="White" BorderColor="#848484"
                DataKeyNames="id"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SDS_NotNewUpdated" AllowPaging="True">
                <Columns>

                    <asp:BoundField DataField="id"
                        HeaderText="id_sub"
                        Visible="false" />

                    <asp:TemplateField HeaderText="تاریخ ارسال" ItemStyle-HorizontalAlign="Center" SortExpression="date_of_entryData">
                        <ItemTemplate>
                            <asp:Label ID="Labewaaal1" runat="server" Text='<%# GetDateShamsi(Eval("date_of_entryData")) %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>



                    <asp:BoundField DataField="id_film" HeaderText="id_film" SortExpression="id_film"
                        Visible="False" />
                    <asp:BoundField DataField="recordnumber" HeaderText="recordnumber" SortExpression="recordnumber"
                        Visible="False" />

                    <asp:BoundField DataField="festival" Visible="false" ItemStyle-HorizontalAlign="Center" HeaderText="فستیوال"
                        HeaderStyle-HorizontalAlign="Center" SortExpression="festival">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="confirm" ItemStyle-HorizontalAlign="Center" HeaderText="confirm"
                        SortExpression="confirm" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="وضعیت" Visible="false" ItemStyle-HorizontalAlign="Center"
                        SortExpression="accept" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="Lab1el1" runat="server" Text='<%# GetAccept(Eval("accept")) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="platforms" HeaderText="platforms" SortExpression="platforms"
                        Visible="False" />


                    <asp:TemplateField HeaderText="فستیوال / آخرین وضعیت" ItemStyle-HorizontalAlign="Center" SortExpression="Fee">
                        <ItemTemplate>
                            <asp:Label ID="Lstabel1" Style="font-weight: bold;" runat="server" Text='<%# Eval("festival") %>'></asp:Label>
                            <br />
                            <div class="divAccept">
                                <asp:Label ID="Lastssssbel2" runat="server" Text='<%# GetAccept(Eval("accept")) %>'></asp:Label>
                            </div>

                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="تاریخ احتمالی اعلان" ItemStyle-HorizontalAlign="Center" SortExpression="Fee">
                        <ItemTemplate>
                            <asp:Label ID="Labewal1" runat="server" Text='<%# GetNotification(Eval("notification")) %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="رایگان / پولی" ItemStyle-HorizontalAlign="Center" SortExpression="Fee">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# GetFee(Eval("fee")) %>'></asp:Label>
                            <div runat="server"
                                visible='<%# GetFeeValueBackground(Eval("FeeValue")) %>'
                                style="padding: 5px; background-color: red; color: white; width: 50px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
                                <asp:Label ID="Label2" runat="server" Text='<%# GetFeeValue(Eval("FeeValue")) %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:BoundField DataField="website" HeaderText="website" SortExpression="website"
                        Visible="False" />
                    <asp:BoundField DataField="country" Visible="false" ItemStyle-HorizontalAlign="Center" HeaderText="کشور"
                        HeaderStyle-HorizontalAlign="Left" SortExpression="country">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="date_of_entryData" HeaderText="date_of_entryData" SortExpression="date_of_entryData"
                        Visible="False" />


                    <asp:BoundField DataField="level" Visible="false" HeaderText="گرید" SortExpression="level" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center" />


                    </asp:BoundField>
                    <asp:BoundField DataField="valid" HeaderText="valid" SortExpression="valid" Visible="False" />

                    <asp:CheckBoxField DataField="ChangeAccept" HeaderText="ChangeAccept" SortExpression="ChangeAccept"
                        Visible="False" />

                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblReceipt"
                                Visible="false"
                                Text='<%# Eval("receipt") %>'
                                runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="کشور / گرید" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblReceip1t"
                                Text='<%# Eval("country") %>'
                                runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="La23bel3"
                                Style="font-size: 17px; font-weight: bold; color: blue;"
                                Text='<%# Eval("level") %>'
                                runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>

                                    <div style="text-align: center;">
                                        <asp:Label ID="lblIdSubmission"
                                            Style="color: gray; font-size: 10px;"
                                            Text='<%# Eval("id") %>'
                                            runat="server"></asp:Label>
                                        <br />
                                        <asp:Button ID="btnStatusReceipt"
                                            OnCommand="PublicSetClick" runat="server" Font-Names="Samim"
                                            Width="100%"
                                            Height="100%"
                                            Style="cursor: help"
                                            Text="استعلام رسید" />

                                        <asp:Label ID="lblStatusReceipt"
                                            runat="server"></asp:Label>

                                    </div>

                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server"
                                        AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                            <div style="text-align: center;">
                                                <asp:Image ID="Image1" ImageUrl="~/files/images/icons/loading_inGrid.gif" runat="server" />
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

                <EmptyDataTemplate>
                    فستیوالی بروزرسانی نشده است.
                </EmptyDataTemplate>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#848484" />
                <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
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

            <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanelNewestUpdated" ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div style="position: fixed; text-align: center; height: 100%; justify-content: center; align-items: center; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                        <asp:Image ID="imgUpdateProgress" runat="server"
                            ImageUrl="~/files/images/icons/iranfilmportLoading.gif" AlternateText="Loading ..."
                            CssClass="imgLoading"
                            ToolTip="Loading ..." />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>

    </asp:UpdatePanel>


</asp:Content>

