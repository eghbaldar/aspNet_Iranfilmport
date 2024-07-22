<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingOurClients.aspx.vb" Inherits="kingOurClients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .accordion ul, .accordion li
        {
            list-style-type: circle;
            text-align: justify;
        }
        .accordion
        {
            background-color: #f2de00;
            color: #444;
            cursor: pointer;
            padding: 10px;
            width: 100%;
            border: none;
            outline: none;
            transition: 0.4s;
            text-align: right;
            font-size: 18px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
        .active, .accordion:hover
        {
            background-color: #E3EBF2;
        }
        
        /* Style the accordion panel. Note: hidden by default */
        .panel
        {
            padding: 0 18px;
            background-color: white;
            display: none;
            overflow: hidden;
            color: Black;
        }
        .accordion:after
        {
            content: '\02795'; /* Unicode character for "plus" sign (+) */
            font-size: 13px;
            color: #777;
            float: right;
            margin-left: 5px;
        }
        
        .active:after
        {
            content: "\2796"; /* Unicode character for "minus" sign (-) */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <small>جهت مشاهده لیست، بر روی بخش مورد کلیک کنید:</small>
    <div class="item-holder mt-2" style="direction: rtl; text-justify: inter-word; text-align: justify;">
        <div class="accordion">
            فیلم های کوتاه
        </div>
        <div class="panel">
            <asp:DataList ID="DataListShorts" runat="server" DataSourceID="SDS_Shorts" Width="100%">
                <ItemTemplate>
                    <div style="font-weight: bold;">
                        <asp:Label ID="nameFaLabel" runat="server" Text='<%# Eval("nameFa") %>' />
                        |
                                            <asp:Label ID="nameEnLabel" runat="server" Text='<%# Eval("nameEn") %>' />
                    </div>
                    <div style="padding-right: 20px; color: Blue; font-size: 11px;">
                        <asp:Label ID="directorEnLabel" runat="server" Text='<%# Eval("directorFa") %>' />
                        |
                                            <asp:Label ID="directorFaLabel" runat="server" Text='<%# Eval("directorEn") %>' />
                    </div>
                    <div style="padding-right: 20px;">
                        <a style="color: Red; text-decoration: none; font-size: 10px;" target="_blank" href='<%# Eval("photo","/convertToUnscale.aspx?photo=files\uploadFiles\PosterOfCustomers\{0}&w=452&h=640") %>'>(پوستر فیلم - Poster of Film) </a><a runat="server" visible='<%# ShowTrailerAparat(Eval("traileraparat","{0}")) %>'
                            style="color: green; text-decoration: none; font-size: 10px;" target="_blank"
                            href='<%# Eval("traileraparat","trailer.aspx?code={0}") %>'>(تریلر فیلم - Trailer
                                                    of Film) </a>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SDS_Shorts" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT [nameFa], [nameEn], [directorEn], [directorFa],
                                     [photo],[traileraparat] FROM [tbl_PosterOfCustomer] WHERE ([type] = @type)
                                     order by datetime desc">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="accordion">
            فیلم های بلند
        </div>
        <div class="panel">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS_Feature" Width="100%">
                <ItemTemplate>
                    <div style="font-weight: bold;">
                        <asp:Label ID="nameFaLabel" runat="server" Text='<%# Eval("nameFa") %>' />
                        |
                                            <asp:Label ID="nameEnLabel" runat="server" Text='<%# Eval("nameEn") %>' />
                    </div>
                    <div style="padding-right: 20px; color: Blue; font-size: 11px;">
                        <asp:Label ID="directorEnLabel" runat="server" Text='<%# Eval("directorFa") %>' />
                        |
                                            <asp:Label ID="directorFaLabel" runat="server" Text='<%# Eval("directorEn") %>' />
                    </div>
                    <div style="padding-right: 20px;">
                        <a style="color: Red; text-decoration: none; font-size: 10px;" target="_blank" href='<%# Eval("photo","/convertToUnscale.aspx?photo=files\uploadFiles\PosterOfCustomers\{0}&w=452&h=640") %>'>(پوستر فیلم - Poster of Film) </a><a id="A1" runat="server" visible='<%# ShowTrailerAparat(Eval("traileraparat","{0}")) %>'
                            style="color: green; text-decoration: none; font-size: 10px;" target="_blank"
                            href='<%# Eval("traileraparat","trailer.aspx?code={0}") %>'>(تریلر فیلم - Trailer
                                                    of Film) </a>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SDS_Feature" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT [nameFa], [nameEn], [directorEn], [directorFa],
                                     [photo],[traileraparat] FROM [tbl_PosterOfCustomer] WHERE ([type] = @type)
                                     order by datetime desc">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="accordion">
            فیلمنامه ها
        </div>
        <div class="panel">
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SDS_Scripts" Width="100%">
                <ItemTemplate>
                    <div style="font-weight: bold;">
                        <asp:Label ID="nameFaLabel" runat="server" Text='<%# Eval("nameFa") %>' />
                        |
                                            <asp:Label ID="nameEnLabel" runat="server" Text='<%# Eval("nameEn") %>' />
                    </div>
                    <div style="padding-right: 20px; color: Blue; font-size: 11px;">
                        <asp:Label ID="directorEnLabel" runat="server" Text='<%# Eval("directorFa") %>' />
                        |
                                            <asp:Label ID="directorFaLabel" runat="server" Text='<%# Eval("directorEn") %>' />
                    </div>
                    <div style="padding-right: 20px;">
                        <a style="color: Red; text-decoration: none; font-size: 10px;" target="_blank" href='<%# Eval("photo","/convertToUnscale.aspx?photo=files\uploadFiles\PosterOfCustomers\{0}&w=452&h=640") %>'>(کاورپیج فیلمنامه - Cover Page of Script) </a>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SDS_Scripts" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT [nameFa], [nameEn], [directorEn], [directorFa],
                                     [photo] FROM [tbl_PosterOfCustomer] WHERE ([type] = @type)
                                     order by datetime desc">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    /* Toggle between adding and removing the "active" class,
                    to highlight the button that controls the panel */
                    this.classList.toggle("active");

                    /* Toggle between hiding and showing the active panel */
                    var panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "block";
                    }
                });
            }
        </script>
</asp:Content>

