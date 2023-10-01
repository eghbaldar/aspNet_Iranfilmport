<%@ Page Title="" Language="VB" MasterPageFile="~/panelclients/MasterPanel.master" AutoEventWireup="false"
    CodeFile="PanelMoney.aspx.vb" Inherits="PanelMoney" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .rounded_corners
        {
            border: 1px solid #A1DCF2;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;
            border-radius: 15px;
            overflow: hidden;
        }
        .rounded_corners td, .rounded_corners th
        {
            border: 1px solid #A1DCF2;
            font-family: Samim;
            font-size: 10pt;
            text-align: center;
        }
        .rounded_corners table table td
        {
            border-style: none;
        }
        .cmdCss
        {
            padding:10px;
            text-align:center;
            -moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TitleTitle">
        جزییات قرارداد
    </div>
    <div style="padding-top:10px;">
        <table>
            <tr>
                <td>
                    <asp:DropDownList CssClass="cmdCss" ID="cmdProject" runat="server" AutoPostBack="True" DataSourceID="SDS_Project"
                        DataTextField="Film" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SDS_Project" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
                        SelectCommand="SELECT * FROM [tbFilms] WHERE ([customerId] = @customerId)">
                        <SelectParameters>
                            <asp:RouteParameter Name="customerId" RouteKey="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:DropDownList CssClass="cmdCss"  ID="cmdContracts" runat="server" DataSourceID="SDS_Contracts" DataTextField="contractNumber"
                        DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SDS_Contracts" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
                        SelectCommand="SELECT * FROM [tbContracts] WHERE ([filmId] = @filmId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cmdProject" Name="filmId" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button CssClass="cmdCss"  ID="btnShowInfo" Font-Names="Samim" runat="server" style="padding:7px;cursor:pointer;" Text="نمایش" />
                </td>
            </tr>
        </table>
    </div>
    <div style="padding: 10px;">
        <div class="rounded_corners">
            <asp:DetailsView ID="DetailsViewGeneralInformation" runat="server" CssClass="table table-curved"
                HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
                AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#ccc" Height="50px"
                Width="100%" DataSourceID="SDS_GeneralContract" Font-Size="11px" AutoGenerateRows="False"
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" GridLines="Vertical">
                <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="filmId" HeaderText="filmId" SortExpression="filmId" Visible="False" />
                    <asp:BoundField DataField="customerId" HeaderText="customerId" SortExpression="customerId"
                        Visible="False" />
                    <asp:CheckBoxField DataField="genre" HeaderText="genre" SortExpression="genre" Visible="False" />
                    <asp:BoundField DataField="contractNumber" HeaderText="شماره قرارداد" SortExpression="contractNumber" />
                    <asp:BoundField DataField="id" HeaderText="شناسه قرارداد" SortExpression="id" />
                    <asp:BoundField DataField="Genre1" HeaderText="نوع پروژه" ReadOnly="True" SortExpression="Genre1" />
                    <asp:BoundField DataField="Type1" HeaderText="نوع قرارداد" ReadOnly="True" SortExpression="Type1" />
                    <asp:CheckBoxField DataField="type" HeaderText="type" SortExpression="type" Visible="False" />
                    <asp:BoundField DataField="StartDate" HeaderText="تاریخ شروع قرارداد" SortExpression="StartDate" />
                    <asp:BoundField DataField="EndDate" HeaderText="تاریخ پایان قرارداد" SortExpression="EndDate" />
                    <asp:BoundField DataField="totalprice" HeaderText="مبلغ قرارداد" SortExpression="totalprice" />
                    <asp:BoundField DataField="discount" HeaderText="تخفیف" SortExpression="discount" />
                    <asp:BoundField DataField="festivalcount" HeaderText="تعداد فستیوال ها" SortExpression="festivalcount" />
                    <asp:BoundField DataField="FilmName" HeaderText="نام فیلم" ReadOnly="True" SortExpression="FilmName"
                        Visible="False" />
                </Fields>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            </asp:DetailsView>
        </div>
        <asp:SqlDataSource ID="SDS_GeneralContract" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
            SelectCommand="spPanelGeneralContractInformation" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="cmdContracts" Name="id" PropertyName="SelectedValue"
                    Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="TitleTitle">
        صورت حساب ها
    </div>
    <div style="padding:10px;">
        <div class="rounded_corners">
            <asp:GridView ID="GridViewDetailsInvoices" runat="server" Width="100%" AutoGenerateColumns="False"
                CellPadding="4" DataSourceID="SDS_DetailInvoices" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                                    <asp:BoundField DataField="contractID" HeaderText="شناسه قرارداد" SortExpression="contractID" />
                    <asp:BoundField DataField="id" HeaderText="شماره تراکنش" InsertVisible="False" ReadOnly="True"
                        SortExpression="id" />
                    <asp:BoundField DataField="idFilm" HeaderText="شناسه فیلم" SortExpression="idFilm" />
                    <asp:BoundField DataField="cost" HeaderText="مقدار پرداختی" SortExpression="cost" />
                    <asp:BoundField DataField="shamsi" HeaderText="تاریخ پرداختی" SortExpression="shamsi" />

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
        </div>
        <asp:SqlDataSource ID="SDS_DetailInvoices" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
            SelectCommand="SELECT *, (select dbo.fn_DateToShamsiDate(date) AS ShamsiDate) 'Shamsi' FROM [tbInvoice] WHERE ([contractID] = @contractID) order by [date] desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="cmdContracts" Name="contractID" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
        <div class="TitleTitle">
        سر رسید قسط ها
    </div>
    <div>
        <div style="padding:10px;">
        <div class="rounded_corners">
        <asp:GridView ID="GridViewInstallments" runat="server" Width="100%"
            AutoGenerateColumns="False" DataSourceID="SDS_Installments" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="شناسه پرداخت" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="contractNum" HeaderText="شماره قرارداد" 
                    SortExpression="contractNum" />
                <asp:BoundField DataField="shamsi" HeaderText="تاریخ پرداخت" SortExpression="shamsi" />
                <asp:BoundField DataField="price" HeaderText="مبلغ پرداختی" SortExpression="price" />
                <asp:TemplateField HeaderText="روزهای باقیمانده به این سر رسید" ItemStyle-HorizontalAlign="Center"
                    SortExpression="leftdays">
                    <ItemTemplate>
                       
                        <asp:Label ID="Label1" runat="server" style="color:Red;font-weight:bolder;" Text='<%# Bind("leftdays") %>'></asp:Label>
                        - روز
                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <div style="font-family:Samim;">
                    قسطی وجود ندارد.
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
        <asp:SqlDataSource ID="SDS_Installments" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" 
            
            SelectCommand="select *,(select dbo.fn_DateToShamsiDate(date) AS ShamsiDate) 'Shamsi',DATEDIFF(day,getdate(),[date]) [leftdays] from [dbo].[tbInstallment] where contractnum=(select [contractNumber] from [dbo].[tbContracts] where [id]=@id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cmdContracts" Name="id" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
        </div>
    </div>
</asp:Content>
