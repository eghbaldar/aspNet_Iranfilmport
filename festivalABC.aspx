<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="festivalABC.aspx.vb" Inherits="festivalABC" %>

<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .txtSearch
        {
            background-color: White;
            border: 4px solid #ccc;
            width: 100%;
            padding: 5px;
            padding-right: 10px;
            -moz-border-radius: 0px 5px 5px 0px;
            -webkit-border-radius: 0px 5px 5px 0px;
            border-radius: 0px 5px 5px 0px;
        }
        .btnSearch
        {
            background-color: #48BDC5;
            border: 4px solid #ccc;
            -moz-border-radius: 5px 0px 0px 5px;
            -webkit-border-radius: 5px 0px 0px 5px;
            border-radius: 5px 0px 0px 5px;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
            color: White;
            font-family: NazaninB;
        }
        .btnSearch:hover
        {
            background-color: #000;
            color: #fff;
        }
        .Titr
        {
            font-family: Titr;
            color: Black;
        }
        .cmdStatus
        {
            padding: 5px;
            background-color: #48BDC5;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            color: White;
            font-family: NazaninB;
        }
        .cmdGenre
        {
            background-color: #48BDC5;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            color: White;
            text-align: left;
            direction: ltr;
        }
        .Post
        {
            background-color: #f4f4f4;
            padding: 10px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin: 4px;
        }
        .Post:hover
        {
            background-color: #e5e5e5;
            border-color: #48BDC5;
            cursor: pointer;
        }
        .Detail
        {
            background-color: #E5DA00;
            color: Black;
            padding: 5px;
            text-align: center;
        }
        .Detail:hover
        {
            background-color: #CCC200;
            border-color: #848484;
            color: White;
        }
        .IMG
        {
            border-left: 1px solid #ccc;
            width: 70px;
        }
        .Pager a
        {
            color: #000000;
            text-decoration: none;
        }
    </style>
    <style>
        .gridview span
        {
            background-color: #E5DA00;
            color: #fff;
            border-radius: 50%;
            padding: 5px 10px 5px 10px;
        }
        .gridview a
        {
            margin: auto 1%;
            border-radius: 50%;
            background-color: #444;
            padding: 5px 10px 5px 10px;
            color: #fff;
            text-decoration: none;
        }
        .gridview a:hover
        {
            background-color: #48BDC5;
            color: #fff;
        }
        .gridview
        {
            background-color: #fff;
            padding: 2px;
            margin: 2% auto;
        }
    </style>
    <script>
        function ClickforSearch() {
            var s = document.getElementById('txtSearch').value;
            if (s != "فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ...")
                window.open('festivalSearch.aspx?text=' + s, "_self");
        }
        function Open(id, name) {
            var v1 = 'festival\\'
            var v2 = '\\'
            window.open(v1 + id + v2 + name, '', 'width=500');
        }        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right; padding-top: 20px;">
        <%-- <div>
            <table style="width: 100%;">
                <tr>
                    <td style="width: 95%">
                        <div>
                            <input type="text" value="فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ..." id="txtSearch"
                                onblur="if(this.value == '') { this.value = 'فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ...'; }"
                                onfocus="if (this.value == 'فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ...') { this.value = ''; }"
                                class="txtSearch" />
                        </div>
                    </td>
                    <td style="width: 5%;">
                        <input type="button" value="جستجو" class="btnSearch" onclick="ClickforSearch()" />
                    </td>
                </tr>
            </table>
        </div>--%>
        <div style="padding-top: 5px; padding-bottom: 5px;">
            <div class="col-md-9 col-sm-12 col-xs-12" style="padding-bottom: 5px;">
            <div style="text-justify: inter-word; text-align: justify; font-family: Samim;color:Black;
                    font-size: 13px;">
                    به کسر فستیوال‌هایی که سالیانه توسط آکادمی اسکار به عنوان منتخبین و برگزیده‌های فستیوال‌ها که 
                    <a href="../فستیوال-های-اسکاری-فیلم-کوتاه" target="_blank">
                    Oscar-Qualifying Fests
                    </a>                     
                    نامیده می‌شوند، فستیوال‌های مهم و قدمت‌دار دیگری نیز وجود دارند که حائز اهمیت می‌باشند. درگاه فیلم
                    ایران سعی کرده است براساس معیارها و شاخص هایی، سایر فستیوال ها را در سه دسته کلی B ، A و C جای دهد
                    تا فیلمسازان بتوانند فیلم خود را با شناخت بیشتری ارسال کنند.
                </div>
                <hr />
                <div style="width: 100%;">
                    <img alt="فستیوال های فیلم کوتاه و بلند" src="files/images/background/ABCBanner.jpg"
                        width="100%" />
                </div>
                
                <hr />
                <div class="Titr">
                    فستیوال‌های سطح B، A و C
                </div>
                <div style="width: 100%">
                    <%--
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS" RepeatColumns="4"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="Post">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="color: #000; font-size: 12px;">
                                            <asp:Label ID="title_faLabel" runat="server" Text='<%# Eval("title_fa") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="direction: ltr; text-align: left; color: #AFA600; font-size: 11px;">
                                            <asp:Label ID="title_enLabel" runat="server" Text='<%# Eval("title_en") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="padding-bottom: 5px;">
                                                <asp:Image CssClass="IMG" ID="Image1" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                                    runat="server" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                      <td class="Detail">
                                        <a target="_blank" style="color:black;" href='<%# String.Format("festivalEach.aspx?id={0}", Eval("id")) %>'>مشاهده جزییات</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>--%>
                    <table style="width: 100%">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS"
                            GridLines="None" ShowHeader="False" AllowPaging="True" PageSize="50">
                            <Columns>
                                <asp:TemplateField HeaderText="rules" SortExpression="rules">
                                    <ItemTemplate>
                                        <tr style="width: 100%; border: 1px solid #48BDC5; padding: 10px; margin-bottom: 10px;">
                                            <td style="width: 10%">
                                                <asp:Image CssClass="IMG" ID="Image1" AlternateText='<%# Bind("title_fa") %>' ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                                    runat="server" />
                                            </td>
                                            <td style="width: 87%">
                                                <div>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("title_fa") %>'></asp:Label>&nbsp(<asp:Label
                                                        ID="Label1" runat="server" Text='<%# Bind("title_en") %>'></asp:Label>)</div>
                                                <div>
                                                </div>
                                            </td>
                                            <td style="width: 3%;">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("LevelName") %>'></asp:Label>
                                            </td>
                                            <td class="Detail">
                                                <a style="color: black; font-size: 11px;" onclick="return Open('<%# Eval("id")%>','<%# Eval("title_fa").ToString().Replace(" ","-")+".html" %>' );">
                                                    جزییات</a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                فستیوالی وجود ندارد.
                            </EmptyDataTemplate>
                            <PagerStyle CssClass="gridview"></PagerStyle>
                        </asp:GridView>
                    </table>
                    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="SELECT
	Case
		WHEN Level=2 then 'A'
		WHEN Level=3 then 'B'
		WHEN Level=4 then 'C'
	End	AS LevelName	
,*
FROM [tbl_festivals]
WHERE ([Level] = 2 or [Level] = 3 or [Level] = 4) ORDER BY [ID] DESC"></asp:SqlDataSource>
                </div>
            </div>
            <uc1:banners_right ID="banners_right1" runat="server" />
        </div>
    </div>
</asp:Content>
