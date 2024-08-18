<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingFestivalABC.aspx.vb" Inherits="kingFestivalABC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .txtSearch {
            background-color: White;
            border: 4px solid #ccc;
            width: 100%;
            padding: 5px;
            padding-right: 10px;
            -moz-border-radius: 0px 5px 5px 0px;
            -webkit-border-radius: 0px 5px 5px 0px;
            border-radius: 0px 5px 5px 0px;
        }

        .btnSearch {
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

            .btnSearch:hover {
                background-color: #000;
                color: #fff;
            }

        .Titr {
            color: Black;
        }

        .cmdStatus {
            padding: 5px;
            background-color: #48BDC5;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            color: White;
        }

        .cmdGenre {
            background-color: #48BDC5;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            color: White;
            text-align: left;
            direction: ltr;
        }

        .Post {
            background-color: #f4f4f4;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin: 4px;
        }

            .Post:hover {
                background-color: #e5e5e5;
                border-color: #48BDC5;
                cursor: pointer;
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

        .IMG {
            border-left: 1px solid #ccc;
            width: 70px;
        }

        .Pager a {
            color: #000000;
            text-decoration: none;
        }

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
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div style="text-justify: inter-word; text-align: justify;" class="changeAcnhorTag" >
                    به غیر از فستیوال‌هایی که سالیانه توسط آکادمی‌ها به عنوان منتخبین و برگزیده‌های فستیوال‌ها که 
                    <a href="../فستیوال-های-اسکاری-فیلم-کوتاه" target="_blank">Qualifying Festivals
                    </a>
                    نامیده می‌شوند، فستیوال‌های مهم و قدمت‌دار دیگری نیز وجود دارند که حائز اهمیت می‌باشند. 
                    <a href="https://iranfilmport.com/about">درگاه فیلم
                    ایران</a>
                    با سابقه‌ای بیش از 12 سال، سعی کرده است براساس معیارها و شاخص های بین المللی و تجربی، سایر فستیوال‌ها را در سه دسته کلی دیگر B ، A و C جای دهد
                    تا فیلمسازان بتوانند فیلم خود را با شناخت بیشتری ارسال کنند.
                </div>
                <hr />
                <div style="width: 100%;">
                    <img alt="فستیوال های فیلم کوتاه و بلند" src="files/images/background/ABCBanner.jpg" />
                </div>

                <hr />
                <div class="Titr">
                    فستیوال‌های سطح B، A و C
                </div>
                <div style="width: 100%">
                    <table style="width: 100%">
                        <asp:Repeater ID="GridView1" runat="server" DataSourceID="SDS">
                            <ItemTemplate>
                                <tr style="width: 100%; border: 1px solid #E5DA00;border-radius:5px; margin-bottom: 10px;">
                                    <td style="width: 10%">
                                        <asp:Image ID="Image1" AlternateText='<%# Bind("title_fa") %>' ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                            runat="server" />
                                    </td>
                                    <td style="width: 87%">
                                        <div>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("title_fa") %>'></asp:Label>&nbsp(<asp:Label
                                                ID="Label1" runat="server" Text='<%# Bind("title_en") %>'></asp:Label>)
                                        </div>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="width: 3%;">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LevelName") %>'></asp:Label>
                                    </td>
                                    <td class="p-2">
                                        <a class="button" onclick="return Open('<%# Eval("id")%>','<%# Eval("title_fa").ToString().Replace(" ", "-") + ".html" %>' );">جزییات</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
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
        </div>
    </div>
</asp:Content>

