<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPanel.master" AutoEventWireup="false"
    CodeFile="PanelMain.aspx.vb" Inherits="PanelMain" %>

<%@ Register Src="usercontrols/ClientEmailModal.ascx" TagName="ClientEmailModal" TagPrefix="uc1" %>

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
        .receipt {
            padding: 10px;
            background-color: #fff4cf;
            border: 1px solid #f5cb42;
            border-radius: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
            color: #bd9100;
            font-size: 12px;
        }
        .divGiveReceipt{
            padding:4px;
            background-color:#9efffc;
            border:1px solid gray;
            color:black;
            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius:5px;
        }
        .divAccept{
            padding:3px;
            background-color:#ffe873;
            color:red;
            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius:5px;
            margin:2px;
        }
    </style>
    <style>
        .GridPager{
            background-color:#d6fcff;
        }
           .GridPager a, .GridPager span
    {
        display: block;
        height: 30px;
        width: 30px;
        font-weight: bold;
        text-align: center;
        font-size:20px;
        text-decoration: none;        
    }
    .GridPager a
    {
        background-color: #f5f5f5;
        color: #969696;
        border: 1px solid #969696;
    }
    .GridPager span
    {
        background-color: #A1DCF2;
        color: #000;
        border: 1px solid #3AC0F2;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:ClientEmailModal ID="ClientEmailModal" runat="server" Visible="false" />
    <asp:HiddenField ID="HiddenField_CustomerID" runat="server" />
    <asp:HiddenField ID="HiddenField_FilmID" runat="server" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
        <div class="receipt">
        <ul>
            <li>
                در بروزرسانی جدید، امکان رویت همه ارسال ها در یک صفحه وجود ندارد و باید از «شماره های درج شده زیر جدول» برای رویت همه رسیدها استفاده کنید.
            </li>
            <li>جهت استعلام، رویت و دانلود رسید ، در انتهای هر سطر روی دکمه‌ی «استعلام رسید» کلیک کرده و منتظر نتیجه بمانید.
                </li>
            <li>
                پاسخ های احتمالی پس از استعلام به شرح زیر است:
                <ul>
                    <li>
                        ظاهر شدن دکمه‌ی آبی رنگ «دریافت رسید» : در این صورت روی آن کلیک کرده تا در صفحه جدید باز شده، رسید را رویت و سپس دانلود کنید.
                    </li>
                     <li>
                         آیکن
                         <img style="cursor:pointer" src="..\..\files\images\icons\ban.png" width="25px" />
                         یعنی رسید در سرور موجود نیست و قبلا بصورت فیزیکی برای شما ارسال شده است.
                     </li>
                     <li>
                         آیکن
                         <img style="cursor:pointer" src="..\..\files\images\icons\awating.png" />
                         یعنی رسید هنوز بارگزاری نشده است و بزودی بارگزاری خواهد شد.
                     </li>

                </ul>

            </li>
            <li style="color:red;">
                توجه: رکوردهایی که به رنگ قرمز هستند به آن معناست که رسید آنها رویت و یا دانلود نشده اند.
            </li>


        </ul>
    </div>
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
                

                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceFilms" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
                SelectCommand="SELECT F.*, (select count(*) from [dbo].[tbSubmission] 
                where id_film=F.id and valid=1) as 'count' FROM [tbFilms] F WHERE (F.[customerId] = @customerId)">
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

                <%--              <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>--%>

                <asp:GridView ID="dgNewUpdated" Width="100%" runat="server" EmptyDataRowStyle-CssClass="cssEmpty"
                    Font-Size="12px" AutoGenerateColumns="False" BackColor="White" BorderColor="#848484"
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SDS_NotNewUpdated" AllowPaging="True">
                    <Columns>

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
                        <asp:TemplateField HeaderText="وضعیت" Visible="false"  ItemStyle-HorizontalAlign="Center"
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
                                <asp:Label ID="Lstabel1" style="font-weight:bold;" runat="server" Text='<%# Eval("festival") %>'></asp:Label>
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
                        <asp:BoundField DataField="country"  Visible="false"  ItemStyle-HorizontalAlign="Center" HeaderText="کشور"
                            HeaderStyle-HorizontalAlign="Left" SortExpression="country">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="date_of_entryData" HeaderText="date_of_entryData" SortExpression="date_of_entryData"
                            Visible="False" />


                        <asp:BoundField DataField="level"  Visible="false"  HeaderText="گرید" SortExpression="level" ItemStyle-HorizontalAlign="Center">
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
                      
                          <asp:TemplateField  HeaderText="کشور / گرید" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                   <asp:Label ID="lblReceip1t"
                                    
                                    Text='<%# Eval("country") %>'
                                    runat="server"></asp:Label>
                                <br />
                                   <asp:Label ID="La23bel3"
                                   style="font-size:17px;font-weight:bold;color:blue;"
                                    Text='<%# Eval("level") %>'
                                    runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>

