﻿<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingFestivals.aspx.vb" Inherits="kingFestivals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .btnDetail a {
            color:white !important;
            text-align:center !important;
        }
        #searchFest {
            border: 1px solid #ccc;
            padding: 30px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .searchItemBox {
            display: flex;
            padding-bottom: 5px;
        }

        .txtSearchFest {
            background-color: White;
            border: 4px solid #ccc;
            width: 100%;
            padding: 5px;
            padding-right: 10px;
            -moz-border-radius: 0px 5px 5px 0px;
            -webkit-border-radius: 0px 5px 5px 0px;
            border-radius: 0px 5px 5px 0px;
        }

        .btnSearchFest {
            background-color: #ccc;
            border: 4px solid #ccc;
            -moz-border-radius: 5px 0px 0px 5px;
            -webkit-border-radius: 5px 0px 0px 5px;
            border-radius: 5px 0px 0px 5px;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
            color: White;
            width: 100%;
            cursor: pointer;
        }

            .btnSearchFest:hover {
                background-color: #E5DA00;
                color: #000;
            }

        .Titr {
            color: Black;
            font-size: 17px;
        }

        .SearchItem {
            color: Black;
            direction: rtl;
            text-align: right;
            padding: 5px;
            background-color: #ECCE01;
            border-radius: 5px;
            margin: 2px;
        }

        .SearchDiv {
            background-color: #e8e8e8;
            padding: 5px;
        }

        .IMG {
            border-left: 1px solid #ccc;
            width: 70px;
        }

        .IMG_Big {
            border: 1px solid #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .Detail {
            background-color: #E5DA00;
            color: Black;
            padding: 5px;
            text-align: center;
        }

            .Detail:hover {
                background-color: #CCC200;
                border-color: #848484;
                color: White;
            }

        .Pager a {
            color: #000000;
            text-decoration: none;
        }

        .TitleFestivalFa {
            color: Black;
            font-size: 13px;
        }

        .TitleFestivalEn {
            color: Gray;
            font-size: 10px;
        }
    </style>
    <style>
        .gridview span {
            background-color: #E5DA00;
            color: #fff;
            border-radius: 50%;
            padding: 5px 10px 5px 10px;
        }

        .gridview a {
            margin: auto 1%;
            border-radius: 50%;
            background-color: #444;
            padding: 5px 10px 5px 10px;
            color: #fff;
            text-decoration: none;
        }

            .gridview a:hover {
                background-color: #48BDC5;
                color: #fff;
            }

        .gridview {
            background-color: #fff;
            padding: 2px;
            margin: 2% auto;
        }

        #TableOfSearchFestRightFest {
            width: 95%;
        }

        #TableOfSearchFestLeftFest {
            width: 5%;
        }

        #TableOfSearchFest {
            width: 100%;
        }

        .IMG_Big {
            width: 150px;
            height: 150px;
        }

        .Post {
            width: 200px;
            height: 290px;
        }
    </style>
    <style>
        @media (max-width: 600px) {
            .button{
                width:100px !important;
                color:white !important;
                text-align:center !important;
                padding:5px !important;
                padding-right:15px !important;
                padding-left:15px !important;
            }
            .smallImg{
                display:none;
            }
            .searchItemBox {
                display: flex;
                font-size: 12px;
            }

            .Post {
                width: 100%;
                height: 100%;
            }

            #TableOfSearchFestRightFest {
                width: 100%;
            }

            #TableOfSearchFestLeftFest {
                width: 100%;
            }

            .IMG_Big {
                width: 100%;
                height: 100%;
            }

            table tr:hover td {
                /*background-color: #F7F6F3;*/
                color: Black;
            }

            .THeader {
                display: none;
            }

            table .fr {
                text-align: center;
                direction: rtl;
                color: Black;
            }

            table {
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
                table th {
                    background: #333;
                    color: white;
                    font-weight: bold;
                }

            .DL_LastFestival table td, .DL_LastFestival table th {
                padding: 6px;
                border: 1px solid #ccc;
                text-align: center;
            }

            .DL_LastFestival table table td {
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
            .DL_LastFestival table tr:nth-of-type(odd) {
                background: #eee;
                color: Black;
            }

            .DL_LastFestival table, .DL_LastFestival thead, .DL_LastFestival tbody, .DL_LastFestival th, .DL_LastFestival td, .DL_LastFestival tr {
                display: block;
                text-align: center;
            }


                /* Hide table headers (but not display: none;, for accessibility) */
                .DL_LastFestival table table thead tr {
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

                .DL_LastFestival table table tr {
                    border-bottom: 1px solid #ccc;
                }

                .DL_LastFestival table table td {
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="left-side">
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
                        <asp:Button ID="btnSearch" runat="server" class="btnSearchFest" Text="جستجو" />
                    </td>
                </tr>
            </table>
        </div>

        <div>
            <div id="searchFest">
                <asp:Button ID="btnALL" runat="server" CssClass="btnSearchFest" Text="نمایش تمام فستیوال ها" />
                <div class="searchItemBox" style="padding-top: 20px;">
                    <div>
                        وضعیت جشنواره:
                    </div>
                    <div>
                        <asp:RadioButtonList ID="rb_OC" runat="server" AutoPostBack="true" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1" class="SearchItem">&nbsp&nbspباز</asp:ListItem>
                            <asp:ListItem Value="-1" class="SearchItem">&nbsp&nbspبسته</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                </div>
                <div class="searchItemBox">
                    سطح جشنواره
                <div>
                    <asp:RadioButtonList ID="rb_level" runat="server" AutoPostBack="true"
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" class="SearchItem">&nbsp<sup>+</sup>A</asp:ListItem>
                        <asp:ListItem Value="2" class="SearchItem">&nbspA</asp:ListItem>
                        <asp:ListItem Value="3" class="SearchItem">&nbspB</asp:ListItem>
                        <asp:ListItem Value="4" class="SearchItem">&nbspC</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                </div>
                <div class="searchItemBox">
                    ژانر
                <div>
                    <asp:CheckBoxList ID="chk_genre" runat="server" AutoPostBack="true" RepeatColumns="3">
                        <asp:ListItem Value="1" class="SearchItem">انیمیشن</asp:ListItem>
                        <asp:ListItem Value="2" class="SearchItem">مستند</asp:ListItem>
                        <asp:ListItem Value="3" class="SearchItem">تجربی</asp:ListItem>
                        <asp:ListItem Value="4" class="SearchItem">موزیک ویدیو</asp:ListItem>
                        <asp:ListItem Value="5" class="SearchItem">داستانی</asp:ListItem>
                        <asp:ListItem Value="6" class="SearchItem">واقعیت مجازی</asp:ListItem>
                        <asp:ListItem Value="7" class="SearchItem">تبلیغاتی</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                </div>
                <div class="searchItemBox">
                    کوتاه یا بلند
                <div>
                    <asp:RadioButtonList ID="chkShortFeature" runat="server" AutoPostBack="true" RepeatColumns="3">
                        <asp:ListItem Value="1" class="SearchItem">کوتاه</asp:ListItem>
                        <asp:ListItem Value="2" class="SearchItem">بلند</asp:ListItem>
                        <asp:ListItem Value="3" class="SearchItem">کوتاه و بلند</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                </div>
            </div>
            <h3 class="mt-2">آخرین فستیوال‌های اضافه شده به لیست
            </h3>
            <div>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS_Last" RepeatColumns="4"
                    CssClass="DL_LastFestival" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"),getLink(Eval("title_fa")).Replace(" ","-").Replace("ي", "ی")) %>'>
                            <div style="text-align: center;">
                                <div style="height:200px;">
                                    <asp:Image CssClass="img-fluid circular--img"
                                        Style="width: 200px !important" ID="Image1" AlternateText='<%# Eval("title_fa") %>'
                                        ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                        runat="server" />
                                </div>
                                <div style="height:40px;">
                                    <asp:Label ID="title_faLabel" CssClass="TitleFestivalFa" runat="server" Text='<%# Eval("title_fa").Replace("ي", "ی") %>' />

                                </div>
                                <div style="height:30px;">
                                    <asp:Label ID="title_enLabel" CssClass="TitleFestivalEn" runat="server" Text='<%# Eval("title_en") %>' />

                                </div>
                                <div style="height:30px;">
                                    <asp:Label ToolTip="تعداد روز باقی ماننده به آخرین ددلاین" ID="Label1" Style="font-size: 12px;"
                                        runat="server" Text='<%# getDeadlineStatus(Eval("sign"), Eval("RemainDays")) %>'></asp:Label>
                                </div>
                            </div>
                        </a>
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
            <h3 class="mt-2 mb-2">
            لیست فستیوال‌ها براساس آخرین تاریخ پذیرش
        </div>
        <div>
            <asp:Repeater ID="dgLastDeadlineFestival" runat="server">
                <ItemTemplate>
                    <div class="row  p-5">
                        <div class="col-1 pr-2 smallImg" style="border-right: 5px solid #ECCE01">
                            <a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"), Eval("title_en").Replace(" ", "-"), getLink(Eval("title_fa")).Replace(" ", "-").Replace("ي", "ی")) %>'>
                                <asp:Image CssClass="img-fluid circular--img" ID="Image1" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                    runat="server" />
                            </a>
                        </div>
                        <div class="col-8">
                            <a style="font-size: 13px;"
                                href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"), Eval("title_en").Replace(" ", "-"), getLink(Eval("title_fa")).Replace(" ", "-").Replace("ي", "ی")) %>'>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("title_fa").Replace("ي", "ی") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label1" runat="server" Style="color: #daa000; font-style: italic;" Text='<%# Bind("title_en") %>'></asp:Label>
                                <br />
                                <asp:Label ToolTip="تعداد روز باقی ماننده به آخرین ددلاین" ID="Label3" Style="font-size: 12px;"
                                runat="server" Text='<%# getDeadlineStatus(Eval("sign"), Eval("RemainDays")) %>'></asp:Label>
                            </a>
                        </div>
                        <div class="col-3 btnDetail">
                            <a class="button"
                                target="_blank"
                                href='<%# String.Format("/festival/{0}/{1}/{2}", Eval("id"), Eval("title_en").Replace(" ", "-"), getLink(Eval("title_fa")).Replace(" ", "-").Replace("ي", "ی")) %>'>جزییات</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="text-align: center;">
                <asp:LinkButton ID="btnPrev" runat="server" Text="<< قبلی" CssClass="dotYellow" OnClick="btnPrev_Click" />
                <asp:LinkButton ID="btnNext" runat="server" Text=">> بعدی" CssClass="dotYellow" OnClick="btnNext_Click" />
            </div>
            <asp:SqlDataSource ID="SDS_LastFest" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="select *, (select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc) 'lastDeadline', DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc)) as 'RemainDays', sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) 'sign' from dbo.tbl_festivals f where f.flag=1 and DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc)) is not null and sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) <> -1 order by 'RemainDays' asc"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

