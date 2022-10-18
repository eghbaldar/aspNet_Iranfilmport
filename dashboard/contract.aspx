<%@ Page Language="VB" AutoEventWireup="false" CodeFile="contract.aspx.vb" Inherits="dashboard_contract" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="<%= ResolveUrl("~/files/images/icons/icon.png")%>" />
    <style>
        @font-face
        {
            font-family: 'Titr';
            src: url('<%= ResolveUrl("~/files//font/TITRBD.TTF")%>');
        }
        @font-face
        {
            font-family: 'Samim';
            src: url('<%= ResolveUrl("~/files//font/Samim-FD.ttf")%>');
        }
        .box
        {
            width: 200px; /*background-color: #efea83;*/
            padding: 5px;
            font-family: Samim;
            font-size: 12px;
        }
        .box_right
        {
            width: 150px; /*background-color: #ccc;*/
            padding: 5px;
            font-family: Samim;
            font-size: 12px;
        }
        td, th
        {
            border: dotted 1px black;
        }
    </style>
    <script>
    function R(){
    document.addEventListener('contextmenu', event => event.preventDefault());
    }
    </script>
</head>
<body onload="return R();" style="direction: rtl; font-family: Tahoma; font-size: 14px;
    -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none;
    user-scalable=no">
    <form id="form1" runat="server">
    <div style="text-align: center;">
        <img src='<%= ResolveUrl("~/files/images/logos/logo_3.png")%>' />
    </div>
    <hr />
    <div style="text-align: center; font-family: Titr; font-size: 20px;">
        فاکتور حساب مالی
    </div>
    <div style="text-align: center; font-family: Samim; font-size: 11px; cursor: pointer;">
        <a onclick="window.print();" style="color: Blue;">[پریت] </a>
    </div>
    <hr />
    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS" Width="100%">
            <ItemTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <div class="box_right">
                                شماره فاکتور:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                اسم فستیوال:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("FestivalName") %>' /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                اسم پروژه:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("namef") %>' /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                بخش شرکت کرده:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("section") %>' /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                تاریخ ددلاین فستیوال:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("deadline") %>' /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                توضیحات:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="detailLabel" runat="server" Text='<%# Eval("detail") %>' /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                ارزش فاکتور:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="priceLabel" runat="server" Text='<%# MoneyNum(Eval("price")) %>' /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                تخفیف:</div>
                        </td>
                        <td>
                            <div class="box">
                            0
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                جمع کل:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="Label3" runat="server" Text='<%# Total(Eval("price")+"|"+Eval("price")) %>' /></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                تاریخ ایجاد فاکتور:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="Label1" runat="server" Style="font-family: Tahoma; font-size: 12px;"
                                    Text='<%# Eval("CreationFactorDate") %>'></asp:Label></div>
                        </td>
                    </tr>
                    <tr>
                        <td style="border:0;">
                            <div style="position: absolute; text-align: center; width: 100%;">
                                <img width="400" src='<%= ResolveUrl("~/dashboard/assets/img/sign.png")%>' />
                            </div>
                        </td>
                        <td style="border:0;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="box_right">
                                تاریخ پرداخت فاکتور:</div>
                        </td>
                        <td>
                            <div class="box">
                                <asp:Label ID="Label2" Style="font-family: Tahoma; font-size: 12px;" runat="server"
                                    Text='<%# Eval("payment_date") %>'></asp:Label></div>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <hr />
        <div style="font-family: Tahoma; text-align: center; padding: 10px; font-size: 11px;
            color: #848484;">
            درگاه فیلم ایران | Iran Film Port</div>
        <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT i.ID,
    i.email,
    i.detail,
    i.ProjectID,
    i.DeadlineID,
    i.price,
	i.festivalID,
    (select dbo.MiladiTOShamsi(i.record_date,'/')) 'CreationFactorDate',
    f.title_en+' '+f.title_fa 'FestivalName',
    s.section,
	p.namef,
	(select dbo.MiladiTOShamsi(i.payment_date,'/')) 'payment_date',
    (select dbo.MiladiTOShamsi(d.deadline,'/')) 'deadline'
    FROM [tbl_invoice] i,[tbl_festivals] f,[tbl_festivalSections] s,[tbl_festivalDeadline] d,[dbo].[tbl_Projects] p
    WHERE   i.id=@id
            and i.festivalID=f.ID 
            and s.id=d.sectionID 
            and d.festivalID=f.ID
            and i.DeadlineID=d.id 
            and (payment_code is not null or payment_code != '')
			and (transaction_code is not null or transaction_code != '')
			and p.ID=i.ProjectID">
            <SelectParameters>
                <asp:RouteParameter Name="id" RouteKey="factor" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