<div style="text-align:center;">
     <asp:Label ID="lblIdSubmission"
         style="color:gray;font-size:10px;"
                                    Text='<%# Eval("id") %>'
                                    runat="server"></asp:Label>
    <br />
                                            <asp:Button ID="btnStatusReceipt"
                                            OnCommand="PublicSetClick" runat="server" Font-Names="Samim"
                                            Width="100%"
                                            Height="100%"
                                            style="cursor:help"
                                            Text="استعلام رسید" />

                                        <asp:Label ID="lblStatusReceipt"
                                            runat="server"></asp:Label>

</div>

                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                            <ProgressTemplate>
                                                <div style="text-align:center;">
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


                <%--                    </ContentTemplate>
                </asp:UpdatePanel>--%>
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
                    Font-Size="12px" CellPadding="4" DataSourceID="SqlDataSource_All" AllowPaging="True">
                    <Columns>
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
                        </asp:BoundField>
                        <asp:BoundField DataField="confirm" ItemStyle-HorizontalAlign="Center" HeaderText="confirm"
                            SortExpression="confirm" Visible="False" />
                        <asp:TemplateField HeaderText="وضعیت" ItemStyle-HorizontalAlign="Center" Visible="false"
                            SortExpression="accept" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="La1bel1" runat="server" Text='<%# GetAccept(Eval("accept")) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="platforms" HeaderText="platforms" SortExpression="platforms"
                            Visible="False" />
                             <asp:TemplateField HeaderText="فستیوال / آخرین وضعیت" ItemStyle-HorizontalAlign="Center" SortExpression="Fee">
                            <ItemTemplate>
                                <asp:Label ID="Lst1abel1" style="font-weight:bold;" runat="server" Text='<%# Eval("festival") %>'></asp:Label>
                                <br />
                                    <div class="divAccept">
                                        <asp:Label ID="Las1tssssbel2" runat="server" Text='<%# GetAccept(Eval("accept")) %>'></asp:Label>
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
                                <asp:Label ID="L1fabel1" runat="server" Text='<%# GetFee(Eval("fee")) %>'></asp:Label>
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
                        <asp:BoundField DataField="country" Visible="false"  ItemStyle-HorizontalAlign="Center" HeaderText="کشور"
                            HeaderStyle-HorizontalAlign="Left" SortExpression="country">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="date_of_entryData" HeaderText="date_of_entryData" SortExpression="date_of_entryData"
                            Visible="False" />
                        <asp:BoundField DataField="level" Visible="false" HeaderText="گرید" SortExpression="level" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="valid" HeaderText="valid" SortExpression="valid" Visible="False" />

                        <asp:CheckBoxField DataField="ChangeAccept" HeaderText="ChangeAccept" SortExpression="ChangeAccept"
                            Visible="False" />


                                                 <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblReceiptAll"
                                    Visible="false"
                                    Text='<%# Eval("receipt") %>'
                                    runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                      
                          <asp:TemplateField  HeaderText="کشور / گرید" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                   <asp:Label ID="lblcountryall"
                                    
                                    Text='<%# Eval("country") %>'
                                    runat="server"></asp:Label>
                                <br />
                                   <asp:Label ID="La23bel3"
                                   style="font-size:17px;font-weight:bold;color:blue;"
                                    Text='<%# Eval("level") %>'
                                    runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>

                                <asp:UpdatePanel ID="UpdatePanelAll" runat="server">
                                    <ContentTemplate>

<div style="text-align:center;">
     <asp:Label ID="lblIdSubmissionAll"
         style="color:gray;font-size:10px;"
                                    Text='<%# Eval("id") %>'
                                    runat="server"></asp:Label>
    <br />
                                            <asp:Button ID="btnStatusReceiptAll"
                                            OnCommand="PublicSetClickAll" runat="server" Font-Names="Samim"
                                            Width="100%"
                                            Height="100%"
                                            style="cursor:help"
                                            Text="استعلام رسید" />

                                        <asp:Label ID="lblStatusReceiptAll"
                                            runat="server"></asp:Label>

</div>

                                        <asp:UpdateProgress ID="UpdateProgressAll" runat="server" AssociatedUpdatePanelID="UpdatePanelAll">
                                            <ProgressTemplate>
                                                <div style="text-align:center;">
                                                <asp:Image ID="Iqma1ge1" ImageUrl="~/files/images/icons/loading_inGrid.gif" runat="server" />
                                                    </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
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
