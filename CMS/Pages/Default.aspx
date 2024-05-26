<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="Management_Pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 82px;
            height: 97px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
       <div class="TITLE">
        <h4>
            تیکت ها و پیشنهادات فستیوال های ورودی دار
        </h4>
    </div>
    <div>
        <asp:GridView ID="GridView6" runat="server" BackColor="LightGoldenrodYellow"
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourceUnderConstruction"
            AutoGenerateColumns="False" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="در حال بررسی" >
                    <ItemTemplate>
                        <a href="commentClients">
                            <div style="padding: 10px;">
                                <asp:Label ID="Label11" Font-Size="20px" runat="server" Text='<%# Bind("[UnderConstruction]") %>'></asp:Label>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceUnderConstruction" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="
           Select count(*) as 'UnderConstruction' from [tbl_Comment_clients] where flag=1 and Id_parent=0
	"></asp:SqlDataSource> 
                <asp:GridView ID="GridViewSuggestedFestival" runat="server" BackColor="LightGoldenrodYellow"
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourceFestivalSuggestion"
            AutoGenerateColumns="False" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="فستیوال های درخواست شده" >
                    <ItemTemplate>
                        <a href="requestedfestivalsclient">
                            <div style="padding: 10px;">
                                <asp:Label ID="Lab12el11" Font-Size="20px" runat="server" Text='<%# Bind("[UnderConstruction]") %>'></asp:Label>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceFestivalSuggestion" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
            SelectCommand="
           Select count(*) as 'UnderConstruction' from [tbFestivalSuggestion] where agree=2"></asp:SqlDataSource> 
        </div>
    <div class="TITLE">
        <h4>
            فیلمسازان
        </h4>
    </div>
    <div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SDSStatisticalProfile"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="3">
            <Columns>
                <asp:BoundField DataField="کل فیلمسازان" HeaderText="کل فیلمسازان" ReadOnly="True"
                    SortExpression="کل فیلمسازان" />
                <asp:BoundField DataField="ثبت نام کنندگان امروز" HeaderText="ثبت نام کنندگان امروز"
                    ReadOnly="True" SortExpression="ثبت نام کنندگان امروز" />
                <asp:BoundField DataField="تائیده شده" HeaderText="تائیده شده" SortExpression="تائیده شده"
                    ReadOnly="True" />
                <asp:BoundField DataField="تائید نشده" HeaderText="تائید نشده" ReadOnly="True" SortExpression="تائید نشده" />
                <asp:BoundField DataField="محروم شده" HeaderText="محروم شده" ReadOnly="True" SortExpression="محروم شده" />
                <asp:BoundField DataField="نماد گرفته" HeaderText="نماد گرفته" ReadOnly="True" SortExpression="نماد گرفته" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDSStatisticalProfile" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="select * from vw_statisticalProfileStatus"></asp:SqlDataSource>
    </div>
    <div class="TITLE">
        <h4>
            پروژه ها</h4>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSstatistical"
            CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None"
            BorderWidth="1px" CellSpacing="2">
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
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle ForeColor="#8C4510" BackColor="#FFF7E7" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDSstatistical" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [vw_statisticalProjects]"></asp:SqlDataSource>
    </div>
    <div class="TITLE">
        <h4>
            تصاویر تائید نشده</h4>
    </div>
    <div>
        <asp:GridView ID="gv_not_Photos" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_NotPhotos"
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="total" HeaderText="تعداد تصاویر پروژه های تائید نشده"
                    SortExpression="total" />
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
            SelectCommand="select count(*) as 'total'
