<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="post.aspx.vb" Inherits="post" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/comment.ascx" TagName="comment" TagPrefix="uc3" %>
<%@ Register Src="usercontrols/Navigation.ascx" TagName="Navigation" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:PlaceHolder runat="server" ID="pc"></asp:PlaceHolder>
    <style>
        .TitleL {
            font-family: Titr;
            font-size: 20px;
            padding-right: 5px;
            color: Black;
        }

        .TextL {
            font-size: 14px;
            color: Black;
            text-justify: inter-word;
            text-align: justify;
        }

        span {
            font-size: 13px;
            font-family: Samim;
        }

        p {
            font-family: Samim;
            font-size: 14px;
        }

            p.thick {
                color: Gray;
            }

        .MainText li {
            list-style: inherit;
        }

        .MainText P, .MainText div {
            color: Black;
        }

            .MainText span img, .MainText p img, .MainText div img {
                width: 100% !important;
                height: 100% !important;
            }

        .MainText li, .MainText li {
            color: black;
        }
        /*@media only screen and (max-width: 550px) 
        {
            .MainText table, .MainText thead, .MainText tbody, .MainText th, .MainText td, .MainText tr {			   
                max-width:400px;
                overflow:auto;
		    }
          
        }*/
    </style>
    <script>
        function showDiv() {
            var x = document.getElementById('ac');
            if (x.style.display === 'none') {
                x.style.display = 'inline';
            } else {
                x.style.display = 'none';
            }

        }
    </script>
    <meta property="og:image:width" content="631" />
    <meta property="og:image:height" content="1000" />
    <%--Change Fonts--%>
    <script src='<%= ResolveUrl("~/files/js/fontsize/jquery-1.12.4.min.js")%>'></script>
    <script src='<%= ResolveUrl("~/files/js/fontsize/fontsize.js")%>'></script>
    <style>
        .zoomin {
            border: 1px solid #ccc;
            padding-right: 8px;
            padding-left: 8px;
            padding-top: 1px;
            padding-bottom: 3px;
            cursor: pointer;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            background-color: #ccc;
            color: #848484;
        }

        .zoomout {
            border: 1px solid #ccc;
            padding-right: 8px;
            padding-left: 8px;
            padding-top: 1px;
            padding-bottom: 3px;
            cursor: pointer;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            background-color: #ccc;
            color: #848484;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="page-title text-center" style="background-image: url('<%= getPostImage() %>');">
        <div class="container" style="direction: rtl;">
            <div class="title-text">
                <h1>
                    <asp:Label Style="font-family: Titr; font-size: 30px; color: White;" ID="lblGetPostTitle"
                        runat="server"></asp:Label>
                </h1>
                <ul class="title-menu clearfix">
                    <li></li>
                </ul>
            </div>
        </div>
    </section>
    <section class="blog-section style-four section">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div class="left-side" style="padding:5px;margin:10px;">
                        <div class="item-holder" style="direction: rtl; box-shadow: 2px 2px 8px 8px #F4F4F4;
                            padding: 8px;">

                            <asp:GridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Master"
                                AllowPaging="True" GridLines="None" ShowHeader="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                                        <ItemTemplate>
                                            <div>
                                                <uc4:Navigation ID="Navigation1" runat="server" />
                                
                            </div>
                                            <div>
                                                <asp:Image AlternateText='<%# Eval("title").Replace("ي", "ی") %>' Style="width: 100%;
                                                    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" ID="Image1"
                                                    runat="server" ImageUrl='<%# String.Format("~\files\uploadFiles\article\{0}", Eval("photo")) %>' />
                                            </div>
                                            
                                            <div style="padding-top: 5px;">
                                                <span class="zoomout" style="font-size:20px;" runat="server" visible='<%# GetEditPermission() %>'>
                                                    <a href='<%# Eval("id", "../cms/pages/EditPost?type=article&id={0}") %>' target="_blank">ویرایش این پست</a>
                                                    <br />
                                                </span>
                                                
                                                <span class="zoomin">+</span> <span class="zoomout">-</span>
                                                
                                            </div>
                                                                        
                                            <article id="example">
                                                <div style="padding-top: 10px; padding-bottom: 10px; text-align: center;">
                                                    <h2>
                                                        <asp:Label CssClass="TitleL" ID="Label2" runat="server" Text='<%# Eval("title").Replace("ي", "ی") %>'></asp:Label>
                                                    </h2>
                                                </div>
                                                <div>
                                                    <div style="direction: ltr;">
                                                        <asp:Label ID="Label5" runat="server" CssClass="MainText" Text='<%# Eval("text").Replace("ي", "ی").Replace("tahoma, geneva, sans-serif","Samim").Replace("Tahoma,Geneva,sans-serif","Samim").Replace("Tahoma,Gene7a,sans-serif","Samim").Replace("tahoma,geneva,sans-serif","Samim") %>'></asp:Label>
                                                        <%--.Replace("Tahoma,Geneva,sans-serif","Samim").Replace("Tahoma,Gene7a,sans-serif","Samim").Replace("tahoma,geneva,sans-serif","Samim")--%>
                                                    </div>
                                                    <div class="entry-meta">
                                                        <asp:Label ID="Label4" Style="color: #848484; font-size: 13px; font-family: titr;"
                                                            runat="server" Text='<%# getDate(Eval("date_time")) %>'></asp:Label></li> |
                                                        <asp:Label ID="Label3" Style="color: #848484; font-size: 13px; font-family: titr;"
                                                            runat="server" Text='<%# Eval("authors").Replace("ي", "ی") %>'></asp:Label>
                                                    </div>
                                                </div>
                                                <div style="text-align: left;">
                                                    <a target="_blank" href='<%# getTelegram(Eval("id"),Eval("title")) %>'>
                                                        <i class="bi bi-telegram" style="font-size: 2em;"></i>
                                                    </a><a target="_blank" href='<%# getTw(Eval("id"),Eval("title")) %>'>
                                                        <i class="bi bi-twitter" style="font-size: 2em;"></i>
                                                    </a><a target="_blank" href='<%# getFB(Eval("id"),Eval("title")) %>'>
                                                        <i class="bi bi-facebook" style="font-size: 2em;"></i>
                                                    </a></h1>
                                                </div>
                                                <div>
                                                    <asp:Label ID="Label1" Style="font-family: Samim; font-size: 11px; color: Gray;"
                                                        runat="server" Text='<%# getShortLink(Eval("id")) %>'></asp:Label>
                                                    <div style="margin-top: 10px;">
                                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS_Tags">
                                                            <ItemTemplate>
                                                                <h1>
                                                                    <a style="text-decoration: none; color: black; font-size: 11px;" href='<%# Page.ResolveUrl(String.Format("~/tag/{0}", Eval("value").ToString.Trim.Replace(" ","-").Replace("ي", "ی"))) %>'>
                                                                        <span style="background-color: #48bdc5; color: white; padding: 1px; margin: 3px;
                                                                            padding-right: 7px; padding-left: 7px;">
                                                                            <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("value").Replace("ي", "ی").Replace("_"," ") %>' />
                                                                        </span></a>
                                                                </h1>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <%--        <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS_Tags" RepeatColumns="10"
                                RepeatDirection="Horizontal">
                                <ItemTemplate>

                                  <div style="background-color:#ccc;padding:1px;margin:3px;padding-right:7px;padding-left:7px;">
                                  <h1>
                                    <a style="text-decoration: none;color:black;font-size:11px;"
                                    href='<%# Page.ResolveUrl(String.Format("~/tag/{0}", Eval("value").ToString.Trim.Replace(" ","-").Replace("ي", "ی"))) %>'
                                       >
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("value").Replace("ي", "ی") %>' />
                                    </a>
                                    </h1>
                                  </div>
                                </ItemTemplate>
                            </asp:DataList>--%>
                                                        <asp:SqlDataSource ID="SDS_Tags" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                                            SelectCommand="select * from dbo.StringSplit ((select [tags] from dbo.tbl_articles where id= @ID),' ') where value<>'-'">
                                                            <SelectParameters>
                                                                <asp:RouteParameter Name="ID" RouteKey="id" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </article>
                                            <!-- end entry -->
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <script>
                                $('#example').FontSize({

                                    increaseTimes: 5,

                                    reduceTimes: 5

                                });
                                $('#example').FontSize({

                                    increaseBtn: '.zoomin',

                                    reduceBtn: '.zoomout'

                                });
                                $('#example').FontSize({

                                    step: 3

                                });

                            </script>
                            <asp:SqlDataSource ID="SDS_Master" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                SelectCommand="SELECT * FROM [tbl_articles] WHERE (([ID] = @ID) AND ([visible] = @visible))">
                                <SelectParameters>
                                    <asp:RouteParameter Name="id" RouteKey="id" />
                                    <asp:Parameter DefaultValue="true" Name="visible" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <uc3:comment ID="comment" runat="server" />
                        <div style="margin-top: 10px; direction: rtl; font-size: 11px;">
                            <a onclick="return showDiv()" style="color: Gray; text-decoration: none; font-family: NazaninB;">
                                + مشاهده لینک های اصلی سایت</a>
                            <div id="ac" style="display: none; font-family: NazaninB;">
                                <br />
                                <a target="_blank" href="http://iranfilmport.com/درباره-درگاه-فیلم-ایران">درگاه فیلم
                                    ایران</a> بصورت غیر رسمی با نام «پخش گرانش» از سال 1394 فعالیت خود را در زمینه
                                ارسال و پخش کنندگی فیلم آغاز نمود. در طی این سال ها با کسب تجربه در زمینه پخش فیلم
                                و همچنین مطالعات فشرده چندین ساله و تلاش در ایجاد ارتباط با شرکت های پخش جهانی راه
                                خود را یافت. با شروع سال 1397 گروه تصمیم به آن گرفت که با ایجاد پرتابلی چند منظوره
                                فعالیت خود را رسمیت ببخشد. برای مشاهده اطلاعات کامل <a href="http://iranfilmport.com/درباره-درگاه-فیلم-ایران"
                                    target="_blank">اینجا</a> کلیک کنید.
                                <br />
                                جهت <a target="_blank" href="http://iranfilmport.com/تماس-با-درگاه-فیلم-ایران">تماس
                                    با تیم پشتیبانی</a> درگاه فیلم ایران از شماره ها و پست الکترونیکی مرتبط با موضوعتان
                                که در صفحه ی <a target="_blank" href="http://iranfilmport.com/تماس-با-درگاه-فیلم-ایران">
                                    تماس با ما</a> قرار دارد، استفاده کنید.
                                <br />
                                درگاه فیلم ایران با افتخار اعلام میکند که پس از فعالیت پنج ساله میزبان فیلم های
                                نسبتا موفقی بوده است. البته لازم به ذکر است که بدلیل عدم تبلیغات لازم به جهت نداشتن
                                منابع مالی، عزیزان فیلمساز کمتر با درگاه فیلم ایران آشنا هستند، که امید است با معرفی
                                شما آمار پذیرش فیلم ها توسط درگاه فیلم ایران افزایش پیدا کند. جهت مشاهده <a target="_blank"
                                    href="http://iranfilmport.com/کارنامه-پخش-فیلم-درگاه-فیلم-ایران">کارنامه درگاه فیلم
                                    ایران</a> کلیک کنید.
                            </div>
                        </div>
                    </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>
</asp:Content>
