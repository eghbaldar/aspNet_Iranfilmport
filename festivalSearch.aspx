<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="festivalSearch.aspx.vb" Inherits="festivalEach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #searchFest
        {   border:1px solid #ccc;
            padding:2px;
                        -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            }
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
            font-family: Samim;
        }
         .AllFestival
        {
            background-color: #ccc;
            border: 4px solid #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
            color: White;
            font-family: Samim;
            width:100%;
        }
        .btnSearch
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
            width:100%;
        }
        .btnSearch:hover
        {
            background-color: #E5DA00;
            color: #000;
        }
        .Titr
        {
            font-family: Koodak;
            color: Black;
            font-size:17px;
        }
        .SearchItem
        {
            color: Black ;
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
            color:Black;
            padding: 5px;
        }
        .Post
        {
            padding: 1px;
            border-bottom: 10px solid #48BDC5;
            margin: 2px;
            width: 200px;
            text-align: center;
            color: Black;
            font-family: Samim;
            font-size: 10px;
        }
        .Post:hover
        {
            border-color: #E5DA00;
            cursor: pointer;
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
            color: White ;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right; padding-top: 20px;">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td style="width: 95%">
                        <div>
                            <input runat="server" type="text" value="فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ..."
                                id="txtSearch" onblur="if(this.value == '') { this.value = 'فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ...'; }"
                                onfocus="if (this.value == 'فستیوال ، کشور، موقعیت ، کوتاه یا بلند و ...') { this.value = ''; }"
                                class="txtSearch" />
                        </div>
                    </td>
                    <td style="width: 5%;">
                        <%--<input type="button" value="جستجو" class="btnSearch" onclick="ClickforSearch()" />--%>
                        <asp:Button ID="btnSearch" runat="server" class="btnSearch" Text="جستجو" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="padding-top: 5px; padding-bottom: 5px;">
            <div class="col-md-9 col-sm-12 col-xs-12" style="padding-bottom: 5px;">
                <div class="Titr">
                    آخرین فستیوال‌های اضافه شده به درگاه</div>
                <div>
                    <div>
                        <table style="width: 100%">
                            <asp:GridView ID="dgSearch" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%"
                                ShowHeader="False" AllowPaging="True" PageSize="50">
                                <Columns>
                                    <asp:TemplateField HeaderText="rules" SortExpression="rules">
                                        <ItemTemplate>
                                            <tr style="width: 100%; border: 1px solid #48BDC5; padding: 10px; margin-bottom: 10px;
                                                font-family: Samim;">
                                                <td style="width: 10%">
                                                    <a href='<%# String.Format("../../festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"), getLink(Eval("title_fa").Replace("ي", "ی")).Replace(" ","-")) %>'>
                                                        <asp:Image CssClass="IMG" ID="Image1" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                                            runat="server" />
                                                    </a>
                                                </td>
                                                <td style="width: 90%">
                                                    <div>
                                                        <a href='<%# String.Format("../../festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"), getLink(Eval("title_fa").Replace("ي", "ی")).Replace(" ","-")) %>'>
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
                                                    <a style="color:black;" href='<%# String.Format("../../festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"), getLink(Eval("title_fa").Replace("ي", "ی")).Replace(" ","-")) %>'>
                                                        جزییات</a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="gridview"></PagerStyle>
                                <EmptyDataTemplate>
                                    <div style="background-color: #fffaaa; color: #898000; font-size: 11px; padding: 5px;font-family:Samim;
                                        text-align: center; margin-top: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                                        border-radius: 5px; border: 1px solid #d3c500; width: 100%;">
                                        <span>فستیوالی یافت نشد.</span>
                                        <br />
                                        <span>جهت نمایش صحیح فستیوال ها از فیلترگذاری مناسب استفاده کنید، در غیر این صورت میتواند گزینه
                                         
                                         <a href="../search/?oc=&level=&genre=&sf=&t=">نمایش تمام فستیوال ها</a>
                                          استفاده کنید</span>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </table>
                    </div>
                </div>
                <%--<uc1:banners_right ID="banners_right1" runat="server" />--%>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div id="searchFest">     
                        <asp:Button ID="btnALL" runat="server"
                        CssClass="AllFestival"
                         Text="نمایش تمام فستیوال ها" />
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
    </div>
</asp:Content>