from dbo.tbl_Projects p,dbo.tbl_Projects_photos pp
where p.ID=pp.ProjectID and pp.status=0"></asp:SqlDataSource>
    </div>
  <%--  <div class="TITLE">
        <h4>
            آمار کلی صورت حساب ها
        </h4>
    </div>
    <div>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
            DataSourceID="SDS_Invoice" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="فقط ایجاد فاکتور شده" HeaderText="فقط ایجاد فاکتور شده"
                    ReadOnly="True" SortExpression="فقط ایجاد فاکتور شده" />
                <asp:BoundField DataField="به بانک رفته ولی پرداخت نشده" HeaderText="به بانک رفته ولی پرداخت نشده"
                    SortExpression="به بانک رفته ولی پرداخت نشده" ReadOnly="True" />
                <asp:BoundField DataField="پرداخت شده" HeaderText="پرداخت شده" ReadOnly="True" SortExpression="پرداخت شده" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle ForeColor="#333333" BackColor="White" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Invoice" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT (select COUNT(*) from dbo.tbl_invoice where (payment_code is  null or payment_code ='') AND (transaction_code is null or transaction_code ='') ) 'فقط ایجاد فاکتور شده', (select COUNT(*) from dbo.tbl_invoice where (payment_code is null or payment_code ='') AND (transaction_code is not null or transaction_code <>'') ) 'به بانک رفته ولی پرداخت نشده', (select COUNT(*) from dbo.tbl_invoice where (payment_code is not null or payment_code <>''))  'پرداخت شده'">
        </asp:SqlDataSource>
    </div>--%>
    <%--<div class="TITLE">
        <h4>
            پروژه هایی که پول آن واریز شده و باید ارسال شوند
        </h4>
    </div>
    <div>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_ReadyForSubmit"
            BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
            CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="تعداد" HeaderText="تعداد" ReadOnly="True" SortExpression="تعداد" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_ReadyForSubmit" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="select COUNT(*) 'تعداد' from dbo.tbl_invoice where (payment_code is not null or payment_code <> '') AND (transaction_code is not null or transaction_code <> '') AND send_status=1">
        </asp:SqlDataSource>
    </div>--%>
    <div class="TITLE">
        <h4>
            کامنت و تماس با ما
        </h4>
    </div>
    <div>
        <asp:GridView ID="dgCommentContact" runat="server" BackColor="LightGoldenrodYellow"
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SDS_ContactComment"
            AutoGenerateColumns="False" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="تماس با ما" SortExpression="تماس با ما">
                    <ItemTemplate>
                        <a href="Contact">
                            <div style="padding: 10px;">
                                <asp:Label ID="Label11" Font-Size="20px" runat="server" Text='<%# Bind("[تماس با ما]") %>'></asp:Label>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="کامنت ها" SortExpression="کامنت ها">
                    <ItemTemplate>
                        <a href="Comments">
                            <div style="padding: 10px;">
                                <asp:Label ID="Label1" Font-Size="20px" runat="server" Text='<%# Bind("[کامنت]") %>'></asp:Label>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_ContactComment" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="
            select
            (select COUNT(*) from dbo.tbl_Contact where [read]=0) as 'تماس با ما'
            ,
            (select COUNT(*) from dbo.tbl_Comment where [read]=0 and Id_parent=0) as 'کامنت' 
	"></asp:SqlDataSource>
    </div>
    <div class="TITLE">
        <h4>
            اطلاعات ارسال شده توسط افراد مختلف
        </h4>
    </div>
    <div>
        <asp:GridView ID="GridView5" runat="server" BackColor="White" BorderColor="#CCCCCC"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SDS_Send">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Send" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="
            select
            (select COUNT(*) from dbo.tbl_SendInformation where flag=0) as 'تعداد بررسی نشده'
	"></asp:SqlDataSource>
    </div>
    <%--
    از سمت راست منوی مورد نظر را انتخاب کنید.
    <table class="style1">
        <tr>
            <td>
            <a href="../../">
                <img alt="" class="style13" src="../../Content/Images/mnu_website.png" /></a></td>
                
            <td>
            <a href="show_news.aspx">
                <img alt="" class="style13" src="../../Content/Images/mnu_show_news.png" /></a></td>
            <td>
            <a href="add_news.aspx">
                <img alt="" class="style13" src="../../Content/Images/mnu_add_news.png" /></a></td>
            <td>
            <a href="edit_news.aspx">
                <img alt="" class="style13" src="../../Content/Images/mnu_edit_news.png" /></a></td>
            <td>
            <a href="contact.aspx">
                <img alt="" class="style13" src="../../Content/Images/mnu_contact.png" /></a></td>
            <td>
            <a href="users.aspx">
                <img alt="" class="style13" src="../../Content/Images/mnu_users.png" /></a></td>
            <td>
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>--%>
</asp:Content>
