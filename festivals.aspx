<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="festivals.aspx.vb" Inherits="festivals" %>

<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #searchFest
        {
            border: 1px solid #ccc;
            padding: 2px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        .txtSearchFest
        {
            background-color: White;
            border: 4px solid #ccc;
            width: 100%;
            padding: 5px;
            padding-right: 10px;
            -moz-border-radius: 0px 5px 5px 0px;
            -webkit-border-radius: 0px 5px 5px 0px;
            border-radius: 0px 5px 5px 0px;
            font-family: Samim;
        }
        .btnSearchFest
        {
            background-color: #ccc;
            border: 4px solid #ccc;
            -moz-border-radius: 5px 0px 0px 5px;
            -webkit-border-radius: 5px 0px 0px 5px;
            border-radius: 5px 0px 0px 5px;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
            color: White;
            font-family: Samim;
            width: 100%;
        }
        .btnSearchFest:hover
        {
            background-color: #E5DA00;
            color: #000;
        }
        .Titr
        {
            font-family: Koodak;
            color: Black;
            font-size: 17px;
        }
        .SearchItem
        {
            color: Black;
            text-align: left;
            direction: ltr;
            font-family: Samim;
            font-size: 12px;
            direction: rtl;
            text-align: right;
        }
        .SearchDiv
        {
            background-color: #e8e8e8;
            padding: 5px;
        }
        .IMG
        {
            border-left: 1px solid #ccc;
            width: 70px;
        }
        .IMG_Big
        {
            border: 1px solid #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
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
        .Pager a
        {
            color: #000000;
            text-decoration: none;
        }
        .TitleFestivalFa
        {
            color: Black;
            font-size: 13px;
        }
        .TitleFestivalEn
        {
            color: Gray;
            font-size: 10px;
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
        #TableOfSearchFestRightFest
        {
            width: 95%;
        }
        #TableOfSearchFestLeftFest
        {
            width: 5%;
        }
        #TableOfSearchFest
        {
            width: 100%;
        }
        .IMG_Big
        {
            width: 150px;
            height: 150px;
        }
        .Post
        {
            width: 200px;
            height: 290px;
        }
    </style>
    <style>
        @media (max-width: 600px)
        {
            .Post
            {
                width: 100%;
                height: 100%;
            }
            #TableOfSearchFestRightFest
            {
                width: 100%;
            }
            #TableOfSearchFestLeftFest
            {
                width: 100%;
            }
            .IMG_Big
            {
                width: 100%;
                height: 100%;
            }
            table tr:hover td
            {
                /*background-color: #F7F6F3;*/
                color: Black;
            }
            .THeader
            {
                display: none;
            }
            table .fr
            {
                text-align: center;
                font-family: Samim;
                direction: rtl;
                color: Black;
            }
            table
            {
                width: 100%;
                border-collapse: collapse;
                direction: rtl;
                text-align: center;
                color: Black;
            }
            /* Zebra striping 
            table tr:nth-of-type(odd)
            {
                background: #eee;
                color: Black;
            }*/
            table th
            {
                background: #333;
                color: white;
                font-weight: bold;
            }
            .DL_LastFestival table td,.DL_LastFestival table th
            {
                padding: 6px;
                border: 1px solid #ccc;
                text-align: center;
                font-family: irsans;
            }
            .DL_LastFestival table table td
            {
                text-align: center;
                direction: rtl;
            }
        
            /*
            table, thead, tbody, th, td, tr
            {
                display: block;
                text-align:center;
            }
            */
            .DL_LastFestival table tr:nth-of-type(odd)
            {
                background: #eee;
                color: Black;
            }
        
            .DL_LastFestival table, .DL_LastFestival thead, .DL_LastFestival tbody, .DL_LastFestival th, .DL_LastFestival td, .DL_LastFestival tr
            {
                display: block;
                text-align: center;
            }
        
        
            /* Hide table headers (but not display: none;, for accessibility) */
            .DL_LastFestival table table thead tr
            {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
        
            .DL_LastFestival table table tr
            {
                border-bottom: 1px solid #ccc;
            }
        
            .DL_LastFestival table table td
            {
                /* Behave  like a "row" */
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                font-family: irsans;
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right; padding-top: 20px;">
        <div>
            <table id="TableOfSearchFest">
                <tr>
                    <td id="TableOfSearchFestRightFest">
                        <div>
                            <input runat="server" type="text" value="فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ..."
                                id="txtSearch" onblur="if(this.value == '') { this.value = 'فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ...'; }"
                                onfocus="if (this.value == 'فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ...') { this.value = ''; }"
                                class="txtSearchFest" />
                        </div>
                    </td>
                    <td id="TableOfSearchFestLeftFest">
                        <%--<input type="button" value="جستجو" class="btnSearchFest" onclick="ClickforSearch()" />--%>
                        <asp:Button ID="btnSearch" runat="server" class="btnSearchFest" Text="جستجو" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="padding-top: 5px; padding-bottom: 5px;">
            <div class="col-md-9 col-sm-12 col-xs-12" style="padding-bottom: 5px;">
                <div class="Titr">
                    آخرین فستیوال‌های اضافه شده به درگاه</div>
                <div>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS_Last" RepeatColumns="4"
                        CssClass="DL_LastFestival" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"),getLink(Eval("title_fa")).Replace(" ","-").Replace("ي", "ی")) %>'>
                                <%--<div class="Post">--%>
                                <table style="width: 100%; text-align: center;">
                                    <tr>
                                        <td>
                                            <asp:Image CssClass="IMG_Big" ID="Image1" AlternateText='<%# Eval("title_fa") %>'
                                                ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                                runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="title_faLabel" CssClass="TitleFestivalFa" runat="server" Text='<%# Eval("title_fa").Replace("ي", "ی") %>' />
                                        </td>
                                    </tr>
                                    <td>
                                        <asp:Label ID="title_enLabel" CssClass="TitleFestivalEn" runat="server" Text='<%# Eval("title_en") %>' />
                                    </td>
                                    <tr>
                                        <td>
                                            <asp:Label ToolTip="تعداد روز باقی ماننده به آخرین ددلاین" ID="Label1" Style="font-family: Samim;
                                                font-size: 12px;" runat="server" Text='<%# getDeadlineStatus(Eval("sign"),Eval("RemainDays")) %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <%--</div>--%>
                            </a>
                            <%--<a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").
                            Replace(" ","-"),getLink(Eval("title_fa")).Replace(" ","-").Replace("ي", "ی")) %>'>
                                <div class="Post">
                                    <div class="PostDIV">
                                        <asp:Image CssClass="IMG_Big" Height="150" ID="Image1" Width="150" AlternateText='<%# Eval("title_fa") %>'
                                            ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                            runat="server" />
                                    </div>
                                    <div class="PostDIV">
                                        <asp:Label ID="title_faLabel" runat="server" Text='<%# Eval("title_fa").Replace("ي", "ی") %>' />
                                    </div>
                                    <div class="PostDIV">
                                        <asp:Label ID="title_enLabel" runat="server" Text='<%# Eval("title_en") %>' />
                                    </div>
                                    <div class="PostDIV">
                                        <asp:Label ToolTip="تعداد روز باقی ماننده به آخرین ددلاین" ID="Label1" Style="font-family: Samim;
                                            font-size: 12px;" runat="server" Text='<%# getDeadlineStatus(Eval("sign"),Eval("RemainDays")) %>'></asp:Label>
                                    </div>
                                </div>
                            </a>--%>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SDS_Last" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="select top 8 *,
DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc)) as 'RemainDays',
sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) 'sign'	
from dbo.tbl_festivals f
where f.flag=1 and sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) is not null
order by ID desc"></asp:SqlDataSource>
                </div>
                <hr />
                <div class="Titr">
                    لیست فستیوال‌ها براساس آخرین تاریخ پذیرش
                </div>
                <div>
                    <table style="width: 100%">
                        <asp:GridView ID="dgLastDeadlineFestival" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SDS_LastFest" GridLines="None" ShowHeader="False" AllowPaging="True"
                            PageSize="50">
                            <Columns>
                                <asp:TemplateField HeaderText="rules" SortExpression="rules">
                                    <ItemTemplate>
                                        <tr style="width: 100%; border: 1px solid #48BDC5; padding: 10px; margin-bottom: 10px;
                                            font-family: Samim;">
                                            <td style="width: 10%">
                                                <a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"),getLink(Eval("title_fa")).Replace(" ","-").Replace("ي", "ی")) %>'>
                                                    <asp:Image CssClass="IMG" ID="Image1" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                                        runat="server" />
                                                </a>
                                            </td>
                                            <td style="width: 90%">
                                                <div>
                                                    <a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"),getLink(Eval("title_fa")).Replace(" ","-").Replace("ي", "ی")) %>'>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("title_fa").Replace("ي", "ی") %>'></asp:Label>&nbsp(<asp:Label
                                                            ID="Label1" runat="server" Text='<%# Bind("title_en") %>'></asp:Label>)
                                                    </a>
                                                </div>
                                                <div>
                                                    <asp:Label ToolTip="تعداد روز باقی ماننده به آخرین ددلاین" ID="Label3" Style="font-family: Samim;
                                                        font-size: 12px;" runat="server" Text='<%# getDeadlineStatus(Eval("sign"),Eval("RemainDays")) %>'></asp:Label>
                                                </div>
                                            </td>
                                            <td class="Detail">
                                                <a style="color: Black;" href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"),getLink(Eval("title_fa")).Replace(" ","-").Replace("ي", "ی")) %>'>
                                                    جزییات</a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="gridview"></PagerStyle>
                        </asp:GridView>
                    </table>
                    <asp:SqlDataSource ID="SDS_LastFest" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="select *, (select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc) 'lastDeadline', DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc)) as 'RemainDays', sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) 'sign' from dbo.tbl_festivals f where f.flag=1 and DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc)) is not null and sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) <> -1 order by 'RemainDays' asc">
                    </asp:SqlDataSource>
                </div>
            </div>
            <%--<uc1:banners_right ID="banners_right1" runat="server" />--%>
            <div class="col-md-3 col-sm-12 col-xs-12">
                <div id="searchFest">
                    <asp:Button ID="btnALL" runat="server" CssClass="btnSearchFest" Text="نمایش تمام فستیوال ها" />
                    <div class="Titr">
                        وضعیت جشنواره</div>
                    <div class="SearchDiv">
                        <asp:RadioButtonList ID="rb_OC" runat="server" AutoPostBack="true" CssClass="SearchItem"
                            RepeatDirection="Horizontal">
                            <asp:ListItem Value="1" style="padding-left: 5px;">&nbsp&nbspباز</asp:ListItem>
                            <asp:ListItem Value="-1" style="padding-left: 5px;">&nbsp&nbspبسته</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="Titr">
                        سطح جشنواره</div>
                    <div class="SearchDiv">
                        <asp:RadioButtonList ID="rb_level" runat="server" AutoPostBack="true" CssClass="SearchItem"
                            RepeatDirection="Horizontal">
                            <asp:ListItem Value="1" style="padding-left: 15px; padding-right: 5px;">&nbsp<sup>+</sup>A</asp:ListItem>
                            <asp:ListItem Value="2" style="padding-left: 5px;">&nbspA</asp:ListItem>
                            <asp:ListItem Value="3" style="padding-left: 5px;">&nbspB</asp:ListItem>
                            <asp:ListItem Value="4" style="padding-left: 5px;">&nbspC</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="Titr">
                        ژانر</div>
                    <div class="SearchDiv">
                        <asp:CheckBoxList ID="chk_genre" runat="server" AutoPostBack="true" RepeatColumns="1"
                            CssClass="SearchItem">
                            <asp:ListItem Value="1" CssClass="SearchItem">&nbsp انیمیشن | Animation</asp:ListItem>
                            <asp:ListItem Value="2" CssClass="SearchItem">&nbsp مستند | Documentary</asp:ListItem>
                            <asp:ListItem Value="3" CssClass="SearchItem">&nbsp تجربی | Experimental</asp:ListItem>
                            <asp:ListItem Value="4" CssClass="SearchItem">&nbsp موزیک ویدیو | Music Video</asp:ListItem>
                            <asp:ListItem Value="5" CssClass="SearchItem">&nbsp داستانی | Narrative or Fiction</asp:ListItem>
                            <asp:ListItem Value="6" CssClass="SearchItem">&nbsp واقعیت مجازی | Virtual Reality</asp:ListItem>
                            <asp:ListItem Value="7" CssClass="SearchItem">&nbsp تبلیغاتی | Advertisement</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                    <div class="Titr">
                        کوتاه یا بلند</div>
                    <div class="SearchDiv">
                        <asp:RadioButtonList ID="chkShortFeature" runat="server" AutoPostBack="true" RepeatColumns="1"
                            CssClass="SearchItem" Style="direction: rtl;">
                            <asp:ListItem Value="1">&nbspکوتاه | Short</asp:ListItem>
                            <asp:ListItem Value="2">&nbspبلند | Feature</asp:ListItem>
                            <asp:ListItem Value="3">&nbspکوتاه و بلند | Short & Feature</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
