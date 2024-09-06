<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingfestivalSearch.aspx.vb" Inherits="kingfestivalSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="item-holder" style="text-align: justify;">
        <asp:Label ID="lbl" CssClass="lbl panel" runat="server"></asp:Label>
    </div>
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
    <div style="padding-top: 5px; padding-bottom: 5px;">
        <div class="col-12" style="padding-bottom: 5px;">
            <asp:Repeater ID="dgSearch" runat="server">
                <ItemTemplate>
                    <div class="row  p-5">
                        <div class="col-1 pr-2" style="border-right: 5px solid #ECCE01">
                            <a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"), Eval("title_en").Replace(" ", "-"), getLink(Eval("title_fa")).Replace(" ", "-").Replace("ي", "ی")) %>'>
                                <asp:Image CssClass="img-fluid" ID="Image1" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                    runat="server" />
                            </a>
                        </div>
                        <div class="col-8">
                            <a style="font-size: 13px;"
                                href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"), Eval("title_en").Replace(" ", "-"), getLink(Eval("title_fa")).Replace(" ", "-").Replace("ي", "ی")) %>'>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("title_fa").Replace("ي", "ی") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label1" runat="server" Style="color: #daa000; font-style: italic;" Text='<%# Bind("title_en") %>'></asp:Label>
                            </a>
                        </div>
                        <div class="col-1" style="text-align: center;">
                            <asp:Label ToolTip="تعداد روز باقی ماننده به آخرین ددلاین" ID="Label3" Style="font-size: 12px;"
                                runat="server" Text='<%# getDeadlineStatus(Eval("sign"), Eval("RemainDays")) %>'></asp:Label>
                        </div>
                        <div class="col-2">
                            <a class="button"
                                target="_blank"
                                href='<%# String.Format("/festival/{0}/{1}/{2}", Eval("id"), Eval("title_en").Replace(" ", "-"), getLink(Eval("title_fa")).Replace(" ", "-").Replace("ي", "ی")) %>'>جزییات</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

