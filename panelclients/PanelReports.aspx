<%@ Page Title="" Language="VB" MasterPageFile="~/panelclients/MasterPanel.master" AutoEventWireup="false" CodeFile="PanelReports.aspx.vb" Inherits="panelclients_PanelReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .GridPager {
            background-color: #d6fcff;
        }

            .GridPager a, .GridPager span {
                display: block;
                height: 30px;
                width: 30px;
                font-weight: bold;
                text-align: center;
                font-size: 20px;
                text-decoration: none;
            }

            .GridPager a {
                background-color: #f5f5f5;
                color: #969696;
                border: 1px solid #969696;
            }

            .GridPager span {
                background-color: #A1DCF2;
                color: #000;
                border: 1px solid #3AC0F2;
            }
    </style>
    <style>
                .divGiveReceipt {
            padding: 4px;
            background-color: #9efffc;
            border: 1px solid gray;
            color: black;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        .cmdCss {
            padding: 10px;
            text-align: center;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            cursor: pointer;
            background-color: orange;
            border: 0;
            font-family: Samim;
            margin-top: 4px;
            margin-bottom: 2px;
            color: white;
            text-shadow: 1px 1px 2px #3a3a3a;
        }

        @media only screen and (max-width: 600px) {
            .cmdCss {
                width: 100%;
            }
        }

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
            font-family: Samim;
            text-align: center;
        }
    </style>
    <style>
        .divSearch {
            padding: 20px;
            background-color: #f1f1f1;
        }

        .divSearchDate {
            direction: ltr;
            flex-direction: row;
            border: 1px solid grey;
            padding: 1px;
            display: flex;
            grid-template-columns: 1fr 1fr;
            grid-gap: 20px;
            margin-left: 4px;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
        }

            .divSearchDate input {
                flex-grow: 2;
                border: none;
                font-size: 20px;
                text-align: center;
                font-family: Samim;
            }

                .divSearchDate input:focus {
                    outline: none;
                }

            .divSearchDate:focus-within {
                outline: 1px solid orange;
            }

            .divSearchDate button {
                cursor: pointer;
                font-family: Samim;
                font-size: 16px;
                border: 0;
                padding: 10px;
                direction: rtl;
                margin: 2px;
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

    <div class="divSearch">
        <div>
            <div class="my-text" style="text-align: right;">
                نام فستیوال را به انگلیسی وارد کنید
            </div>
            <asp:TextBox
                CssClass="my-text" ID="txtSearchFestivalName"
                placeholder="Festival Name"
                Width="100%"
                runat="server"></asp:TextBox>
            <div class="my-text" style="text-align: right;">
                بازه‌ی تاریخ مد نظر را مشخص کنید:
            </div>

        </div>

        <div>


            <div class="divSearchDate">
                <input
                    id="txtDateFrom"
                    placeholder="برای تعیین تاریخ کلیک کنید"
                    name="AnotherDate1" onclick="displayDatePicker('AnotherDate1');" style="width: 100px" />
                <button type="button" onclick="displayDatePicker('AnotherDate1');">تا:</button>
                <asp:HiddenField ID="HiddenFieldFrom" runat="server" />
            </div>
            <div class="divSearchDate">
                <input
                    id="txtDateTo"
                    placeholder="برای تعیین تاریخ کلیک کنید"
                    name="AnotherDate2" onclick="displayDatePicker('AnotherDate2');" style="width: 100px" />
                <button type="button" onclick="displayDatePicker('AnotherDate2');">از:</button>
                <asp:HiddenField ID="HiddenFieldTo" runat="server" />
            </div>
        </div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelNewestUpdated" runat="server">
        <ContentTemplate>

            <asp:Button ID="btnSearch"
                OnClientClick="setDates()"
                CssClass="cmdCss" runat="server" Text="جستجو کن" />

            <asp:HiddenField ID="HiddenField_FilmID" runat="server" />

            <asp:GridView ID="dgNewUpdated" Width="100%" runat="server" EmptyDataRowStyle-CssClass="cssEmpty"
                EnableViewState="False"
                Font-Size="12px" AutoGenerateColumns="False" BackColor="White" BorderColor="#848484"
                DataKeyNames="id"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True">
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

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
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
                    فستیوالی جهت نمایش وجود ندارد.
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

            <script>
                function setDates() {
                    var dates = {
                        "date1": $("#txtDateFrom").val(),
                        "date2": $("#txtDateTo").val(),
                    };
                    document.getElementById('<%= HiddenFieldFrom.ClientID %>').value = dates.date1;
                    document.getElementById('<%= HiddenFieldTo.ClientID %>').value = dates.date2;
                }
            </script>

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

