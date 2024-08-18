<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingFestivalsOscar.aspx.vb" Inherits="kingFestivalsOscar" %>

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
        }
        .btnSearch:hover
        {
            background-color: #000;
            color: #fff;
        }
        .Titr
        {
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
            height: 300px;
        }
        .Post:hover
        {
            background-color: #e5e5e5;
            border-color: #48BDC5;
            cursor: pointer;
        }
        .IMG_Big
        {
            border: 1px solid #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            width: 150px;
            height: 150px;
        }
        .Detail
        {
            background-color: #E5DA00;
            color: Black;
            padding: 5px;
            text-align: center;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin: 4px;
        }
        .Detail:hover
        {
            background-color: #FFFFFF;
            border-color: #848484;
        }
        
        @media (max-width: 600px)
        {
            .Post
            {
                width: 100%;
                height: 100%;
            }
            #TableOfSearchRight
            {
                width: 100%;
            }
            #TableOfSearchLeft
            {
                width: 100%;
            }
            .IMG_Big
            {
                width: 100%;
                height: 100%;
            }
            .DLoscar tr:hover td
            {
                /*background-color: #F7F6F3;*/
                color: Black;
            }
            .THeader
            {
                display: none;
            }
            .DLoscar .fr
            {
                text-align: center;
                direction: rtl;
                color: Black;
            }
            .DLoscar
            {
                width: 100%;
                border-collapse: collapse;
                direction: rtl;
                text-align: center;
                color: Black;
            }
            /* Zebra striping */
            .DLoscar tr:nth-of-type(odd)
            {
                background: #eee;
                color: Black;
            }
            .DLoscar th
            {
                background: #333;
                color: white;
                font-weight: bold;
            }
            .DLoscar td,.DLoscar th
            {
                padding: 6px;
                border: 1px solid #ccc;
                text-align: center;
            }
            .DLoscar td
            {
                text-align: center;
                direction: rtl;
            }
        }
        @media only screen and (max-width: 600px)
        {
            /* Force table to not be like tables anymore */
            .DLoscar,.DLoscar thead,.DLoscar tbody,.DLoscar th,.DLoscar td,.DLoscar tr
            {
                display: block;
                text-align: center;
            }
        
            /* Hide table headers (but not display: none;, for accessibility) */
            .DLoscar thead tr
            {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
        
            .DLoscar tr
            {
                border-bottom: 1px solid #ccc;
            }
        
            .DLoscar td
            {
                /* Behave  like a "row" */
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                text-align: center;
            }
        
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
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side panel first-level">
        <div style="padding-top: 5px; padding-bottom: 5px;">
            <div class="col-12" style="padding-bottom: 5px;">
                <div style="width: 100%;">
                    <div style="text-justify: inter-word; text-align: justify; color: Black;">
                        برخلاف تصویر رایج بین فیلمسازان و حتی پخش کنندگان آماتور، تنها «اسکار» آکادمی نیست!
                        بغیر از آکادمی اسکار، کوآلیفایرهای دیگری چون «بفتا»، «سزار»، «گویا»، «جوایز کانادایی» و ... نیز وجود دارند.
                        سالیانه این آکادمی‌ها، لیست فستیوال های مورد تایید خودشان را در مدیوم‌های کوتاه و بلند ارائه می
                        کند. فستیوال هایی که از درجه ی بالایی اعتبار (ای پلاس) و محبوبیت در بین علاقه مندان حرفه‌ای و با سابقه سینمایی
                        و بخصوص فیلم کوتاه برخوردار هستند. سالیانه این آکادمی‌هالیست خود را
                        بدون هیچ هشدار و آکاهی قبلی بروز میکنند، بنابراین لیستی که در زیر شاهد آن هستید
                        .ممکن است تغییر کرده و بروز شود.
                    </div>
                    <hr />
                    <img alt="فستیوال های اسکاری فیلم کوتاه" src="files/images/background/oscarsBanner.jpg"
                        style="-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                        width="100%" />
                </div>
                <hr />
                <div class="Titr">
                    فستیوال های مورد تایید آکادمی اسکار در مدیوم کوتاه (Academy Awards Short Films Qualifying
                    Festival List)
                </div>
                <div>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS" RepeatColumns="4"
                        RepeatDirection="Horizontal" CssClass="DLoscar">
                        <ItemTemplate>
                            <div class="Post">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="color: #000; font-size: 12px; text-align: center;">
                                            <asp:Label ID="title_faLabel" runat="server" Text='<%# Eval("title_fa").Replace("ي", "ی") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="direction: ltr; text-align: center; color: #AFA600; font-size: 11px;">
                                            <asp:Label ID="title_enLabel" runat="server" Text='<%# Eval("title_en") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                            <div style="padding-bottom: 5px;">
                                                <asp:Image AlternateText='<%# Eval("title_fa").Replace("ي", "ی") %>' CssClass="IMG_Big"
                                                    ID="Image1" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                                    runat="server" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="Detail">
                                <%--onclick="return Open('<%# Eval("id")%>','<%# Eval("title_fa").ToString.Replace(" ","-").Replace("ي", "ی") %>' );"--%>
                                <a style="color: black;" target="_blank" href='<%# String.Format("festival/{0}/", Eval("id")) %>'>مشاهده جزییات</a>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="SELECT * FROM [tbl_festivals] WHERE ([Level] = @Level) ORDER BY [ID] DESC">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="Level" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

